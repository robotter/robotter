from collections import namedtuple as _namedtuple
from .. import Payload as _Payload
from . import types as room_types


room_payloads = {}  # map of registered payloads, indexed by message ID


class PayloadRoom(_Payload):
  """
  ROOM payload

  Base classe for ROOM payloads.

  Subclasses must define the following attributes:
    mid, mname, ptypes
  Prior registration, mid may be None to be set later.

  Subclass attributes:
    mid -- message ID
    mname -- message name (lowercase, with underscores)
    ptypes -- parameters types, as a list of (name, type) pairs
    ptuple -- namedtuple type for message parameters
    transaction -- Transaction of the message (optional)
    response -- response Payload message (if any)

  Attributes:
    params -- payload parameters values, ptuple instance

  """

  pid = 0x10
  pname = 'room'
  transaction = None

  class __metaclass__(_Payload.__metaclass__):
    def __new__(mcls, name, bases, fields):
      tcls = _Payload.__metaclass__.__new__(mcls, name, bases, fields)
      if 'ptypes' in fields:
        tcls.ptuple = _namedtuple('%s_params' % name, [ k for k,t in fields['ptypes'] ])
      return tcls

  def __init__(self, *a, **kw):
    self.params = self.ptuple(*a, **kw)

  @classmethod
  def fromdata(cls, data):
    if len(data) < 1:
      raise ValueError("invalid payload data size")
    n = ord(data[0])
    rcls = room_payloads[n]
    args = []
    data = data[1:]
    for k,t in rcls.ptypes:
      v, data = t.unpack(data)
      args.append(v)
    return rcls(*args)

  def data(self):
    ret = chr(self.mid)
    for v,(k,t) in zip(self.params, self.ptypes):
      ret += t.pack(v)
    return ret

  def __repr__(self):
    return "<payload:%s %s>" % (self.pname, self.mname)


def register(cls):
  """Register a PayloadRoom subclass"""
  if cls.mid in room_payloads:
    raise ValueError("ROOM payload with message ID %d already defined" % cls.mid)
  room_payloads[cls.mid] = cls

def create(mid, mname, ptypes):
  """Create and return a PayloadRoom subclass"""
  _mid, _mname = mid, mname
  _ptypes = [ (k, room_types.types[t]) for k,t in ptypes ]
  clsname = 'PayloadRoom'+''.join( s.capitalize() for s in mname.split('_') )

  class PayloadRoomNew(PayloadRoom):
    mid = _mid
    mname = _mname
    ptypes = _ptypes
  PayloadRoomNew.__name__ = clsname
  return PayloadRoomNew

