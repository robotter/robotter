"""

Easily send and receive PPP messages

Example:

>>> # create the binding
>>> from galipeur import robot
>>> b = Binding(cons, robot, 42)
>>> # send a "ping" message with value 10 to the "meca" device
>>> b.devices.meca.msg_ping(10).send()

Devices can be accessed from various ways:

>>> b.devices.meca     # by attribute
>>> b.devices['meca']  # by name
>>> b.devices[0x20]    # by ROID

Messages can be created from various ways:

>>> b.messages.ping(src, dst, tid=0, v=10)  # directly, total control
>>> b.msg_ping(dst, 10)                     # from binding
>>> b.devices.meca.msg_ping(10)             # from device

Source and destinations can be provided as ROIDs, names or instances:

>>> b.messages.ping(42, b.devices.prop, v=10)
>>> b.msg_ping('meca', 10)

Message values are provided as positional parameters or keywords:

>>> b.devices.prop.msg_set_xya(10, 2, 3)
>>> b.devices.prop.msg_set_xya(10, a=3, y=2)

Message frames can be modified and resent. If None, tid is replaced by an
actual value. It can be reset to None to use a new tid.
(Parameters values cannot be modified.)

>>> m = b.msg_ping('meca', 10)
>>> m.tid
1
>>> m.send()
>>> m.update_params(v=20)
>>> m.dst = 'prop'
>>> m.tid = None
>>> m.send()
>>> m.tid
2

"""

import os
import types
import select
import threading
import itertools
import time
from .core.types import ppp_uint8
from .core.protocol import Frame, UARTFrame
from .core import Command, TransactionSingle


class attriddict(object):
  """Dict with attribute, name and id access"""

  __slots__ = ('_byid', '_byname')

  def __init__(self, elems=()):
    self._byid = {}
    self._byname = {}
    for i,k,v in elems:
      self._add(i, k, v)
  def _add(self, i, k, v):
    self._byid[i] = v
    self._byname[k] = v
  def _get(self, k, default=None):
    if isinstance(k, int):
      return self._byid.get(k, default)
    else:
      return self._byname.get(k, default)

  def __getitem__(self, k):
    if isinstance(k, int):
      return self._byid[k]
    else:
      return self._byname[k]
  def __getattr__(self, k):
    return self._byname[k]
  def __dir__(self):
    return self._byname.keys()
  def __iter__(self):
    return iter(self._byid.values())
  def __len__(self):
    return len(self._byid)


