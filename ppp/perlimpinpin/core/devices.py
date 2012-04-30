import re
from collections import namedtuple
from . import types as ppp_types


class Robot:
  """
  Describe a robot.

  Attributes:
    devices -- a list of devices (Device instances)
    transactions -- a list of transactions
    messages -- a list of messages

  """

  def __init__(self, objs):
    """Create a new robot description."""
    self.devices = []
    self.transactions = []
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


  def add_transactions(self, transactions):
    """Add message to the robot, from transactions.
    Auto-attribute IDs to messages without an ID.
    """
    messages = [ msg for t in transactions for msg in t.messages() ]

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

    self.transactions += transactions
    self.messages += messages


  def merge(self, robot):
    """Merge content from another robot."""
    self.add_devices(robot.devices)
    self.add_transactions(robot.messages)

  def update(self, objs):
    """Add/merge random objects (devices, robots, transactions, ...)."""
    for obj in objs:
      if isinstance(obj, Robot):
        self.merge(obj)
      elif isinstance(obj, Device):
        self.add_devices([obj])
      elif isinstance(obj, Transaction):
        self.add_transactions([obj])
      elif isinstance(obj, TransactionGroup):
        self.add_transactions(obj.transactions)
      elif isinstance(obj, (list, tuple)):
        self.update(obj)



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


class Message(object):
  """
  Single transmitted message.

  Attributes:
    name -- message name (lowercase, with underscores)
    params -- payload parameters, as a list of (name, type) pairs
    mid -- message ID (automatically assigned if None)
    tid -- transaction ID type: None (always 0), 'new' or 'forward'
    ptuple -- namedtuple for message parameters

  """

  def __init__(self, name, params, mid=None, tid=None):
    if not re.match('^[a-z][a-z0-9_]*$', name):
      raise ValueError("invalid message name: %r" % name)
    if tid not in (None, 'new', 'forward'):
      raise ValueError("invalid tid: %r" % tid)
    self.name = name
    self.mid = mid
    self.tid = tid

    names = set()  # defined parameter names
    self.params = []
    for n, t in params:
      self._check_name(n)
      if n in names:
        raise ValueError("parameter %r already defined" % n)
      names.add(n)
      self.params.append((n, self._convert_type(t)))
    self.ptuple = namedtuple('%s_params' % name, [ k for k,t in params ])

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


class Transaction(object):
  """
  High-level object which groups one or several messages.

  Attributes:
    name -- transaction group name (see Message.name)
    desc -- description, or None

  """
  desc = None  # provide default value for instances

  def messages(self):
    """Return messages handled by the group."""
    raise NotImplementedError()


class TransactionSingle(Transaction):
  """
  Transaction with a single message

  Attributes:
    msg -- the message

  """

  def __init__(self, name, params, desc=None, mid=None):
    self.name = name
    self.desc = desc
    self.msg = Message(name, params, mid, tid=None)

  def messages(self):
    return [self.msg]


class Command(Transaction):
  """
  Command transaction.

  Attributes:
    request -- request message
    response -- response message

  """

  response_suffix = '_r'

  def __init__(self, name, preq, pres, desc=None, mid=None):
    name_r = name+self.response_suffix
    mid_r = None if mid is None else mid+1
    self.name = name
    self.desc = desc
    self.request = Message(name, preq, mid, tid='new')
    self.response = Message(name_r, pres, mid_r, tid='forward')

  def messages(self):
    return [self.request, self.response]


class Order(TransactionSingle):
  pass

class Event(TransactionSingle):
  pass


class TransactionGroup(object):
  """
  Group transactions

  Only used to group transactions so they have successive message IDs.

  Attributes:
    transactions -- transaction list

  """

  def __init__(self, mid, transactions):
    self.transactions = transactions
    for t in transactions:
      for m in t.messages():
        if m.mid is None:
          m.mid = mid
          mid += 1

