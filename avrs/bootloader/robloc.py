#!/usr/bin/env python

import re, sys
import struct


def load_hex(f):
  """Parse an HEX file to a list of data chunks.
  f is a file object or a filename.

  Return a list of (address, data) pairs.
  """
  if isinstance(f, basestring):
    f = open(f, 'rb')

  ret = []
  addr, data = 0, ''  # current chunk
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
    if len(fields['data']) != 2*fields['bytecount']:
      raise ValueError("invalid byte count")

    rt = fields['recordtype']
    if rt == 0:
      newaddr = fields['address'] + offset
      if newaddr < addr+len(data):
        raise ValueError("backward address jump")
      if newaddr > addr+len(data):
        # gap: store previous chunk
        if data:
          ret.append( (addr, data) )
        addr, data = newaddr, ''
      d = fields['data']
      data += ''.join(
          chr(int(d[i:i+2],16))
          for i in range(0,len(d),2)
          )
    elif rt == 1:
      break # EOF
    elif rt == 2:
      if fields['bytecount'] != 2:
        raise ValueError("invalid extended segment address record")
      offset = int(fields['data'],16) << 4
    else:
      raise ValueError("invalid HEX record type: %s" % rt)
  # last chunk
  if data:
    ret.append( (addr, data) )
  return ret

def split_hex_chunks(chunks, size, fill):
  """Split and pad a list of data chunks.
  chunks and return value are lists of (address, data) pairs.
  """
  if not len(chunks):
    return []
  ret = []
  paddr, pdata = 0, ''

  for addr,data in chunks:
    if addr < paddr+size:
      # pad previous page
      pdata = pdata.ljust(addr-paddr, fill)
      # append new data to previous page
      n = size - len(pdata)
      pdata += data[:n]
      if len(pdata) < size:
        continue  # page still incomplete
      # start new page
      ret.append( (paddr, pdata) )
      paddr, pdata, addr, data = addr+n, '', addr+n, data[n:]
    else:
      # pad and push previous page
      if pdata:
        pdata = pdata.ljust(size, fill)
        ret.append( (paddr, pdata) )
      # start new page, align new data
      n = addr % size
      paddr, pdata = addr-n, fill*n+data

    # push full pages
    while len(data) > size:
      ret.append( (addr, data[:size]) )
      addr, data = addr+size, data[size:]
    paddr, pdata = addr, data
  # last page
  if pdata:
    pdata = pdata.ljust(size, fill)
    ret.append( (paddr, pdata) )
  return ret