class Binding(object):
  """
  Binding to send and receive messages

  Some methods are intended to be (re)defined in subclasses.
  A lock is used for safe concurrent read/write to the connection.

  Connections are provided as a map indexed by ROID with the following values:
    None -- drop
    file object -- send to given file object
    sequence of file objects -- send to several file objects
  File objects must wrap a real fd (and have a fileno() method).

  By default, the broadcast ROID targets all provided file objects.
  By default, the binding ROID targets nothing (None).
  Unmapped ROIDs use the None map index, or 0 (broadcast).

  Attributes:
    robot -- Robot instance
    roid -- ROID for sent frames (writable)
    devices -- attrdict of BindingDevices
    messages -- attrdict of BindingMessages
    cons -- map of UART connection object, indexed by ROID
    _lock -- lock for connection read/write
    _tids -- transaction ID iterator
    _send_cbs -- map of reply callbacks, indexed by (tid, mid)
    _feed_data -- map of unprocessed fed data, indexed by file object
    _epoll -- epoll object, for receiving data
    _fd2file -- map integer fd to connection file objects
    _listen_th -- listening thread, or None
    _listen_pw -- listening pipe write end, to abort listening

  """

  # default timeout and retry values for send_wait() calls
  default_send_wait_timeout = 1
  default_send_wait_retry = 3

  def __init__(self, cons, robot, roid):
    self.robot = robot
    self.roid = roid
    self.devices = attriddict()
    self.messages = attriddict()
    self._lock = threading.RLock()
    self._tids = itertools.cycle(range(1, 256))
    self._send_cbs = {}
    self._init_robot_attrs()
    self._init_cons(cons)
    self._listen_th = None
    self._listen_pw = None

  def __repr__(self):
    return "<%s roid=%02X>" % (self.__class__.__name__, self.roid)

  def _init_cons(self, cons):
    all_cons = set()
    self.cons = {}
    for k,v in cons.items():
      if v is None:
        self.cons[k] = None
        continue
      if not isinstance(v, (list, tuple)):
        v = (v,)
      all_cons.update(v)
      self.cons[k] = tuple(v)
    if self.roid not in self.cons:
      self.cons[self.roid] = None
    if 0 not in self.cons:
      if not len(all_cons):
        self.cons[0] = None
      else:
        self.cons[0] = tuple(all_cons)
    if None not in self.cons:
      self.cons[None] = self.cons[0]

    self._feed_data = dict( (k, '') for k in all_cons )
    self._fd2file = {}
    self._epoll = select.epoll(len(all_cons)+1)
    for f in all_cons:
      fd = f.fileno()
      if fd in self._fd2file:
        raise ValueError("%r and %r have the same fd", fd, self._fd2file[fd], f)
      self._fd2file[fd] = f
      self._epoll.register(fd, select.EPOLLIN)

  def _init_robot_attrs(self):
    # transactions, define messages
    for trans in self.robot.transactions:
      self._init_transaction_attrs(trans)
    # devices (must be after transactions)
    for dev in self.robot.devices:
      self.devices._add(dev.roid, dev.name, BindingDevice(self, dev))

  def _init_transaction_attrs(self, trans):
    if isinstance(trans, Command):
      mreq, mres = trans.request, trans.response
      bmreq = BindingRequest(self, trans)
      bmres = BindingMessage(self, mres)
      self.messages._add(mreq.mid, mreq.name, bmreq)
      self.messages._add(mres.mid, mres.name, bmres)
      def msg_call(self, dst, *a, **kw):
        return bmreq(self, dst, None, *a, **kw)
      f = types.MethodType(msg_call, self, self.__class__)
      setattr(self, 'msg_%s' % trans.name, f)
    elif isinstance(trans, TransactionSingle):
      msg = trans.msg
      bm = BindingMessage(self, msg)
      self.messages._add(msg.mid, msg.name, bm)
      def msg_call(self, dst, *a, **kw):
        return bm(self, dst, None, *a, **kw)
      f = types.MethodType(msg_call, self, self.__class__)
      setattr(self, 'msg_%s' % trans.name, f)
    else:
      raise TypeError("unsupported transaction type: %r" % trans)

  def send_frame(self, frame):
    """Send a Frame"""
    cons = self.cons.get(frame.dst, self.cons[None])
    if cons is None:
      return
    data = frame.data()
    for con in cons:
      with self._lock:
        con.write(data)

  def send(self, mf, cb=None, cbmid=None):
    """Send a MsgFrame
    If cb is not None, it will be called on the first received message with the
    same tid and given cbmid (or any if None).
    Return a callback key to pass to cancel_send_cb(), or None.
    """
    if cb is not None:
      key = (mf.tid, cbmid)
      with self._lock:
        self._send_cbs[key] = cb
    else:
      key = None
    self.send_frame(mf.build_frame())
    return key

  def send_wait(self, mf, cbmid=None, timeout=None, retry=None):
    """Send a MsgFrame and wait for response
    Like send() with callback but wait for the reply message and return it
    instead of invoking a callback.
    Return the received MsgFrame.

    Note that using send_wait() while listening may cause the method to wait
    too long when the message by the listening thread.
    """
    if timeout is None:
      timeout = self.default_send_wait_timeout
    if retry is None:
      retry = self.default_send_wait_retry
    for i in range(retry):
      tend = time.time() + timeout
      nonlocal_waitmsg = [None]  # would use nonlocal on python3
      def cb(msg):
        nonlocal_waitmsg[0] = msg
      key = self.send(mf, cb, cbmid)
      while nonlocal_waitmsg[0] is None:
        tout = tend - time.time()
        if tout < 0:
          # timeout
          self.cancel_send_cb(key)
          break
        self.process_input(tout)
      if nonlocal_waitmsg[0] is not None:
        # success
        return nonlocal_waitmsg[0]
    raise RuntimeError("no more retries")

  def cancel_send_cb(self, key):
    with self._lock:
      del self._send_cbs[key]


  def process_input(self, timeout=0):
    """Read and process incoming data from all file objects"""
    l = self._epoll.poll(timeout)
    if len(l) == 0:
      return False
    for fd,ev in l:
      if ev == select.EPOLLIN:
        self._process_input(self._fd2file[fd])
    return True

  def process_input_all(self, timeout=0):
    while self.process_input(timeout):
      pass

  def _process_input(self, f):
    """Read and process data from a single file object"""
    if hasattr(f, 'inWaiting') and callable(f.inWaiting):
      with self._lock:
        data = f.read(f.inWaiting())
    else:
      data = ''
      with self._lock:
        while not f.eof():
          data += f.read(1)
    data = self._feed_data[f] + data
    while True:
      frame, pre, data = UARTFrame.extract(data)
      if pre:
        self.on_rawdata(f, pre)
      if frame is None:
        break
      try:
        mf = self._parse_msgframe(frame)
        self.on_msgframe(mf)
      except Exception, e:
        self.on_error(frame, str(e))
    self._feed_data[f] = data


  def listen_start(self):
    """Listen for incoming data in a separated thread"""
    if self._listen_th is not None:
      raise Exception("already listening")
    pr,pw = os.pipe()
    def f():
      self._epoll.register(pr)
      try:
        while True:
          for fd,ev in self._epoll.poll(-1):
            if fd == pr:
              return
            self._process_input(self._fd2file[fd])
      finally:
        self._epoll.unregister(pr)
    th = threading.Thread(target=f)
    th.daemon = True
    th.start()
    self._listen_th = th
    self._listen_pw = pw


  def listen_stop(self):
    if self._listen_th is None:
      raise Exception("not listening")
    with self._lock:
      os.fdopen(self._listen_pw, 'w', 0).close()
    self._listen_th.join()
    self._listen_th = None
    self._listen_pw = None


  def _parse_msgframe(self, frame):
    """Parse a Frame into a MsgFrame"""
    tid = frame.unpack(ppp_uint8)
    mid = frame.unpack(ppp_uint8)
    if mid == 0:
      raise ValueError("unexpected protocol command")
    try:
      mf = self.messages[mid]
    except KeyError:
      raise KeyError("unknown mid: %r" % mid)
    src = self.roid_to_data(frame.src)
    dst = self.roid_to_data(frame.dst)
    args = frame.unpack_args(mf.msg.params)
    if len(frame.unparsed) != 0:
      raise ValueError("extra frame data")
    return mf(src, dst, tid, **args)


  def roid_to_data(self, roid):
    """Convert an ROID to a suitable object, if possible"""
    ret = self.devices._get(roid)
    if ret is None:
      ret = roid
    return ret

  def roid_from_data(self, data):
    """Return an ROID from a "random" object"""
    if isinstance(data, int):
      return data
    if hasattr(data, 'roid'):
      return data.roid
    if isinstance(data, BindingDevice):
      return data.dev.roid
    return self.devices[data].dev.roid


  def on_rawdata(self, f, data):
    """Called on received non-frame data"""
    pass

  def on_error(self, frame, msg):
    """Called on erroneous frame"""
    raise StandardError("failed to process frame: %s" % msg)

  def on_msgframe(self, mf):
    """Called on received MsgFrame
    Return True if the message has been processed
    """
    keys = [
        (mf.tid, mf.msg.msg.mid),
        (mf.tid, None),
        ]
    for k in keys:
        cb = None
        with self._lock:
          if k in self._send_cbs:
            cb = self._send_cbs.pop(k)
        if cb is not None:
          cb(mf)
          return True


