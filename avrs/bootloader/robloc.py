#!/usr/bin/env python

import re, sys, select

# TODO 
# - call uio.restoreLocalTermios when program quit

class RobloClient:
  """
  Low-level Client for the Rob'Otter Bootloader.
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
    self.conn = conn
    if hasattr(conn, 'readline'):
      self._readline = conn.readline
    elif hasattr(conn, 'read'):
      def rl():
        s = ''
        while True:
          c = self.conn.read(1)
          s += c
          if c == '\n': break
        return s
      self._readline = rl
    else:
      raise ValueError, "invalid connection: read() method missing"


  # Data transmission

  def send_raw(self, buf):
    """Send raw data to the server."""
    self.conn.write(buf)
    self.output_write(buf)

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
    self.output_read(s)
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


  # Output (default: do nothing)

  def output_read(self, data): pass
  def output_write(self, data): pass


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
    self.cmd = None
    self.ask = False
    self.prompt = False
    self.ok = False
    self.ko = False
    self.args = None
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

  If the given connection object defines an eof() method which returns True if
  there is nothing to read (a call to read(1) will block) and False otherwise
  or an inWaiting() method (as defined by pyserial objects), it will be used
  for a better (and safer) behavior.

  Attributes:
    cmds -- supported commands (as a string)
    roid -- server's Rob'Otter ID
    pagesize -- server's page size
    response -- last received response, or None
    verbose -- print transferred data on stderr if True

  """

  CRC_RETRY = 5  # maximum number of retry on CRC mismatch
  UNUSED_BYTE = '\xFF'  # value of programmed unused bytes

  def __init__(self, conn, **kw):
    self.verbose = kw.get('verbose', False)
    RobloClient.__init__(self, conn)

    if hasattr(conn, 'eof') and callable(conn.eof):
      self._eof = conn.eof
    elif hasattr(conn, 'inWaiting') and callable(conn.inWaiting):
      self._eof = lambda: conn.inWaiting() == 0
    else:
      self._eof = None

    # send init string, if any
    if kw.get('init_send'):
      self.send_raw( kw.get('init_send') )

    self.response = None
    
    # retrieve server infos
    self._wait_prompt()
    r = self.cmd_infos()
    if not r: raise RoblochonError("cannot retrieve device info")
    self.cmds, self.roid, self.pagesize = r

  def recv_msg(self):
    """Redefined method to store the last response."""
    r = RobloClient.recv_msg(self)
    self.response = r if r is not False else None
    return r

  def _wait_prompt(self):
    """Wait or force a prompt."""

    if self.response is None:
      # unknown state, read all we can
      if self._eof is not None:
        while not self._eof():
          r = self.recv_msg()
          if r is False: raise RoblochonError("recv_msg failed")

    if self.response and self.response.prompt:
      return # we have a prompt

    # wait for the prompt
    while True:
      if self.response is None or self.response.ask:
        # server is waiting for an answer, force KO
        self.send_msg('')
      r = self.recv_msg()
      if r is False: raise RoblochonError("recv_msg failed")
      if r.prompt: break


  def program(self, fhex, fhex2=None, force=False):
    """Send a program to the device.

    Parameters:
      fhex -- HEX file (or filename) to program
      fhex2 -- previous HEX file, to program changes
      force -- if True, skip CRC checking

    """

    data = self._parse_hex_file(fhex)
    if len(data) == 0: raise ValueError("empty HEX data")
    if fhex2 is None:
      return self.program_pages(data, force)

    data2 = self._parse_hex_file(fhex2)
    if len(data2) == 0: raise ValueError("empty previous HEX data")
    
    return self.program_pages(self._diff_pages(data, data2), force)


  def program_pages(self, pages, force=False):
    """Send a program to the device.

    Parameters:
      pages -- list of pages to program, or a single buffer string
      force -- if True, skip CRC checking

    pages is a list of (address, data) pairs. address has to be aligned to
    pagesize, data is padded if needed but size must not exceed page size.
    If pages is a single string, it will be cut in pages starting at address 0.

    """

    self._assert_supported_cmd('p')

    if type(pages) is str:
      pages = list(
          (i, pages[i:i+self.pagesize])
          for i in range(0, len(pages) ,self.pagesize)
          )
    page_count = len(pages)

    for i, (addr, data) in enumerate(pages):
      self.output_program_progress(i+1, page_count)

      err_info = "at page %d/%d (0x%0x)" % (i+1, page_count, addr)
      data = data.ljust(self.pagesize, self.UNUSED_BYTE)
      assert addr%self.pagesize == 0, "page address not aligned %s" % err_info
      assert len(data) == self.pagesize, "invalid page size %s" % err_info

      crc = self.compute_crc(d) if force else False
      n = self.CRC_RETRY
      while True:
        self._wait_prompt()
        r = self.cmd_prog_page(addr, data, crc)
        if r is True:
          break # ok
        elif r is False:
          raise RoblochonError("prog failed %s" % err_info)
        elif r is None:
          if n == 0:
            raise RoblochonError("prog failed %s: too many attempts" % err_info)
          n = n-1
          continue # retry
        raise ValueError("unexpected cmd_prog_page() return value: %r" % r)
    self.output_program_end()


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
    r = self.cmd_fuse_read()
    if r is False:
      raise RoblochonError("failed to read fuses")
    return r


  def boot(self):
    """Boot the device."""
    self._assert_supported_cmd('x')
    self._wait_prompt()
    r = self.cmd_execute()
    if r is False:
      raise RoblochonError("boot failed")
    return


  def _diff_pages(self, data1, data2):
    """Return a list of pages of data1 which differ from data2."""
    p = []
    for i in range(0, len(data1), self.pagesize):
      d1 = data1[i:i+self.pagesize]
      d2 = data2[i:i+len(d1)]
      if d1 != d2:
        p.append( (i, d1) )
    return p


  @classmethod
  def _parse_hex_file(cls, f):
    """Return a data buffer from a .hex.
    f is a file object or a filename.
    Gaps are filled with bytes set to UNUSED_BYTE.
    """
    if type(f) is str:
      f = open(f, 'rb')

    data = ''
    offset = 0  # set by record type 02
    for s in f:
      s = s.strip()
      # only do basic checks needed for the algo
      if re.match(':[\dA-Fa-f]{10,42}$', s) is None:
        raise ValueError("invalid HEX line: %s" % s)
      fields = {
          'bytecount':  int(s[1:3],16),
          'address':    int(s[3:7],16),
          'recordtype': int(s[7:9],16),
          'data':       s[9:-2],
          'checksum':   int(s[-2:],16),
          }
      assert len(fields['data']) == 2*fields['bytecount'], "invalid byte count"

      rt = fields['recordtype']
      if rt == 0:
        addr = fields['address'] + offset
        assert addr >= len(data), "invalid address"
        data = data.ljust(addr, cls.UNUSED_BYTE) # fill with default data
        d = fields['data']
        data += ''.join(
            chr(int(d[i:i+2],16))
            for i in range(0,len(d),2)
            )
      elif rt == 1:
        break # EOF
      elif rt == 2:
        assert fields['bytecount'] == 2, "invalid extended segment address record"
        offset = int(fields['data'],16) << 4
      else:
        raise ValueError("invalid HEX record type: %s" % rt)
    return data

  def _assert_supported_cmd(self, c):
    if c not in self.cmds:
      raise RoblochonError("command '%c' not supported by the device" % c)


  # Output

  def output_read(self, data):
    if self.verbose:
      sys.stderr.write("robloc: << %r\n" % data)
  def output_write(self, data):
    if self.verbose:
      sys.stderr.write("robloc: >> %r\n" % data)

  def output_program_progress(self, ncur, nmax):
    sys.stdout.write("\rprogramming: page %3d / %3d  -- %2.2f%%" 
                          % (ncur, nmax, (100.0*ncur)/nmax))
    sys.stdout.flush()
  def output_program_end(self):
    sys.stdout.write("\n")



