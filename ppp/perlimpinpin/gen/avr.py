import re, os
import time  # used by templates

from ..core import Telemetry, Command, Message, ppp_types


def templatize(tpl, out, loc):
  """Process a template.

  '#pragma perlimpinpin_tpl CODE' and '$$ppp:CODE$$' sequences are replaced,
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
    robot -- robot for which files are generated
    srcdir -- output directory for main source files
    conf -- output file or directory for configuration
            None to use srcdir, False to skip generation
    replaceconf -- False to not regenerate configuration file if it already exists

  """

  format_strings = {
      'int32': '%ld', 'uint32': '%lu',
      'int16': '%d',  'uint16': '%u',
      'int8':  '%d',  'uint8':  '0x%02X',
      'bool':  '%d',
      }

  def __init__(self, robot, srcdir, conf=None, replaceconf=False):
    self.robot = robot
    self.srcdir = srcdir
    self.conf = conf
    self.replaceconf = replaceconf

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
  def msgid_enum_name(cls, msg):
    return 'PPP_MID_%s' % msg.name.upper()

  @classmethod
  def roid_macro_name(cls, dev):
    return 'ROID_%s' % dev.name.upper()

  @classmethod
  def pretty_enum_fields(cls, fields, indent='  '):
    """Return nicely aligned enum fields declarations.
    fields is an iterable of (name, val, doc) tuples, with doc the field
    documentation. val and doc may be None, doc may be omitted.
    """
    fields = tuple(fields)
    names_len = max( len(nvd[0]) for nvd in fields )
    vals_len = max( len(str(nvd[1])) if nvd[1] is not None else 0 for nvd in fields )
    ret = ''
    for nvd in fields:
      try:
        name, val, doc = nvd
      except ValueError:
        (name, val), doc = nvd, None
      if val is not None:
        s = '%-*s = %*s,' % (names_len, name, vals_len, val)
      else:
        s = '%s,' % name
      if doc is not None:
        s = '%s  ///< %s' % (s.ljust(names_len+vals_len+len(' = ,')), doc)
      ret += '%s%s\n' % (indent, s)
    return ret


  def generate(self):
    """Generate all files."""

    loc = { 'self': self }
    tpldir = os.path.join(os.path.dirname(__file__), 'src')
    for f in os.listdir(tpldir):
      if not os.path.splitext(f)[1] in ('.c', '.h'):
        continue
      tpl = os.path.join(tpldir, f)
      if f.endswith('_config.h'):
        if self.conf is False:
          continue  # don't generate configuration
        elif self.conf is None:
          out = os.path.join(self.srcdir, f)
        elif os.path.isdir(self.conf) or self.conf.endswith('/'):
          out = os.path.join(self.conf, f)
        else:
          out = self.conf
        if os.path.isfile(out) and not self.replaceconf:
          continue  # don't replace existing configuration
      else:
        out = os.path.join(self.srcdir, f)
      templatize(tpl, out, loc)


  def device_roid_macros(self):
    name_len = max( len(self.roid_macro_name(dev)) for dev in self.robot.devices )
    return ''.join(
        '#define %-*s 0x%02X\n' % (name_len, self.roid_macro_name(dev), dev.roid)
        for dev in self.robot.devices
        )

  def msgid_enum_fields(self):
    return self.pretty_enum_fields( 
        (self.msgid_enum_name(msg), msg.mid)
        for msg in self.robot.messages()
        )

  def msgdata_union_fields(self):
    ret = ''
    for msg in self.robot.messages():
      fields = ['PPPMsgID mid;']
      if isinstance(msg, Telemetry):
        fields.extend( '%s %s;' % (self.avr_typename(t), v) for v,t in msg.params )
      elif isinstance(msg, Command):
        if len(msg.iparams) != 0:
          fields.append('// input')
          fields.extend( '%s %s;' % (self.avr_typename(t), v) for v,t in msg.iparams )
        if len(msg.oparams) != 0:
          fields.append('// output')
          fields.extend( '%s %s;' % (self.avr_typename(t), v) for v,t in msg.oparams )
      else:
        raise TypeError("unsupported message type")
      ret += '\n  struct {\n%s  } %s;\n' % (
          ''.join( '    %s\n'%s for s in fields ),
          msg.name,
          )
    return ret

  def max_payload_size(self):
    payloads = []
    for msg in self.robot.messages():
      if isinstance(msg, Telemetry):
        payloads.append( msg.params )
      elif isinstance(msg, Command):
        payloads.append( msg.iparams )
        payloads.append( msg.oparams )
      else:
        raise TypeError("unsupported message type")
    return max( sum( self.avr_sizeof(t) for v,t in pl ) for pl in payloads )


  def process_input_frame_switch(self):
    ret = ''
    for msg in self.robot.commands():
      lines = []
      msgdata_struct = 'msgdata.%s' % msg.name

      # check size
      # note: send_size is checked at compile time
      size_exp = sum( self.avr_sizeof(t) for v,t in msg.iparams )
      lines.extend((
        'if( payload_size != %u ) {' % size_exp,
        '  WARNING(PPP_ERROR, "invalid payload size for %s (expected %u, got %%u)", payload_size);' % (msg.name, size_exp),
        '  return -1;',
        '}',
        ))

      # unpack arguments
      pos = 3
      for v,t in msg.iparams:
        lines.append('%s.%s = *(const %s *)(rbuf+%u);'
            % (msgdata_struct, v, self.avr_typename(t), pos))
        pos += self.avr_sizeof(t)

      # debug line
      fmt_str = ','.join( self.avr_printf_fmt(t) for v,t in msg.iparams )
      fmt_args = ', '.join( '%s.%s'%(msgdata_struct, v) for v,t in msg.iparams )
      if fmt_args != '':
        fmt_args = ', '+fmt_args
      lines.append('DEBUG(PPP_ERROR, "received message %s(%s)"%s);' % (msg.name, fmt_str, fmt_args))

      # call the user callback
      lines.append( 'ppp_command_callback(&msgdata);' )

      # pack reply (if needed)
      if len(msg.oparams) != 0:
        pos = 3
        for v,t in msg.oparams:
          lines.append('*((%s *)(frame->send_buf+%u)) = %s.%s;'
              % (self.avr_typename(t), pos, msgdata_struct, v))
          pos += self.avr_sizeof(t)
        lines.append('payload_size = %u;' % (pos-2))  # - size (2)
      else:
        lines.append('payload_size = 0;  // no reply')

      lines.append('break;')
      ret += ('#if PPP_DEVICE_ROID == %s\n'
              '    case %s:\n%s'
              '#endif\n\n') % (
                 self.roid_macro_name(msg.device),
                 self.msgid_enum_name(msg),
                 ''.join('      %s\n'%s for s in lines),
                 )
    return ret


  def send_message_switch(self):
    ret = ''

    for msg in self.robot.commands():
      lines = []
      msgdata_struct = 'msgdata->%s' % msg.name

      # pack arguments
      pos = 3
      for v,t in msg.iparams:
        lines.append('*((%s*)(frame.send_buf+%u)) = %s.%s;'
            % (self.avr_typename(t), pos, msgdata_struct, v))
        pos += self.avr_sizeof(t)
      lines.append('frame.send_size = %u;' % (pos+1))  # + checksum (1)

      # debug line
      fmt_str = ','.join( self.avr_printf_fmt(t) for v,t in msg.iparams )
      fmt_args = ', '.join( '%s.%s'%(msgdata_struct, v) for v,t in msg.iparams )
      if fmt_args != '':
        fmt_args = ', '+fmt_args
      lines.append('DEBUG(PPP_ERROR, "send message %s(%s)"%s);' % (msg.name, fmt_str, fmt_args))

      # process the message
      lines.extend((
        'if( ppp_i2cm_process_output_frame(&frame, 0x%02X) != 0 ) {' % msg.device.roid,
        '  return -1;',
        '}',
        ))

      # unpack reply (if any)
      pos = 3
      for v,t in msg.oparams:
        lines.append('*((%s*)(frame.recv_buf+%u)) = %s.%s;'
            % (self.avr_typename(t), pos+3, msgdata_struct, v))
        pos += self.avr_sizeof(t)

      lines.append('break;')
      ret += ('#if defined(PPP_I2C_MASTER) && PPP_DEVICE_ROID != %s\n'
              '    case %s:\n%s'
              '#endif\n\n') % (
                 self.roid_macro_name(msg.device),
                 self.msgid_enum_name(msg),
                 ''.join('      %s\n'%s for s in lines),
                 )

    for msg in self.robot.telemetries():
      lines = []
      msgdata_struct = 'msgdata->%s' % msg.name

      # pack arguments
      pos = 3
      for v,t in msg.params:
        lines.append('*((%s*)(frame.send_buf+%u)) = %s.%s;'
            % (self.avr_typename(t), pos, msgdata_struct, v))
        pos += self.avr_sizeof(t)
      lines.append('frame.send_size = %u;' % (pos+1))  # + checksum (1)

      # debug line
      fmt_str = ','.join( self.avr_printf_fmt(t) for v,t in msg.params )
      fmt_args = ', '.join( '%s.%s'%(msgdata_struct, v) for v,t in msg.params )
      if fmt_args != '':
        fmt_args = ', '+fmt_args
      lines.append('DEBUG(PPP_ERROR, "send message %s(%s)"%s);' % (msg.name, fmt_str, fmt_args))

      # process the message
      lines.append('ppp_uart_send(frame.send_buf, frame.send_size);')
      lines.append('break;')
      ret += ('#if defined(PPP_UART_NUM) && PPP_DEVICE_ROID == %s\n'
              '    case %s:\n%s'
              '#endif\n\n') % (
                 self.roid_macro_name(msg.device),
                 self.msgid_enum_name(msg),
                 ''.join('      %s\n'%s for s in lines),
                 )

    return ret


  def send_helpers(self):
    ret = ''

    for msg in self.robot.commands():
      args = ['_msgdata'] + [ v for v,t in msg.iparams ]
      sargs = ', '.join(args)

      lines = [ '(_msgdata)->mid = %u,' % msg.mid ]
      msgdata_struct = '(_msgdata)->%s' % msg.name
      for v,t in msg.iparams:
        lines.append('%s.%s = (%s),' % (msgdata_struct, v, v))
      ret += ('#if defined(PPP_I2C_MASTER) && PPP_DEVICE_ROID != %s\n'
              '#define PPP_SEND_%s(%s) \\\n%s    ppp_send_message(_msgdata);\n'
              '#endif\n\n') % (
                 self.roid_macro_name(msg.device),
                 msg.name.upper(), sargs,
                 ''.join( '    %s \\\n'%s for s in lines ),
                 )

    for msg in self.robot.telemetries():
      args = ['_msgdata'] + [ v for v,t in msg.params ]
      sargs = ', '.join(args)

      lines = [ '(_msgdata)->mid = %u,' % msg.mid ]
      msgdata_struct = '(_msgdata)->%s' % msg.name
      for v,t in msg.params:
        lines.append('%s.%s = (%s),' % (msgdata_struct, v, v))
      ret += ('#if defined(PPP_UART_NUM) && PPP_DEVICE_ROID == %s\n'
              '#define PPP_SEND_%s(%s) \\\n%s    ppp_send_message(_msgdata);\n'
              '#endif\n\n') % (
                 self.roid_macro_name(msg.device),
                 msg.name.upper(), sargs,
                 ''.join( '    %s \\\n'%s for s in lines ),
                 )

    return ret