class RobloClient:
  """
  Low-level Client for the Rob'Otter Bootloader.
    
  Command methods should not split send/recv into several calls to
  send_raw()/recv_raw(). This would be inefficient for the I2C client wrapper
  since each call produces a distinct frame.

  """

  STATUS_NONE             = 0x00
  STATUS_SUCCESS          = 0x01
  STATUS_BOOTLOADER_MSG   = 0x0a
  STATUS_I2C_WAIT_FRAME   = 0x20
  STATUS_I2C_READ         = 0x21
  STATUS_FAILURE          = 0xff
  STATUS_UNKNOWN_COMMAND  = 0x81
  STATUS_NOT_SUPPORTED    = 0x82
  STATUS_BAD_FORMAT       = 0x83
  STATUS_BAD_VALUE        = 0x84
  STATUS_CRC_MISMATCH     = 0x90
  STATUS_I2C_ERROR        = 0xa0
  STATUS_I2C_BAD_FRAME    = 0xa1


  def __init__(self, conn):
    """Initialize the client.

    conn is an UART connection object with the following requirements:
     - it must be blocking
     - write() and read(1) must be implemented

    Note: methods assume that their are no pending data in the input queue
    before sending a command. Otherwise, read responses will not match.

    """
    self.conn = conn


  # Data transmission

  def send_raw(self, buf):
    """Send raw data to the server."""
    self.conn.write(buf)
    self.output_write(buf)

  def recv_raw(self, n):
    """Receive raw data from the server."""
    buf = ''
    for i in range(n):
      buf += self.conn.read(1)
    self.output_read(buf)
    return buf

  def send_cmd(self, cmd, fmt='', *args):
    """Send a command, return a RoblosReply object.
    cmd is either a byte value or a single character string.
    If args is not empty, fmt and args are parameters for struct.pack (without
    byte order indication).
    Otherwise, fmt is the command string to send.
    """
    if not isinstance(cmd, basestring):
      cmd = chr(cmd)
    else:
      ord(cmd) # check the value
    if len(args):
      data = struct.pack('<'+fmt, *args)
    else:
      data = fmt
    self.send_raw(cmd + data)
    return self.recv_reply()

  def recv_reply(self):
    """Read a reply.
    Leading null bytes are skipped;
    See RoblosReply for the meaning of fmt.
    Return a RoblosReply object.
    """
    while True:
      size = ord(self.recv_raw(1))
      if size != 0:
        break
    return RoblosReply(self.recv_raw(size))


  # Commands

  def cmd_mirror(self, v):
    """Ping/pong command.
    Return True if the same byte was read in the reply, False otherwise.
    """
    r = self.send_cmd('m', 'B', v)
    if not r:
      return False
    return r.unpack('B')[0] == v

  def cmd_infos(self):
    """Retrieve server infos.
    Return a the tuple (ROID, pagesize, features, commands) or False on error.
    """
    r = self.send_cmd('i')
    if not r:
      return False
    roid, pagesize = r.unpack('BH')
    features = r.unpack_sz()
    commands = r.unpack_sz()
    return roid, pagesize, features, commands

  def cmd_fuse_read(self):
    """Read fuses.
    Return a tuple with low, high and extended fuse bytes or False on error.
    """
    r = self.send_cmd('f')
    if not r:
      return False
    return r.unpack('3B')

  def cmd_prog_page(self, addr, buf, crc=0):
    """Program a page.
    Return True on success, False on error and None on crc mismatch.
    """
    r = self.send_cmd('p', 'IH%ds'%len(buf), addr, crc, buf)
    if r.status == self.STATUS_CRC_MISMATCH:
      return None
    if not r:
      return False
    return True

  def cmd_mem_crc(self, start, size):
    """Compute the CRC of a given memory range.
    Return the computed CRC or False on error.
    """
    r = self.send_cmd('c', 'II', start, size)
    if not r:
      return False
    return r.unpack('H')[0]

  def cmd_execute(self):
    """Run the application.
    Return True on success, False otherwise.
    """
    r = self.send_cmd('x')
    if not r:
      return False
    return True

  def cmd_copy_pages(self, dest, src, n):
    """Copy pages of flash from an address to another.
    dest and src are 32-bit addresses, however restrictions apply on
    parameters. See roblos.c for details.
    The command returns before actually doing the copy: one should wait for a
    reset to make sure pages have been copied.
    Return True on success, False otherwise.
    """
    r = self.send_cmd('y', 'IIB', dest, src, n)
    if not r:
      return False
    return True

  def cmd_i2c_recv(self, addr, size=None):
    """Receive data from an I2C slave.
    If size is None or 0, it is read from the first data byte.
    This is used to read protocol replies from the slave.

    Return received data on success, False on error.
    """
    if size is None:
      size = 0
    r = self.send_cmd('<', 'BB', addr, size)
    if not r:
      return False
    return r.data

  def cmd_i2c_send(self, addr, data):
    """Send data to an I2C slave.
    Return True on success, False otherwise.
    """
    r = self.send_cmd('>', 'BH%ds'%(len(data)), addr, len(data), data)
    if not r:
      return False
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


