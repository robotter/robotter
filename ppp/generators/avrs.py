
import time, re, os, shutil

from configuration.perlimpinpin import MasterDevice, SlaveDevice, Telemetry, Command, Message
import generators.robotter

class CodeWriter:
  def __init__(self, path, is_header=False):
    self.f = open(path,'wb')
    self.indent = 0
    self.is_header = is_header
    filename = os.path.split(path)[-1]

    self.write(generators.robotter.copyright)
    self.write(generators.robotter.file_header%{'filename':filename,
                                         'date':time.asctime()})
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
    self.indent -= 1
    if self.indent < 0:
      self.indent = 0

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
    s = re.sub(r'[^A-Z_]','_',filename.upper())
    pre =  '#ifndef ' + s + '\n'
    pre += '#define ' + s + '\n'
    post = '#endif/*' + s + '*/\n'
    return (pre,post)

  def close(self):
    if self.is_header:
      self.write(self.guard[1])
    self.write('\n')
    
class AVRCodeGenerator:
  
  sizeof_avr_types = { 'uint8_t':1, 'int8_t':1,
                   'uint16_t':2, 'int16_t':2,
                   'uint32_t':4, 'int32_t':4 }

  format_strings = { 'int32_t':'%ld', 'uint32_t':'%lu',
                    'int16_t':'%d', 'uint16_t':'%u',
                    'uint8_t':'0x%02X' }

  type_prefixs = {'int32_t':'i32', 'uint32_t':'u32',
                  'int16_t':'i16', 'uint16_t':'u16',
                  'uint8_t':'u8'}

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
      self.args = args
      self.retvalues = retvalues
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
      args += [ v for v,t in self.args]
      args += [ '&'+v for v,t in self.retvalues]
      cb_args = ', '.join(args)
      return '%s(%s);'%(self.name.lower(), cb_args)
    
    def get_macro(self):
      args = []
      args += [ '%s'%(v) for v,t in self.args ]
      dargs = ', '.join(args)
      return '%s(%s)'%(self.name.upper(), dargs)

    def get_prototype(self, semicolon=True):
      if self.thistype is not None:
        args = [ '%s *%s'%(self.thistype, self.thisarg) ]
      else:
        args = []
      args += [ '%s %s'%(t,v) for v,t in self.args ]
      args += [ '%s *%s'%(t,v) for v,t in self.retvalues]
      dargs = ', '.join(args)
      if dargs == '':
        dargs = 'void'
      if semicolon:
        sc = ';'
      else:
        sc = ''
      return '%s %s(%s)%s'%(self.rettype, self.name.lower(), dargs, sc)

  def __init__(self, robot, device):
    self.device = device
    self.robot = robot
    if device.outdir is None:
      self.outdir = '.'
    else:
      self.outdir = device.outdir

  def get_varname(self, vname, vtype):
    if vtype in self.type_prefixs:
      return self.type_prefixs[vtype]+'_'+vname
    else:
      return 'v_'+name

  def get_format_string(self, vtype):
    if vtype in self.format_strings:
      return self.format_strings[vtype]
    else:
      return '0x%02X'

  def get_message_cname(self, message):
    return 'CM_'+message.device_name.upper()+'_'+message.name

  def generate(self):
    """ Generate all files """

    # telemetry files
    self.generate_telemetry(self.outdir)

    # i2c messaging files
    if isinstance(self.device, SlaveDevice):
      self.generate_command_messages( os.path.join(self.outdir,
                                        self.command_messages_filename) )
      self.generate_command_process( os.path.join(self.outdir,
                                        self.command_process_filename) )
      self.generate_command_callbacks_header( os.path.join(self.outdir,
                                                self.command_callback_header_filename) )
      self.copy_slave_sources(self.outdir)

    elif isinstance(self.device, MasterDevice):

      self.generate_command_master_send_header(os.path.join(self.outdir,
                                      self.command_master_send_header) )
      self.generate_command_master_send_source(os.path.join(self.outdir,
                                      self.command_master_send_source) )
      self.copy_master_sources(self.outdir)

  def generate_command_messages(self, path):
    """ Generate orders ID defines """

    cw = CodeWriter(path,True)

    cw.write('#define STRATCOMM_I2C_ADDRESS 0x%2.2X'%(self.device.roid))

    cw.write('')

    for cmd in self.device.messages:
      if isinstance(cmd,Command):
        cw.write('#define %s 0x%2.2X'%(self.get_message_cname(cmd), cmd.mid))
    cw.close()

  def generate_command_process(self, path):
    """ Generate command processing """

    cw = CodeWriter(path)
    
    # includes
    cw.write_ext_includes(['aversive/error.h'])
    cw.write_local_includes(['stratcomm.h','stratcomm_messages.h',
                              'stratcomm_payloads.h',
                              'stratcomm_callbacks.h'])

    # function declaration
    cw.write('void stratcomm_process(stratcomm_t *sc,')
    cw.write('                        uint8_t mid,')
    cw.write('                        uint8_t *payload)')
    
    cw.open_block()

    # variables declarations
    decl = {}
    for cmd in self.device.messages:
      if isinstance(cmd, Command):
        for vname, vtype in cmd.args + cmd.retvalues:
          vname = self.get_varname(vname,vtype)
          if vtype in decl.keys():
            decl[vtype].append(vname)
          else:
            decl[vtype] = [vname]
    
    # write variables declarations
    for vtype, vnames in decl.iteritems():
      cw.write('%s %s;'%(vtype, ', '.join(set(vnames))))
    cw.write('')

    # open switch case
    cw.write('switch(mid)')
    cw.open_block()
    
    for cmd in self.device.messages:
      if isinstance(cmd,Command):
        cw.write('// %s : %s'%(cmd.name,cmd.text))
        cw.write('case %s:'%(self.get_message_cname(cmd)))
        cw.inc_indent()
        # unpack payload
        for argname, argtype in cmd.args:
          cw.write('%s = UNPACK_%s(sc, payload);'%(
                    self.get_varname(argname,argtype),
                    argtype.rstrip('_t').upper()))
        
        # add debug message
        fmt_str = ','.join([ self.get_format_string(t) for v,t in cmd.args])
        fmt_args = ', '.join([ self.get_varname(v,t) for v,t in cmd.args ])

        cw.write('DEBUG(0,"new order %s(%s) recvd"%s);'%(
                  cmd.name, fmt_str,
                  '' if fmt_args == '' else ','+fmt_args) )

        # call callback
        cbf = self.Function("stratcomm_callback_"+cmd.name,
          [ (self.get_varname(v,t),t) for v,t in cmd.args],
          [ (self.get_varname(v,t),t) for v,t in cmd.retvalues ] )
        cw.write('%s'%(cbf.get_call()))

        # pack response payload
        for retname, rettype in cmd.retvalues:
          cw.write('stratcomm_pushReturnPayload(sc, PACK_%s(%s), sizeof(%s));'%(
                    rettype.rstrip('_t').upper(), self.get_varname(retname,rettype), rettype))
        
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
    cw = CodeWriter(path, True)

    cw.write_ext_includes(['aversive.h'])
    
    for cmd in self.device.messages:
      if isinstance(cmd,Command):
        cw.write('/** @brief Command callback function :  %s */'%(cmd.text))
        cbf = self.Function("stratcomm_callback_"+cmd.name, cmd.args, cmd.retvalues)
        cw.write(cbf.get_prototype())
        cw.write('')

    cw.close()

  def generate_command_master_send_header(self, path):
    """  """
    cw = CodeWriter(path)
    cw.write_ext_includes(['aversive.h'])
    cw.write_local_includes(['stratcomm.h'])
    
    for cmd in self.robot.get_master_messages():
      if isinstance(cmd,Command):
        cw.write('/** @brief %s */'%(cmd.text))
        mf = self.Function("stratcomm_message_"+cmd.name, cmd.args, cmd.retvalues, ('stratcomm_t','sc'), 'uint8_t')
        cw.write(mf.get_prototype())
        cw.write('')

    cw.close()

  def generate_command_master_send_source(self, path):
    """  """
    cw = CodeWriter(path)

    cw.write_ext_includes(['i2cm.h','aversive/error.h','aversive/wait.h','string.h'])
    cw.write_local_includes(['stratcomm_send.h'])

    cw.write('#define RECV_MAX_TRIES 20')

    for cmd in self.robot.get_master_messages():
      if isinstance(cmd,Command):
        
        # prepare messages
        sbufsz = 0
        for argv, argtype in cmd.args:
          if argtype in self.sizeof_avr_types.keys():
            sbufsz += self.sizeof_avr_types[argtype]
          else:
            raise Exception("Can't find sizeof(%s)"%(argtype))

        rbufsz = 0
        for argv, argtype in cmd.retvalues:
          if argtype in self.sizeof_avr_types.keys():
            rbufsz += self.sizeof_avr_types[argtype]
          else:
            raise Exception("Can't find sizeof(%s)"%(argtype))

        # write to file
        mf = self.Function("stratcomm_message_"+cmd.name, cmd.args, cmd.retvalues, ('stratcomm_t','sc'), 'uint8_t')
        cw.write(mf.get_prototype(semicolon=False))
        cw.open_block()
        cw.write('uint8_t buffer[255];')
        cw.write('buffer[0] = 0x%2.2x&0xFF;'%(sbufsz+1))
        cw.write('buffer[1] = (0x%2.2x>>8)&0xFF;'%(sbufsz+1))
        cw.write('buffer[2] = 0x%2.2x;'%(cmd.mid))
        pit = 3
        for argv, argtype in cmd.args:
          cw.write('memcpy(buffer+%d, &%s, sizeof(%s));'%(pit,argv,argtype))
          pit += self.sizeof_avr_types[argtype]
        cw.write('buffer[%d] = stratcomm_computeChecksum(buffer, %d);'%(
                    sbufsz + 3, sbufsz+3))
        cw.write('i2cm_send(0x%2.2x, buffer, %d);'%(cmd.addr,sbufsz+4))

        if rbufsz > 0:
          cw.write('wait_ms(10);')
          cw.write('')
          cw.write('uint16_t size;')
          cw.write('uint8_t checksum, c_checksum, rv;')
          cw.write('rv = stratcomm_i2cm_recv(0x%2.2x, buffer, %d);'%(
                   cmd.addr, rbufsz+3))
          cw.write('if(rv < %d)'%(rbufsz+3))
          cw.open_block()
          cw.write('WARNING(STRATCOMM_ERROR,"i2cm_recv returned %%d < %%d", rv, %d);'%(rbufsz+3))
          cw.write('return 0;')
          cw.close_block()

          cw.write('size = *((uint16_t*)buffer);')
          cw.write('if(size != %d)'%(rbufsz+1))
          cw.open_block()
          cw.write('WARNING(STRATCOMM_ERROR,"received frame size not valid: got %%u expect %%u", size, %d);'%(rbufsz+1))
          cw.write('return 0;')
          cw.close_block()

          cw.write('checksum = (uint8_t)buffer[%d];'%(rbufsz+2))
          cw.write('c_checksum = stratcomm_computeChecksum(buffer,%d);'%(rbufsz+2))
          cw.write('if( checksum != c_checksum )')
          cw.open_block()
          cw.write('WARNING(STRATCOMM_ERROR,"received frame checksum not valid: got 0x%02X expect 0x%02X", c_checksum, checksum);')
          cw.write('return 0;')
          cw.close_block()
          
          pit = 2
          for argv, argtype in cmd.retvalues:
            cw.write('*%s = *(%s*)(buffer+%d);'%(argv,argtype,pit))
            pit += self.sizeof_avr_types[argtype]

        cw.write('return 1;')
        cw.close_block()
  
    cw.close()

  def copy_slave_sources(self, path):
    shutil.copy( os.path.join('src', self.slave_payload_header), path)
    shutil.copy( os.path.join('src', self.slave_stratcomm_header), path)
    shutil.copy( os.path.join('src', self.slave_stratcomm_source), path)

  def copy_master_sources(self, path):
    shutil.copy( os.path.join('src', self.master_stratcomm_header), path)
    shutil.copy( os.path.join('src', self.master_stratcomm_source), path)
   

  def generate_telemetry(self, dirpath):
    hpath = os.path.join(dirpath, self.telemetry_header)

    # instanciate codewriters for headers
    cw = CodeWriter(hpath,True)
    
    cw.write('#ifdef TELEMETRY_ACTIVE')
    cw.write('')

    # macros
    for msg in self.device.messages:
      if isinstance(msg,Telemetry):
        mf = self.Function('TELEMETRY_'+msg.name, msg.payload, [], rettype=None)
        cf = self.Function('telemetry_send_'+msg.name, msg.payload, [])
        cw.write('#define %s %s'%(mf.get_macro(),cf.get_call()))

    cw.write('')

    # functions prototypes
    for msg in self.device.messages:
      if isinstance(msg,Telemetry):
        f = self.Function('telemetry_send_'+msg.name, msg.payload, [])
        cw.write(f.get_prototype())
    
    cw.write('')
    cw.write('#else //TELEMETRY_ACTIVE')
    cw.write('')

    for msg in self.device.messages:
      if isinstance(msg,Telemetry):
        mf = self.Function('TELEMETRY_'+msg.name, msg.payload, [], rettype=None)
        cw.write('#define %s'%(mf.get_macro()))


    cw.write('')
    cw.write('#endif // TELEMETRY_ACTIVE')

    cw.write('')
    cw.close()

    # instanciate codewriters for source
    cpath = os.path.join(dirpath, self.telemetry_source)

    cw = CodeWriter(cpath)
    cw.write_ext_includes(['uart.h','string.h'])
    cw.write_local_includes(['telemetry.h','stratcomm.h'])
    cw.write('')

    for msg in self.device.messages:
      if isinstance(msg,Telemetry):
        f = self.Function('telemetry_send_'+msg.name, msg.payload, [])
        cw.write(f.get_prototype(False))
        cw.open_block()

        bufsz = 0
        for argv, argtype in msg.payload:
          if argtype in self.sizeof_avr_types.keys():
            bufsz += self.sizeof_avr_types[argtype]
          else:
            raise Exception("Can't find sizeof(%s)"%(argtype))
        
        cw.write('uint8_t buffer[255];')
        cw.write('buffer[0] = 0xFF;')
        cw.write('buffer[1] = 0xFF;')
        cw.write('buffer[2] = 0x%2.2x&0xFF;'%(bufsz+1))
        cw.write('buffer[3] = (0x%2.2x>>8)&0xFF;'%(bufsz+1))
        cw.write('buffer[4] = 0x%2.2x;'%(msg.mid))
        pit = 5
        for argv, argtype in msg.payload:
          cw.write('memcpy(buffer+%d, &%s, sizeof(%s));'%(pit,argv,argtype))
          pit += self.sizeof_avr_types[argtype]

        cw.write('buffer[%d] = stratcomm_computeChecksum(buffer+2, %d);'%(
                  pit, bufsz+3))
        
        cw.write('uint8_t i;')
        cw.write('for(i=0;i<%d;i++)'%(bufsz+6))
        cw.open_block()
        cw.write('uart_send(%d,buffer[i]);'%(self.device.uartnum))
        cw.close_block()

        cw.close_block()
        cw.write('')

    cw.close()

