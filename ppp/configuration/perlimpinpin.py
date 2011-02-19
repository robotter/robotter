import re


class Robot:
  """
  Describe a robot.

  Attributes:
    devices -- a list of devices (Device instances)
    master -- the master device
    slaves -- list of slave devices

  """

  def __init__(self, devices):
    """Create a new robot description.
    Check device and message consistency.
    Auto-attribute IDs to message without ID.
    """
    # asigne robot to devices, split master and slaves
    self.master = None
    self.slaves = []
    for dev in devices:
      if dev.robot is not None:
        raise AttributeError("device %r already assigned to a robot" % dev.name)
      dev.robot = self
      if isinstance(dev, MasterDevice):
        if self.master is not None:
          raise ValueError("master already defined: %r" % self.master.name)
        self.master = dev
      elif isinstance(dev, SlaveDevice):
        self.slaves.append(dev)
    if self.master is None:
      raise ValueError("no master")
    self.devices = devices

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

    # check for duplicate message IDs
    messages = {}  # messages, indexed by ID
    msgs_noid = []  # messages without ID
    for dev in devices:
      for msg in dev.messages:
        mid = msg.mid
        if mid is None:
          msgs_noid.append(msg)
        elif mid in messages:
          raise ValueError("message ID %u set on %r already used by %r"
              % (mid, msg.name, messages[mid].name))
        else:
          messages[mid] = msg

    # auto-attribute message IDs
    mid = 0
    for msg in msgs_noid:
      while mid in messages:
        mid += 1
        if mid > 0xff:
          raise OverflowError("too many messages")
      msg.mid = mid
      messages[mid] = msg


class Device:
  """
  Describe robot device (part of robot system).

  Attributes:
    name -- device's name
    roid -- device's ROID (and I2C address)
    messages -- list of messsages
    uartnum -- ATmega UART number or None
    outdir -- directory for device's generated files
    robot -- device's robot (set by the robot itself)

  """
  def __init__(self, name, roid, messages, uartnum=None, outdir=None):
    if not re.match('^[a-zA-Z][a-zA-Z0-9_]*$', name):
      raise ValueError("invalid device name: %r" % name)
    if uartnum is not None and not 0 <= uartnum < 8:
      raise ValueError("invalid UART number")
    if not 0x08 <= roid < 0x78:
      raise ValueError("invalid ROID: %r" % roid)
    self.name = name
    self.roid = int(roid)
    self.messages = messages
    self.uartnum = uartnum
    self.outdir = outdir
    self.robot = None

    # assign device to messages
    for msg in self.messages:
      if msg.device is not None:
        raise AttributeError("message %r already assigned to a device" % msg.name)
      msg.device = self


  def messages_of_type(self, typ):
    """Return messages of a given type."""
    assert issubclass(typ, Message)
    return [ msg for msg in self.messages if isinstance(msg, typ) ]



class SlaveDevice(Device):
  pass

class MasterDevice(Device):
  
  def slave_commands(self):
    """Return command messages of slaves."""
    ret = []
    for dev in self.robot.devices:
      if isinstance(dev, SlaveDevice):
        ret += dev.messages_of_type(Command)
    return ret


class Message:
  """
  Transmitted message, either from or to a device.

  Attributes:
    name -- message name (uppercase, with underscores)
    mid -- message ID (automatically assigned if None)
    desc -- message description, or None
    device -- message's device (set by the device itself)

  """
  def __init__(self, name, mid=None, desc=None):
    if not re.match('^[A-Z][A-Z0-9_]*$', name):
      raise ValueError("invalid message name: %r" % name)
    self.name = name
    self.mid = mid
    self.desc = desc
    self.device = None

  @classmethod
  def _convert_type(cls, t):
    """Helper method to check and convert a parameter type."""
    if isinstance(t, basestring):
      t = types[t]
    if not isinstance(t, Type):
      raise TypeError("invalid data type")
    return t

  @classmethod
  def _check_name(cls, name):
    """Helper method to check a parameter name."""
    if not re.match('^[a-zA-Z][a-zA-Z0-9_]*$', name):
      raise ValueError("invalid parameter name: %r" % name)


class Telemetry(Message):
  """
  Telemetry message, from device to exterior.

  Attributes:
    params -- payload parameters, as a list of fields

  """
  def __init__(self, name, params, **kw):
    Message.__init__(self, name, **kw)
    names = set()  # defined parameter names
    self.params = []
    for n, t in params:
      self._check_name(n)
      if n in names:
        raise ValueError("parameter %r already defined" % n)
      names.add(n)
      self.params.append((n, self._convert_type(t)))


class Command(Message):
  """
  Command message, from exterior to device.

  Attributes:
    iparams -- input parameters (arguments)
    oparams -- output parameters (returned values)
  """
  def __init__(self, name, iparams, oparams, **kw):
    Message.__init__(self, name, **kw)
    names = set()  # defined parameter names (shared by in/out params)

    self.iparams = []
    for n, t in iparams:
      self._check_name(n)
      if n in names:
        raise ValueError("parameter %r already defined" % n)
      names.add(n)
      self.iparams.append((n, self._convert_type(t)))

    self.oparams = []
    for n, t in oparams:
      self._check_name(n)
      if n in names:
        raise ValueError("parameter %r already defined" % n)
      names.add(n)
      self.oparams.append((n, self._convert_type(t)))



#
# Type definitions
#
#TODO move this in a dedicated file
#

types = {}  # defined types


class Type(type):
  """
  Type metaclass for Perlimpinpin data.

  Each class may define a name field which is the type's "human" name.
  
  """

  def __new__(mcls, name, bases, fields):
    if 'name' in fields:
      name = fields['name']
      tcls = type.__new__(mcls, name, bases, fields)
      if name in types:
        raise ValueError("type '%s' already defined" % name)
      types[name] = tcls
      return tcls
    else:
      fields['name'] = None
      return type.__new__(mcls, name, bases, fields)

  def __str__(tcls):
    try:
      return tcls.name
    except AttributeError:
      return type.__str__(tcls)


class BaseType:
  """Base class for types."""
  __metaclass__ = Type

class Boolean(BaseType):
  """Boolean type."""
  name = 'bool'

class Integer(BaseType):
  """
  Integer type
    bitsize -- bit size
    signed -- True if signed, False if unsigned
  """
  pass

# define common integer types
for n in (8, 16, 32):
  class IntN(Integer):
    name = 'int%d' % n
    bitsize = n
    signed = True
  class UIntN(Integer):
    name = 'uint%d' % n
    bitsize = n
    signed = False


