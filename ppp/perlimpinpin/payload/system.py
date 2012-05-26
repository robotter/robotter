from . import Payload as _Payload

system_payloads = {}  # map of defined system payloads, indexed by system ID


class PayloadSystem(_Payload):
  """
  System payload

  Class attributes:
    system_id -- system type ID
    system_name = system type name

  Attributes:
    request -- True for requests, False for responses

  """

  pid = 0x00
  pname = 'system'

  class __metaclass__(_Payload.__metaclass__):
    def __new__(mcls, name, bases, fields):
      tcls = _Payload.__metaclass__.__new__(mcls, name, bases, fields)
      if 'system_id' in fields:
        sid = fields['system_id']
        if sid in system_payloads:
          raise ValueError("system payload with ID %d already defined" % sid)
        system_payloads[sid] = tcls
      return tcls

  def __init__(self, request):
    self.request = bool(request)

  @classmethod
  def fromdata(cls, data):
    if len(data) < 1:
      raise ValueError("invalid payload data size")
    n = ord(data[0])
    return system_payloads[n & 0x7f]._system_fromdata(n & 0x80 == 0, data[1:])

  def data(self):
    c = chr(self.system_id | (0 if self.request else 0x80))
    return c + self._system_data()

  @classmethod
  def _system_fromdata(cls, request, data):
    """Parse system payload data into a payload"""
    raise NotImplementedError()

  def _system_data(self):
    """Return system payload data"""
    raise NotImplementedError()

  def __repr__(self):
    return "<payload:%s %s>" % (self.pname, self.system_name)


class PayloadSystemAck(PayloadSystem):
  """
  ACK system payload
  """
  system_id = 0
  system_name = 'ack'

  @classmethod
  def _system_fromdata(cls, request, data):
    if not request:
      raise ValueError("system payload not available for responses")
    if len(data) != 0:
      raise ValueError("unexpected payload data")
    return cls(request)

  def _system_data(self):
    return ''


class PayloadSystemNak(PayloadSystem):
  """
  NAK system payload
  """
  system_id = 1
  system_name = 'nak'

  @classmethod
  def _system_fromdata(cls, request, data):
    if not request:
      raise ValueError("system payload not available for responses")
    if len(data) != 0:
      raise ValueError("unexpected payload data")
    return cls(request)

  def _system_data(self):
    return ''


class PayloadSystemPing(PayloadSystem):
  """
  Ping system payload

  Attributes:
    value -- one-byte integer value

  """
  system_id = 2
  system_name = 'ping'

  def __init__(self, request, value):
    PayloadSystem.__init__(self, request)
    self.value = value

  @classmethod
  def _system_fromdata(cls, request, data):
    if len(data) != 1:
      raise ValueError("invalid payload data size")
    return cls(request, ord(data))

  def _system_data(self):
    return chr(self.value)


class PayloadSystemTraceroute(PayloadSystem):
  """
  Traceroute system payload

  Attributes:
    distance -- one-byte distance value

  """
  system_id = 3
  system_name = 'traceroute'

  def __init__(self, request, distance):
    PayloadSystem.__init__(self, request)
    self.distance = distance

  @classmethod
  def _system_fromdata(cls, request, data):
    if len(data) != 1:
      raise ValueError("invalid payload data size")
    return cls(request, ord(data))

  def _system_data(self):
    return chr(self.distance)


class PayloadSystemName(PayloadSystem):
  """
  Name system payload

  Attributes:
    name -- the name

  """
  system_id = 4
  system_name = 'name'

  valid_chars = set( chr(x) for x in range(ord(' '), 128) )

  def __init__(self, request, name=None):
    if request and name is None:
      name = ''
    if len(name) > 32 or (len(name) <= 0 and not request):
      raise ValueError("invalid name length")
    if len(set(name) - self.valid_chars):
      raise ValueError("invalid characters in name")
    PayloadSystem.__init__(self, request)
    self.name = name

  @classmethod
  def _system_fromdata(cls, request, data):
    # name checks are made in the constructor
    return cls(request, data)

  def _system_data(self):
    return self.name


class PayloadSystemStop(PayloadSystem):
  """
  Stop system payload
  """
  system_id = 5
  system_name = 'stop'

  @classmethod
  def _system_fromdata(cls, request, data):
    if len(data) != 0:
      raise ValueError("unexpected payload data")
    return cls(request)

  def _system_data(self):
    return ''


class PayloadSystemReset(PayloadSystem):
  """
  Reset system payload
  """
  system_id = 6
  system_name = 'reset'

  @classmethod
  def _system_fromdata(cls, request, data):
    if len(data) != 0:
      raise ValueError("unexpected payload data")
    return cls(request)

  def _system_data(self):
    return ''


class PayloadSystemSupportedPayloads(PayloadSystem):
  """
  Support payloads system payload

  Attributes:
    supported_pids -- a set of supported pids

  """
  system_id = 7
  system_name = 'supported-payloads'

  def __init__(self, request, pids):
    PayloadSystem.__init__(self, request)
    self.supported_pids = set(pids)

  @classmethod
  def _system_fromdata(cls, request, data):
    if len(data) != 32:
      raise ValueError("invalid payload data size")
    pids = set()
    for i in range(32):
      for b in range(8):
        if data[i] & (1 << b):
          pids.add( 8*i + b )
    return cls(request, pids)

  def _system_data(self):
    return ''.join( chr(sum( 1<<b for b in range(8) if 8*i+b in self.pids )) for i in range(32) )


