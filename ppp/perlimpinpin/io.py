"""

Handle PPP I/O from several sources simultaneously

"""

import os
import select
import fcntl
import threading
import Queue
from frame import Frame

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



class Hub(object):
  """
  Handle PPP I/O for multiple connections

  I/O are processed in a separated thread.

  The following methods must be implemented:
    on_frame() -- called when a frame is received
    route_frame() -- route a packet

  Frames can be sent directly through a Connection object or through the hub to
  be routed.

  Events such as I/O thread stop, new frames in queue, etc. are announced using
  an internal pipe and queue. See also _internal_msg_send().
  The following characters can be sent:
    'w' -- new frame to send in queue, data: (Frame, Connections)
    'x' -- exit I/O thread, data: None
    'c' -- add a new connection, data: Connection
    'C' -- remove a connection, data: Connection

  Connections are switched to non-blocking mode.

  Attributes:
    cons -- set of Connection objects
    thread -- I/O thread
    _lock -- lock for thread-safety
    _poll -- epoll object
    _msg_queue -- Queue for internal events data
    _msg_pw -- pipe to announce internal events to the I/O thread

  """

  def __init__(self):
    self.thread = threading.Thread(target=self.run, name='PPPHub')
    self.cons = set()
    self._lock = threading.RLock()

  def add_connection(self, con):
    """Add a connection to a hub"""
    if con.hub is not None:
      raise ValueError("connection already in a hub")
    with self._lock:
      con.hub = self
      self.cons.add(con)
      if self.thread.is_alive():
        self._msg_send('c', con)

  def remove_connection(self, con):
    """Remove a connection from a hub"""
    if con.hub is not self:
      raise ValueError("connection not in hub")
    with self._lock:
      self.cons.remove(con)
      con.hub = None
      if self.thread.is_alive():
        self._msg_send('C', con)

  def start(self):
    """Start the I/O thread"""
    self.thread.start()

  def stop(self):
    """Stop the I/O thread"""
    if not self.thread.is_alive():
      raise RuntimeError("not running")
    self._msg_send('x', None)
    self.thread.join()


  def _msg_send(self, c, data):
    """Send an internal event to the I/O thread"""
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
    if not self.thread.is_alive():
      raise RuntimeError("not running")
    if cons is None:
      cons = self.route_frame(frame)
    if cons:
      self._msg_send('w', (frame, cons))

  def run(self):
    """I/O thread target"""
    cons = {}  # connections, indexed by fd
    # prepare connection, queue, epoll, etc.
    with self._lock:
      qsend = Queue.Queue()
      poll = select.epoll(len(self.cons)+1)
      msg_pr, msg_pw = os.pipe()
      poll.register(msg_pr, select.EPOLLIN)
      for con in self.cons:
        con.reset()
        cons[con.fd] = con
        poll.register(con.fd, select.EPOLLIN)
      # keep copies on instance
      self._msg_queue = qsend
      self._poll = poll
      self._msg_pw = msg_pw

    try:
      while True:
        for fd, ev in poll.poll(-1):
          # internal event
          if fd == msg_pr:
            for c in os.read(fd, 32):
              if c == 'w':
                # new frame to send
                frame, dst_cons = qsend.get()
                qsend.task_done()
                data = frame.data()
                for con in dst_cons:
                  if con.wbuf is None:
                    con.wbuf = data
                    poll.modify(con.fd, select.EPOLLIN|select.EPOLLOUT)
                  else:
                    con.wbuf += data
              elif c == 'c':
                # new connection
                con = qsend.get()
                con.reset()
                cons[con.fd] = con
                self._poll.register(con.fd, select.EPOLLIN)
              elif c == 'C':
                # remove connection
                con = qsend.get()
                self._poll.unregister(con.fd)
                del cons[con.fd]
              elif c == 'x':
                # exit the I/O thread
                return
          # receive data
          elif ev & select.EPOLLIN:
            con = cons[fd]
            while True:
              try:
                data = os.read(fd, 512)
                if not data:
                  if con.hub is self:  # avoid double removal
                    self.remove_connection(con)
                  break
              except OSError as e:
                if e.errno == os.errno.EAGAIN:
                  break
                raise
              frame = con.rgen.send(data)
              if frame is None:
                break
              self.on_frame(con, frame)
          # send data
          elif ev & select.EPOLLOUT:
            con = cons[fd]
            try:
              n = os.write(fd, con.wbuf)
            except OSError as e:
              if e.errno != os.errno.EAGAIN:
                raise
            else:
              if n == len(con.wbuf):
                poll.modify(fd, select.EPOLLIN)
                con.wbuf = None
              else:
                con.wbuf = con.wbuf[n:]
          # unexpected event
          else:
            raise RuntimeError("unexpected event %r for fd %d" % (ev, fd))
    finally:
      poll.close()
      os.close(msg_pr)
      os.close(msg_pw)
      self._poll = None
      self._msg_pw = None
      self._msg_queue = None