class RoblosReply:
  """Parse a server reply into an object.

  This is a very simple object which only sets some attributes.

  Attributes:
    status -- reply status, as an int
    fields -- list of parsed fields
    data -- unparsed field data
    raw -- raw copy of the reply

  The reponse evaluates to True if it as a non-error status.

  """

  def __init__(self, s):
    self.raw = s
    self.status = ord(s[0])
    self.data = s[1:]
    self.fields = []

  def unpack(self, fmt):
    """Unpack data using a format string.
    fmt is a string as used by struct.unpack but without byte order
    indication.
    Unpacked fields are appended to the fields attribute and returned.
    """
    fmt = '<'+fmt  # little-endian
    n = struct.calcsize(fmt)
    l = struct.unpack(fmt, self.data[:n])
    self.fields += l
    self.data = self.data[n:]
    return l

  def unpack_sz(self):
    """Unpack a NUL-terminated string.
    The unpacked string is appended to the fields attribute and returned.
    """
    try:
      i = self.data.index('\0')
    except ValueError:
      raise ValueError("NUL byte not found")
    s = self.data[:i]
    self.fields.append(s)
    self.data = self.data[i+1:]
    return s

  def __nonzero__(self):
    return 1 if self.status < 0x80 else 0
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
    features -- supported features (as a string)
    commands -- supported commands (as a string)
    roid -- server's Rob'Otter ID
    pagesize -- server's page size
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

    self.clear_infos()

  __sync_gen = None

  @classmethod
  def _sync_byte(cls):
    """Return a synchronization byte to use."""
    if cls.__sync_gen is None:
      def gen():
        vals = range(1,255)
        import random
        random.shuffle(vals)
        while True:
          for i in vals:
            yield i
      cls.__sync_gen = gen()
    return next(cls.__sync_gen)

  def synchronize(self):
    """Synchronize with the server to be ready to send a command."""
    #XXX current implementation is lazy
    # We wait for the expected reply to a mirror command.
    # On unexpected data, a new mirror command is sent.
    while True:
      # flush first
      if self._eof is not None:
        while not self._eof():
          self.recv_raw(1)
      # send a mirror command
      # don't use cmd_mirror() to control reply reading
      sync = chr(self._sync_byte())
      self.send_raw('m'+sync)
      if (self.recv_raw(1) == '\x02' and  # size
          self.recv_raw(1) == '\x01' and  # status
          self.recv_raw(1) == sync):
        break


  def program(self, fhex, fhex2=None):
    """Send a program to the device.

    Parameters:
      fhex -- HEX data to program
      fhex2 -- previous HEX data, to program changes

    See parse_hex() for accepted fhex/fhex2 values.
    See program_pages() for return values.

    """
    pages = self.parse_hex(fhex)
    if fhex2 is None:
      return self.program_pages(pages)
    pages2 = self.parse_hex(fhex2)
    return self.program_pages( self.diff_pages(pages, pages2) )


  def program_pages(self, pages):
    """Send a program to the device.

    Parameters:
      pages -- a list of pages to program

    pages is a list of (address, data) pairs. address has to be aligned to
    pagesize, data is padded if needed but size must not exceed page size.
    If pages is a single string, it will be cut in pages starting at address 0.

    Return True on success, None if nothing has been programmed.

    """

    self._assert_supported_cmd('p')

    page_count = len(pages)
    if page_count == 0:
      return None

    self.synchronize()
    for i, (addr, data) in enumerate(pages):
      self.output_program_progress(i+1, page_count)

      err_info = "at page %d/%d (0x%0x)" % (i+1, page_count, addr)
      data = data.ljust(self.pagesize, self.UNUSED_BYTE)
      assert addr%self.pagesize == 0, "page address not aligned %s" % err_info
      assert len(data) == self.pagesize, "invalid page size %s" % err_info

      if 'C' in self.features:
        crc = self.compute_crc(data)
      else:
        crc = 0  # cannot use CRC check
      n = self.CRC_RETRY
      while True:
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
    return True


  def program_bootloader(self, fhex, copy=True, check=True):
    """Reprogram the device's bootloader.

    Parameters:
      fhex -- HEX file (or filename or buffer) to program
      copy -- True to reprogram the roblocop page, False to ignore it, None if
              it is not in the HEX file
      check -- CRC-check programmed pages when possible

    If copy is not None, the roblocop page is retrieved from the last page of
    the HEX file.
    The bootloader is first programmed in the application part of the flash, as
    far as possible (before its final position, and in the lower 64KB for large
    devices) to avoid to overwrite the application.
    On error, the bootloader may need to be reprogrammed using an external
    programmer.

    Return True on success, None if no bootloader page has been programmed
    (roblocop may have been updated though).

    """

    self._assert_supported_cmd('y')
    if 'c' not in self.commands:
      check = False  # check not available
    pages = self.parse_hex(fhex)

    # reprogram roblocop if needed
    if copy is True:
      pages, cop_pages = pages[:-1], pages[-1:]
      self.output_program_roblocop()
      self.program_pages(cop_pages)
      if check and not self.check(cop_pages):
        raise RuntimeError("CRC mismatch for roblocop page")
    elif copy is False:
      # drop the roblocop page
      pages = pages[:-1]
    elif copy is not None:
      raise ValueError("copy")

    if len(pages) == 0:
      return None

    # get final and copy bootloader location
    dest_final = pages[0][0]
    size = pages[-1][0] - dest_final + self.pagesize
    dest_copy = min(dest_final, 0x10000) - size
    # shift data to copy
    pages = [ (i-dest_final+dest_copy, d) for i,d in pages ]
    # program the new bootloader at the start of the flash
    self.output_program_bootloader()
    self.program_pages(pages)
    if check and not self.check(pages):
      raise RuntimeError("CRC mismatch for bootloader pages")
    # copy bootloader to its final location
    self.output_copy_bootloader()
    ret = self.cmd_copy_pages(dest_final, dest_copy, size/self.pagesize)
    self.clear_infos()  # bootloader changed, info may have changed too
    if not ret:
      raise RuntimeError("bootloader page copy failed")
    self.synchronize()
    return True
    

  def check(self, fhex, fill=True):
    """Check the program on the device.

    Parameters:
      fhex -- HEX data to check (HEX file/filename or list of (addr, data))
      gap -- if True, gaps in checked data are filled with UNUSED_BYTE,
             otherwise several check commands are sent

    Return True if the CRC matches, False otherwise

    """

    self._assert_supported_cmd('c')

    # don't parse to pages: this may add unwanted padding
    if isinstance(fhex, (tuple, list)):
      chunks = fhex
    else:
      chunks = load_hex(fhex)
    if len(chunks) == 0:
      raise ValueError("empty HEX data")
    # merge chunks, fill gaps if needed
    chunks2 = []
    curaddr, curdata = 0, ''
    for addr,data in chunks:
      if addr < curaddr+len(curdata):
        raise ValueError("backward address jump")
      elif addr == curaddr:
        # merge
        curdata += data
      elif not curdata:
        # new chunk
        curaddr, curdata = addr, data
      elif fill:
        # fill gaps
        curdata += (addr-curaddr-len(curdata)) * self.UNUSED_BYTE + data
      else:
        # new chunk
        chunks2.append( (curaddr, curdata) )
        curaddr, curdata = addr, data
    # last chunk
    if curdata:
      chunks2.append( (curaddr, curdata) )

    self.synchronize()
    for addr,data in chunks2:
      r = self.cmd_mem_crc(addr, len(data))
      if r is False:
        raise RoblochonError("crc check failed")
      if r != self.compute_crc(data):
        return False
    return True


  def update_infos(self):
    """Get device infos, update associated attributes."""
    self.synchronize()
    r = self.cmd_infos()
    if not r:
      raise RoblochonError("cannot retrieve device info")
    self.roid, self.pagesize, self.features, self.commands = r
    return r

  def clear_infos(self):
    """Clear cached device infos."""
    self.features = None
    self.commands = None
    self.roid = None
    self.pagesize = None


  def read_fuses(self):
    """Read fuses.
    Return a tuple with low, high and extended fuse bytes.
    """
    self._assert_supported_cmd('f')
    self.synchronize()
    r = self.cmd_fuse_read()
    if r is False:
      raise RoblochonError("failed to read fuses")
    return r


  def boot(self):
    """Boot the device."""
    self._assert_supported_cmd('x')
    self.synchronize()
    r = self.cmd_execute()
    if r is False:
      raise RoblochonError("boot failed")
    return


  def slave(self, addr):
    """Return an I2C slave to connect to, as a RobloSlave."""
    self._assert_supported_cmd('<')
    self._assert_supported_cmd('>')
    return RobloSlave(self, addr, verbose=self.verbose)


  def parse_hex(self, fhex):
    """Parse an HEX file to a list of pages.
    Raise an exception if data is empty.
    If f is already a list of pages, return it unchanged.
    """
    if isinstance(fhex, (tuple, list)):
      pages = fhex
    else:
      data = load_hex(fhex)
      if self.pagesize is None:
        self.update_infos()
      pages = split_hex_chunks(data, self.pagesize, self.UNUSED_BYTE)
    if not len(pages):
      raise ValueError("empty HEX data")
    return pages

  @classmethod
  def diff_pages(cls, p1, p2):
    """Return the pages from p1 not in p2."""
    return sorted( set(p1) - set(p2) )


  def _assert_supported_cmd(self, c):
    if self.commands is None:
      self.update_infos()
    if c not in self.commands:
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

  def output_program_roblocop(self):
    sys.stdout.write("programming roblocop part\n")
  def output_program_bootloader(self):
    sys.stdout.write("programming bootloader part\n")
  def output_copy_bootloader(self):
    sys.stdout.write("copy bootloader to its final location\n")