import os, termios, fcntl, struct

class BasicSerial:
  """Basic serial connection implementation."""

  def __init__(self, device, baudrate=38400, bytesize=8, parity=None, stopbits=1):
    self.fd = os.open(device, os.O_RDWR|os.O_NOCTTY)

    iflag, oflag, cflag, lflag, ispeed, ospeed, cc = termios.tcgetattr(self.fd)

    iflag &= ~(termios.INPCK|termios.ISTRIP|termios.INLCR|termios.IGNCR|termios.ICRNL|termios.IXON)
    oflag &= ~(termios.OPOST)
    cflag = (termios.CREAD|termios.CLOCAL)
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
  def flushInput(self):
    termios.tcflush(self.fd, termios.TCIFLUSH)
  def flushOutput(self):
    termios.tcflush(self.fd, termios.TCIOFLUSH)


class TermColor:

  """ Terminal color codes """
  normal = "\033[0m"
  black = "\033[30m"
  red = "\033[31m"
  green = "\033[32m"
  yellow = "\033[33m"
  blue = "\033[34m"
  purple = "\033[35m"
  cyan = "\033[36m"
  grey = "\033[37m"
  bold = "\033[1m"
  uline = "\033[4m"
  blink = "\033[5m"
  invert = "\033[7m"


class BasicUIO:
  """ Basic User I/O """

  def __init__(self):
    self.saveLocalTermios()
    self.setLocalTermios()
 
  def setColorSpecial(self):
    sys.stderr.write("%s%s"%(TermColor.blue,TermColor.bold))

  def setColorNormal(self):
    sys.stderr.write("%s"%(TermColor.normal))

  def showMenu(self,opts):
    self.setColorSpecial()
    sys.stderr.write(">> . | p ")
    self.setColorNormal()
    
    c = os.read(sys.stdin.fileno(), 1)

    sys.stderr.write("\n")

    # quit
    if c == ".":
      return 0
    
    # program
    elif c == "p":
      return 1

  def saveLocalTermios(self):
    """ Save local termios
    """
    self.savetio_local = termios.tcgetattr(sys.stdout)

  def restoreLocalTermios(self):
    """ Restore local termios
    """
    termios.tcsetattr(sys.stdout, termios.TCSANOW, self.savetio_local)

  def setLocalTermios(self):
    """ Set local termios
    """
    
    # get current termios
    tio = termios.tcgetattr(sys.stdout)
    
    # do not translate carriage return to newline
    tio[0] = tio[0] & ~termios.ICRNL

    # various magic from tip
    tio[3] = 0
    tio[6][termios.VMIN] = 1
    tio[6][termios.VTIME] = 0

    # set new termios
    termios.tcsetattr(sys.stdout, termios.TCSANOW, tio)



