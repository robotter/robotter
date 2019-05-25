"""

Protocol frames

Frame format:
  0 - start byte: 0x52
  1 - payload length (8b)
  2 - message ID (8b)
  3 - payload (variable size)
  n - payload CRC (16b)

Minimum frame size is 4 bytes.

The CRC used is the CRC-CCITT used by the PPP protocol (RFC1171).
Polynomial: x^16 + x^12 + x^5 + 1 (0x8408)
Initial value: 0xffff

"""

import struct
import re
import itertools
from collections import namedtuple as _namedtuple
from . import types as rome_types


START_BYTE = 0x52
START_BYTES = bytes([START_BYTE])
MIN_FRAME_SIZE = 5


# valid message or parameter name
# leading '_' is reserved for internal use
re_symbol_name = re.compile(r'^[A-Za-z0-9][A-Za-z0-9_]*$')

def is_valid_symbol_name(s):
  return re_symbol_name.match(s) is not None


def crc16(data):
  """Compute the CRC of a data string"""
  crc = 0xffff
  for c in data:
    c ^= crc
    c ^= (c << 4)
    c &= 0xff
    crc = ((c << 8) | ((crc >> 8) & 0xff)) ^ ((c >> 4) & 0xff) ^ (c << 3)
    crc &= 0xffff
  return crc


# registered messages, indexed by ID
messages = {}
# registered messages, indexed by name
messages_by_name = {}


class Frame(object):
  """
  ROME frame content

  Attributes:
    msg -- message class
    params -- message parameters, as a msg.ptuple instance
    ack -- ACK value, only for orders

  Class attributes:
    next_ack -- generator of ACK values

  To be able to send orders, set_ack_range() must be called with the ACK range
  to use. Different (sub)classes can set different ranges.

  """

  def __init__(_self, _msg, *a, **kw):
    """Create a frame for given message and parameters

    msg may be a Message instance, a message ID or a message name.
    ACK value may be provided in _ack keyword argument.
    """

    # Make sure to not use unserved names in function parameters.
    # Otherwise, they could conflict with message parameters.
    msg = _msg
    self = _self
    if isinstance(msg, Message):
      self.msg = msg
    elif isinstance(msg, int):
      self.msg = messages[msg]
    elif isinstance(msg, str):
      self.msg = messages_by_name[msg]
    else:
      raise TypeError("invalid msg")
    if isinstance(self.msg, Order):
      self.ack = kw.pop('_ack', None)
    elif '_ack' in kw:
      del kw['_ack']
    self.params = self.msg.ptuple(*a, **kw)

  @classmethod
  def fromdata(cls, data):
    """Parse data into a frame"""
    if len(data) < MIN_FRAME_SIZE:
      raise ValueError("frame is too short (expected at least %d bytes, got %u)" % (MIN_FRAME_SIZE, len(data)))
    start_byte, size_exp, mid = struct.unpack('<BBB', data[:3])
    if start_byte != START_BYTE:
      raise ValueError("invalid start byte (expected 0x%02X, got 0x%02X)" % (START_BYTE, start_byte))
    size_got = len(data)-MIN_FRAME_SIZE
    if size_exp != size_got:
      raise ValueError("frame and payload sizes mismatch (expected payload size was %u, got %u)" % (size_exp, size_got))
    payload = data[3:-2]

    # check CRC
    crc_exp, crc_got = struct.unpack('<H', data[-2:])[0], crc16(data[1:-2])
    if crc_exp != crc_got:
      raise ValueError("CRC mismatch (expected %04X, got %04X)" % (crc_exp, crc_got))

    msg = messages.get(mid)
    if msg is None:
      raise ValueError("unknown message ID: %d" % mid)
    if len(payload) < msg.plsize:
      raise ValueError("payload too short for message %s (expected at least %04X, got %04X)" % (msg.name, msg.plsize, len(payload)))
    args = []
    if isinstance(msg, Order):
      ack, payload = rome_types.rome_uint8.unpack(payload)
    else:
      ack = None
    for _,t in msg.ptypes:
      v, payload = t.unpack(payload)
      args.append(v)
    if len(payload):
      raise ValueError("payload not completely consummed")
    return cls(msg, *args, _ack=ack)

  def data(self):
    """Return the formatted frame data"""
    payload = b''
    if isinstance(self.msg, Order):
      payload += struct.pack('<B', self.ack if self.ack is not None else self.next_ack())
    payload += self.params_data()
    data = struct.pack('<BB', len(payload), self.msg.mid) + payload
    return START_BYTES + data + struct.pack('<H', crc16(data))

  def params_data(self):
    """Return the formatted parameters data"""
    data = b''
    for v,(k,t) in zip(self.params, self.msg.ptypes):
      data += t.pack(v)
    return data

  def __repr__(self):
    attrs = ''.join(' %s=%r' % kv for kv in zip(self.params._fields, self.params))
    return "<frame:%s%s>" % (self.msg.name, attrs)

  @classmethod
  def extract_gen(cls):
    """Generator to extract frame from data

    Generator is intended to be resumed by calling send() with new incoming
    data. When there is not enough data, None is yielded.
    """
    data = ''
    while True:
      pos = data.find(START_BYTE)
      if pos == -1:
        # no start byte, no frame
        data = yield None
        continue
      data = data[pos:]
      while len(data) < MIN_FRAME_SIZE:
        # not enough data for a whole frame
        data += yield None
      size = data[1]
      end = MIN_FRAME_SIZE + size
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
      pos = data.find(START_BYTE, pos)
      if pos == -1:
        # no start byte, no frame
        return None, data, ''
      if ndata-pos < MIN_FRAME_SIZE:
        # not enough data for a whole frame
        return None, data[:pos], data[pos:]
      size = data[pos+1]
      end = pos + MIN_FRAME_SIZE + size
      if end > ndata:
        # incomplete frame
        return None, data[:pos], data[pos:]
      try:
        return cls.fromdata(data[pos:end]), data[:pos], data[end:]
      except ValueError:
        pass  # invalid frame, skip
      pos += 1

  @classmethod
  def read(cls, fo):
    """Read a frame from a file object

    Return a frame object or None on EOF.
    Invalid frames are skipped.
    """

    if hasattr(fo, 'eof'):
      feof = fo.eof
    else:
      feof = lambda: False

    while True:
      # start byte
      data = fo.read(1)
      if not data and feof():
        return None
      if data != START_BYTES:
        continue

      # plsize
      while True:
        c = fo.read(1)
        if c:
          data += c
          break
        elif feof():
          return None
      plsize = data[-1]
      # read remaining frame data
      toread = plsize+MIN_FRAME_SIZE - len(data)
      while toread > 0:
        s = fo.read(toread)
        if not s:
          if feof():
            return None
          continue
        data += s
        toread -= len(s)

      # parse data to frame
      try:
        return cls.fromdata(data)
      except ValueError:
        pass  # invalid frame, skip

  @classmethod
  def set_ack_range(cls, start, stop):
    """Update the next_ack iterator"""
    cls.next_ack = itertools.cycle(range(start, stop)).__next__

  next_ack = None