class RobloSlave(Roblochon):
  """Wrapper for addressing I2C clients.
  
  Attributes:
    addr -- I2C address
    master -- master's Roblochon instance

  Note that send/recv and command methods assume that the master and (sometimes)
  the slave are synchronized.
  
  """

  def __init__(self, master, addr, **kw):
    if not 0x08 < addr <= 0x77:
      raise ValueError("invalid i2c slave address")
    self.master = master
    self.addr = addr
    self.verbose = kw.get('verbose', False)

  def send_raw(self, buf):
    # poll slave by sending an empty frame
    # required to avoid UART buffer overflow
    if self.master.cmd_i2c_send(self.addr, '') is False:
      raise RuntimeError("i2c send failed")
    if self.master.cmd_i2c_send(self.addr, buf) is False:
      raise RuntimeError("i2c send failed")
    self.output_write(buf)

  def recv_raw(self, n):
    buf = self.master.cmd_i2c_recv(self.addr, n)
    if buf is False:
      raise RuntimeError("i2c recv failed")
    self.output_read(buf)
    return buf

  def recv_reply(self):
    while True:
      buf = self.recv_raw(None)
      if buf[0] == 0:
        continue  # ignore empty replies
      if ord(buf[0]) != len(buf)-1:
        continue  #XXX ignore invalid sizes
      return RoblosReply(buf[1:])

  def synchronize(self):
    """Synchronize with master and slave."""
    self.master.synchronize()
    while True:
      # synchronize with a mirror command
      if self.cmd_mirror(self._sync_byte()) is True:
        break

  def output_read(self, data):
    if self.verbose:
      sys.stderr.write("robloc(0x%02x): << %r\n" % (self.addr, data))
  def output_write(self, data):
    if self.verbose:
      sys.stderr.write("robloc(0x%02x): >> %r\n" % (self.addr, data))


