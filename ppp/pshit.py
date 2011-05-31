#!/usr/bin/env python

import sys, os, time
try:
  this_dir = os.path.dirname(__file__)
except:
  this_dir = os.getcwd()
sys.path.append( this_dir )
sys.path.append( os.path.join(this_dir, '../avrs/bootloader') )

from robloc import Serial
from perlimpinpin.core import Device
from perlimpinpin.binding import Binding, Client
import readline
import IPython.ipapi


class ShellBinding(Binding):

  def __init__(self, conn, robot, remote, buffered=True):
    # get ROID from remote device (instance, name or ROID)
    roid = None
    if isinstance(remote, Device):
      if remote not in robot.devices:
        raise ValueError("remote is not a device of the robot")
      roid = remote.roid | 0x80
    elif remote is not None:
      try:
        remote = int(remote, 0)
      except ValueError:
        pass
      if isinstance(remote, int):
        if remote not in ( dev.roid for dev in robot ):
          raise ValueError("unknown device ROID: %u" % remote)
        roid = remote | 0x80
      else:
        for dev in robot.devices:
          if remote == dev.name:
            roid = dev.roid | 0x80
            break
        if roid is None:
          raise ValueError("unknown device name: %s" % remote)

    Binding.__init__(self, conn, robot, roid)
    self.buffered = buffered
    self._data_buf = ''

  @classmethod
  def prompt_print(cls, s):
    sys.stdout.write("\r\033[K%s" % s)
    prompt = str(IPython.ipapi.get().IP.outputcache.prompt1.p_str)
    sys.stdout.write(prompt.replace('\001','').replace('\002','') + readline.get_line_buffer())
    sys.stdout.flush()

  def on_rawdata(self, data):
    if self.buffered:
      self._data_buf += data
      l = self._data_buf.split('\n')
      if len(l) > 1:
        self.prompt_print( '\n'.join('RAW: '+s for s in l[:-1]) )
        self._data_buf = l[-1]
    else:
      self.prompt_print('RAW: %s' % data)

  def on_message(self, msg, src, args):
    if isinstance(src, Device):
      src = src.name
    else:
      src = '0x%02X' % src
    self.prompt_print("MSG  %s from %s : %r" % (msg.name, src, args))

  def on_error(self, frame, msg):
    self.prompt_print("ERROR: %s" % msg)


def main():
  from optparse import OptionParser
  port_default = '/dev/ttyUSB0'
  parser = OptionParser(
      description="pshit -- a shell for perlimpinpin communications",
      usage="%prog [OPTIONS] [ROBOT]",
      )
  parser.add_option('-P', '--port', dest='port',
      help="UART device port to use (default: %s)"%port_default)
  parser.add_option('--baudrate', dest='baudrate', type='int',
      help="UART baudrate (default: 38400)")
  parser.add_option('-r', '--remote', dest='remote',
      help="ROID or name of the remote UART device (defaul: discovered)")
  parser.set_defaults(
      port=port_default,
      baudrate=38400,
      remote=None,
      )
  (opts, args) = parser.parse_args()

  from galipeur import robot

  conn = Serial(opts.port, opts.baudrate)
  b = ShellBinding(conn, robot, opts.remote)
  cl = Client(b)
  b.listen_start()

  _ppp_client = cl  # alias with a more "unique" name
  from IPython.Shell import IPShellEmbed
  ipshell = IPShellEmbed(['-pi1','ppp [\#]: '])
  ipshell()


if __name__ == '__main__':
  main()

