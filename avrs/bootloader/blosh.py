#!/usr/bin/env python

import cmd, re, sys, os, select, termios, glob, subprocess, signal, StringIO
from robloc import Roblochon, RoblochonError

class Color:
  """Terminal color codes."""
  normal = "\033[0m"
  black = "\033[30m"
  red = "\033[31m"
  green = "\033[32m"
  yellow = "\033[33m"
  blue = "\033[34m"
  magenta = "\033[35m"
  cyan = "\033[36m"
  grey = "\033[37m"
  bold = "\033[1m"
  uline = "\033[4m"
  blink = "\033[5m"
  invert = "\033[7m"

class ColorTheme:
  def __getattr__(self, attr):
    if not attr.startswith('do_'):
      raise AttributeError("no attribute '%s'" % attr)
    style = attr[3:]
    if not hasattr(self, style):
      raise AttributeError("style '%s' not found" % style)
    style = getattr(self, style)
    fmt = style+'%s'+Color.normal
    def do_style(s):
      return fmt % s
    return do_style
  def fmt(self, s):
    s = s.replace('%', '%%')
    s = re.subn(r'\{(\w+)\}', r'%(\1)s', s)[0] % self.__class__.__dict__
    return s.replace('{}', Color.normal)

class DefaultTheme(ColorTheme):
  bold = Color.bold
  prompt = Color.bold+Color.blue
  warn = Color.yellow+Color.bold
  error = Color.red+Color.bold
  arg = Color.normal+Color.bold
  match = Color.green+Color.bold
  notice = Color.green+Color.bold
  help_cmd = Color.normal+Color.bold
  help_brief = Color.normal
  info = Color.normal+Color.magenta
  data_in = Color.normal
  data_out = Color.normal+Color.cyan

class NoColorTheme(ColorTheme):
  def __getattr__(self, attr):
    if not attr.startswith('do_'):
      return ''
    return lambda s: s
  def fmt(self, s):
    return re.subn(r'\{(\w*)\}', '', s)[0]


# Option values

class ShellOption:
  def __init__(self, default):
    self.set(default)
    self.default = self.val
  def set(self, val):
    self.val = val
  def __str__(self):
    return str(self.val)
  def reset(self):
    self.val = self.default
  def __nonzero__(self):
    return True if self.val else False

class ShellOptBool(ShellOption):
  def set(self, val):
    if val is None:
      self.reset()
    elif val is True:
      self.val = True
    elif val is False or val == '':
      self.val = False
    elif val == '!':
      self.val = not self.val
    else:
      v = val[0].lower()
      if v in '1tyo':
        self.val = True
      elif v in '0fn':
        self.val = False
      else:
        raise ValueError(val)
  def __str__(self):
    return 'true' if self.val else 'false'

class ShellOptStr(ShellOption):
  def __str__(self):
    return repr(self.val) if self.val else 'none'

class ShellOptInt(ShellOption):
  def set(self, val):
    if type(val) == int:
      self.val = val
    else:
      self.val = int(str(val), 0)

def ShellOptEnum(*opt_choices):
  class cls(ShellOption):
    choices = tuple( x.upper() for x in opt_choices )
    def set(self, val):
      v = val.upper()
      if v not in self.choices:
        raise ValueError(val)
      self.val = v
  return cls

class ShellOptKey(ShellOption):
  def set(self, val):
    if val in (None, '', 'None', '-1'):
      self.val = None
      return
    try:
      self.val = chr(int(val, 0))
      return
    except:
      pass
    if len(val) == 1:
      self.val = val
      return
    elif val[0] == '^' and len(val) == 2:
      c = val[1].upper()
      if ord(c)-ord('@') < 0x20:
        self.val = chr(ord(c)-ord('@'))
        return
    raise ValueError(val)
  def __str__(self):
    try:
      return { None:'none', '\r':r'\r', '\n':r'\n', '\t':r'\t', ' ':"' '" }[self.val]
    except:
      pass
    if ord(self.val) < 0x20:
      return '^%c'%(ord(self.val)+ord('@'))
    return self.val


