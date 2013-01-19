"""

ROOM types

Type names are defined using their human names, which may conflict with
built-in objects. Thus, one should import '*' from this module.
Types are also available in the types map.

The pack/unpack methods may do conversions to rescale values, especially for
types used quantities (e.g. length).

"""

import struct

__all__ = []  # protect against "import *" misuse
types = {}  # map of defined types


class _Type(type):
  """
  Type metaclass for ROOM data

  Class attributes:
    name -- human name

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
  Base class for types

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


class room_int(_BaseType):
  """
  Integer type

  Class attributes:
    signed -- True if signed, False if unsigned
    packfmt -- packing format
    fpack -- callable applied to values before packing
    funpack -- callable applied to unpacked value

  """
  name = 'int'
  packsize = None
  fpack = int
  funpack = int

  @classmethod
  def pack(cls, v):
    if cls == room_int:
      raise TypeError("base integer type cannot be packed")
    return struct.pack(cls.packfmt, cls.fpack(v))

  @classmethod
  def unpack(cls, data):
    if cls == room_int:
      raise TypeError("base integer type cannot be unpacked")
    n = struct.calcsize(cls.packfmt)
    if len(data) < n:
      raise ValueError("not enough data to unpack (expected %u, got %u)" % (n, len(data)))
    return cls.funpack(struct.unpack(cls.packfmt, data[:n])[0]), data[n:]


# define common integer types

class room_int8(room_int):
  name = 'int8'
  signed = True
  packfmt = '<b'
  packsize = 1

class room_uint8(room_int):
  name = 'uint8'
  signed = False
  packfmt = '<B'
  packsize = 1

class room_int16(room_int):
  name = 'int16'
  signed = True
  packfmt = '<h'
  packsize = 2

class room_uint16(room_int):
  name = 'uint16'
  signed = False
  packfmt = '<H'
  packsize = 2

class room_int32(room_int):
  name = 'int32'
  signed = True
  packfmt = '<i'
  packsize = 4

class room_uint32(room_int):
  name = 'uint32'
  signed = False
  packfmt = '<I'
  packsize = 4


class room_bool(room_uint8):
  """Boolean type."""
  name = 'bool'
  packfmt = '<?'
  fpack = bool
  funpack = bool


# fonctions used to pack/unpack dist/angle values
_scale1000_fpack = staticmethod(lambda v: int(v * 1000))
_scale1000_funpack = staticmethod(lambda v: float(v) / 1000)

class room_dist(room_int16):
  """Distance type (meters / millimeters)"""
  name = 'dist'
  fpack = _scale1000_fpack
  funpack = _scale1000_funpack

class room_udist(room_uint16):
  """Positive distance type (meters / millimeters)"""
  name = 'udist'
  fpack = _scale1000_fpack
  funpack = _scale1000_funpack

class room_angle(room_int16):
  """Angle type (radians / milliradians)"""
  name = 'angle'
  fpack = _scale1000_fpack
  funpack = _scale1000_funpack

class room_uangle(room_uint16):
  """Positive angle type (radians / milliradians)"""
  name = 'uangle'
  fpack = _scale1000_fpack
  funpack = _scale1000_funpack

