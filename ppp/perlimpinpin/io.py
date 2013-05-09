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
import traceback
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
    self.hub.send(frame, self)

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

  Connections are switched to non-blocking mode.

  Attributes:
    cons -- set of Connection objects
    started -- True if start() has been called
    _running -- True when run() is being called
    _lock -- lock for thread-safety
    _poll_cons -- polled connections, indexed by fd
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
        con.reset()
        self._poll_cons[con.fd] = con

  def remove_connection(self, con):
    """Remove a connection from a hub"""
    if con.hub is not self:
      raise ValueError("connection not in hub")
    with self._lock:
      self.cons.remove(con)
      con.hub = None
      if self.started:
        del self._poll_cons[con.fd]

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
      msg_pr, msg_pw = os.pipe()
      flags = fcntl.fcntl(msg_pr, fcntl.F_GETFL)
      fcntl.fcntl(msg_pr, fcntl.F_SETFL, flags|os.O_NONBLOCK)
      for con in self.cons:
        con.reset()
        self._poll_cons[con.fd] = con
      # keep copies on instance
      self.started = True

  def stop(self):
    """Stop I/O processing

    This will interrupt a call to run().
    """
    if not self.started:
      raise RuntimeError("not running")
    if self._running:
      pass #TODO(?)
    else:
      # stop now
      self._stop()

  def _stop(self):
    """Deinitialize I/O processing"""
    self.started = False


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
      try:
        data = frame.data()
      except Exception as e:
        sys.stderr.write("failed to format frame: %s\n" % e)
        return
      for con in cons:
        n = os.write(con.fd, data)
        if n != len(data):
          raise RuntimeError("incomplete write to %d" % con.fd)

  def schedule(self, dt, cb):
    """Schedule a callback to be executed in dt seconds"""
    t = time.time() + dt
    with self._lock:
      self._timers_queue.put((t, cb))


  def run_one(self, timeout=None):
    """Process a single batch of I/O events

    timeout is ignored.

    Processing exceptions are printed on stderr.
    """

    time.sleep(0.01)

    if not self._timers_queue.empty():
      tnow = time.time()
      # get() may block, but we don't consider it for the timeout
      t, cb = self._timers_queue.get()
      if tnow >= t:
        cb()
      else:
        # put back the callback
        self._timers_queue.put((t, cb))

    # process connections
    for con in self._poll_cons.values():
      fd = con.fd
      try:
        data = os.read(fd, 4096)
        #TODO for now, we never remove connections
      except OSError as e:
        if e.errno == os.errno.EAGAIN:
          continue
        raise
      while True:
        frame = con.rgen.send(data)
        if frame is None:
          break
        data = ''
        try:
          self.on_frame(con, frame)
        except Exception as e:
          traceback.print_exc()


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
    self.verbose = False

  def route_frame(self, frame, con=None):
    if self.server == con:
      return []
    else:
      return [self.server]

  def on_frame(self, con, frame):
    if self.verbose:
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
  hub.verbose = True
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

