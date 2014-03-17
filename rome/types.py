"""

ROME types

Type names are defined using their human names, which may conflict with
built-in objects. Thus, one should import '*' from this module.
Types are also available in the types map.

The pack/unpack methods may do conversions to rescale values (e.g. angles).

"""

import struct

__all__ = []  # protect against "import *" misuse
types = {}  # map of defined types


class _Type(type):
  """
  Type metaclass for ROME data

  Class attributes:
    name -- human name

  """

  def __new__(mcls, name, bases, fields):
    if 'name' in fields:
      name = fields['name']
      if 'packfmt' in fields:
        fmtsize = struct.calcsize(fields['packfmt'])
        packsize = fields.get('packsize')
        if packsize is None:
          fields['packsize'] = fmtsize
        elif packsize != fmtsize:
          raise ValueError("packsize and packfmt mismatch")
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
    packfmt -- packing format (optional)

  If packfmt is used, packsize is deduced from it.

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


class rome_int(_BaseType):
  """
  Integer type

  Class attributes:
    signed -- True if signed, False if unsigned
    packfmt -- packing format (mandatory)
    fpack -- callable applied to values before packing
    funpack -- callable applied to unpacked value

  """
  name = 'int'
  fpack = int
  funpack = int

  @classmethod
  def pack(cls, v):
    if cls == rome_int:
      raise TypeError("base integer type cannot be packed")
    return struct.pack(cls.packfmt, cls.fpack(v))

  @classmethod
  def unpack(cls, data):
    if cls == rome_int:
      raise TypeError("base integer type cannot be unpacked")
    n = cls.packsize
    if len(data) < n:
      raise ValueError("not enough data to unpack (expected %u, got %u)" % (n, len(data)))
    return cls.funpack(struct.unpack(cls.packfmt, data[:n])[0]), data[n:]


class rome_float(_BaseType):
  """
  Float type
  """
  name = 'float'
  packfmt = '<f'

  @classmethod
  def pack(cls, v):
    return struct.pack(cls.packfmt, v)

  @classmethod
  def unpack(cls, data):
    n = cls.packsize
    if len(data) < n:
      raise ValueError("not enough data to unpack (expected %u, got %u)" % (n, len(data)))
    return struct.unpack(cls.packfmt, data[:n])[0], data[n:]


# define common integer types

class rome_int8(rome_int):
  name = 'int8'
  signed = True
  packfmt = '<b'

class rome_uint8(rome_int):
  name = 'uint8'
  signed = False
  packfmt = '<B'

class rome_int16(rome_int):
  name = 'int16'
  signed = True
  packfmt = '<h'

class rome_uint16(rome_int):
  name = 'uint16'
  signed = False
  packfmt = '<H'

class rome_int32(rome_int):
  name = 'int32'
  signed = True
  packfmt = '<i'

class rome_uint32(rome_int):
  name = 'uint32'
  signed = False
  packfmt = '<I'


class rome_bool(rome_uint8):
  """Boolean type."""
  name = 'bool'
  packfmt = '<?'
  fpack = bool
  funpack = bool


# fonctions used to pack/unpack angle values
_scale1000_fpack = staticmethod(lambda v: int(v * 1000))
_scale1000_funpack = staticmethod(lambda v: float(v) / 1000)

class rome_dist(rome_int16):
  """Distance type (millimeters)"""
  name = 'dist'

class rome_udist(rome_uint16):
  """Positive distance type (millimeters)"""
  name = 'udist'

class rome_angle(rome_int16):
  """Angle type (radians / milliradians)"""
  name = 'angle'
  fpack = _scale1000_fpack
  funpack = _scale1000_funpack

class rome_uangle(rome_uint16):
  """Positive angle type (radians / milliradians)"""
  name = 'uangle'
  fpack = _scale1000_fpack
  funpack = _scale1000_funpack
