from . import Payload as _Payload


# Severity values
log_severities = {
  'debug': 0,
  'notice': 1,
  'info': 2,
  'warning': 3,
  'error': 4,
  }


class PayloadLog(_Payload):
  """
  Log payload

  Attributes:
    severity -- log severity, integer or key for log_severities map
    message -- log message
    ack -- True if an ACK reply is expected

  """

  pid = 0x01
  pname = 'log'

  def __init__(self, severity, message, ack=False):
    self.severity = log_severities.get(severity, severity)
    self.message = message
    self.ack = bool(ack)

  @classmethod
  def fromdata(cls, data):
    if len(data) < 1:
      raise ValueError("invalid payload data size")
    n = ord(data[0])
    return cls(n & 0xEF, data[1:], ack=bool(n & 0x80))

  def data(self):
    c = chr(self.severity | (0x80 if self.ack else 0))
    return c + self.message

  def __repr__(self):
    return "<payload:%s %r %r>" % (self.pname, self.severity, self.message)

