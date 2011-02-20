
import time, re, os, shutil

import configuration.perlimpinpin as ppp
from configuration.perlimpinpin import MasterDevice, SlaveDevice, Telemetry, Command, Message
import generators.robotter

class CodeWriter:
  def __init__(self, path, is_header=False):
    self.f = open(path,'wb')
    self.indent = 0
    self.is_header = is_header
    filename = os.path.split(path)[-1]

    self.write(generators.robotter.copyright)
    self.write(generators.robotter.file_header
        % {'filename':filename, 'date':time.asctime()})
    if self.is_header:                                         
      self.guard = self.build_header_guard(filename)
      self.write(self.guard[0])

  def open_block(self):
    self.write('{')
    self.inc_indent()

  def close_block(self):
    self.dec_indent()
    self.write('}')

  def inc_indent(self):
    self.indent += 1

  def dec_indent(self):
    assert self.indent > 0
    self.indent -= 1

  def write(self, string):
    self.f.write(' '*2*self.indent+string+'\n')

  def write_local_includes(self, files):
    for f in files:
      self.write('#include "%s"'%f)
    self.write('')

  def write_ext_includes(self, files):
    for f in files:
      self.write('#include <%s>'%f)
    self.write('')

  def build_header_guard(self, filename):
    s = re.sub(r'[^A-Z0-9_]','_',filename.upper())
    pre =  '#ifndef ' + s + '\n'
    pre += '#define ' + s + '\n'
    post = '#endif/*' + s + '*/\n'
    return (pre,post)

  def close(self):
    assert self.indent == 0
    if self.is_header:
      self.write(self.guard[1])
    self.write('\n')


