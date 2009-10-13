#!/usr/bin/env python

import re, sys


class RobloClient:
  """
  Low-level Client for the Rob'Otter Bootloader.

  Attributes:
    verbose -- print transferred data on stderr if True

  """

  # End-of-line sequence
  EOL = '\r\n'


  def __init__(self, conn):
    """Initialize the client.

    conn is an UART connection object with the following requirements:
     - it must be blocking
     - write() and either read(1) or readline() must be implemented

    Note: methods assume that their are no pending data in the input queue
    before sending a command. Otherwise, read responses will not match.

    """
    self.verbose = False
    self.conn = conn
    if hasattr(conn, 'readline'):
      self._readline = conn.readline
    else:
      def rl():
        s = ''
        while True:
          c = self.conn.read(1)
          s += c
          if c == '\n': break
        return s
      self._readline = rl

  # Data transmission

  def send_raw(self, buf):
    """Send raw data to the server."""
    if self.verbose:
      sys.stderr.write("robloc: >> %r\n" % str(buf))
    self.conn.write(buf)

  def send_eol(self):
    """Send an end-of-line sequence."""
    self.send_raw(self.EOL)

  def send_msg(self, *args):
    """Send a line ended by an EOL sequence.
    Number arguments are properly formatted.
    """
    l = []
    for a in args:
      if type(a) is int:
        a = '%x' % a
      l.append(a)
    self.send_raw(' '.join(l) + self.EOL)

  def send_hex(self, n):
    """Send a number."""
    self.send_raw("%x" % n)

  def send_yesno(self, b):
    """Send a confirmation response."""
    self.send_msg( 'y' if b else 'n' )


  def recv_msg(self):
    """Read and parse a one-line message.
    Return a RoblosResponse object or False on error.
    """
    s = self._readline()
    if self.verbose:
      sys.stderr.write("robloc: << %r\n" % s)
    if not s: return False
    r = RoblosResponse(s)
    return r


  # Commands

  def cmd_infos(self):
    """Retrieve server infos.
    Return a the tuple (supported commands, ROID, pagesize) or False on error.
    """
    self.send_msg('i')
    r = self.recv_msg()
    if not r or r.cmd!='info' or len(r.args)!=3: return False
    return tuple( r.args )

  def cmd_fuse_read(self):
    """Read fuses.
    Return a tuple with low, high and extended fuse bytes or False on error.
    """
    self.send_msg('f')
    r = self.recv_msg()
    if not r or r.cmd!='fuse' or len(r.args)!=3: return False
    return tuple( r.args )

  def cmd_prog_page(self, addr, buf, crc=None):
    """Program a page.
    Return True on success, False on error and None on crc mismatch.
    """

    self.send_msg('p', addr)
    r = self.recv_msg()
    if not r or not r.ask or r.cmd!='data': return False

    # send data
    self.send_raw(buf)

    r = self.recv_msg()
    if not r or not r.ask or r.cmd!='crc': return False
    if not crc or r.args[0] == crc:
      self.send_yesno(True)
      r = self.recv_msg()
    else:
      self.send_yesno(False)
      r = self.recv_msg() # should be a 'KO'
      return None
    if not r or not r.ok: return False
    return True

  def cmd_mem_crc(self, start, size):
    """Compute the CRC of a given memory range.
    Return the computed CRC or False on error.
    """
    self.send_msg('c', start, size)
    r = self.recv_msg()
    if not r or r.cmd!='crc' or len(r.args)!=1: return False
    return r.args[0]

  def cmd_execute(self):
    """Run the application.
    Return True on success, False otherwise.
    """
    self.send_msg('x')
    r = self.recv_msg()
    if not r or r.cmd!='boot': return False
    return True


  # Utils

  @classmethod
  def compute_crc(cls, data):
    """Compute a CRC as used by the protocol."""
    crc = 0xffff
    for c in data:
      c = ord(c)
      c ^= (crc&0xff)
      c ^= c << 4
      c &= 0xff
      crc = ((c << 8) | ((crc>>8)&0xff)) ^ ((c>>4)&0xff) ^ (c << 3)
      crc &= 0xffff
    return crc



class RoblosResponse:
  """Parse a server response into an object.

  This is a very simple object which only sets some attributes.

  Attributes:
    valid -- the reply is valid
    ask -- the server asks for a reply (leading '?')
    prompt -- True if the message is a prompt
    ok -- True if the message is a 'ok' status
    ko -- True if the message is a 'KO' status
    cmd -- first field (without any leading '?')
    args -- tuple of fields without the first one, valid number strings are
            casted to int
    raw -- raw copy of the message

  The reponse evaluates to True if it is valid and not a 'KO' status.

  """

  def __init__(self, s):
    self.valid = self.parse(s)

  def parse(self, s):
    self.raw = s
    if not s: return False
    if s[-2:] != '\r\n': return False

    m = re.match(r'^(\?)?([^ ]+)((?: [^ ]+)*)$', s[:-2])
    if m is None: return False

    # fill attributes
    self.cmd = m.group(2)
    self.ask = bool(m.group(1))
    self.prompt = ( self.ask and self.cmd == 'cmd' )
    self.ok = ( self.cmd == 'ok' )
    self.ko = ( self.cmd == 'KO' )
    self.args = tuple(
        int(a,16) if re.match('^(?:[0-9a-f][0-9a-f])*$', a) else a
        for a in m.group(3).split(' ')[1:]
        )
    return True

  def __nonzero__(self):
    return 1 if self.valid and not self.ko else 0
  __bool__ = __nonzero__