class Blosh(cmd.Cmd):
  """Shell-like client for the Rob'Otter bootloader.

  Attributes:
    conn -- serial connection (shared with Roblochon)
    opts -- shell options
    theme -- color theme
    bl -- Roblochon instance (initialized at first use)
    bl_mode -- True if bootloader active
    last_hex -- last uploaded HEX data

  """

  _option_list = {
      'reset_str': (ShellOptStr, None, "string to reset the device"),
      'hexa': (ShellOptBool, False, "hexadecimal output in terminal mode"),
      'hexa_len': (ShellOptInt, 16, "line length (in bytes) for hexa output"),
      'echo': (ShellOptBool, False, "display send data in terminal mode"),
      'eol': (ShellOptEnum('CR','LF','CRLF'), 'CRLF', "[CR|LF|CRLF], EOL of outgoing data from stdin"),
      'tkey_quit': (ShellOptKey, '^', "key to quit in terminal mode"),
      'tkey_reset': (ShellOptKey, '^R', "key to reset in terminal mode"),
      'tkey_prog': (ShellOptKey, '^P', "key to (re)program in terminal mode"),
      'log_file': (ShellOptStr, None, "current log file (see 'log' command)"),
      'filter_cmd': (ShellOptStr, None, "filtering program (see 'filter' command)"),
      'feed_cmd': (ShellOptStr, None, "feeding program (see 'feed' command)"),
      'prog_file': (ShellOptStr, None, "programmed binary file (see 'programm' command)"),
      'prog_check': (ShellOptBool, False, "check programmed pages"),
      'auto_boot': (ShellOptBool, True, "boot (if needed) when entering terminal mode"),
      }

  _help_topics = {
      'quit': "quit the interactive shell",
      'shell': ('!<cmd>', "run a shell command"),
      'reset': ('r[eset]', "reset the device by sending the reset string or boot"),
      'set': ('set [opt [value]]', "list, set or unset shell options",
        "Option list:"+''.join('\n  %-12s  %s'%(k, v[2]) for k,v in _option_list.items())
        ),
      'terminal': ('t[erminal]', "enter terminal mode"),
      'source': ('source <file>', "load commands from a file"),
      'log': ('log [file]', "set or unset log file", """This command is an alias for 'set filter_cmd'."""),
      'filter': ('filter [cmd]', "set or unset a filter on incoming data", """Data received from the device is send to the filter command. Its output is displayed, stderr data is displayed in a different color.\nTerminal mode is aborted if the process returned a not null code.\nIf hexa output is enabled, no filtering is applied.\nThis command is an alias for 'set filter_cmd'."""),
      'feed': ('feed [cmd]', "set or unset a command providing outgoing data", """Data received from stdin is send to the feeder command. Its output is then sent to the device. stderr data is displayed in a different color.\nTerminal mode is aborted if the process returned a not null code.\neol and tkey_quit are applied before sending data to the feeder; tkey_reset is ignored. If hexa output or echo are enabled, they use data returned by the feeder.\nThis command is an alias for 'set feed_cmd'."""),
      'program': ('p[rogram][!] [file.hex]', "program the device", """The given file, or the previous one if none is provided, is uploaded on the device. Without '!', only differences with the previous binary are sent."""),
      'check': ('check [file.hex]', "check uploaded program"),
      'boot': "boot the device (if bootloader is active)",
      'infos': "display device infos and value of fuse bytes",
      }

  _cmd_aliases = {
      'r': 'reset',
      't': 'terminal',
      'p': 'program',
      }


  # strings matched agains input data and displayed messages
  _matches = {
      '\r\nboot\r\n': 'reboot',
      }


  class BlClient(Roblochon):
    """Redefine some Roblochon methods for internal purposes."""
    def output_program_progress(self, ncur, nmax):
      sys.stdout.write(
          self.theme.fmt("\r{info}programming: {bold}page %3d / %3d{info} -- {bold}%2.2f%%{}")
          % (ncur, nmax, (100.0*ncur)/nmax))
      sys.stdout.flush()
    def output_program_end(self):
      sys.stdout.write("\n")


  def __init__(self, conn, color=True):
    cmd.Cmd.__init__(self)

    if color:
      self.theme = DefaultTheme()
    else:
      self.theme = NoColorTheme()
    self.prompt = self.theme.do_prompt('>> ')
    self.intro = ''
    self.use_rawinput = True

    self.conn = conn
    self.opts = dict( (k, v[0](v[1])) for k,v in self._option_list.items() )
    self.bl = None
    self.bl_mode = None
    self.last_hex = None


  def bl_enter(self):
    """Enter bootloader mode.
    Return True on success, None if bootloader was already active.
    """
    if self.bl_mode: return None
    if self.opts['reset_str']:
      print self.theme.fmt('{info}sending {bold}reset{info} string{}')
      self.conn.write(self.opts['reset_str'].val)
    print self.theme.fmt('{info}{bold}waiting{info} for bootloader...{}')

    if self.bl is None:
      self.bl = self.BlClient(self.conn)
      self.bl.theme = self.theme
    self.bl.wait_prompt(True)
    self.bl_mode = True
    return True

  def bl_exit(self):
    """Exit bootloader mode.
    Return True on success, None if bootloader was already active.
    If bootloader state is not known, first enter then exit.
    """
    if not self.bl:
      self.bl_enter()
    if not self.bl_mode: return None
    self.bl_mode = False
    try:
      print self.theme.fmt('{info}{bold}exiting{info} bootloader{}')
      self.bl.boot()
    except Error, e:
      print self.theme.do_error('failed to boot: %s' % e)
      return False
    return True


  def terminal_mode(self):
    """Enter terminal mode."""

    if self.bl_mode and self.opts['auto_boot']:
      self.bl_exit()

    if self.opts['reset_str']:
      tkey_reset = self.opts['tkey_reset'].val
    else:
      tkey_reset = None
    if self.opts['prog_file']:
      tkey_prog = self.opts['tkey_prog'].val
    else:
      tkey_prog = None

    tkey_quit = self.opts['tkey_quit'].val
    if tkey_quit in '\r\n':
      print self.theme.do_error('using CR or LF for tkey_quit is not safe')
      return
    print self.theme.fmt('{info}entering teminal mode, {bold}%s{info} to quit{}') % self.opts['tkey_quit']

    l = filter(None, (tkey_reset, tkey_prog, tkey_quit))
    if len(l) != len(set(l)):
      print self.theme.do_error('several tkey_* share the same value')
      return

    crlf = {'CR':'\r','LF':'\n','CRLF':'\r\n'}[self.opts['eol'].val]

    printers_in = []
    printers_out = []
    pfilter, pfeed = None, None
    def print_in(s):
      for p in printers_in: p(s)
    def print_out(s):
      for p in printers_out: p(s)

    pin_default = lambda s: sys.stdout.write(s)
    if self.opts['echo']:
      pout_default = lambda s: sys.stdout.write(self.theme.do_data_out(s))
    else:
      pout_default = lambda s: None

    flog = None
    if self.opts['log_file']:
      s = self.opts['log_file'].val
      try:
        flog = open(s, 'w')
        print self.theme.fmt('{info}logging to {bold}%s{info}') % s
      except Exception, e:
        print self.theme.fmt('{error}cannot open log file {arg}%s{error}: %s{}') % (s,e)
        return
      printers_in.append(lambda s: flog.write(s))

    if self.opts['hexa']:
      # number of written data bytes on the current line (>0: out, <0: in)
      hexaline_len = [0] # in a list to keep a reference
      hexa_len = self.opts['hexa_len'].val
      def pin_hexa(s):
        n, = hexaline_len
        for c in s:
          if n >= 0 or n <= -hexa_len:
            if n != 0: sys.stdout.write('\r\n')
            sys.stdout.write(self.theme.fmt('{data_in}{bold} <-- {data_in}'))
            n = 0
          sys.stdout.write(' %02x' % ord(c))
          n -= 1
        hexaline_len[0] = n
      def pout_hexa(s):
        n, = hexaline_len
        for c in s:
          if n <= 0 or n >= hexa_len:
            if n != 0: sys.stdout.write('\r\n')
            sys.stdout.write(self.theme.fmt('{data_out}{bold} --> {data_out}'))
            n = 0
          sys.stdout.write(' %02x' % ord(c))
          n += 1
        hexaline_len[0] = n
      printers_in.append(pin_hexa)
      printers_out.append(pout_hexa)

    elif self.opts['filter_cmd']:
      s = self.opts['filter_cmd'].val
      try:
        pfilter = subprocess.Popen(s, shell=True, bufsize=0, close_fds=True,
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        print self.theme.fmt('{info}filtering with {bold}%s{}') % s
      except Exception, e:
        print self.theme.fmt('{error}failed to run filter command {arg}%s{error}: %s') % (s,e)
        return
      def pin_filter(s):
        if pfilter and pfilter.poll() is None:
          pfilter.stdin.write(s)
        else:
          pin_default(s)
      printers_in.append(pin_filter)

    if self.opts['feed_cmd']:
      tkey_reset = None
      s = self.opts['feed_cmd'].val
      try:
        pfeed = subprocess.Popen(s, shell=True, bufsize=0, close_fds=True,
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        print self.theme.fmt('{info}feeding with {bold}%s{}') % s
      except Exception, e:
        print self.theme.fmt('{error}failed to run feed command {arg}%s{error}: %s') % (s,e)
        return

    if not printers_in: printers_in.append(pin_default)
    if not printers_out: printers_out.append(pout_default)

    match_data = ''  # last input data, for matching
    match_data_len = max( len(k) for k in self._matches )

    self.conn.flushInput()

    # the loop
    tio_attr_bak = termios.tcgetattr(sys.stdin)
    tio_attr = termios.tcgetattr(sys.stdin)
    tio_attr[0] = tio_attr[0] | termios.ICRNL
    tio_attr[3] = 0
    termios.tcsetattr(sys.stdin, termios.TCSAFLUSH, tio_attr)
    try:
      while True:
        fds = [self.conn.fd, sys.stdin]
        if pfilter:
          fds += (pfilter.stdout, pfilter.stderr)
        if pfeed:
          fds += (pfeed.stdout, pfeed.stderr)
        rds,_,_ = select.select(fds,[],[])


        # child processes: process return and last data

        if pfilter and pfilter.poll() is not None:
          sys.stdout.write(pfilter.stdout.read())
          sys.stdout.write(self.theme.do_warn(pfilter.stderr.read()))
          sys.stdout.write(self.theme.do_notice('\r\nfilter returned %d\r\n'%pfilter.returncode))
          if pfilter.returncode != 0: break
          pfilter = None

        if pfeed and pfeed.poll() is not None:
          s = pfeed.stdout.read()
          self.conn.write(s)
          print_out(s)
          sys.stdout.write(self.theme.do_warn(pfeed.stderr.read()))
          sys.stdout.write(self.theme.do_notice('\r\nfeeder returned %d\r\n'%pfeed.returncode))
          if pfeed.returncode != 0: break
          pfeed = None

        # process 'selected' fds

        if self.conn.fd in rds:
          c = self.conn.read(1)
          print_in(c)
          match_data += c
          for k in self._matches:
            if match_data.endswith(k):
              sys.stdout.write(self.theme.do_match('\r\n%s\r\n'%self._matches[k]))
            try: hexaline_len[0] = 0
            except: pass
          match_data = match_data[-match_data_len:]

        if sys.stdin in rds:
          c = sys.stdin.read(1)
          if c == tkey_quit: break
          if c == tkey_reset: c = self.opts['reset_str'].val
          if c == tkey_prog:
            sys.stdout.write('\r\n')
            self.reprogram()
            self.bl_exit()
          if c == '\n': c = crlf
          if pfeed:
            pfeed.stdin.write(c)
          else:
            self.conn.write(c)
            print_out(c)

        if pfilter:
          if pfilter.stdout in rds:
            sys.stdout.write(pfilter.stdout.read(1))
          if pfilter.stderr in rds:
            sys.stdout.write(self.theme.do_warn(pfilter.stderr.read(1)))

        if pfeed:
          if pfeed.stdout in rds:
            c = pfeed.stdout.read(1)
            self.conn.write(c)
            print_out(c)
          if pfeed.stderr in rds:
            sys.stdout.write(self.theme.do_warn(pfeed.stderr.read(1)))

        sys.stdout.flush()
    finally:
      termios.tcsetattr(sys.stdin, termios.TCSAFLUSH, tio_attr_bak)
      if pfilter is not None and pfilter.poll() is None:
        os.kill(pfilter.pid, signal.SIGKILL)
      if pfeed is not None and pfeed.poll() is None:
        os.kill(pfeed.pid, signal.SIGKILL)
      if flog:
        flog.close()
    self.stdout.write('\n'+Color.normal)

  def reprogram(self):
    """(Re)program the current prog_file."""
    f = self.opts['prog_file'].val
    if not f:
      print self.theme.do_error("no file to upload")
      return
    self.bl_enter()
    try:
      data = self.bl.parse_hex_file(f)
    except Exception, e:
      print self.theme.fmt('{error}cannot parse HEX file {arg}%s{error}: %s{}') % (f,e)
      return

    try:
      if self.bl.program(data, self.last_hex, self.opts['prog_check'].val) is None:
        print self.theme.do_info("nothing to program")
      self.last_hex = data
    except Exception, e:
      print self.theme.do_error('failed to program: %s' % e)


  def do_quit(self, line):
    return True
  def do_EOF(self, line):
    print '' # extra newline
    return True

  def emptyline(self):
    pass

  def precmd(self, line):
    if len(line) == 1 or (len(line) > 1 and line[1] not in self.identchars):
      try:
        return self._cmd_aliases[line[0]] + line[1:]
      except:
        pass
    return line


  def default(self, line):
    if line[0] == '#': return  # ignore comments
    print self.theme.fmt('{error}unknown command: {arg}%s{}')%line.split()[0]

  def do_shell(self, line):
    os.system(line)

  def do_terminal(self, line):
    self.terminal_mode()

  def do_reset(self, line):
    if self.bl_mode:
      self.bl_exit()
    elif self.opts['reset_str']:
      print self.theme.fmt('{info}sending {bold}reset{info} string{}')
      self.conn.write(self.opts['reset_str'].val)
    else:
      print self.theme.fmt("{arg}reset_str{error} option is not set{}")

  def do_set(self, line):
    l = line.split(None, 1)
    if len(l) < 1:
      print "Option values:"
      l = self._option_list.keys()
      l.sort()
      for k in l:
        print "  %-12s  %s" % (k, self.opts[k])
    else:
      k = l[0]
      try:
        opt = self.opts[k]
      except KeyError:
        print self.theme.fmt('{error}unknown option: {arg}%s{}')%k
        return
      if len(l) < 2:
        opt.reset()
      else:
        try:
          opt.set(l[1])
        except ValueError, e:
          print self.theme.fmt('{error}invalid option value: {arg}%s{}')%e

  def do_source(self, line):
    if not line:
      print self.theme.do_error('no file given')
      return
    try:
      f = open(line, 'r')
    except:
      print self.theme.fmt('{error}failed to open {arg}%s{}')%line
      return
    self.execute(f)

  def execute(self, f):
    """Execute a file or a string."""
    if type(f) is str:
      f = f.strip()+'\n'
      f = StringIO.StringIO(f)
    bak = self.prompt, self.use_rawinput, self.stdin
    self.prompt = ''
    self.use_rawinput = False
    self.stdin = f
    try:
      self.cmdloop('')
    finally:
      self.prompt, self.use_rawinput, self.stdin = bak


  def do_log(self, line):
    return self.do_set('log_file %s' %line)
  def do_filter(self, line):
    return self.do_set('filter_cmd %s' %line)
  def do_feed(self, line):
    return self.do_set('feed_cmd %s' %line)


  def do_program(self, line):
    if len(line) and line[0] == '!':
      self.last_hex = None
      line = line.lstrip('! \t')
    else:
      force = False
    if line:
      self.opts['prog_file'].set(line)
    self.reprogram()

  def do_check(self, line):
    if line:
      f = line
    else:
      f = self.opts['prog_file'].val
    if not f:
      print self.theme.do_error("no file to check")
      return
    self.bl_enter()
    try:
      ret = self.bl.check(f)
      print self.theme.fmt('check: {bold}%s{}') % (
        Color.green+'OK' if ret else Color.red+'FAILED'
        )
    except Exception, e:
      print self.theme.do_error('failed to check: %s' % e)

  def do_boot(self, line):
    self.bl_exit()

  def do_infos(self, line):
    self.bl_enter()
    print self.theme.fmt('{bold}ROID:{} 0x%02x (%d)   {bold}commands:{} %s') % (
        self.bl.roid, self.bl.roid, self.bl.cmds )
    try:
      fuses = self.bl.read_fuses()
      print self.theme.fmt('{bold}fuses (low high ex):{} %02x %02x %02x') % fuses
    except Exception, e:
      self.theme.do_error('cannot read fuses: %s' % e)


  # completion

  def complete_set(self, text, line, begidx, endidx):
    return [x for x in self.opts if x.startswith(text)]

  def _complete_file(self, text, line, begidx, endidx):
    i = line.rfind(' ', 0, endidx)
    if i == -1:
      i = begidx-1
    path = line[i+1:endidx]
    n = len(path)-len(text)
    return [x[n:] for x in glob.glob('%s*'%path) if x.startswith(path)]

  complete_source = _complete_file
  complete_log = _complete_file
  complete_filter = _complete_file
  complete_feed = _complete_file
  complete_program = _complete_file
  complete_check = _complete_file

  def complete_help(self, text, line, begidx, endidx):
    return [x for x in self._help_topics if x.startswith(text)]


  # help

  def do_help(self, line):
    line = line.strip()
    if line:
      try:
        cmd, brief, desc = self._help_topics[line]
        print self.theme.fmt('{help_cmd}%s{help_brief} -- %s')%(cmd,brief)
        if desc:
          desc = re.subn(r'(.{1,76}\S)(?:\n|\s+|$)', r'\1\n', desc)[0]
          print '  '+ desc.rstrip().replace('\n', '\n  ')
      except KeyError:
        print self.theme.fmt('{error}no help on {arg}%s')%line
    else:
      print "Help topics:"
      it = self._help_topics.items()
      it.sort()
      for k,v in it:
        print "  %-10s  %s" % (k,v[1])

  # arrange _help_topics to have (cmd, brief, desc) values
  d = {}
  for k,v in _help_topics.items():
    if type(v) is tuple:
      v = list(v)
    elif type(v) is not list:
      v = [v]
    if type(v) is not list:
      v = list(v)
    if len(v) == 1:
      v = [k, v[0], None]
    elif len(v) == 2:
      v = [v[0], v[1], None]
    if v[0] is None: v[0] = k
    if v[2]: v[2] = v[2].strip()
    d[k] = tuple(v)
  _help_topics.update(d)
  del d


if __name__ == '__main__':
  from optparse import OptionParser
  from robloc import BasicSerial as Serial

  parser = OptionParser(
      description="blosh -- a shell-like client for the Rob'Otter bootloader",
      usage="%prog [OPTIONS] [FILE]",
      )
  parser.add_option('-P', '--port', dest='port',
      help="device port to use (default: /dev/ttyUSB0)")
  parser.add_option('-s', '--baudrate', dest='baudrate',
      help="baudrate (default: 38400)")
  parser.add_option('-c', '--command', dest='command',
      help="command to execute")
  parser.add_option('-t', '--terminal', dest='terminal', action='store_true',
      help="start in terminal mode")
  parser.set_defaults(
      port='/dev/ttyUSB0',
      baudrate=38400,
      command=None,
      terminal=False,
      )
  (opts, args) = parser.parse_args()

  # Check arg count
  if len(args) > 1:
    parser.error("extra argument")

  conn = Serial(opts.port, opts.baudrate)
  cmd = Blosh(conn)
  if len(args) > 0:
    cmd.execute(open(args[0]))
  if opts.command:
    cmd.execute(opts.command)
  if opts.terminal:
    cmd.execute('terminal')
  else:
    cmd.cmdloop()

