from .core import Device, Message
from .core.types import ppp_uint8
from .core.protocol import Frame, UARTFrame


class Binding(object):
  """
  Python binding to send and receive message.

  Some methods are intended to be (re)defined in subclasses.

  Attributes
    robot -- Robot instance
    uart -- True for UART mode
    _msg_wrappers -- dict of message methods, indexed by name
    _messages -- dict of messages, indexed by mid
    _frame_cls -- Frame class
    _feed_data -- unprocessed fed data

  """

  def __init__(self, robot, roid, uart=True):
    self.robot = robot
    self.uart = uart
    self.roid = roid
    self._frame_cls = UARTFrame if uart else Frame
    self._msg_wrappers = dict( (msg.name, self._wrap_message(msg)) for msg in robot.messages )
    self._messages = dict( (msg.mid, msg) for msg in robot.messages )
    self._feed_data = ''

  def send_raw(self, data):
    """Send raw data."""
    raise NotImplementedError()

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
    self.send_raw(data)

  def feed(self, data):
    """Process incoming data.
    Extract and process frames from incoming data.
    This method is intended to be used with streamed data (e.g. UART).
    Return fed data without extracted frames.
    """
    data = self._feed_data + data
    ret = ''
    while True:
      frame, pre, data = self._frame_cls.extract(data)
      ret += pre
      if frame is None:
        break
      try:
        mid = frame.unpack(ppp_uint8)
        try:
          msg = self._messages[mid]
        except KeyError:
          raise KeyError("unknown mid: %r" % mid)
        args = frame.unpack_args(msg.params)
        if len(frame.unparsed) != 0:
          raise ValueError("extra frame data")
        src = frame.src
        for dev in self.robot.devices:
          if dev.roid == frame.src:
            src = dev
            break
        self.on_message(msg, src, args)
      except Exception, e:
        self.on_error(frame, str(e))
    self._feed_data = data
    return ret


  def message_frame(self, msg, dst, *args, **kw):
    """Build a message frame."""
    frame = self._frame_cls(self.roid, dst)
    frame.pack(ppp_uint8, msg.mid)
    frame.pack_args(msg.params, args, kw)
    return frame


  def __getattr__(self, k):
    try:
      return self._msg_wrappers[k]
    except KeyError:
      raise AttributeError(k)

  def __dir__(self):
    return self.__dict__.keys() + self._msg_wrappers.keys()

  def _wrap_message(self, msg):
    def msg_wrapper(dst, *args, **kw):
      if isinstance(dst, Device):
        dst = dst.roid
      elif isinstance(dst, basestring):
        for dev in self.robot.devices:
          if dev.name == dst:
            dst = dev.roid
            break
      self.send(self.message_frame(msg, dst, *args, **kw))
    return msg_wrapper