class AVRCodeGenerator:

  format_strings = {
      'int32': '%ld', 'uint32': '%lu',
      'int16': '%d',  'uint16': '%u',
      'int8':  '%d',  'uint8':  '0x%02X',
      'bool':  '%d',
      }

  type_prefixes = {
      'int32': 'i32', 'uint32': 'u32',
      'int16': 'i16', 'uint16': 'u16',
      'int8':  'i8',  'uint8':  'u8',
      }

  pack_endian = '<'
  pack_fmt = {
      'int32': 'i', 'uint32': 'I',
      'int16': 'h', 'uint16': 'H',
      'int8':  'b',  'uint8': 'B',
      }

  command_process_filename = 'stratcomm_process.c'
  command_messages_filename = 'stratcomm_messages.h'
  command_callback_header_filename = 'stratcomm_callbacks.h'

  slave_payload_header = 'slave/stratcomm_payloads.h'
  slave_stratcomm_header = 'slave/stratcomm.h'
  slave_stratcomm_source = 'slave/stratcomm.c'

  master_stratcomm_header = 'master/stratcomm.h'
  master_stratcomm_source = 'master/stratcomm.c'

  command_master_send_header = 'stratcomm_send.h'
  command_master_send_source = 'stratcomm_send.c'

  telemetry_header = 'telemetry.h'
  telemetry_source = 'telemetry.c'

  class Function:

    def __init__(self, name, args, retvalues, this=None, rettype='void'):
      self.name = name
      # convert ppp types to C types
      self.args = []
      for v,t in args:
        if not isinstance(t, basestring):
          t = AVRCodeGenerator.avr_typename(t)
        self.args.append((v,t))
      self.retvalues = []
      for v,t in retvalues:
        if not isinstance(t, basestring):
          t = AVRCodeGenerator.avr_typename(t)
        self.retvalues.append((v,t))

      if this is not None:
        self.thistype, self.thisarg = this
      else:
        self.thistype, self.thisarg = None, None
      self.rettype = rettype

    def get_call(self):
      if self.thistype is not None:
        args = [ '*'+self.thisarg ]
      else:
        args = []
      args += [     v for v,t in self.args ]
      args += [ '&'+v for v,t in self.retvalues ]
      cb_args = ', '.join(args)
      return '%s(%s);' % (self.name.lower(), cb_args)

    def get_macro(self):
      dargs = ', '.join( v for v,t in self.args )
      return '%s(%s)' % (self.name.upper(), dargs)

    def get_prototype(self):
      if self.thistype is not None:
        args = [ '%s *%s' % (self.thistype, self.thisarg) ]
      else:
        args = []
      args += [ '%s %s' %(t,v) for v,t in self.args ]
      args += [ '%s *%s'%(t,v) for v,t in self.retvalues ]
      if len(args) == 0:
        dargs = 'void'
      else:
        dargs = ', '.join(args)
      return '%s %s(%s)' % (self.rettype, self.name.lower(), dargs)


  def __init__(self, device):
    self.device = device
    if device.outdir is None:
      self.outdir = '.'
    else:
      self.outdir = device.outdir

  
  @classmethod
  def avr_typename(cls, typ):
    """Return C typename of a PPP type."""
    if issubclass(typ, ppp.Integer):
      return '%s_t' % typ.name
    elif issubclass(typ, ppp.Boolean):
      return 'uint8_t'
    else:
      raise TypeError("unsupported type: %s" % typ)

  @classmethod
  def avr_sizeof(cls, typ):
    """Return byte size of a PPP type."""
    if hasattr(typ, 'bitsize'):
      return int( (typ.bitsize+7)//8 )  # ceil(bitsize/8)
    elif issubclass(typ, ppp.Boolean):
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
  def get_varname(cls, name, typ):
    return '%s_%s' % (cls.type_prefixes.get(typ.name, 'v'), name)

  @classmethod
  def get_message_cname(cls, msg):
    return 'CM_%s_%s' % (msg.device.name.upper(), msg.name)


  def generate(self):
    """ Generate all files """

    # telemetry files
    self.generate_telemetry(self.outdir)

    # i2c messaging files
    if isinstance(self.device, SlaveDevice):
      self.generate_command_messages(
          os.path.join(self.outdir, self.command_messages_filename) )
      self.generate_command_process(
          os.path.join(self.outdir, self.command_process_filename) )
      self.generate_command_callbacks_header(
          os.path.join(self.outdir, self.command_callback_header_filename) )
      self.copy_slave_sources(self.outdir)

    elif isinstance(self.device, MasterDevice):
      self.generate_command_master_send_header(
          os.path.join(self.outdir, self.command_master_send_header) )
      self.generate_command_master_send_source(
          os.path.join(self.outdir, self.command_master_send_source) )
      self.copy_master_sources(self.outdir)

    else:
      raise TypeError("unsupported device type")

  def generate_command_messages(self, path):
    """ Generate orders ID defines """
    assert isinstance(self.device, SlaveDevice)

    cw = CodeWriter(path,True)

    cw.write('#define STRATCOMM_I2C_ADDRESS 0x%2.2X'%(self.device.roid))
    cw.write('')

    for cmd in self.device.messages_of_type(Command):
      cw.write('#define %s 0x%2.2X'%(self.get_message_cname(cmd), cmd.mid))
    cw.close()

  def generate_command_process(self, path):
    """ Generate command processing """
    assert isinstance(self.device, SlaveDevice)

    cw = CodeWriter(path)

    # includes
    cw.write_ext_includes(['aversive/error.h'])
    cw.write_local_includes([
      'stratcomm.h',
      'stratcomm_messages.h',
      'stratcomm_payloads.h',
      'stratcomm_callbacks.h'
      ])

    # function declaration
    cw.write('void stratcomm_process(stratcomm_t *sc, uint8_t mid, uint8_t *payload)')

    cw.open_block()

    commands = self.device.messages_of_type(Command)

    #TODO:ryder remove
    # variables declarations
    decl = {}
    for cmd in commands:
      for vname, vtype in cmd.iparams + cmd.oparams:
        vname = self.get_varname(vname,vtype)
        if vtype in decl:
          decl[vtype].append(vname)
        else:
          decl[vtype] = [vname]

    # write variables declarations
    for vtype, vnames in decl.iteritems():
      cw.write('%s %s;'%( self.avr_typename(vtype), ', '.join(set(vnames))))
    cw.write('')

    # open switch case
    cw.write('switch(mid)')
    cw.open_block()

    for cmd in commands:
      if cmd.desc is None:
        cw.write('// %s')
      else:
        cw.write('// %s : %s' % (cmd.name, cmd.desc))
      cw.write('case %s:'%(self.get_message_cname(cmd)))
      cw.inc_indent()
      cw.open_block()

      # unpack payload
      for v,t in cmd.iparams:
        cw.write('%s %s;' % (self.avr_typename(t), v))
      for v,t in cmd.iparams:
        cw.write('%s = UNPACK_%s(sc, payload);' % (v, t.name.upper()))

      # add debug message
      fmt_str = ','.join( self.avr_printf_fmt(t) for v,t in cmd.iparams )
      fmt_args = ', '.join( self.get_varname(v,t) for v,t in cmd.iparams )

      cw.write('DEBUG(0,"new order %s(%s) recvd"%s);'%(
                cmd.name, fmt_str,
                '' if fmt_args == '' else ','+fmt_args) )

      # call callback
      cbf = self.Function("stratcomm_callback_"+cmd.name,
        [ (self.get_varname(v,t), t) for v,t in cmd.iparams ],
        [ (self.get_varname(v,t), t) for v,t in cmd.oparams ] )
      cw.write('%s' % cbf.get_call())

      # pack response payload
      for v, t in cmd.oparams:
        cw.write('stratcomm_pushReturnPayload(sc, &%s, sizeof(%s));'
          % (self.get_varname(v, t), self.avr_typename(t)))

      cw.close_block()
      cw.write('break;')
      cw.write('')
      cw.dec_indent()

    # default case
    cw.write('default:')
    cw.inc_indent()
    cw.write('WARNING(STRATCOMM_ERROR,"Unrecognized message 0x%2.2X",mid);')
    cw.write('break;')
    cw.dec_indent()

    # close switch case
    cw.close_block()

    #close function declaration
    cw.write('return;')
    cw.close_block()

  def generate_command_callbacks_header(self, path):
    """ Generate callbacks prototypes """
    assert isinstance(self.device, SlaveDevice)

    cw = CodeWriter(path, True)
    cw.write_ext_includes(['aversive.h'])

    for cmd in self.device.messages_of_type(Command):
      if cmd.desc is None:
        cw.write('/** @brief Command callback function :  %s */' % cmd.desc)
      else:
        cw.write('/** @brief Command callback function :  %s */' % cmd.desc)
      cbf = self.Function("stratcomm_callback_%s"%cmd.name, cmd.iparams, cmd.oparams)
      cw.write(cbf.get_prototype()+';')
      cw.write('')

    cw.close()

  def generate_command_master_send_header(self, path):
    assert isinstance(self.device, MasterDevice)

    cw = CodeWriter(path)
    cw.write_ext_includes(['aversive.h'])
    cw.write_local_includes(['stratcomm.h'])

    for cmd in self.device.slave_commands():
      if cmd.desc:
        cw.write('/** @brief %s */' % cmd.desc)
      mf = self.Function("stratcomm_message_%s"%cmd.name,
          cmd.iparams, cmd.oparams, None, 'uint8_t')
      cw.write(mf.get_prototype()+';')
      cw.write('')

    cw.close()

  def generate_command_master_send_source(self, path):
    assert isinstance(self.device, MasterDevice)

    cw = CodeWriter(path)

    cw.write_ext_includes(['i2cm.h','aversive/error.h','aversive/wait.h','string.h'])
    cw.write_local_includes(['stratcomm_send.h'])

    cw.write('#define RECV_MAX_TRIES 20')
    cw.write('')

    for cmd in self.device.slave_commands():
      sbufsz = sum( self.avr_sizeof(t) for v,t in cmd.iparams )
      rbufsz = sum( self.avr_sizeof(t) for v,t in cmd.oparams )

      # write to file
      mf = self.Function("stratcomm_message_%s" % cmd.name, cmd.iparams, cmd.oparams, None, 'uint8_t')
      cw.write(mf.get_prototype())
      cw.open_block()
      cw.write('uint8_t buffer[%u];' % max(sbufsz+4, rbufsz+3))
      cw.write('buffer[0] = 0x%2.2x&0xFF;'%(sbufsz+1))
      cw.write('buffer[1] = (0x%2.2x>>8)&0xFF;'%(sbufsz+1))
      cw.write('buffer[2] = 0x%2.2x;'%(cmd.mid))
      pit = 3
      for v,t in cmd.iparams:
        cw.write('memcpy(buffer+%d, &%s, sizeof(%s));'%(pit, v, v))
        pit += self.avr_sizeof(t)
      cw.write('buffer[%d] = stratcomm_computeChecksum(buffer, %d);'%(pit, sbufsz+3))
      cw.write('i2cm_send(0x%2.2x, buffer, %d);'%(cmd.device.roid, sbufsz+4))

      if rbufsz > 0:
        cw.write('wait_ms(10);')
        cw.write('')
        cw.write('uint16_t size;')
        cw.write('uint8_t checksum, c_checksum, rv;')
        cw.write('rv = stratcomm_i2cm_recv(0x%2.2x, buffer, %d);' % (cmd.device.roid, rbufsz+3))
        cw.write('if(rv < %d)'%(rbufsz+3))
        cw.open_block()
        cw.write('WARNING(STRATCOMM_ERROR,"i2cm_recv returned %%d < %%d", rv, %d);'%(rbufsz+3))
        cw.write('return 0;')
        cw.close_block()

        cw.write('size = *((uint16_t*)buffer);')
        cw.write('if(size != %d)'%(rbufsz+1))
        cw.open_block()
        cw.write('WARNING(STRATCOMM_ERROR,"received frame size not valid: got %%u expected %%u", size, %d);'%(rbufsz+1))
        cw.write('return 0;')
        cw.close_block()

        cw.write('checksum = buffer[%d];'%(rbufsz+2))
        cw.write('c_checksum = stratcomm_computeChecksum(buffer,%d);'%(rbufsz+2))
        cw.write('if( checksum != c_checksum )')
        cw.open_block()
        cw.write('WARNING(STRATCOMM_ERROR,"received frame checksum not valid: got 0x%02X expected 0x%02X", c_checksum, checksum);')
        cw.write('return 0;')
        cw.close_block()

        pit = 2
        for v,t in cmd.oparams:
          cw.write('*%s = *(%s*)(buffer+%d);' % (v, self.avr_typename(t), pit))
          pit += self.avr_sizeof(t)

      cw.write('return 1;')
      cw.close_block()
      cw.write('')

    cw.close()

  def copy_slave_sources(self, path):
    assert isinstance(self.device, SlaveDevice)
    shutil.copy( os.path.join('src', self.slave_payload_header), path)
    shutil.copy( os.path.join('src', self.slave_stratcomm_header), path)
    shutil.copy( os.path.join('src', self.slave_stratcomm_source), path)

  def copy_master_sources(self, path):
    assert isinstance(self.device, MasterDevice)
    shutil.copy( os.path.join('src', self.master_stratcomm_header), path)
    shutil.copy( os.path.join('src', self.master_stratcomm_source), path)


  def generate_telemetry(self, dirpath):
    hpath = os.path.join(dirpath, self.telemetry_header)

    # instantiate codewriters for headers
    cw = CodeWriter(hpath,True)

    cw.write('#ifdef TELEMETRY_ACTIVE')
    cw.write('')

    telemetries = self.device.messages_of_type(Telemetry)

    # macros
    for msg in telemetries:
      mf = self.Function('TELEMETRY_'+msg.name, msg.params, [], rettype=None)
      cf = self.Function('telemetry_send_'+msg.name, msg.params, [])
      cw.write('#define %s %s'%(mf.get_macro(),cf.get_call()))

    cw.write('')

    # functions prototypes
    for msg in telemetries:
      f = self.Function('telemetry_send_'+msg.name, msg.params, [])
      cw.write(f.get_prototype()+';')

    cw.write('')
    cw.write('#else //TELEMETRY_ACTIVE')
    cw.write('')

    for msg in telemetries:
      mf = self.Function('TELEMETRY_'+msg.name, msg.params, [], rettype=None)
      cw.write('#define %s'%(mf.get_macro()))

    cw.write('')
    cw.write('#endif // TELEMETRY_ACTIVE')

    cw.write('')
    cw.close()

    # instantiate codewriters for source
    cpath = os.path.join(dirpath, self.telemetry_source)

    cw = CodeWriter(cpath)
    cw.write_ext_includes(['uart.h','string.h'])
    cw.write_local_includes(['telemetry.h','stratcomm.h'])
    cw.write('')

    for msg in telemetries:
      f = self.Function('telemetry_send_'+msg.name, msg.params, [])
      cw.write(f.get_prototype())
      cw.open_block()

      bufsz = sum( self.avr_sizeof(t) for v,t in msg.params )

      cw.write('uint8_t buffer[%u];'%(bufsz+6))
      cw.write('buffer[0] = 0xFF;')
      cw.write('buffer[1] = 0xFF;')
      cw.write('buffer[2] = 0x%2.2x&0xFF;'%(bufsz+1))
      cw.write('buffer[3] = (0x%2.2x>>8)&0xFF;'%(bufsz+1))
      cw.write('buffer[4] = 0x%2.2x;'%(msg.mid))
      pit = 5
      for v,t in msg.params:
        cw.write('memcpy(buffer+%d, &%s, sizeof(%s));' % (pit, v, v))
        pit += self.avr_sizeof(t)

      cw.write('buffer[%d] = stratcomm_computeChecksum(buffer+2, %d);' % (pit, bufsz+3))

      cw.write('uint8_t i;')
      cw.write('for(i=0;i<%d;i++)'%(bufsz+6))
      cw.open_block()
      cw.write('uart_send(%d,buffer[i]);'%(self.device.uartnum))
      cw.close_block()

      cw.close_block()
      cw.write('')

    cw.close()