class BindingDevice(object):
  """
  Wrap a device for use by a binding

  Attributes:
    b -- associated binding
    dev -- associated Device instance
    name -- device name

  """
  def __init__(self, b, dev):
    self.b = b
    self.dev = dev
    self.name = dev.name
    for trans in b.robot.transactions:
      self._init_transaction_attrs(trans)

  def __repr__(self):
    return "<%s %r:%02X>" % (
        self.__class__.__name__, self.name, self.dev.roid)

  def _init_transaction_attrs(self, trans):
    if isinstance(trans, Command):
      bmreq = self.b.messages[trans.request.mid]
      def msg_call(self, *a, **kw):
        return bmreq(self.b.roid, self.dev.roid, None, *a, **kw)
      f = types.MethodType(msg_call, self, self.__class__)
      setattr(self, 'msg_%s' % trans.name, f)
    elif isinstance(trans, TransactionSingle):
      bm = self.b.messages[trans.msg.mid]
      def msg_call(self, *a, **kw):
        return bm(self.b.roid, self.dev.roid, None, *a, **kw)
      f = types.MethodType(msg_call, self, self.__class__)
      setattr(self, 'msg_%s' % trans.name, f)
    else:
      raise TypeError("unsupported transaction type: %r" % trans)


class BindingMessage(object):
  """
  Wrap a message for use by a binding

  It also behaves as a constructor for MsgFrames.

  Attributes:
    b -- associated binding
    msg -- associated Message instance
    name -- message name

  """

  def __init__(self, b, msg):
    self.b = b
    self.msg = msg
    self.name = msg.name

  def __repr__(self):
    return "<%s %r:%02X (%s)>" % (
        self.__class__.__name__, self.name, self.msg.mid,
        ', '.join('%s:%s'%kv for kv in self.msg.params))

  def __call__(self, src, dst, tid=None, *args, **kw):
    params = self.msg.ptuple(*args, **kw)
    return MsgFrame(self, src, dst, tid, params)


