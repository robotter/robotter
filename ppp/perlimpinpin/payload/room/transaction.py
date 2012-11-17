"""

Define ROOM transactions, create and register messages

"""

import payload as _payload


class Transaction(object):
  """
  A group of message

  Attributes:
    name -- transaction name
    desc -- description, or None

  """
  desc = None  # default value for instances

  def messages(self):
    """Return messages handled by the transaction"""
    raise NotImplementedError()

  def register(self):
    """Register transaction message classes"""
    for msg in self.messages():
      _payload.register(msg)

  def __repr__(self):
    return "<%s %r>" % (self.__class__.__name__, self.name)


class Event(Transaction):
  """
  Transaction with a single message

  Attributes:
    message -- the message payload class

  """

  def __init__(self, name, params, desc=None, mid=None):
    self.name = name
    self.desc = desc
    self.message = _payload.create(mid, name, params)
    self.message.transaction = self

  def messages(self):
    return [self.message]


class Command(Transaction):
  """
  Command transaction

  Attributes:
    request -- request message payload clas
    response -- response message payload clas

  """

  response_suffix = '_r'

  def __init__(self, name, preq, pres, desc=None, mid=None):
    name_r = name+self.response_suffix
    mid_r = None if mid is None else mid+1
    self.name = name
    self.desc = desc
    self.request = _payload.create(mid, name, preq)
    self.response = _payload.create(mid_r, name_r, pres)
    self.request.transaction = self
    self.request.response = self.response
    self.response.transaction = self

  def messages(self):
    return [self.request, self.response]


class Order(Command):
  def __init__(self, name, preq, desc=None, mid=None):
    Command.__init__(self, name, preq, [], desc, mid)


def register_groups(*groups):
  """Register group of transactions and return them

  groups is an iterable of (mid, transactions) pairs.

  mids are affected automatically.
  Registered transactions are returned.

  """
  ret = []
  for mid, transactions in groups:
    for t in transactions:
      for m in t.messages():
        if m.mid is None:
          m.mid = mid
          mid += 1
      t.register()
      ret.append(t)
  return ret

