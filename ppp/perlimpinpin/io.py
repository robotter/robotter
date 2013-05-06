"""

Handle PPP I/O from several sources simultaneously

"""

import os
import sys
import re
import select
import fcntl
import threading
import Queue
import time
from frame import Frame
import payload
from payload.system import *

__all__ = ['Connection', 'Hub', 'HubBase']


class Connection(object):
  """
  Connection to be used in a Hub

  Attributes:
    fd -- file descriptor (integer)
    fo -- file object or integer
    hub -- associated Hub instance
    rgen -- generator processing received data
    wbuf -- data to send, None if not registered in epoll

  """

  def __init__(self, fd):
    flags = fcntl.fcntl(fd, fcntl.F_GETFL)
    fcntl.fcntl(fd, fcntl.F_SETFL, flags|os.O_NONBLOCK)
    self.fo = fd
    if isinstance(fd, int):
      self.fd = fd
    else:
      self.fd = fd.fileno()
    self.hub = None

  def send(self, frame):
    self.hub._msg_send('w', (frame, [self]))

  def reset(self):
    """Reset connection for handling by a hub"""
    self.rgen = Frame.extract_gen()
    self.rgen.send(None)  # init the generator
    self.wbuf = None

  @classmethod
  def fromsource(cls, src, **kw):
    """Create a connection from a source string

    source may be
      host:port -- TCP connection
      /dev/tty* -- serial
      filename -- special file (pseudo-terminal, socket, ...)

    Keywords:
      baudrate -- serial baudrate, imply serial port, default to 38400

    """

    baudrate = kw.get('baudrate')

    # guess source type
    src_type = None
    if baudrate is not None:
      src_type = 'serial'
    elif re.match('^([^:]+):(\d+)$', src):
      src_type = 'tcp'
    elif src.startswith('/dev/tty'):
      src_type = 'serial'
    elif os.path.exists(src):
      import stat
      mode = os.stat(src).st_mode
      if stat.S_ISREG(mode):
        raise ValueError("source cannot be a regular file")
      elif stat.S_ISFIFO(mode):
        src_type = 'fifo'
      elif stat.S_ISSOCK(mode):
        src_type = 'socket'
      elif stat.S_ISCHR(mode):
        src_type = 'chr'
    if src_type is None:
      raise ValueError("cannot detect source type")

    # get connection file object from source
    if src_type == 'serial':
      from serial import Serial
      if baudrate is None:
        baudrate = 38400
      fo = Serial(src, baudrate)
    elif src_type == 'tcp':
      import socket
      m = re.match('^([^:]+):(\d+)$', src)
      host, port = m.group(1), int(m.group(2))
      fo = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
      fo.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
      print "connecting to %s:%d..." % (host, port)
      fo.connect((host, port))
    elif src_type == 'fifo':
      raise ValueError("pipe source not supported")
    elif src_type == 'socket':
      import socket
      fo = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
      fo.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
      fo.connect(src)
    elif src_type == 'chr':
      fo = open(src, 'r+b')
    else:
      raise ValueError("invalid source type")

    return cls(fo)


