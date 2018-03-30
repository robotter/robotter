"""

ROME types

Type names are defined using their human names, which may conflict with
built-in objects. Thus, one should import '*' from this module.
Types are also available in the types map.

The pack/unpack methods may do conversions to rescale values (e.g. angles).

"""

import sys
import struct
import re

# Python2/3 compatibility
def metaclassed(mcls):
  def f(cls):
    body = vars(cls).copy()
    body.pop('__dict__', None)
    body.pop('__weakref__', None)
    return mcls(cls.__name__, cls.__bases__, body)
  return f


__all__ = []  # protect against "import *" misuse
types = {}  # map of defined types


def from_decl(typ):
  """Return a type from its declare, create type if needed"""
  if isinstance(typ, type) and issubclass(typ, _BaseType):
    return typ
  if typ in types:
    return types[typ]
  m = re.match(r'^(\w+)\[(\d+)?\]$', typ)
  if m:
    if m.group(2):
      return rome_array(types[m.group(1)], int(m.group(2)))
    else:
      return rome_vararray(types[m.group(1)])
  raise ValueError("invalid type")



class _TypeMetaclass(type):
  """
  Type metaclass for ROME data

  Class attributes:
    name -- human name

  """

  def __new__(mcls, name, bases, fields):
    if fields.get('name', None):
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


class _FixedTypeMetaclass(_TypeMetaclass):
  """
  Type metaclass for fixed-size types

  Class attributes:
    packsize -- byte size of packed value
    packfmt -- packing format (optional)

    packsize is deduced from packfmt if needed.

  """

  def __init__(cls, name, bases, fields):
    _TypeMetaclass.__init__(cls, name, bases, fields)
    if 'packfmt' in fields:
      fmtsize = struct.calcsize(fields['packfmt'])
      packsize = fields.get('packsize')
      if packsize is None:
        cls.packsize = fmtsize
      elif packsize != fmtsize:
        raise ValueError("packsize and packfmt mismatch")
    else:
      pass  # not a final type


@metaclassed(_TypeMetaclass)
class _BaseType(object):
  """
  Base class for types
  """

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


@metaclassed(_FixedTypeMetaclass)
class FixedType(_BaseType):
  """
  Base class for fixed-size types
  """
  pass


class rome_int(FixedType):
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
    if cls is rome_int:
      raise TypeError("base integer type cannot be packed")
    return struct.pack(cls.packfmt, cls.fpack(v))

  @classmethod
  def unpack(cls, data):
    if cls is rome_int:
      raise TypeError("base integer type cannot be unpacked")
    n = cls.packsize
    if len(data) < n:
      raise ValueError("not enough data to unpack (expected %u, got %u)" % (n, len(data)))
    return cls.funpack(struct.unpack(cls.packfmt, data[:n])[0]), data[n:]


class rome_float(FixedType):
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


class EnumType(rome_uint8):
  """
  Base class for enumeration types

  Should be created using rome_enum().

  Class attributes:
    values -- map of enumeration values, string to integer
    keys -- revert map of values, integer to strings

  """

  @classmethod
  def pack(cls, v):
    if not isinstance(v, int):
      try:
        v = cls.values[v]
      except KeyError:
        raise ValueError("unknown key for enum %s: %s" % (cls.__name__, v))
    return rome_uint8.pack(v)

  @classmethod
  def unpack(cls, data):
    v, tail = rome_uint8.unpack(data)
    try:
      v = cls.keys[v]
    except KeyError:
      raise ValueError("unknown value for enum %s: %s" % (cls.__name__, v))
    return v, tail

def rome_enum(name, mapping):
  """Create an enum type

  mapping can be a map of key/values or an iterable of keys.
  """
  if hasattr(mapping, 'items'):
    values = { k: v for k,v in mapping.items() }
  else:
    values = { k: i for i,k in enumerate(mapping) }
  # reuse already created type if possible
  if name in types:
    typ = types[name]
    if typ.values != values:
      raise ValueError("duplicate enum type with different values: %s" % name)
    return types[name]
  fields = {
      'name': name,
      'values': values,
      'keys': { v: k for k,v in values.items() }
      }
  return type(name, (EnumType,), fields)


class rome_fourcc(FixedType):
  """Four-character code"""

  name = 'fourcc'

  @classmethod
  def pack(cls, v):
    if isinstance(v, int):
      return rome_uint32.pack(v)
    else:
      if len(v) != 4:
        raise ValueError("invalid FourCC value: %r" % v)
      return v

  @classmethod
  def unpack(cls, data):
    if len(data) < 4:
      raise ValueError("not enough data to unpack FourCC (expected 4, got %u)" % len(data))
    return data[:4], data[4:]


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


class ArrayType(FixedType):
  """
  Base class for fixed-size array types

  Should be created using rome_array().

  Class attributes:
    base -- base type
    array_size -- number of elements in the array

  """

  @classmethod
  def pack(cls, v):
    if len(v) != cls.array_size:
      raise ValueError("invalid array size (expected %u, got %u)" % (cls.array_size, len(v)))
    return ''.join(cls.base.pack(vv) for vv in v)

  @classmethod
  def unpack(cls, data):
    return [cls.base.unpack(data) for i in range(cls.array_size)], data[cls.packsize:]


def rome_array(base, size):
  """Create a fixed-size array type"""
  name = "%s_%d" % (base.name, size)
  # reuse already created type if possible
  if name in types:
    return types[name]
  if not issubclass(base, FixedType):
    raise TypeError("rome_array() base type must be a fixed-size type, got %s" % base)
  fields = {
      'name': name,
      'base': base,
      'array_size': size,
      'packsize': size * base.packsize,
      }
  return type(name, (ArrayType,), fields)



class VarArrayType(_BaseType):
  """
  Base class for variable-size array types

  Should be created using rome_vararray().

  Class attributes:
    base -- base type

  """

  @classmethod
  def pack(cls, v):
    return ''.join(cls.base.pack(vv) for vv in v)

  @classmethod
  def unpack(cls, data):
    n = int(len(data)//cls.base.packsize)
    return [cls.base.unpack(data) for i in range(n)], data[n*cls.base.packsize]


def rome_vararray(base):
  """Create a variable-size array type"""
  name = "%s_vararray" % base.name
  # reuse already created type if possible
  if name in types:
    return types[name]
  if not issubclass(base, FixedType):
    raise TypeError("rome_vararray() base type must be a fixed-size type, got %s" % base)
  fields = {
      'name': name,
      'base': base,
      }
  return type(name, (VarArrayType,), fields)


class rome_string(_BaseType):
  """Variable-length binary string"""

  name = 'string'

  @classmethod
  def pack(cls, v):
    return v

  @classmethod
  def unpack(cls, data):
    return data, ''


