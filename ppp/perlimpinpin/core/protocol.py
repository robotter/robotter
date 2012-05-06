import struct
from .types import ppp_uint8


def checksum(data):
  """Compute the PPP checksum of a data string."""
  return sum( ord(c) for c in data ) % 256


SUBCMD_UART_DISCOVER = 1
SUBCMD_SUBSCRIBE = 2


class Frame(object):
  """
  PPP frame.

  Attributes:
    src, dst -- source and destination ROID
    payload -- payload data (without size, src, dst, checksum)
    unparsed -- payload data to be unpacked

  """

  def __init__(self, src=None, dst=None, data=None):
    """Create a empty frame with optional data to unpack."""
    self.src = src
    self.dst = dst
    self.payload = data or ''
    self.unparsed = data

  def __repr__(self):
    return "<%s %02X->%02X len=%d>" % (
        self.__class__.__name__, self.src, self.dst, len(self.payload))

  @classmethod
  def fromdata(cls, data):
    """Parse data into a frame."""
    if len(data) < 5:
      raise ValueError("frame is too short (expected at least 5 bytes, got %u)" % len(data))
    chksum_exp, chksum_got = struct.unpack('<B', data[-1])[0], checksum(data[:-1])
    if chksum_exp != chksum_got:
      raise ValueError("checksum mismatch (expected 0x%02X, got 0x%02X)" % (chksum_exp, chksum_got))
    size_exp, size_got = struct.unpack('<H', data[:2])[0], len(data)-3
    if size_exp != size_got:
      raise ValueError("frame and payload sizes mismatch (expected payload size was %u, got %u)" % (size_exp, size_got))
    src, dst = struct.unpack('<BB', data[2:4])
    return cls(src, dst, data[4:-1])


  def pack(self, typ, val):
    """Pack a single value."""
    self.payload += typ.pack(val)

  def pack_n(self, *values):
    """Pack several values.
    values is a list of (type, value) pairs.
    """
    self.payload += ''.join( t.pack(v) for t,v in values )

  def pack_args(self, params, args, kw):
    """Pack values from function arguments.
    params -- a list of (name, type) pairs
    args, kw -- arguments
    """
    if len(args) > len(params):
      raise TypeError("too many arguments (expected %u, got %u)" % (len(params), len(args)))
    for (k,t),v in zip(params, args):
      if k in kw:
        raise TypeError("multiple values for argument %r" % k)
      self.pack(t, v)
    params = params[len(args):]
    if len(kw) != len(params):
      raise TypeError("invalid argument count (expected %u, got %u)" % (len(params), len(kw)))
    for k,t in params:
      try:
        v = kw[k]
      except KeyError:
        raise TypeError("argument not found: %r" % k)
      self.pack(t, v)


  def unpack(self, typ):
    """Unpack a single value.
    Unpacked data is removed from the unparsed data.
    Return the unpacked value.
    """
    v, self.unparsed = typ.unpack(self.unparsed)
    return v

  def unpack_n(self, *types):
    """Unpack several values.
    Unpacked data is removed from the unparsed data.
    Return unpacked values as a list.
    """
    values = []
    unparsed = self.unparsed  # preserve original value on error
    for t in types:
      v, unparsed = t.unpack(unparsed)
      values.append(v)
    self.unparsed = unparsed
    return values

  def unpack_args(self, params):
    """Unpack named arguments.
    params -- a list of (name, type) pairs
    Return a dict of unpacked values.
    """
    return dict( (k, self.unpack(t)) for k,t in params )


  def data(self):
    """Return the formatted frame data."""
    data = struct.pack('<HBB', len(self.payload)+2, self.src, self.dst)
    data += self.payload
    return data + chr(checksum(data))


  @classmethod
  def extract(cls, data, header=''):
    """Extract a frame from data.
    Frames are detected following the given header.
    Return a (frame, pre, post) 3-uple, with:
      frame -- the extracted frame, or None
      pre -- data skipped before header
      post -- remaining unparsed data
    Invalid frames are skipped and their data is included in 'pre'.
    """
    ndata = len(data)
    pos = 0
    while True:
      pos = data.find(header, pos)
      if pos == -1:  # note: never happens when header==''
        # return as much data as possible in predata
        i = data.rfind(header[0])
        if i != -1 and header.startswith(data[i:]):
          return None, data[:i], data[i:]
        return None, data, ''
      i = pos + len(header)
      if ndata-i < 3:
        return None, data[:pos], data[pos:]
      size = 3 + struct.unpack('<H', data[i:i+2])[0]
      if ndata-i < size:
        return None, data[:pos], data[pos:]
      try:
        return cls.fromdata(data[i:i+size]), data[:pos], data[i+size:]
      except ValueError:
        pass
      pos += 1


  # Build frames for protocol commands

  @classmethod
  def build_uart_discover(cls):
    frame = cls(0, 0, 0)
    frame.pack(ppp_uint8, 0)
    frame.pack(ppp_uint8, SUBCMD_UART_DISCOVER)
    return frame

  @classmethod
  def build_subscribe(cls, src, dst, subscriber=None):
    if subscriber is None:
      subscriber = src
    frame = cls(src, dst, 0)
    frame.pack(ppp_uint8, 0)
    frame.pack(ppp_uint8, SUBCMD_SUBSCRIBE)
    frame.pack(ppp_uint8, subscriber)
    return frame


class UARTFrame(Frame):
  """
  Frame sent over UART.
  """

  frame_header = '\xff\xff'

  @classmethod
  def extract(cls, data):
    return super(cls, cls).extract(data, cls.frame_header)

  def data(self):
    return self.frame_header + super(UARTFrame, self).data()