class Message(object):
  """
  ROME message definition

  Attributes:
    mid -- message ID
    name -- message name (lowercase, with underscores)
    ptypes -- parameters types, as a list of (name, type) pairs
    ptuple -- namedtuple type for message parameters
    plsize -- minimum expected payload size
    varsize -- True if frame size is not fixed

  """

  def __init__(self, mid, name, ptypes):
    if mid <= 0 or mid > 255:
      raise ValueError("invalid message ID: %r" % mid)
    if not is_valid_symbol_name(name):
      raise ValueError("invalid message name: %r" % name)
    for k,_ in ptypes:
      if not is_valid_symbol_name(k):
        raise ValueError("invalid message parameter name: %r" % k)
    self.mid = mid
    self.name = name
    self.ptypes = ptypes
    self.ptuple = _namedtuple('%s_params' % name, [ k for k,t in ptypes ])
    if not all(issubclass(t, rome_types.FixedType) for v,t in ptypes[:-1]):
      raise TypeError("unexpected non fixed-size type")
    self.plsize = sum(t.packsize for v,t in ptypes if issubclass(t, rome_types.FixedType))
    self.varsize = len(ptypes) and not issubclass(ptypes[-1][1], rome_types.FixedType)

  def register(self):
    """Register the message ID and name"""
    msg = messages.get(self.mid)
    if msg is not None and msg is not self:
      raise ValueError("message ID %d already registered with name %r" % (self.mid, msg.name))
    msg = messages_by_name.get(self.name)
    if msg is not None and msg is not self:
      raise ValueError("message name %r already registered with ID %d" % (self.name, msg.mid))
    messages[self.mid] = self
    messages_by_name[self.name] = self


class Order(Message):
  """
  ROME message with ACK value
  """

  def __init__(self, mid, name, ptypes):
    Message.__init__(self, mid, name, ptypes)
    self.plsize += 1


def register_messages(*groups):
  """Create and register groups of messages and return them

  groups is an iterable of (mid, messages) pairs
  where messages is a list of (name, ptypes) or (Order|Message, name, ptypes).

  mids are affected automatically.
  Registered transactions are returned.

  """
  ret = []
  for mid, messages in groups:
    for args in messages:
      if isinstance(args, type):
        # allow to define types between messages, for convenience
        continue
      elif len(args) == 2:
        cls = Message
        name, ptypes = args
      else:
        cls, name, ptypes = args
      ptypes = [ (k, rome_types.from_decl(t)) for k,t in ptypes ]
      msg = cls(mid, name, ptypes)
      mid += 1
      msg.register()
      ret.append(msg)
  return ret

def unregister_all_messages():
  """Unregister all messages
  This can be used for tests or other cases when we need to control which
  messages are defined.
  """
  messages.clear()
  messages_by_name.clear()
  register_builtin_messages()

def register_builtin_messages():
  register_messages(
    (0x01, [
      (Message, 'ack', [('ack', 'uint8')]),
      (Message, 'log', [
        ('sev', rome_types.rome_enum('log_severity', ('debug', 'info', 'notice', 'warning', 'error'))),
        ('msg', 'string')]),
      (Order, 'bootloader', [
          ('cmd', rome_types.rome_enum('bootloader_cmd', (
              'none', 'buffer', 'boot',
              'info', 'r_info',
              'prog_page', 'r_prog_page',
              'mem_crc', 'r_mem_crc',
              'fuse_read', 'r_fuse_read',
              'read_user_sig', 'r_read_user_sig',
              'prog_user_sig', 'r_prog_user_sig',
              ))),
          ('data', 'bytes')]),
      (Message, 'bootloader_r', [
        ('ack', 'uint8'),
        ('status', rome_types.rome_enum('bootloader_status', ('success', 'error', 'unknown_cmd', 'bad_value', 'crc_mismatch', 'unexpected_cmd'))),
        ('data', 'bytes')]),
      ]),
    )


# register built-in messages
register_builtin_messages()

# register default messages if available
try:
  import rome_messages
  del rome_messages
except ImportError as e:
  pass

