#!/usr/bin/env python

import cmd, re, sys, os, select, glob, subprocess, signal, StringIO
from robloc import Roblochon
try:
  import termios
except ImportError:
  termios = None


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
  ok = Color.green+Color.bold
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
    if type(val) is int:
      self.val = val
    else:
      self.val = int(str(val), 0)

def ShellOptEnum(*opt_choices):
  class cls(ShellOption):
    choices = set( x.upper() for x in opt_choices )
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
    ctx -- current context
    contexts -- dictionary of contexts
    cmd_aliases -- dictionary of command aliases
    theme -- color theme
    out_write -- method to write on output

  """

  _option_list = {
      'reset_str': (ShellOptStr, None, "string to reset the device"),
      'hexa': (ShellOptBool, False, "hexadecimal output in terminal mode"),
      'hexa_len': (ShellOptInt, 16, "line length (in bytes) for hexa output"),
      'echo': (ShellOptBool, False, "display sent data in terminal mode"),
      'eol': (ShellOptEnum('CR','LF','CRLF'), 'CRLF', "[CR|LF|CRLF], EOL of outgoing data from stdin"),
      'switch_way_eol': (ShellOptBool, True, "force an EOL when switching between send and received data"),
      'tkey_quit': (ShellOptKey, '^', "key to quit in terminal mode"),
      'tkey_reset': (ShellOptKey, '^R', "key to reset in terminal mode"),
      'tkey_prog': (ShellOptKey, '^P', "key to (re)program in terminal mode"),
      'log_file': (ShellOptStr, None, "current log file (see 'log' command)"),
      'filter_cmd': (ShellOptStr, None, "filtering program (see 'filter' command)"),
      'feed_cmd': (ShellOptStr, None, "feeding program (see 'feed' command)"),
      'prog_file': (ShellOptStr, None, "programmed binary file (see 'programm' command)"),
      'auto_boot': (ShellOptBool, True, "boot (if needed) when entering terminal mode"),
      'check_roid': (ShellOptInt, -1, "excepted ROID, checked before programming/checking (-1 to ignore)"),
      }

  _help_topics = {
      'quit': "quit the interactive shell",
      'shell': ('!<cmd>', "run a shell command"),
      'reset': ('r[eset]', "reset the device by sending the reset string or boot"),
      'set': ('set [opt [value]]', "list, set or unset shell options",
        "Option list:"+''.join('\n  %-14s  %s'%(k, v[2]) for k,v in _option_list.items())
        ),
      'alias': ('set [name [commmand]]', "list, set or unset command aliases", """Alias names are replaced by the associated command, then processed as usual. Alias matching is recursive and alias names may shadow built-in command names. Aliases names are not commpleted."""),
      'terminal': ('t[erminal]', "enter terminal mode"),
      'source': ('source <file>', "load commands from a file"),
      'log': ('log [file]', "set or unset log file", """This command is an alias for 'set filter_cmd'."""),
      'filter': ('filter [cmd]', "set or unset a filter on incoming data", """Data received from the device is send to the filter command. Its output is displayed, stderr data is displayed in a different color.\nTerminal mode is aborted if the process returned a not null code.\nIf hexa output is enabled, no filtering is applied.\nThis command is an alias for 'set filter_cmd'."""),
      'feed': ('feed [cmd]', "set or unset a command providing outgoing data", """Data received from stdin is send to the feeder command. Its output is then sent to the device. stderr data is displayed in a different color.\nTerminal mode is aborted if the process returned a not null code.\neol and tkey_quit are applied before sending data to the feeder; tkey_reset and switch_way_eol are ignored. If hexa output or echo are enabled, they use data returned by the feeder.\nThis command is an alias for 'set feed_cmd'."""),
      'program': ('p[rogram][!] [file.hex]', "program the device", """The given file, or the previous one if none is provided, is uploaded on the device. Without '!', only differences with the previous binary are sent."""),
      'check': ('check [file.hex]', "check uploaded program", """On success, checked program becomes the previous binary (used when programming only changes). This may be used to avoid reprogramming the whole binary file at startup."""),
      'boot': "boot the device (if bootloader is active)",
      'clear': "clear cached device infos and last programmed data",
      'infos': "display device infos, fuse bytes and programmed binary state",
      }

  _default_aliases = {
      'r': 'reset',
      't': 'terminal',
      'p': 'program',
      }


  # strings matched agains input data and displayed messages
  _matches = {
      '\r\nboot\r\n': 'reboot',
      }


  class Context:
    """Device environment, for master or slave.

    Attributes:
      id -- context's ID
      blosh -- blosh instance the context is attached to
      conn -- serial connection (shared with Roblochon)
      opts -- shell options
      bl -- Roblochon instance
      bl_mode -- True if bootloader active
      last_hex -- last uploaded HEX data

    """

    def __init__(self, id, blosh, conn):
      self.id = id
      self.blosh = blosh
      self.conn = conn
      self.opts = dict( (k, v[0](v[1])) for k,v in blosh._option_list.items() )
      self.bl = blosh.BlClient(self.conn)
      self.bl.theme = blosh.theme
      self.bl_mode = False
      self.last_hex = None


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

    import sys
    if sys.platform == 'win32' and color:
      try:
        import readline
        self.out_write = readline.GetOutputFile().write
      except ImportError:
        sys.stderr("Colors not available, disabled.")
        color = False
        self.out_write = self.stdout.write
    else:
      self.out_write = self.stdout.write

    if color:
      self.theme = DefaultTheme()
    else:
      self.theme = NoColorTheme()
    self.intro = ''
    self.use_rawinput = True

    self.cmd_aliases = dict(self._default_aliases)
    ctx = self.Context('', self, conn) # default context
    self.contexts = { ctx.id: ctx }
    self.ctx_change(ctx.id)


  def _trap_keyboardinterrupt(f):
    """Method decorator to catch interrupts."""
    def ret(self, *args):
      try: f(self, *args)
      except (KeyboardInterrupt, SystemExit):
        self.print_error('interrupted')
    return ret


  def ctx_change(self, id):
    """Change current context.
    Return True on succes, False on error.
    """
    try:
      self.ctx = self.contexts[id]
    except KeyError:
      self.print_fmt('{error}unknown context: {arg}%s{}', id)
      return False
    self.prompt = self.theme.do_prompt('%s> ' % ('>' if id == '' else id))
    return True

  
  def bl_enter(self):
    """Enter bootloader mode.
    Return True on success, None if bootloader was already active.
    """
    ctx = self.ctx
    if ctx.bl_mode: return None
    if ctx.opts['reset_str']:
      self.print_fmt('{info}sending {bold}reset{info} string{}')
      ctx.conn.write(ctx.opts['reset_str'].val)
    self.print_fmt('{info}{bold}waiting{info} for bootloader...{}')

    ctx.bl.synchronize()
    ctx.bl_mode = True
    return True

  def bl_exit(self):
    """Exit bootloader mode.
    Return True on success, None if bootloader was already active.
    If bootloader state is not known, first enter then exit.
    """
    ctx = self.ctx
    if not ctx.bl:
      self.bl_enter()
    if not ctx.bl_mode: return None
    ctx.bl_mode = False
    try:
      self.print_fmt('{info}{bold}exiting{info} bootloader{}')
      ctx.bl.boot()
    except Exception, e:
      self.print_error('failed to boot: %s' % e)
      return False
    return True


  @_trap_keyboardinterrupt
  def terminal_mode(self):
    """Enter terminal mode."""
    ctx = self.ctx

    if ctx.bl_mode and ctx.opts['auto_boot']:
      self.bl_exit()

    if ctx.opts['reset_str']:
      tkey_reset = ctx.opts['tkey_reset'].val
    else:
      tkey_reset = None
    if ctx.opts['prog_file']:
      tkey_prog = ctx.opts['tkey_prog'].val
    else:
      tkey_prog = None

    tkey_quit = ctx.opts['tkey_quit'].val
    if tkey_quit in '\r\n':
      self.print_error('using CR or LF for tkey_quit is not safe')
      return
    self.print_fmt('{info}entering terminal mode, {bold}%s{info} to quit{}', ctx.opts['tkey_quit'])

    l = filter(None, (tkey_reset, tkey_prog, tkey_quit))
    if len(l) != len(set(l)):
      self.print_error('several tkey_* share the same value')
      return

    crlf = {'CR':'\r','LF':'\n','CRLF':'\r\n'}[ctx.opts['eol'].val]

    printers_in = []
    printers_out = []
    pfilter, pfeed = None, None
    def print_in(s):
      for p in printers_in: p(s)
    def print_out(s):
      for p in printers_out: p(s)

    if ctx.opts['switch_way_eol']:
      last_way = [0] # -1: in, +1: out, in a list to keep a reference
      def pin_default(s):
        if last_way[0] > 0: sys.stdout.write('\r\n')
        last_way[0] = -1
        sys.stdout.write(s)
      def pout_default(s):
        if last_way[0] < 0: sys.stdout.write('\r\n')
        last_way[0] = 1
        sys.stdout.write(self.theme.do_data_out(s))
    else:
      pin_default = lambda s: sys.stdout.write(s)
      pout_default = lambda s: sys.stdout.write(self.theme.do_data_out(s))
    if not ctx.opts['echo']:
      pout_default = lambda s: None


    if ctx.opts['hexa']:
      # number of written data bytes on the current line (>0: out, <0: in)
      hexaline_len = [0] # in a list to keep a reference
      hexa_len = ctx.opts['hexa_len'].val
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
      if ctx.opts['echo']:
        printers_out.append(pout_hexa)

    elif ctx.opts['filter_cmd']:
      s = ctx.opts['filter_cmd'].val
      try:
        pfilter = subprocess.Popen(s, shell=True, bufsize=0, close_fds=True,
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self.print_fmt('{info}filtering with {bold}%s{}', s)
      except Exception, e:
        self.print_fmt('{error}failed to run filter command {arg}%s{error}: %s', s,e)
        return
      def pin_filter(s):
        if pfilter and pfilter.poll() is None:
          pfilter.stdin.write(s)
        else:
          pin_default(s)
      printers_in.append(pin_filter)

    if ctx.opts['feed_cmd']:
      tkey_reset = None
      s = ctx.opts['feed_cmd'].val
      try:
        pfeed = subprocess.Popen(s, shell=True, bufsize=0, close_fds=True,
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self.print_fmt('{info}feeding with {bold}%s{}', s)
      except Exception, e:
        self.print_fmt('{error}failed to run feed command {arg}%s{error}: %s', s,e)
        return

    if not printers_in: printers_in.append(pin_default)
    if not printers_out: printers_out.append(pout_default)

    flog = None
    if ctx.opts['log_file']:
      s = ctx.opts['log_file'].val
      try:
        flog = open(s, 'w')
        self.print_fmt('{info}logging to {bold}%s{}', s)
      except Exception, e:
        self.print_fmt('{error}cannot open log file {arg}%s{error}: %s{}', s,e)
        return
      printers_in.append(lambda s: flog.write(s))

    match_data = ''  # last input data, for matching
    match_data_len = max( len(k) for k in self._matches )

    ctx.conn.flushInput()

    if termios is not None:
      tio_attr_bak = termios.tcgetattr(sys.stdin)
      tio_attr = termios.tcgetattr(sys.stdin)
      tio_attr[0] = tio_attr[0] | termios.ICRNL
      tio_attr[3] = 0
      termios.tcsetattr(sys.stdin, termios.TCSAFLUSH, tio_attr)

    # the loop
    try:
      while True:
        fds = [ctx.conn.fd, sys.stdin]
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
          ctx.conn.write(s)
          print_out(s)
          sys.stdout.write(self.theme.do_warn(pfeed.stderr.read()))
          sys.stdout.write(self.theme.do_notice('\r\nfeeder returned %d\r\n'%pfeed.returncode))
          if pfeed.returncode != 0: break
          pfeed = None

        # process 'selected' fds

        if ctx.conn.fd in rds:
          c = ctx.conn.read(1)
          if not c:
            sys.stdout.write(self.theme.do_warn('\r\ndisconnected\r\n'))
            break
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
          if c == tkey_reset: c = ctx.opts['reset_str'].val
          if c == tkey_prog:
            sys.stdout.write('\r\n')
            # reenable keyboard interrupt
            if termios is not None:
              tio_attr_bak2 = termios.tcgetattr(sys.stdin)
              termios.tcsetattr(sys.stdin, termios.TCSAFLUSH, tio_attr_bak)
            self.reprogram()
            self.bl_exit()
            if termios is not None:
              termios.tcsetattr(sys.stdin, termios.TCSAFLUSH, tio_attr_bak2)
          if c == '\n': c = crlf
          if pfeed:
            pfeed.stdin.write(c)
          else:
            ctx.conn.write(c)
            print_out(c)

        if pfilter:
          if pfilter.stdout in rds:
            sys.stdout.write(pfilter.stdout.read(1))
          if pfilter.stderr in rds:
            sys.stdout.write(self.theme.do_warn(pfilter.stderr.read(1)))

        if pfeed:
          if pfeed.stdout in rds:
            c = pfeed.stdout.read(1)
            ctx.conn.write(c)
            print_out(c)
          if pfeed.stderr in rds:
            sys.stdout.write(self.theme.do_warn(pfeed.stderr.read(1)))

        sys.stdout.flush()
    finally:
      if termios is not None:
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
    ctx = self.ctx
    f = ctx.opts['prog_file'].val
    if not f:
      self.print_error("no file to upload")
      return
    self.bl_enter()
    if not self._check_roid(): return
    try:
      data = ctx.bl.parse_hex_file(f)
    except Exception, e:
      self.print_fmt('{error}cannot parse HEX file {arg}%s{error}: %s{}', f,e)
      return

    try:
      if ctx.bl.program(data, ctx.last_hex) is None:
        self.print_ln(self.theme.do_info("nothing to program"))
      ctx.last_hex = data
    except Exception, e:
      self.print_error('failed to program: %s' % e)


  def do_quit(self, line):
    return True
  def do_EOF(self, line):
    self.print_ln() # extra newline
    return True

  def emptyline(self):
    pass

  def precmd(self, line):
    last_alias = None
    if not line: return line
    while True:
      l = line.split(None, 1)
      if l[0] == last_alias: break  # avoid self-recursive aliases
      alias_val = self.cmd_aliases.get(l[0])
      if alias_val is None: break  # not an alias
      last_alias = l[0]
      line = alias_val + line[len(last_alias):]
    return line


  def default(self, line):
    if line[0] == '#': return  # ignore comments
    self.print_fmt('{error}unknown command: {arg}%s{}', line.split()[0])

  def do_shell(self, line):
    os.system(line)

  def do_terminal(self, line):
    self.terminal_mode()

  def do_reset(self, line):
    ctx = self.ctx
    if ctx.bl_mode:
      self.bl_exit()
    elif ctx.opts['reset_str']:
      self.print_fmt('{info}sending {bold}reset{info} string{}')
      ctx.conn.write(ctx.opts['reset_str'].val)
    else:
      self.print_fmt("{arg}reset_str{error} option is not set{}")

  def do_set(self, line):
    ctx = self.ctx
    l = line.split(None, 1)
    if len(l) < 1:
      self.print_ln("Option values:")
      l = sorted(self._option_list.keys())
      for k in l:
        self.print_ln("  %-14s  %s" % (k, ctx.opts[k]))
    else:
      k = l[0]
      try:
        opt = ctx.opts[k]
      except KeyError:
        self.print_fmt('{error}unknown option: {arg}%s{}', k)
        return
      if len(l) < 2:
        opt.reset()
      else:
        try:
          opt.set(l[1])
        except ValueError, e:
          self.print_fmt('{error}invalid option value: {arg}%s{}', e)

  def do_alias(self, line):
    l = line.split(None, 1)
    if len(l) < 1:
      self.print_ln("Aliases:")
      l = sorted(self.cmd_aliases.keys())
      k_len = max( len(k) for k in l )
      for k in l:
        self.print_ln("  %-*s  %s" % (k_len, k, self.cmd_aliases[k]))
    else:
      k = l[0]
      if len(l) < 2:
        del self.cmd_aliases[k]
      else:
        self.cmd_aliases[k] = l[1]

  def do_source(self, line):
    if not line:
      self.print_error('no file given')
      return
    try:
      f = open(line, 'r')
    except:
      self.print_fmt('{error}failed to open {arg}%s{}', line)
      return
    self.execute(f)

  def execute(self, f):
    """Execute a file or a string."""
    if isinstance(f, basestring):
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

  def do_context(self, line):
    l = line.split(None, 1)
    if len(l) < 1:
      l = [''] # default context
    if len(l) == 1:
      self.ctx_change(l[0])
    else:
      # retrieve current ID
      prev_id = self.ctx.id
      if not self.ctx_change(l[0]): return
      try: self.execute(l[1])
      finally: self.ctx_change(old_id)


  def do_log(self, line):
    return self.do_set('log_file %s' %line)
  def do_filter(self, line):
    return self.do_set('filter_cmd %s' %line)
  def do_feed(self, line):
    return self.do_set('feed_cmd %s' %line)


  @_trap_keyboardinterrupt
  def do_program(self, line):
    ctx = self.ctx
    if len(line) and line[0] == '!':
      ctx.last_hex = None
      line = line.lstrip('! \t')
    else:
      force = False
    if line:
      ctx.opts['prog_file'].set(line)
    self.reprogram()

  @_trap_keyboardinterrupt
  def do_check(self, line):
    ctx = self.ctx
    if line:
      f = line
    else:
      f = ctx.opts['prog_file'].val
    if not f:
      self.print_error("no file to check")
      return
    self.bl_enter()
    if not self._check_roid(): return
    try:
      ret = ctx.bl.check(f)
      if ret:
        # current embedded program is the given HEX file
        # set last_hex to allow page optimizations
        ctx.last_hex = ctx.bl.parse_hex_file(f)
      self.print_ln('check: %s' % self.theme.do_ok('OK') if ret else self.theme.do_error('FAILED'))
    except Exception, e:
      self.print_error('failed to check: %s' % e)

  def do_boot(self, line):
    self.bl_exit()

  def do_clear(self, line):
    self.ctx.bl.clear_infos()
    self.ctx.last_hex = None

  @_trap_keyboardinterrupt
  def do_infos(self, line):
    ctx = self.ctx
    self.bl_enter()
    ctx.bl.update_infos()
    roid_style = ''
    if ctx.opts['check_roid'].val > -1:
      roid_style = 'ok' if ctx.bl.roid == ctx.opts['check_roid'].val else 'error'
    self.print_fmt('{bold}ROID:{'+roid_style+'} 0x%02x (%d){}   {bold}features:{} %s',
        ctx.bl.roid, ctx.bl.roid, ctx.bl.features)
    try:
      fuses = ctx.bl.read_fuses()
      self.print_fmt('{bold}fuses (low high ex):{} %02x %02x %02x', *fuses)
    except Exception, e:
      self.print_error('cannot read fuses: %s' % e)

    f = ctx.opts['prog_file'].val
    if f:
      try:
        data = ctx.bl.parse_hex_file(f)
        if ctx.last_hex is not None:
          data_diff = ctx.bl.diff_pages(data, ctx.last_hex)
          self.print_fmt('{bold}program:{} %d bytes, %d page%c to program',
              len(data), len(data_diff), '' if len(data_diff)==1 else 's')
        else:
          self.print_fmt('{bold}program:{} %d bytes, no previous state', len(data))
      except Exception:
        self.print_fmt('{bold}program:{} {error}invalid data{}')
    else:
      self.print_fmt('{bold}program:{} no file')


  def _check_roid(self):
    ctx = self.ctx
    """Internal method to check ROID if needed, print a message on mismatch."""
    if ctx.opts['check_roid'].val <= -1: return True
    ctx.bl.update_infos()
    if ctx.opts['check_roid'].val != ctx.bl.roid:
      self.print_fmt('{error}ROID mismatch: expected {arg}0x%02x{error} got {arg}0x%02x{}',
          ctx.opts['check_roid'].val, ctx.bl.roid)
      return False
    return True


  # completion

  def complete_set(self, text, line, begidx, endidx):
    return [x for x in self._option_list if x.startswith(text)]

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
        self.print_fmt('{help_cmd}%s{help_brief} -- %s', cmd,brief)
        if desc:
          desc = re.subn(r'(.{1,76}\S)(?:\n|\s+|$)', r'\1\n', desc)[0]
          self.out_write('  '+ desc.rstrip().replace('\n', '\n  '))
      except KeyError:
        self.print_fmt('{error}no help on {arg}%s', line)
    else:
      self.out_write("Help topics:\n")
      it = sorted(self._help_topics.items())
      for k,v in it:
        self.print_ln("  %-10s  %s" % (k,v[1]))

  # arrange _help_topics to have (cmd, brief, desc) values
  d = {}
  for k,v in _help_topics.items():
    if isinstance(v, tuple):
      v = list(v)
    elif not isinstance(v, list):
      v = [v]
    if len(v) == 1:
      v = [k, v[0], None]
    elif len(v) == 2:
      v = [v[0], v[1], None]
    if v[0] is None: v[0] = k
    if v[2]: v[2] = v[2].strip()
    d[k] = tuple(v)
  _help_topics.update(d)
  del d

  # output

  def print_ln(self, s):
    self.out_write(s+'\n')

  def print_fmt(self, s, *args):
    s = self.theme.fmt(s)
    if args:
      s = s % args
    self.print_ln(s)

  def print_error(self, s):
    self.print_ln(self.theme.do_error(s))


if __name__ == '__main__':
  from optparse import OptionParser
  from robloc import Serial

  # default port, platform-dependant
  import os
  if os.name == 'nt':
    port_default = 'COM1'
  else:
    port_default = '/dev/ttyUSB0'

  parser = OptionParser(
      description="blosh -- a shell-like client for the Rob'Otter bootloader",
      usage="%prog [OPTIONS] [FILE]",
      )
  parser.add_option('-P', '--port', dest='port',
      help="device port to use (default: %s)"%port_default)
  parser.add_option('-s', '--baudrate', dest='baudrate',
      help="baudrate (default: 38400)")
  parser.add_option('-c', '--command', dest='command',
      help="command to execute")
  parser.add_option('-t', '--terminal', dest='terminal', action='store_true',
      help="start in terminal mode")
  parser.set_defaults(
      port=port_default,
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

