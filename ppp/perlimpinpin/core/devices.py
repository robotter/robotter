import re
from . import types as ppp_types


class Robot:
  """
  Describe a robot.

  Attributes:
    devices -- a tuple of devices (Device instances)
    messages -- a tuple of messages
    wrappers -- a tuple of message wrappers

  """

  def __init__(self, devices, wrappers):
    """Create a new robot description.
    Check device and message consistency.
    Auto-attribute IDs to message without ID.
    """
    # assign robot to devices
    for dev in devices:
      if dev.robot is not None:
        raise AttributeError("device %r already assigned to a robot" % dev.name)
      dev.robot = self
    self.devices = tuple(devices)

    # check for duplicate names (case insensitive)
    dev_names = set()  # device names, lowercase
    for dev in devices:
      name = dev.name.lower()
      if name in dev_names:
        raise ValueError("device name %r already used" % name)
      else:
        dev_names.add(name)

    # check for duplicate ROIDs
    dev_roids = {}  # devices, indexed by ROID
    for dev in devices:
      roid = dev.roid
      if roid in dev_roids:
        raise ValueError("ROID %u set on %r already used by %r"
            % (roid, dev.name, dev_roids[roid].name))
      else:
        dev_roids[roid] = dev

    self.messages = tuple( msg for w in wrappers for msg in w.messages() )

    # check for duplicate message IDs or names (case insensitive)
    msgs_map = {}  # messages, indexed by ID
    msgs_noid = []  # messages without ID
    msgs_names = set()
    for msg in self.messages:
      mid = msg.mid
      if mid is None:
        msgs_noid.append(msg)
      elif mid in msgs_map:
        raise ValueError("message ID %u set on %r already used by %r"
            % (mid, msg.name, msgs_map[mid].name))
      else:
        if not 1 <= mid <= 0xff:
          raise ValueError("invalid message ID set on %r: %u" % (msg.name, mid))
        msgs_map[mid] = msg
      name = msg.name.lower()
      if name in msgs_names:
        raise ValueError("message name %r already used" % name)
      else:
        msgs_names.add(name)

    # auto-attribute message IDs
    mid = 1
    for msg in msgs_noid:
      while mid in msgs_map:
        mid += 1
        if mid > 0xff:
          raise OverflowError("too many messages")
      msg.mid = mid
      msgs_map[mid] = msg


class Device:
  """
  Describe robot device (part of robot system).

  Attributes:
    name -- device's name
    roid -- device's ROID (and I2C address)
    robot -- device's robot (set by the robot itself)

  """
  def __init__(self, name, roid):
    if not re.match('^[a-zA-Z][a-zA-Z0-9_]*$', name):
      raise ValueError("invalid device name: %r" % name)
    if not 0x08 <= roid < 0x78:
      raise ValueError("invalid ROID: %r" % roid)
    self.name = name
    self.roid = int(roid)
    self.robot = None


class Message:
  """
  Single transmitted message.

  Attributes:
    name -- message name (lowercase, with underscores)
    params -- payload parameters, as a list of (name, type) pairs
    mid -- message ID (automatically assigned if None)

  """

  def __init__(self, name, params, mid=None):
    if not re.match('^[a-z][a-z0-9_]*$', name):
      raise ValueError("invalid message name: %r" % name)
    self.name = name
    self.mid = mid

    names = set()  # defined parameter names
    self.params = []
    for n, t in params:
      self._check_name(n)
      if n in names:
        raise ValueError("parameter %r already defined" % n)
      names.add(n)
      self.params.append((n, self._convert_type(t)))

  @classmethod
  def _convert_type(cls, t):
    """Helper method to check and convert a parameter type."""
    if isinstance(t, basestring):
      t = ppp_types.types[t]
    if not isinstance(t, ppp_types._Type):
      raise TypeError("invalid data type")
    return t

  @classmethod
  def _check_name(cls, name):
    """Helper method to check a parameter name."""
    if not re.match('^[a-zA-Z][a-zA-Z0-9_]*$', name):
      raise ValueError("invalid parameter name: %r" % name)

  def messages(self):
    """For compatibility with MessageWrapper."""
    return [self]


class MessageWrapper:
  """
  High-level object representing one or several messages.

  Attributes:
    desc -- message description, or None

  """
  desc = None  # provide default value for instances
  def messages(self):
    """Return messages implemented by the wrapper."""
    raise NotImplementedError()


class Telemetry(Message, MessageWrapper):
  """
  Telemetry message, from device to exterior.
  """
  def __init__(self, name, params, desc=None, mid=None):
    Message.__init__(self, name, params, mid)
    self.desc = desc


class Command(MessageWrapper):
  """
  Command message.

  Attributes:
    request -- request message
    response -- response message

  """

  response_suffix = '_r'

  def __init__(self, name, preq, pres, desc=None, mid=None):
    name_r = name+self.response_suffix
    mid_r = None if mid is None else mid+1
    self.request = Message(name, preq, mid)
    self.response = Message(name_r, pres, mid_r)
    self.desc = desc

  def messages(self):
    return [self.request, self.response]