class Hub(object):
  """
  Handle PPP I/O for multiple connections

  I/O routines are thread-safe. Callbacks are processed in the thread that calls
  run() or run_one().

  The following methods must be implemented:
    on_frame() -- called when a frame is received
    route_frame() -- route a packet

  Frames can be sent directly through a Connection object or through the hub to
  be routed.

  Events such as server stop, new frames in queue, etc. are announced using
  an internal pipe and queue. See also _internal_msg_send().
  The following characters can be sent:
    'w' -- new frame to send in queue, data: (Frame, Connections)
    'x' -- exit run(), data: None
    'c' -- add a new connection, data: Connection
    'C' -- remove a connection, data: Connection

  Connections are switched to non-blocking mode.

  Attributes:
    cons -- set of Connection objects
    started -- True if start() has been called
    _running -- True when run() is being called
    _lock -- lock for thread-safety
    _poll -- epoll object
    _poll_cons -- polled connections, indexed by fd
    _msg_queue -- Queue for internal events data
    _msg_pr -- pipe to read internal events in run()/run_one()
    _msg_pw -- pipe to announce internal events to run()/run_one()
    _timers_queue -- timed callbacks priority queue

  """

  def __init__(self):
    self.cons = set()
    self._lock = threading.RLock()
    self.started = False
    self._running = False
    self._timers_queue = Queue.PriorityQueue()

  def add_connection(self, con):
    """Add a connection to a hub"""
    if con.hub is not None:
      raise ValueError("connection already in a hub")
    with self._lock:
      con.hub = self
      self.cons.add(con)
      if self.started:
        self._msg_send('c', con)

  def remove_connection(self, con):
    """Remove a connection from a hub"""
    if con.hub is not self:
      raise ValueError("connection not in hub")
    with self._lock:
      self.cons.remove(con)
      con.hub = None
      if self.started:
        self._msg_send('C', con)

  def start(self):
    """Initialize I/O processing

    This method must be called before run(), run_one(), send(), ...
    It should be called after initializing connections, etc.
    """
    if self.started:
      raise RuntimeError("already started")
    # prepare connection, queue, epoll, etc.
    with self._lock:
      self._poll_cons = {}
      poll = select.epoll(len(self.cons)+1)
      msg_pr, msg_pw = os.pipe()
      poll.register(msg_pr, select.EPOLLIN)
      for con in self.cons:
        con.reset()
        self._poll_cons[con.fd] = con
        poll.register(con.fd, select.EPOLLIN)
      # keep copies on instance
      self._msg_queue = Queue.Queue()
      self._poll = poll
      self._msg_pr = msg_pr
      self._msg_pw = msg_pw
      self.started = True

  def stop(self):
    """Stop I/O processing

    This will interrupt a call to run().
    """
    if not self.started:
      raise RuntimeError("not running")
    if self._running:
      # delay, will be processed by run_one()
      self._msg_send('x', None)
    else:
      # stop now
      self._stop()

  def _stop(self):
    """Deinitialize I/O processing"""
    self.started = False
    self._poll.close()
    os.close(self._msg_pr)
    os.close(self._msg_pw)
    self._poll = None
    self._msg_pw = None
    self._msg_queue = None


  def _msg_send(self, c, data):
    """Send an internal event to the I/O processing"""
    with self._lock:
      self._msg_queue.put(data)
      os.write(self._msg_pw, c)

  def on_frame(self, con, frame):
    """Method called when a frame is received"""
    raise NotImplementedError()

  def route_frame(self, frame, con=None):
    """Route a packet

    Return an iterable of connections to which the frame must be sent.
    The con parameter may indicate a connection from which the frame has been
    sent, to avoid loops when forwarding frames.
    """
    raise NotImplementedError()

  def send(self, frame, cons=None):
    """Route and send a PPP frame"""
    if not self.started:
      raise RuntimeError("not started")
    if cons is None:
      cons = self.route_frame(frame)
    if cons:
      self._msg_send('w', (frame, cons))

  def schedule(self, dt, cb):
    """Schedule a callback to be executed in dt seconds"""
    t = time.clock() + dt
    with self._lock:
      self._timers_queue.put((t, cb))


  def run_one(self, timeout=None):
    """Process a single batch of I/O events

    If timeout is set (in seconds), wait at most for the given time before
    returning.

    Processing exceptions are printed on stderr.
    """

    if self._timers_queue.empty():
      cb = None
    else:
      tnow = time.clock()
      # get() may block, but we don't consider it for the timeout
      t, cb = self._timers_queue.get()
      dt = max(0, t - tnow)
      if timeout is None:
        timeout = dt
      else:
        timeout = min(timeout, dt)

    events = self._poll.poll(-1 if timeout is None else timeout)
    if cb is not None:
      if not len(events):
        # timeout, execute the callback
        cb()
      else:
        # put back the callback
        self._timers_queue.put((t, cb))

    for fd, ev in events:
      # internal event
      if fd == self._msg_pr:
        for c in os.read(fd, 32):
          if c == 'w':
            # new frame to send
            frame, dst_cons = self._msg_queue.get()
            self._msg_queue.task_done()
            try:
              data = frame.data()
            except Exception as e:
              sys.stderr.write("failed to format frame: %s\n" % e)
              continue
            for con in dst_cons:
              if con.wbuf is None:
                con.wbuf = data
                self._poll.modify(con.fd, select.EPOLLIN|select.EPOLLOUT)
              else:
                con.wbuf += data
          elif c == 'c':
            # new connection
            con = self._msg_queue.get()
            con.reset()
            self._poll_cons[con.fd] = con
            self._poll.register(con.fd, select.EPOLLIN)
          elif c == 'C':
            # remove connection
            con = self._msg_queue.get()
            try:
              self._poll.unregister(con.fd)
            except IOError:
              pass # already unregistered
            del self._poll_cons[con.fd]
          elif c == 'x':
            # exit I/O processing
            return
      # receive data
      elif ev & select.EPOLLIN:
        con = self._poll_cons[fd]
        try:
          data = os.read(fd, 512)
          if not data:
            if con.hub is self:  # avoid double removal
              # unregister now or the same event may be triggered
              # indefinitely, preventing the 'C' message to be processed
              self._poll.unregister(con.fd)
              self.remove_connection(con)
            break
        except OSError as e:
          if e.errno == os.errno.EAGAIN:
            break
          raise
        frame = con.rgen.send(data)
        if frame is None:
          break
        try:
          self.on_frame(con, frame)
        except Exception as e:
          print_exc()
          continue
      # send data
      elif ev & select.EPOLLOUT:
        con = self._poll_cons[fd]
        try:
          n = os.write(fd, con.wbuf)
        except OSError as e:
          if e.errno != os.errno.EAGAIN:
            raise
        else:
          if n == len(con.wbuf):
            self._poll.modify(fd, select.EPOLLIN)
            con.wbuf = None
          else:
            con.wbuf = con.wbuf[n:]
      # unexpected event
      else:
        raise RuntimeError("unexpected event %r for fd %d" % (ev, fd))


  def run(self):
    """Process I/O events indefinitely

    This method can be interrupted by calling stop().
    """
    self._running = True
    try:
      while self.started:
        self.run_one()
    finally:
      self._running = False
      self._stop()

  def run_threaded(self):
    """Process I/O events in a separated thread
    Return the created thread.
    """
    thread = threading.Thread(target=self.run, name='PPPHub')
    thread.daemon = True
    thread.start()
    return thread


