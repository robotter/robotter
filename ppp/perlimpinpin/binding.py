from .core import Telemetry, Command, Message
from .core.types import ppp_uint8
from .core.protocol import Frame, UARTFrame


class Binding(object):
  """
  Python binding to send and receive message.

  Command calls are asynchronous.
  Some methods are intended to be (re)defined in subclasses.

  Attributes
    robot -- Robot instance
    uart -- True for UART mode
    _cmd_wrappers -- dict of command methods, indexed by name
    _messages -- dict of messages, indexed by mid
    _frame_cls -- Frame class
    _feed_data -- unprocessed fed data

  """

  def __init__(self, robot, uart=True):
    self.robot = robot
    self.uart = uart
    self._frame_cls = UARTFrame if uart else Frame
    self._cmd_wrappers = dict( (cmd.name, self._wrap_command(cmd)) for cmd in robot.commands() )
    self._messages = dict( (msg.mid, msg) for msg in robot.messages() )
    self._feed_data = ''

  def send_raw(self, data):
    """Send raw data."""
    raise NotImplementedError()

  def on_response(self, cmd, args):
    """Called on command reply.
    cmd is the command which is replied to. args is a dict of arguments.
    """
    pass

  def on_telemetry(self, msg, args):
    """Called on received telemetry.
    msg is the received telemetry. args is a dict of arguments.
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
        if isinstance(msg, Telemetry):
          params, cb = msg.params, self.on_telemetry
        elif isinstance(msg, Command):
          params, cb = msg.oparams, self.on_response
        else:
          raise TypeError("unsupported message type")
        args = frame.unpack_args(params)
        if len(frame.unparsed) != 0:
          raise ValueError("extra frame data")
        cb(msg, args)
      except Exception, e:
        self.on_error(frame, str(e))
    self._feed_data = data
    return ret


  def message_frame(self, mid, params, *args, **kw):
    """Build a message frame."""
    frame = self._frame_cls()
    frame.pack(ppp_uint8, mid)
    frame.pack_args(params, args, kw)
    return frame

  def command_frame(self, msg, *args, **kw):
    """Build a command frame."""
    return self.message_frame(msg.mid, msg.iparams, *args, **kw)

  def response_frame(self, msg, *args, **kw):
    """Build a command response frame."""
    return self.message_frame(msg.mid, msg.oparams, *args, **kw)

  def telemetry_frame(self, msg, *args, **kw):
    """Build a telemetry frame."""
    return self.message_frame(msg.mid, msg.params, *args, **kw)


  def __getattr__(self, k):
    try:
      return self._cmd_wrappers[k]
    except KeyError:
      raise AttributeError(k)

  def __dir__(self):
    return self.__dict__.keys() + self._cmd_wrappers.keys()

  def _wrap_command(self, cmd):
    def cmd_wrapper(*args, **kw):
      self.send(self.command_frame(cmd, *args, **kw))
    return cmd_wrapper