def startBootloader():
  print "bootloader waiting..."
  client = Roblochon(conn, verbose=opts.verbose, init_send=opts.init_send)
  
  if opts.roid is not None:
    assert opts.roid != client.roid, "ROID mismatch"

  if opts.infos:
    print "device infos :  ROID: %d, commands: %s" % (client.roid, client.cmds)
  if opts.fuses:
    print "fuses (low high ex): %02x %02x %02x" % client.read_fuses()
  if opts.program:
    print "programming..."
    client.program(args[0], args[1] if len(args)>1 else None, opts.force)
  if opts.check:
    print "CRC check..."
    if client.check(args[0]):
      print "CRC OK"
    else:
      print "CRC mismatch"
      opts.boot = False
  if opts.boot:
    print "boot"
    client.boot()
 

if __name__ == '__main__':
  from optparse import OptionParser

  parser = OptionParser(
      description="Rob'Otter Bootloader Client",
      usage="%prog [OPTIONS] [file.hex] [previous.hex]",
      )
  parser.add_option('-t', '--terminal', dest='terminal', action='store_true',
      help="work as a serial terminal")
  parser.add_option('-p', '--program', dest='program', action='store_true',
      help="program the device")
  parser.add_option('-c', '--check', dest='check', action='store_true',
      help="check current loaded program")
  parser.add_option('-b', '--boot', dest='boot', action='store_true',
      help="boot (after programming and CRC check)")
  parser.add_option('-i', '--infos', dest='infos', action='store_true',
      help="print device infos")
  parser.add_option('-f', '--read-fuses', dest='fuses', action='store_true',
      help="print value of fuse bytes")
  parser.add_option('--roid', dest='roid',
      help="check device ROID before doing anything")
  parser.add_option('--force', dest='force', action='store_true',
      help="do not check CRC of programmed pages")
  parser.add_option('--init-send', dest='init_send',
      help="string to send at connection (eg. to reset the device)")
  parser.add_option('-P', '--port', dest='port',
      help="device port to used (default: /dev/ttyUSB0)")
  parser.add_option('-s', '--baudrate', dest='baudrate',
      help="baudrate (default: 38400)")
  parser.add_option('-v', '--verbose', dest='verbose', action='store_true',
      help="print transferred data on stderr")
  parser.set_defaults(
      terminal=False,
      program=False,
      check=False,
      boot=False,
      infos=False,
      fuses=False,
      roid=None,
      force=False,
      init_send=None,
      port='/dev/ttyUSB0',
      baudrate=38400,
      verbose=False
      )
  (opts, args) = parser.parse_args()

  # Check arg count
  narg_max = 0
  if opts.program:
    if len(args) < 1:
      parser.error("argument missing: HEX file")
    narg_max = 2
  elif opts.check:
    if len(args) < 1:
      parser.error("argument missing: HEX file")
    narg_max = 1
  if len(args) > narg_max:
    parser.error("extra argument")

  # Connect to serial line and setup stdin/out
  conn = BasicSerial(opts.port, opts.baudrate)

  # not in terminal mode, just run bootloader 
  if opts.terminal == False :
    startBootloader()
  else:

    uio = BasicUIO()

    # Main loop
    while 1:

      # wait for data in either stdin or serial line
      rds,_,_ = select.select([conn.fd,sys.stdin],[],[])

      # select was trigged by the serial line
      # transfer bytes to stdout
      if conn.fd in rds :
        buffer = conn.read(1024)
        os.write(sys.stdout.fileno(), buffer)

      # select was trigged by stdin
      # transfer bytes to serial line
      if sys.stdin in rds:
        buffer = os.read(sys.stdin.fileno(), 1)
        
        # bring up menu
        if buffer == "^":
          r = uio.showMenu(opts)

          if r == 0:
            break
          elif r == 1:
            
            # switch to special color
            uio.setColorSpecial()

            startBootloader()

            # switch back to normal color
            uio.setColorNormal()

        else:
          conn.write(buffer)
    
    # Final cleanup
    uio.restoreLocalTermios()