class HubBase(Hub):
  """
  Basic hub implementation

  This subclass provides handling of base features such as system payload.

  Payload handlers may also be defined on the instance/class as methods named
  payload_handler_NAME(), where NAME is the payload's pname.
  Note that only frames sent to the hub are processed by these handlers.

  PayloadHandler classes can be mixed-in to add specific payload support.

  Supported payloads use the payload_handlers map. None values can be added to
  fake support of a given payload.

  Attributes:
    address -- hub address
    network -- routing table, {address: Connection} map
    node_name -- node name, returned in 'name' system payload
    payload_handlers -- map of payload callbacks, indexed by payload ID

  """

  def __init__(self, addr):
    Hub.__init__(self)
    self.address = addr
    self.network = {}
    self.node_name = 'pyhub'
    self.payload_handlers = {}
    # register payload handler methods
    for pl in payload.payloads.values():
      fname = 'payload_handler_%s' % pl.pname.replace('-', '_')
      if hasattr(self, fname):
        self.payload_handlers[pl.pid] = getattr(self, fname)

  def on_frame(self, con, frame):
    # update traceroute distance before replying/routing
    drop = False
    pl = frame.payload
    if isinstance(pl, PayloadSystemTraceroute):
      if pl.request:
        pl.distance += 1
        if pl.distance >= 255:
          drop = True
      else:
        pl.distance -= 1
        if pl.distance < 0:
          drop = True

    # route if needed
    if not drop:
      cons = self.route_frame(frame, con)
      if cons:
        self.send(frame, cons)

    # process payload
    if frame.dst == 0xff or frame.dst == self.address:
      handler = self.payload_handlers.get(pl.pid, None)
      if handler is not None:
        handler(frame)


  def route_frame(self, frame, con=None):
    if frame.dst == 0xff:
      return [c for c in self.cons if c != con]
    elif frame.dst != self.address and frame.dst in self.network:
      c = self.network[frame.dst]
      if c != con:
        return [c]
    return []


  def payload_handler_system(self, frame):
    pl = frame.payload
    if not pl.request:
      return

    reply = None
    if isinstance(pl, PayloadSystemPing):
      reply = PayloadSystemPing(False, pl.value)
    elif isinstance(pl, PayloadSystemTraceroute):
      reply = PayloadSystemTraceroute(False, 0)
    elif isinstance(pl, PayloadSystemName):
      reply = PayloadSystemName(False, self.node_name)
    elif isinstance(pl, PayloadSystemReset):
      pass #TODO
    elif isinstance(pl, PayloadSystemSupportedPayloads):
      reply = PayloadSystemSupportedPayloads(False, set(self.payload_handlers))
    if reply is not None:
      self.send(Frame(self.address, frame.src, reply))


class HubClient(HubBase):
  """
  Hub for a single client connection that print received messages
  """

  def __init__(self, addr, con):
    HubBase.__init__(self, addr)
    self.server = con
    self.add_connection(self.server)

  def route_frame(self, frame, con=None):
    if self.server == con:
      return []
    else:
      return [self.server]

  def on_frame(self, con, frame):
    print "<<< %r" % frame
    HubBase.on_frame(self, con, frame)

  def remove_connection(self, con):
    HubBase.remove_connection(self, con)
    if con is self.server:
      self.stop()


def main():
  import argparse

  parser = argparse.ArgumentParser()
  parser.add_argument('address', type=lambda x: int(x, 0),
      help="PPP node address")
  parser.add_argument('source',
      help="source to listen from (host:port or filename)")
  parser.add_argument('--baudrate', type=int, default=None,
      help="serial baudrate, imply serial port, defaults to 38400")
  parser.add_argument('-i', '--interactive', action='store_true', default=False,
      help="start an interactive IPython shell")

  args = parser.parse_args()

  fo = Connection.fromsource(args.source, baudrate=args.baudrate)
  hub = HubClient(args.address, fo)
  hub.start()
  if not args.interactive:
    hub.run()
  else:
    hub.thread = hub.run_threaded()

    import perlimpinpin
    import perlimpinpin.frame
    import perlimpinpin.payload
    namespace = {
        'hub': hub,
        'Frame': Frame,
        'payload': perlimpinpin.payload,
        }
    # payload base classes
    namespace.update({ cls.__name__: cls for cls in perlimpinpin.payload.payloads.values() })
    # payload.system subclasses
    namespace.update({ k: getattr(perlimpinpin.payload.system, k)
      for k in dir(perlimpinpin.payload.system) if k.startswith('PayloadSystem')
      })

    import IPython
    IPython.embed(user_ns=namespace, banner2="PPP interactive shell")


if __name__ == '__main__':
  main()