class RoblochonError(StandardError):
  pass

class Roblochon(RobloClient):
  """Rob'Otter Bootloader Client - High Orders and Network.

  The given connection object must meet an additional requirement: an
  inWaiting() method which returns a number > 0 if there are in the receive
  buffer. (This requirement is satisfied by pyserial objects.)

  Attributes:
    cmds -- supported commands (as a string)
    roid -- server's Rob'Otter ID
    pagesize -- server's page size

  """

  CRC_RETRY = 5  # maximum number of retry on CRC mismatch

  def __init__(self, conn, verbose=False):
    RobloClient.__init__(self, conn)
    self.verbose = verbose
    # retrieve server infos
    self._wait_prompt()
    r = self.cmd_infos()
    if not r: raise RoblochonError("cannot retrieve device info")
    self.cmds, self.roid, self.pagesize = r

  def _wait_prompt(self):
    """Wait or force a prompt."""
    # Flush all waiting lines, remember the last one.
    r = None
    while self.conn.inWaiting() > 0:
      rr = self.recv_msg()
      if rr is False:
        raise RoblochonError("recv_msg failed")
      r = rr
    if r and r.prompt: return  # got a prompt
    # not a prompt? ask for it!
    self.send_msg('')
    while True:
      r = self.recv_msg()
      if r is False:
        raise RoblochonError("recv_msg failed")
      if not r: continue
      if r.prompt: break


  def program(self, fhex, force=False):
    """Send a program to the device.

    Parameters:
      fhex -- HEX file (or filename) to program
      force -- if True, skip CRC checking

    """

    self._assert_supported_cmd('p')
    data = self._parse_hex_file(fhex)
    if len(data) == 0:
      raise ValueError("empty HEX data")
    # data padding
    n = len(data) % self.pagesize
    data += (self.pagesize - len(data)%self.pagesize) * '\0'
    page_count = len(data)/self.pagesize

    for i in range(page_count):
      #TODO progress bar
      addr = i*self.pagesize
      d = data[addr:addr+self.pagesize]
      crc = self.compute_crc(d) if force else False
      n = self.CRC_RETRY
      while True:
        self._wait_prompt()
        r = self.cmd_prog_page(addr, d, crc)
        if r is True:
          break # ok
        elif r is False:
          raise RoblochonError("prog failed at page %d/%d (0x%x)" % (i+1,page_count,addr))
        elif r is None:
          if n == 0:
            raise RoblochonError("prog failed at page %d/%d (0x%x): too many attempts" % (i+1,page_count,addr))
          n = n-1
          continue # retry
        raise ValueError("unexpected cmd_prog_page() return value: %r" % r)


  def check(self, fhex):
    """Check the program on the device.

    Parameters:
      fhex -- HEX file (or filename) to check against

    Return True if the CRC matches, False otherwise

    """

    self._assert_supported_cmd('c')
    data = self._parse_hex_file(fhex)
    if len(data) == 0:
      raise ValueError("empty HEX data")

    self._wait_prompt()
    r = self.cmd_mem_crc(0, len(data))
    if r is False:
      raise RoblochonError("crc check failed")
    return r == self.compute_crc(data)


  def read_fuses(self):
    """Read fuses.
    Return a tuple with low, high and extended fuse bytes.
    """
    self._assert_supported_cmd('f')
    self._wait_prompt()
    r = client.cmd_fuse_read()
    if r is False:
      raise RoblochonError("failed to read fuses")
    return r


  def reset(self):
    """Reset the device."""
    self._assert_supported_cmd('x')
    self._wait_prompt()
    r = client.cmd_execute()
    if r is False:
      raise RoblochonError("reset failed")
    return


  @classmethod
  def _parse_hex_file(cls, f):
    """Return a data buffer from a .hex.
    f is a file object or a filename.
    """
    if type(f) is str:
      f = open(f, 'rb')

    data = ''
    for s in f:
      s = s.strip()
      # only do basic checks needed for the algo
      if re.match(':[\dA-Fa-f]{10,42}$', s) is None:
        raise ValueError("invalid HEX line: %s" % s)
      rt = s[7:9]
      if rt == '00':
        d = s[9:-2]
        data += ''.join(
            chr(int(d[i:i+2],16))
            for i in range(0,len(d),2)
            )
      elif rt == '01':
        break
      else:
        raise ValueError("invalid HEX record type: %s" % rt)
    return data

  def _assert_supported_cmd(self, c):
    if c not in self.cmds:
      raise RoblochonError("command '%c' not supported by the device" % c)



