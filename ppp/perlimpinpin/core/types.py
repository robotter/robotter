"""

Define Perlimpinpin types.

Type names are defined using their human names, which may conflict with
built-in objects. Thus, one should import '*' from this module.
Types are also available in the types map

"""

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
      globals()['ppp_%s'%name] = tcls
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
  """Base class for types."""
  __metaclass__ = _Type

class _Boolean(_BaseType):
  """Boolean type."""
  name = 'bool'

class _Integer(_BaseType):
  """
  Integer type
    bitsize -- bit size
    signed -- True if signed, False if unsigned
  """
  name = 'int'


# define common integer types
for n in (8, 16, 32):
  class _IntN(_Integer):
    name = 'int%d' % n
    bitsize = n
    signed = True
  class _UIntN(_Integer):
    name = 'uint%d' % n
    bitsize = n
    signed = False
  del _IntN, _UIntN
del n


