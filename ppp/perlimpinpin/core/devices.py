import re
from . import types as ppp_types


class Robot:
  """
  Describe a robot.

  Attributes:
    devices -- a list of devices (Device instances)
    messages -- a list of messages

  """

  def __init__(self, objs):
    """Create a new robot description."""
    self.devices = []
    self.messages = []
    self.wrappers = []
    self.update(objs)


  def add_devices(self, devices):
    """Add devices to the robot."""

    # check for duplicate names (case insensitive)
    dev_names = set( dev.name.lower() for dev in self.devices )
    for dev in devices:
      name = dev.name.lower()
      if name in dev_names:
        raise ValueError("device name %r already used" % name)
      else:
        dev_names.add(name)

    # check for duplicate ROIDs
    dev_roids = dict( (dev.roid, dev) for dev in self.devices )
    for dev in devices:
      roid = dev.roid
      if roid in dev_roids:
        raise ValueError("ROID %u set on %r already used by %r"
            % (roid, dev.name, dev_roids[roid].name))
      else:
        dev_roids[roid] = dev

    # assign robot to devices
    for dev in devices:
      if dev.robot is not None:
        raise AttributeError("device %r already assigned to a robot" % dev.name)
      dev.robot = self

    self.devices += devices


  def add_messages(self, wrappers):
    """Add messages to the robot, from wrappers.
    Auto-attribute IDs to messages without an ID.
    """
    messages = [ msg for w in wrappers for msg in w.messages() ]

    # check for duplicate message IDs or names (case insensitive)
    msgs_map = dict( (msg.mid, msg) for msg in self.messages )
    msgs_names = set( msg.name for msg in self.messages )
    msgs_noid = []  # messages without ID
    for msg in messages:
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

    self.messages += messages


  def merge(self, robot):
    """Merge content from another robot."""
    self.add_devices(robot.devices)
    self.add_messages(robot.messages)

  def update(self, objs):
    """Add/merge random objects (devices, messages, robots...)."""
    for obj in objs:
      if isinstance(obj, Robot):
        self.merge(obj)
      elif isinstance(obj, Device):
        self.add_devices([obj])
      elif isinstance(obj, MessageWrapper):
        self.add_messages([obj])



class Device(object):
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


class Message(MessageWrapper):
  """
  Single transmitted message.

  Attributes:
    name -- message name (lowercase, with underscores)
    params -- payload parameters, as a list of (name, type) pairs
    mid -- message ID (automatically assigned if None)
    tid -- transaction ID type: None (always 0), True (manually set), False (auto set)
    desc -- message description, or None

  """

  def __init__(self, name, params, mid=None, tid=0, desc=None):
    if not re.match('^[a-z][a-z0-9_]*$', name):
      raise ValueError("invalid message name: %r" % name)
    self.name = name
    self.mid = mid
    self.tid = tid
    self.desc = desc

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
    """For MessageWrapper interface."""
    return [self]


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
    self.request = Message(name, preq, mid, tid=False)
    self.response = Message(name_r, pres, mid_r, tid=True)
    self.desc = desc

  def messages(self):
    return [self.request, self.response]


class Order(Message): pass
class Event(Message): pass


class MsgGroupWrapper(MessageWrapper):
  """
  Message group with successive message IDs.

  Attributes:
    mid -- starting mid
    grpmsgs -- messages of the group

  """
  def __init__(self, mid, wrappers):
    self.mid = mid
    self.grpmsgs = [ msg for w in wrappers for msg in w.messages() ]
    for msg in self.grpmsgs:
      if msg.mid is not None:
        raise ValueError("mid already set on %s" % msg.name)
      msg.mid = mid
      mid += 1

  def messages(self):
    return self.grpmsgs

