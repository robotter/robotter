"""

Define Perlimpinpin types.

Type names are defined using their human names, which may conflict with
built-in objects. Thus, one should import '*' from this module.
Types are also available in the types map

"""

import struct

__all__ = []  # protect against "import *" misuse
types = {}  # map of defined types


class _Type(type):
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


class _BaseType:
  """
  Base class for types.

  Class attributes:
    packsize -- byte size of packed value
  """
  __metaclass__ = _Type

  @classmethod
  def pack(cls, v):
    """Return the payload data for a value."""
    raise NotImplementedError()

  @classmethod
  def unpack(cls, data):
    """Unpack a value from payload data.
    Return the Python unpacked value and the remaining data.
    """
    raise NotImplementedError()


class ppp_int(_BaseType):
  """
  Integer type
    signed -- True if signed, False if unsigned
    packfmt -- packing format
  """
  name = 'int'
  packsize = None

  @classmethod
  def pack(cls, v):
    if cls == ppp_int:
      raise TypeError("base integer type cannot be packed")
    return struct.pack(cls.packfmt, v)

  @classmethod
  def unpack(cls, data):
    if cls == ppp_int:
      raise TypeError("base integer type cannot be unpacked")
    n = struct.calcsize(cls.packfmt)
    if len(data) < n:
      raise ValueError("not enough data to unpack (expected %u, got %u)" % (n, len(data)))
    return struct.unpack(cls.packfmt, data[:n])[0], data[n:]


# define common integer types

class ppp_int8(ppp_int):
  name = 'int8'
  signed = True
  packfmt = '<b'
  packsize = 1

class ppp_uint8(ppp_int):
  name = 'uint8'
  signed = False
  packfmt = '<B'
  packsize = 1

class ppp_int16(ppp_int):
  name = 'int16'
  signed = True
  packfmt = '<h'
  packsize = 2

class ppp_uint16(ppp_int):
  name = 'uint16'
  signed = False
  packfmt = '<H'
  packsize = 2

class ppp_int32(ppp_int):
  name = 'int32'
  signed = True
  packfmt = '<i'
  packsize = 4

class ppp_uint32(ppp_int):
  name = 'uint32'
  signed = False
  packfmt = '<I'
  packsize = 4


class ppp_bool(ppp_uint8):
  """Boolean type."""
  name = 'bool'
  packfmt = '<?'

