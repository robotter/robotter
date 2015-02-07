"""

ROME client connection

"""

import threading
import Queue
import time
import datetime
from . import frame
from .frame import Frame

__all__ = ['Client']


class ClientResultHandler:
  """
  Handle Client.send() when client is started in background

  To be used with send() to check for results when using a daemon client.

  Attributes:
    result -- send() call result: None (not set yet), True or False
    check -- callback used to check periodically if message has succeeded
    check_ev -- event used to signal that the ACK has been received
    result_ev -- event used to signal that the result has been set

  If check is not set, check() is expected to be called.
  If check is False
  """

  def __init__(self, check=None):
    self.result = None
    self.check = None
    self.check_ev = threading.Event()
    self.result_ev = threading.Event()

  def reset(self):
    """Reset the result handler"""
    self.result = None
    self.check_ev.clear()
    self.result_ev.clear()

  def ack(self):
    """Signal that the result has been received"""
    self.check_ev.set()

  def wait(self, timeout=None):
    """Wait for the result to be received"""
    self.result_ev.wait(timeout)

  def _check(self, timeout):
    """Check if response has been received"""
    if self.check is None:
      return self.check_ev.wait(timeout)
    else:
      time.sleep(timeout)
      return self.check_ev.is_set()


class Client(object):
  """
  ROME client connection

  Attributes:
    fo -- file object for the remote device
    retry_count -- number of tries for sent messages
    retry_period -- period between tries (and checks) for sent messages
    rthread -- thread used for reading while runing
    wthread -- thread used for writing while running
    wqueue -- write queue, see send() for values
    _stop_threads -- used internally to stop the client

  """

  _stop_threads_period = 0.5

  def __init__(self, fo):
    self.fo = fo
    self.retry_count = 10
    self.retry_period = 0.05
    self.rthread = self.wthread = None
    self.wqueue = Queue.Queue()
    self._stop_threads = False


  def start(self, background=True):
    """Start threads

    If background is True, reading is made in a new thread. Otherwise, current
    thread is used.
    """
    if self.rthread is not None or self.wthread is not None:
      raise RuntimeError("already started")
    self._stop_threads = False
    # write thread
    self.wthread = threading.Thread(target=self.run_wthread, name='RomeClientWrite')
    self.wthread.daemon = True
    self.wthread.start()
    # read thread
    if background:
      self.rthread = threading.Thread(target=self.run_rthread, name='RomeClientRead')
      self.rthread.daemon = True
      self.rthread.start()
    else:
      self.run_rthread()

  def stop(self):
    if self.rthread is None or self.wthread is None:
      raise RuntimeError("not started")
    self._stop_threads = True
    if self.rthread is not None:
      self.rthread.join()
      self.rthread = None
    if self.wthread is not None:
      self.wthread.join()
      self.wthread = None


  def send(self, frame, handler=None, cb_result=None):
    """Queue a frame to send

    handler is expected to be a ClientResultHandler instance.
    If not None, cb_result is called with True (success) or False (failure) as
    parameter. If handler is not set, send will succeed as soon as data has
    been written.
    """
    self.wqueue.put((frame, handler, cb_result))

  def send_raw(self, data):
    """Queue raw data to send"""
    self.wqueue.put((data, None, None))


  def on_frame(self, frame):
    """Method called to handle incoming frames"""
    raise NotImplementedError

  def on_sent_frame(self, frame):
    """Method called when a frame is sent"""
    pass


  def run_rthread(self):
    """Process input data"""

    try:
      while not self._stop_threads:
        #XXX use self._stop_threads_period instead of blocking
        frame = Frame.read(self.fo)
        if frame is None:
          break
        self.on_frame(frame)
    finally:
      self._stop_threads = True  # to also stop wthread

  def run_wthread(self):
    """Process pending write requests"""

    while not self._stop_threads:
      try:
        frame, handler, cb_result = self.wqueue.get(True, self._stop_threads_period)
      except Queue.Empty:
        continue

      if not isinstance(frame, Frame):
        # raw data
        self.fo.write(frame)
        continue

      self.on_sent_frame(frame)
      data = frame.data()
      if handler is None:
        self.fo.write(data)
        result = True
      else:
        for i in range(self.retry_count):
          self.fo.write(data)
          if handler._check(self.retry_period):
            result = True
            break
        else:
          result = False
      if cb_result is not None:
        cb_result(result)
      if handler is not None:
        handler.result_ev.set()


class ClientEcho(Client):

  def __init__(self, fo, mids=None):
    Client.__init__(self, fo)
    self.filtered_mids = mids

  @classmethod
  def log_strtime(cls):
    t = datetime.datetime.now()
    return '%02d:%02d:%02d.%03d' % (t.hour, t.minute, t.second, t.microsecond/1000)

  def on_frame(self, frame):
    if self.filtered_mids is None or frame.mid in self.filtered_mids:
      print "%s <<< %r" % (self.log_strtime(), frame)

  def on_sent_frame(self, frame):
    if self.filtered_mids is None or frame.mid in self.filtered_mids:
      print "%s >>> %r" % (self.log_strtime(), frame)


def main():
  import argparse

  parser = argparse.ArgumentParser()
  parser.add_argument('source', default='/dev/ttyUSB0',
      help="serial device to listen from, defaults to /dev/ttyUSB0")
  parser.add_argument('--baudrate', type=int, default=38400,
      help="serial baudrate, defaults to 38400")
  parser.add_argument('-i', '--interactive', action='store_true', default=False,
      help="start an interactive IPython shell")
  parser.add_argument('--filter', default=None,
      help="comma-separated list of message IDs or name to print")

  args = parser.parse_args()

  from serial import Serial
  import os
  fo = Serial(args.source, args.baudrate, timeout=0.5)

  if args.filter is None:
    filtered_mids = None
  else:
    filtered_mids = []
    for x in args.filter.split(','):
      try:
        mid = int(x, 0)
      except ValueError:
        mid = frame.messages_by_name[x].mid
    filtered_mids.append(mid)

  client = ClientEcho(fo, filtered_mids)

  if not args.interactive:
    client.start(False)
  else:
    client.start()

    namespace = {
        'client': client,
        'Frame': Frame,
        }
    import IPython
    IPython.embed(user_ns=namespace, banner2="ROME interactive shell")


if __name__ == '__main__':
  main()

