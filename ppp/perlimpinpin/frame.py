"""

Protocol frames

Frame format:
  0 - start byte: 0x50 = 'P'
  1 - payload length (16b), not including headers and CRC
  3 - source (8b)
  4 - destination (8b)
  5 - payload type (8b)
  6 - header CRC (16b)
  8 - payload (variable size)
  n - payload CRC (16b)

Header length is always 8 bytes (including start byte and CRC).
Minimum frame size is 10 bytes.

The CRC used is the CRC-CCITT used by the PPP protocol (RFC1171).
Polynomial: x^16 + x^12 + x^5 + 1 (0x8408)
Initial value: 0xffff

"""

import struct
from . import payload as _payload


START_BYTE = 0x50
MIN_FRAME_SIZE = 10


def crc16(data):
  """Compute the CRC of a data string"""
  crc = 0xffff;
  for c in data:
    c = ord(c)
    c ^= crc
    c ^= (c << 4)
    c &= 0xff
    crc = ((c << 8) | ((crc >> 8) & 0xff)) ^ ((c >> 4) & 0xff) ^ (c << 3)
    crc &= 0xffff
  return crc


class Frame(object):
  """
  Protocol frame

  Attributes:
    src, dst -- source and destination ROIDs
    payload -- payload data as a Payload instance

  """

  def __init__(self, src=None, dst=None, payload=None):
    """Create a new frame

    payload may be a Payload instance or a (typ, data) pair.
    """

    self.src = src
    self.dst = dst
    if not isinstance(payload, _payload.Payload):
      typ, data = payload
      cls = _payload.payloads.get(typ, _payload.UnknownPayload)
      payload = cls.fromdata(data)
    self.payload = payload

  def __repr__(self):
    return "<%s %02X->%02X %r>" % (
        self.__class__.__name__, self.src, self.dst, self.payload)

  @classmethod
  def fromdata(cls, data):
    """Parse data into a frame"""
    if len(data) < MIN_FRAME_SIZE:
      raise ValueError("frame is too short (expected at least %d bytes, got %u)" % (MIN_FRAME_SIZE, len(data)))
    start_byte, size_exp, src, dst, typ = struct.unpack('<BHBBB', data[:6])
    if start_byte != START_BYTE:
      raise ValueError("invalid start byte (expected 0x%02X, got 0x%02X)" % (START_BYTE, start_byte))
    size_got = len(data)-MIN_FRAME_SIZE
    if size_exp != size_got:
      raise ValueError("frame and payload sizes mismatch (expected payload size was %u, got %u)" % (size_exp, size_got))

    # check CRCs
    crc_exp, crc_got = struct.unpack('<H', data[6:8])[0], crc16(data[1:6])
    if crc_exp != crc_got:
      raise ValueError("header CRC mismatch (expected %04X, got %04X)" % (crc_exp, crc_got))
    crc_exp, crc_got = struct.unpack('<H', data[-2:])[0], crc16(data[8:-2])
    if crc_exp != crc_got:
      raise ValueError("payload CRC mismatch (expected %04X, got %04X)" % (crc_exp, crc_got))
    return cls(src, dst, (typ, data[8:-2]))


  def data(self):
    """Return the formatted frame data"""
    payload_data = self.payload.data()
    data = struct.pack('<BHBBB', START_BYTE, len(payload_data), self.src, self.dst, self.payload.pid)
    data += struct.pack('<H', crc16(data[1:]))
    data += payload_data
    return data + struct.pack('<H', crc16(payload_data))


  @classmethod
  def extract_gen(cls):
    """Generator to extract frame from data

    Generator is intended to be resumed by calling send() with new incoming
    data. When there is not enough data, None is yielded.
    """
    data = ''
    while True:
      pos = data.find(chr(START_BYTE))
      if pos == -1:
        # no start byte, no frame
        data = yield None
        continue
      data = data[pos:]
      while len(data) < MIN_FRAME_SIZE:
        # not enough data for a whole frame
        data += yield None
      length = struct.unpack('<H', data[1:3])[0]
      end = MIN_FRAME_SIZE + length
      while len(data) < end:
        data += yield None
      try:
        data += yield cls.fromdata(data[:end])
      except ValueError:
        pass  # invalid frame, skip
      data = data[end:]

  @classmethod
  def extract(cls, data):
    """Extract a frame from data

    Return a (frame, pre, post) 3-uple, with:
      frame -- the extracted frame, or None
      pre -- non-frame data before the frame
      post -- trailing unparsed data
    Invalid frames are skipped and their data is included in 'pre'.
    """
    ndata = len(data)
    if ndata < MIN_FRAME_SIZE:
      # not enough data for a whole frame
      return None, data, ''
    pos = 0
    while True:
      pos = data.find(chr(START_BYTE), pos)
      if pos == -1:
        # no start byte, no frame
        return None, data, ''
      if ndata-pos < MIN_FRAME_SIZE:
        # not enough data for a whole frame
        return None, data[:pos], data[pos:]
      length = struct.unpack('<H', data[pos+1:pos+3])[0]
      end = pos + MIN_FRAME_SIZE + length
      if end > ndata:
        # incomplete frame
        return None, data[:pos], data[pos:]
      try:
        return cls.fromdata(data[pos:end]), data[:pos], data[end:]
      except ValueError:
        pass  # invalid frame, skip
      pos += 1


