import re, os
import time  # used by templates

from ..core import MasterDevice, SlaveDevice, Telemetry, Command, Message, ppp_types


def templatize(tpl, out, loc):
  """Process a template.

  '#pragma perlimpinpin_tpl CODE' and '$$ppp:CODE' sequences are replaced,
  where CODE is Python code. Multiline #pragma (using backslash at end of line)
  are not supported.

  Parameters:
    tpl -- template file (name or file object)
    out -- output file (name or file object)
    loc -- local values accessible in the template code.
  """
  if isinstance(tpl, basestring):
    tpl = open(tpl, 'rb')
  if isinstance(out, basestring):
    out = open(out, 'wb')
  def tpl_replace(m):
    code = m.group(1).strip()
    return str(eval(code, None, loc))
  txt = tpl.read()
  txt = re.sub(r'\$\$ppp:(.*?)\$\$', tpl_replace, txt)
  pragma_re = re.compile(r'^#pragma\s+perlimpinpin_tpl\s+(.*)$\n', re.M)
  txt = pragma_re.sub(tpl_replace, txt)
  out.write(txt)


class CodeGenerator:
  """
  Generate Perlimpinpin code for AVR.

  Attributes:
    device -- device for which files are generated

  """

  format_strings = {
      'int32': '%ld', 'uint32': '%lu',
      'int16': '%d',  'uint16': '%u',
      'int8':  '%d',  'uint8':  '0x%02X',
      'bool':  '%d',
      }

  def __init__(self, device):
    if device.outdir is None:
      raise ValueError("output directory not specified")
    self.device = device

  @classmethod
  def avr_typename(cls, typ):
    """Return C typename of a PPP type."""
    if issubclass(typ, ppp_types.ppp_int):
      return '%s_t' % typ.name
    elif issubclass(typ, ppp_types.ppp_bool):
      return 'uint8_t'
    else:
      raise TypeError("unsupported type: %s" % typ)

  @classmethod
  def avr_sizeof(cls, typ):
    """Return byte size of a PPP type."""
    if hasattr(typ, 'bitsize'):
      return int( (typ.bitsize+7)//8 )  # ceil(bitsize/8)
    elif issubclass(typ, ppp_types.ppp_bool):
      return 1
    else:
      raise TypeError("unsupported type: %s" % typ)

  @classmethod
  def avr_printf_fmt(cls, typ):
    """Return printf-like format string of a PPP type."""
    try:
      return cls.format_strings[typ.name]
    except KeyError:
      raise TypeError("unsupported type: %s" % typ)

  @classmethod
  def cmdid_enum_name(cls, cmd):
    return 'PPP_CMDID_%s' % cmd.name.upper()

  def generate(self):
    """Generate all files."""

    if isinstance(self.device, SlaveDevice):
      tpldir = 'src/slave'
    elif isinstance(self.device, MasterDevice):
      tpldir = 'src/master'
    else:
      raise TypeError("unsupported device type")

    loc = { 'self': self }
    tpldir = os.path.join(os.path.dirname(__file__), tpldir)
    for f in os.listdir(tpldir):
      if os.path.splitext(f)[1] in ('.c', '.h'):
        tpl = os.path.join(tpldir, f)
        out = os.path.join(self.device.outdir, f)
        templatize(tpl, out, loc)


  def cmdid_enum_fields(self):
    return ''.join(
        '  %s = %u,\n' % (self.cmdid_enum_name(cmd), cmd.mid)
        for cmd in self.device.commands()
        )

  def cmddata_union_fields(self):
    ret = ''
    for cmd in self.device.commands():
      fields = ['PPPCmdID cmdid;']
      if len(cmd.iparams) != 0:
        fields.append('// input')
        fields.extend( '%s %s;' % (self.avr_typename(t), v) for v,t in cmd.iparams )
      if len(cmd.oparams) != 0:
        fields.append('// output')
        fields.extend( '%s %s;' % (self.avr_typename(t), v) for v,t in cmd.oparams )
      ret += '\n  struct {\n%s  } %s;\n' % (
          ''.join( '    %s\n'%s for s in fields ),
          cmd.name.lower(),
          )
    return ret

  def max_payload_recv_size(self):
    return max(
        sum( self.avr_sizeof(t) for v,t in cmd.iparams )
        for cmd in self.device.commands()
        )

  def max_payload_send_size(self):
    return max(
        sum( self.avr_sizeof(t) for v,t in cmd.oparams )
        for cmd in self.device.commands()
        )


  def slave_process_cmd_payload_switch(self):
    ret = ''
    for cmd in self.device.commands():
      lines = []
      cmddata_struct = 'pl->data.%s' % cmd.name.lower()

      # check size
      # note: send_size is checked at compile time
      size_exp = sum( self.avr_sizeof(t) for v,t in cmd.iparams )
      lines.extend((
        'if( pl->recv_size != %u ) {' % size_exp,
        '  WARNING(PPP_ERROR, "invalid payload size for %s (expected %u, got %%u)", pl->recv_size);' % (cmd.name, size_exp),
        '  return -1;',
        '}',
        ))

      # unpack arguments
      pos = 0
      for v,t in cmd.iparams:
        lines.append('%s.%s = *(const %s *)(recv_data+%u);'
            % (cmddata_struct, v, self.avr_typename(t), pos))
        pos += self.avr_sizeof(t)

      # debug line
      fmt_str = ','.join( self.avr_printf_fmt(t) for v,t in cmd.iparams )
      fmt_args = ', '.join( '%s.%s'%(cmddata_struct, v) for v,t in cmd.iparams )
      if fmt_args != '':
        fmt_args = ', '+fmt_args
      lines.append('DEBUG(PPP_ERROR, "received order %s(%s)"%s);' % (cmd.name, fmt_str, fmt_args))

      # call the user callback
      lines.append( 'ppp_command_callback(&pl->data);' )

      # pack reply (if needed)
      if len(cmd.oparams) != 0:
        pos = 0
        for v,t in cmd.oparams:
          lines.append('*((%s *)(send_data+%u)) = %s.%s;'
              % (self.avr_typename(t), pos, cmddata_struct, v))
          pos += self.avr_sizeof(t)
        lines.append('pl->send_size = %u;' % (pos+1))  # +1 for cmdid
      else:
        lines.append('pl->send_size = 0;  // no reply')

      lines.append('break;')
      ret += '    case %s:\n%s\n' % (
          self.cmdid_enum_name(cmd),
          ''.join('      %s\n'%s for s in lines),
          )
    return ret


  def master_send_command(self):
    ret = ''
    for cmd in self.device.commands():
      lines = []
      cmddata_struct = 'cmddata->%s' % cmd.name.lower()

      # pack arguments
      pos = 0
      for v,t in cmd.oparams:
        lines.append('*((%s *)(frame.buf+%u)) = %s.%s;'
            % (self.avr_typename(t), pos+3, cmddata_struct, v))
        pos += self.avr_sizeof(t)
      lines.append('frame.send_size = %u;' % (pos+1))  # +1 for cmdid

      # debug line
      fmt_str = ','.join( self.avr_printf_fmt(t) for v,t in cmd.iparams )
      fmt_args = ', '.join( '%s.%s'%(cmddata_struct, v) for v,t in cmd.iparams )
      if fmt_args != '':
        fmt_args = ', '+fmt_args
      lines.append('DEBUG(PPP_ERROR, "send order %s(%s)"%s);' % (cmd.name, fmt_str, fmt_args))

      # process the order
      lines.extend((
        'if( ppp_process_frame(&frame) != 0 ) {',
        '  return -1;',
        '}',
        ))

      # unpack reply (if any)
      pos = 0
      for v,t in cmd.oparams:
        lines.append('*((%s *)(frame.buf+%u)) = %s.%s;'
            % (self.avr_typename(t), pos+3, cmddata_struct, v))
        pos += self.avr_sizeof(t)

      lines.append('break;')
      ret += '    case %s:\n%s\n' % (
          self.cmdid_enum_name(cmd),
          ''.join('      %s\n'%s for s in lines),
          )
    return ret


  def master_send_helpers(self):
    ret = ''
    for cmd in self.device.commands():
      args = ['_cmddata'] + [ v for v,t in cmd.iparams ]
      sargs = ', '.join(args)

      lines = [ '(_cmddata)->cmdid = %u,' % cmd.mid ]
      cmddata_struct = '(_cmddata)->%s' % cmd.name.lower()
      for v,t in cmd.iparams:
        lines.append('%s.%s = (%s),' % (cmddata_struct, v, v))
      ret += '#define PPP_SEND_%s(%s) \\\n%s    ppp_send_command(_cmd_data);\n\n' % (
          cmd.name.upper(), sargs,
          ''.join( '    %s \\\n'%s for s in lines ),
          )
    return ret