# Use the pySerial implementation as fallback
try:
  from basicserial import BasicSerial as Serial
except ImportError:
  try:
    from serial import Serial
  except ImportError:
    raise ImportError("no Serial implementation available")


if __name__ == '__main__':
  from optparse import OptionParser

  # default port, platform-dependant
  import os
  if os.name == 'nt':
    port_default = 'COM1'
  else:
    port_default = '/dev/ttyUSB0'

  parser = OptionParser(
      description="Rob'Otter Bootloader Client",
      usage="%prog [OPTIONS] [file.hex] [previous.hex]",
      )
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
  parser.add_option('--program-bootloader', dest='program_bootloader', metavar='HEX',
      help="program the bootloader")
  parser.add_option('--slave', dest='slave_addr', metavar='ADDR',
      help="I2C address of a slave to communicate with")
  parser.add_option('--roid', dest='roid',
      help="check device ROID before doing anything")
  parser.add_option('--init-send', dest='init_send',
      help="string to send at connection (eg. to reset the device)")
  parser.add_option('-P', '--port', dest='port',
      help="device port to used (default: %s)"%port_default)
  parser.add_option('-s', '--baudrate', dest='baudrate', type='int',
      help="baudrate (default: 38400)")
  parser.add_option('-v', '--verbose', dest='verbose', action='store_true',
      help="print transferred data on stderr")
  parser.set_defaults(
      program=False,
      check=False,
      boot=False,
      infos=False,
      fuses=False,
      program_bootloader=None,
      slave_addr=None,
      roid=None,
      init_send=None,
      port=port_default,
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
  conn = Serial(opts.port, opts.baudrate)

  master = Roblochon(conn, verbose=opts.verbose, init_send=opts.init_send)
  print "bootloader waiting..."
  master.synchronize()
  master.update_infos()

  if opts.slave_addr is not None:
    addr = int(opts.slave_addr, 0)
    client = master.slave(addr)
    client.update_infos()
  else:
    client = master

  if opts.roid is not None:
    assert opts.roid == client.roid, "ROID mismatch"

  if opts.infos:
    #TODO list of commands
    print "device infos :  ROID: 0x%02x, features: %s" % (client.roid, client.features)
  if opts.fuses:
    print "fuses (low high ex): %02x %02x %02x" % client.read_fuses()
  if opts.program_bootloader:
    print "programming bootloader..."
    client.program_bootloader(opts.program_bootloader)
  if opts.program:
    print "programming..."
    ret = client.program(args[0], args[1] if len(args)>1 else None)
    if ret is None:
      print "nothing to program"
  if opts.check:
    print "CRC check..."
    if client.check(args[0], False):
      print "CRC OK"
    else:
      print "CRC mismatch"
      opts.boot = False
  if opts.boot:
    print "boot"
    client.boot()