import os, termios, fcntl, struct

class BasicSerial:
  """Basic serial connection implementation."""

  def __init__(self, device, baudrate=38400, bytesize=8, parity=None, stopbits=1):
    self.fd = os.open(device, os.O_RDWR|os.O_NOCTTY)

    iflag, oflag, cflag, lflag, ispeed, ospeed, cc = termios.tcgetattr(self.fd)

    iflag &= ~(termios.INPCK|termios.ISTRIP|termios.INLCR|termios.IGNCR|termios.ICRNL|termios.IXON)
    oflag &= ~(termios.OPOST)
    cflag = (termios.CREAD)
    lflag = 0

    # baudrate
    try:
      ispeed = ospeed = getattr(termios, 'B%s' % baudrate)
    except AttributeError:
      raise ValueErro("baudrate not supported")

    # bytesize
    cflag &= ~(termios.CSIZE)
    try:
      cflag |= {
          5: termios.CS5,
          6: termios.CS6,
          7: termios.CS7,
          8: termios.CS8,
          }[bytesize]
    except KeyError:
      raise ValueError("invalid bytesize: %r" % bytesize)

    # setup parity
    if parity is None:
      cflag &= ~(termios.PARENB|termios.PARODD)
    elif parity == 0 or parity == 'even':
      cflag &= ~(termios.PARODD)
      cflag |=  (termios.PARENB)
    elif parity == 1 or parity == 'odd':
      cflag |=  (termios.PARENB|termios.PARODD)
    else:
      raise ValueError("invalid parity: %r" % parity)

    # stopbits
    if stopbits == 1:
        cflag &= ~(termios.CSTOPB)
    elif stopsbits == 2:
        cflag |=  (termios.CSTOPB)
    else:
      raise ValueError("invalid stopbits: %r" % stopbits)

    # no blocking, no timeout
    cc[termios.VMIN] = 1
    cc[termios.VTIME] = 0

    # activate settings
    termios.tcsetattr(self.fd, termios.TCSANOW, [iflag, oflag, cflag, lflag, ispeed, ospeed, cc])


  # required interface
  def read(self, size=1):
    return os.read(self.fd, size)
  def write(self, data):
    return os.write(self.fd, data)
  def inWaiting(self):
    s = fcntl.ioctl(self.fd, termios.FIONREAD, struct.pack('I', 0))
    return struct.unpack('I',s)[0]



if __name__ == '__main__':
  from optparse import OptionParser

  parser = OptionParser(
      description="Rob'Otter Bootloader Client",
      usage="%prog [OPTIONS] [file.hex]",
      )
  parser.add_option('-p', '--program', dest='program', action='store_true',
      help="program the device")
  parser.add_option('-c', '--check', dest='check', action='store_true',
      help="check current loaded program")
  parser.add_option('-r', '--reset', dest='reset', action='store_true',
      help="reset (after programming and CRC check)")
  parser.add_option('-i', '--infos', dest='infos', action='store_true',
      help="print device infos")
  parser.add_option('-f', '--read-fuses', dest='fuses', action='store_true',
      help="print value of fuse bytes")
  parser.add_option('--force', dest='force', action='store_true',
      help="do not check CRC during programming")
  parser.add_option('-P', '--port', dest='port',
      help="device port to used (default: /dev/ttyUSB0)")
  parser.add_option('-s', '--baudrate', dest='baudrate',
      help="baudrate (default: 38400)")
  parser.add_option('-v', '--verbose', dest='verbose', action='store_true',
      help="print transferred data on stderr")
  parser.set_defaults(
      program=False,
      check=False,
      reset=False,
      infos=False,
      fuses=False,
      force=False,
      port='/dev/ttyUSB0',
      baudrate=38400,
      verbose=False
      )
  (opts, args) = parser.parse_args()

  conn = BasicSerial(opts.port, opts.baudrate)
  client = Roblochon(conn, opts.verbose)

  if opts.program or opts.check:
    if len(args) < 1:
      parser.error("argument missing: HEX file")
    elif len(args) > 1:
      parser.error("extra argument")

  if opts.infos:
    print "device infos :  ROID: %d, commands: %s" % (client.roid, client.cmds)
  if opts.fuses:
    print "fuses (low high ex): %02x %02x %02x" % client.read_fuses()
  if opts.program:
    print "programming..."
    client.program(args[0], opts.force)
  if opts.check:
    print "CRC check..."
    if client.check(args[0]):
      print "CRC OK"
    else:
      print "CRC mismatch"
      opts.reset = False
  if opts.reset:
    print "reset"
    client.reset()