class BindingRequest(BindingMessage):
  """
  Wrap a message for a command request
  """

  def __init__(self, b, trans):
    BindingMessage.__init__(self, b, trans.request)
    self.trans = trans

  def __call__(self, src, dst, tid=None, *args, **kw):
    params = self.msg.ptuple(*args, **kw)
    return MsgFrameRequest(self, self.trans, src, dst, tid, params)


class MsgFrame(object):
  """
  Message frame sent/received by a binding

  Attributes:
    b -- associated binding
    msg -- associated BindingMessage instance
    src, dst -- source and destination as objects
    tid -- transaction ID
    params -- message parameters as a msg.ptuple instance

  """

  def __init__(self, msg, src, dst, tid, params):
    self.b = msg.b
    self.msg = msg
    self.src, self.dst = src, dst
    self.update_tid(tid)
    self.params = params

  def __repr__(self):
    return "<%s [%02X->%02X|%s] %r (%s)>" % (self.__class__.__name__,
        self.b.roid_from_data(self.src), self.b.roid_from_data(self.dst),
        '??' if self.tid is None else '%02X'%self.tid,
        self.msg.name, ', '.join('%s=%r'%kv for kv in self.params._asdict().items()))

  def update_tid(self, tid=None):
    if tid is None:
      msgtid = self.msg.msg.tid
      if msgtid is None:
        tid = 0
      elif msgtid == 'new':
        tid = self.b._tids.next()
      else:
        raise ValueError("tid must be set")
    self.tid = tid

  def build_frame(self):
    """Build a frame for the message"""
    if self.tid is None:
      self.update_tid()
    isrc = self.b.roid_from_data(self.src)
    idst = self.b.roid_from_data(self.dst)
    frame = UARTFrame(isrc, idst)
    frame.pack(ppp_uint8, self.tid)
    frame.pack(ppp_uint8, self.msg.msg.mid)
    for (k,t),v in zip(self.msg.msg.params, self.params):
      frame.pack(t, v)
    return frame

  def send(self):
    self._send()

  def _send(self, cb=None, cbmid=None):
    self.b.send(self, cb, cbmid)

  def update_params(self, *a, **kw):
    self.params = self.msg.msg.ptuple(*a, **kw)


class MsgFrameRequest(MsgFrame):
  """
  MsgFrame for command requests

  Attributes:
    trans -- the transaction
    _wait -- still waiting (used by send_wait())

  """

  def __init__(self, msgreq, trans, src, dst, tid, params):
    MsgFrame.__init__(self, msgreq, src, dst, tid, params)
    self.trans = trans

  def send(self, cb=None):
    msg = self.b.messages[self.trans.response.mid]
    self._send(cb, self.trans.response.mid)

  def send_wait(self, timeout=None, retry=None):
    return self.b.send_wait(self, self.trans.response.mid, timeout, retry)

  def reply(self, *a, **kw):
    """Return a reply MsgFrame"""
    msg = self.b.messages[self.trans.response.mid]
    params = msg.msg.ptuple(*a, **kw)
    return MsgFrame(msg, self.dst, self.src, self.tid, params)

  def _wait_end(msg):
    """Callback used by send_wait()"""
    self._wait = False

