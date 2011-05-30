import os
import threading
import types
from .core import protocol, Device, Message
from .core.types import ppp_uint8
from .core.protocol import Frame, UARTFrame


class Binding(object):
  """
  Python binding to send and receive message.

  Some methods are intended to be (re)defined in subclasses.
  A lock is used for safe concurrent read/write to the connection, especially
  when listening.

  Attributes
    conn -- UART connection object
    robot -- Robot instance
    roid -- ROID for sent frames (writable)
    _lock -- lock for connection read/write
    _messages -- dict of messages, indexed by mid
    _feed_data -- unprocessed fed data
    _listen_th -- listening thread
    _listen_pw -- listening pipe write end, to abort listening

  """

  def __init__(self, conn, robot, roid):
    self.conn = conn
    self.robot = robot
    self.roid = roid
    self._messages = dict( (msg.mid, msg) for msg in robot.messages )
    self._lock = threading.RLock()
    self._feed_data = ''
    self._listen_th = None
    self._listen_pw = None
    if self.roid is None:
      self.discover()

  def on_rawdata(self, data):
    """Called on received non-frame data."""
    pass

  def on_message(self, msg, src, args):
    """Called on received message.
    msg is the received message.
    src is the source device, or an integer ROID.
    args is a dict of arguments.
    """
    pass

  def on_error(self, frame, msg):
    """Called on erroneous frame."""
    raise StandardError("failed to process frame: %s" % msg)

  def send(self, data):
    """Send raw data or a frame."""
    if isinstance(data, Frame):
      data = data.data()
    with self._lock:
      self.conn.write(data)

  def feed(self, data):
    """Process incoming data.
    Extract and process frames from incoming data.
    """
    data = self._feed_data + data
    while True:
      frame, pre, data = UARTFrame.extract(data)
      if pre:
        self.on_rawdata(pre)
      if frame is None:
        break
      try:
        mid = frame.unpack(ppp_uint8)
        if mid == 0:
          raise ValueError("unexpected protocol command")
        try:
          msg = self._messages[mid]
        except KeyError:
          raise KeyError("unknown mid: %r" % mid)
        args = frame.unpack_args(msg.params)
        if len(frame.unparsed) != 0:
          raise ValueError("extra frame data")
        src = self.roid_to_data(frame.src)
        self.on_message(msg, src, args)
      except Exception, e:
        self.on_error(frame, str(e))
    self._feed_data = data

  def build_frame(self, msg, dst, *args, **kw):
    """Build a message frame."""
    frame = UARTFrame(self.roid, self.roid_from_data(dst))
    frame.pack(ppp_uint8, msg.mid)
    frame.pack_args(msg.params, args, kw)
    return frame

  def send_message(self, msg, dst, *args, **kw):
    """Build and send a message frame."""
    self.send(self.build_frame(msg, dst, *args, **kw))

  def roid_to_data(self, roid):
    """Convert an ROID to more data, if possible."""
    for dev in self.robot.devices:
      if dev.roid == roid:
        return dev
    return roid

  def roid_from_data(self, data):
    """Return an ROID from a "random" object."""
    if isinstance(data, basestring):
      for dev in self.b.robot.devices:
        if dev.name == dst:
          return dev.roid
      raise KeyError("no device with name '%s'"%data)
    if hasattr(data, 'roid'):
      return data.roid
    return int(data)

  def listen_start(self):
    """Listen for incoming data in a separated thread."""
    if self._listen_th is not None:
      raise Exception("already listening")

    import select
    conn = self.conn
    # eof method for the connection object
    if hasattr(conn, 'eof') and callable(conn.eof):
      eof = conn.eof
    elif hasattr(conn, 'inWaiting') and callable(conn.inWaiting):
      eof = lambda: conn.inWaiting() == 0
    else:
      raise TypeError("connection does not support EOF")

    pr,pw = os.pipe()
    def f():
      while True:
        rds = select.select([conn, pr],[],[])[0]
        if pr in rds:
          return  # abort listening
        if conn in rds:
          data = ''
          with self._lock:
            # read as much as possible
            while not eof():
              data += conn.read(1)
          self.feed(data)

    th = threading.Thread(target=f)
    th.daemon = True
    th.start()
    self._listen_th = th
    self._listen_pw = pw

  def listen_stop(self):
    if self._listen_th is None:
      raise Exception("not listening")
    with self._lock:
      self._listen_pw.close()
    self._listen_th.join()
    self._listen_th = None
    self._listen_pw = None

  def discover(self):
    if self._listen_th is not None:
      raise Exception("listening is runing, cannot discover")
    self.send(UARTFrame.build_uart_discover())
    print "discovering..."

    data = ''
    while True:
      data += self.conn.read(1)
      frame, pre, data = UARTFrame.extract(data)
      if frame is None:
        continue
      try:
        mid = frame.unpack(ppp_uint8)
        if mid != 0:
          continue
        subcmd = frame.unpack(ppp_uint8)
        if len(frame.unparsed) != 0:
          raise ValueError("extra frame data")
        if subcmd == protocol.SUBCMD_UART_DISCOVER:
          self.roid = frame.dst
          dev = self.roid_to_data(self.roid & 0x7f)
          if isinstance(dev, Device):
            s = dev.name
          else:
            s = '0x%02X' % self.roid
          print "connected to %s" % s
          return
      except Exception, e:
        self.on_error(frame, str(e))

  def subscribe(self, dst, subscriber=None):
    if subscriber is not None:
      subscriber = self.roid_from_data(subscriber)
    dst = self.roid_from_data(dst)
    self.send(UARTFrame.build_subscribe(self.roid, dst, subscriber))


class ClientDevice(Device):
  """
  A Device for use by a Client.

  Attributes:
    _cl -- associated Client instance

  """

  def __new__(cls, dev, cl):
    if isinstance(dev, cls):
      raise TypeError("device already wrapped to a ClientDevice")
    dev.__class__ = cls
    return dev

  def __init__(self, dev, cl):
    assert dev is self
    self._cl = cl

  def __getattr__(self, k):
    try:
      return types.MethodType(self._cl._msg_wrp[k], self, ClientDevice)
    except KeyError:
      raise AttributeError(k)

  def __dir__(self):
    return self.__dict__.keys() + self._cl._msg_wrp.keys()

  def subscribe(self, subscriber=None):
    self._cl.b.subscribe(self, subscriber)



class Client(object):
  """
  PPP client for interactive sessions.

  Attributes:
    b -- ClientBinding instance
    _dev_wrp -- dict of ClientDevice, indexed by name
    _msg_wrp -- dict of message methods, indexed by name

  """

  def __init__(self, b):
    if not isinstance(b, Binding):
      raise TypeError("not a binding")
    self.b = b
    self._dev_wrp = dict(
        (dev.name, ClientDevice(dev, self))
        for dev in b.robot.devices )
    self._msg_wrp = dict(
        (msg.name, types.MethodType(b.send_message, msg, Message))
        for msg in b.robot.messages )

  def __getattr__(self, k):
    try:
      return self._dev_wrp[k]
    except KeyError:
      pass
    try:
      return self._msg_wrp[k]
    except KeyError:
      raise AttributeError(k)

  def __dir__(self):
    return self.__dict__.keys() + self._dev_wrp.keys() + self._msg_wrp.keys()

  def subscribe(self, dst, subscriber=None):
    self.b.subscribe(dst, subscriber)

