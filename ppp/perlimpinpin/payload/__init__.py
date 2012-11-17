
payloads = {}  # map of defined payloads, indexed by payload ID


class Payload(object):
  """
  Base class for frame payloads

  Subclasses are automatically registered through the metaclass.
  Each subclass which directly defines a payload type must define the following
  attributes:
    pid -- the payload ID
    pname -- the payload name

  """

  class __metaclass__(type):
    def __new__(mcls, name, bases, fields):
      tcls = type.__new__(mcls, name, bases, fields)
      if 'pid' in fields:
        pid = fields['pid']
        if pid in payloads:
          raise ValueError("payload with ID %d already defined" % pid)
        payloads[pid] = tcls
      return tcls

  @classmethod
  def fromdata(cls, data):
    """Parse data into a payload"""
    raise NotImplementedError()

  def data(self):
    """Return payload data as a string"""
    raise NotImplementedError()

  def __repr__(self):
    return "<payload:%s>" % self.pname


class UnknownPayload(Payload):
  """
  Special payload class for unknown payloads
  """

  pname = 'unknown'

  def __init__(self, data=''):
    self._data = data

  @classmethod
  def fromdata(cls, data):
    return cls(data)

  def data(self):
    return self._data


# register knwon classes
from . import system
from . import log
from . import room

