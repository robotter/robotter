
import time, re, os, shutil

from perlimpinpin import MasterDevice, SlaveDevice, Telemetry, Command, Message
import robotter

class AVRCodeGenerator:
  
  sizeof_avr_types = { 'uint8_t':1, 'int8_t':1,
                   'uint16_t':2, 'int16_t':2,
                   'uint32_t':4, 'int32_t':4 }

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

  def build_header_guard(self, filename):
    s = re.sub(r'[^A-Z_]','_',filename.upper())
    pre =  '#ifndef ' + s + '\n'
    pre += '#define ' + s + '\n'
    post = '#endif/*' + s + '*/\n'
    return (pre,post)

  def get_format_string(self, vtype):
    if vtype == 'int32_t':
      return '%ld'
    elif vtype == 'uint32_t':
      return '%lu'
    elif vtype == 'int16_t':
      return '%d'
    elif vtype == 'uint16_t':
      return '%u'
    elif vtype == 'uint8_t':
      return '0x%2.2X'
    else:
      return '%d'

  def get_var(self, vname, vtype):
    c = 'v'
    if vtype == 'int32_t':
      c = 'i32'
    elif vtype == 'uint32_t':
      c = 'u32'
    elif vtype == 'int16_t':
      c = 'i16'
    elif vtype == 'uint16_t':
      c = 'u16'
    elif vtype == 'uint8_t':
      c = 'u8'
    return vname+'_'+c

  def generate(self):
    """ Generate all files """

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

    with open(path,'wb') as f:
      
      filename = path.split('/')[-1]
      guard = self.build_header_guard(filename)

      # print copyright and source header
      f.write(robotter.copyright)
      f.write(robotter.file_header%{'filename':filename,
                                    'date':time.asctime()})
      # print opening header guard
      f.write(guard[0])
      
      for cmd in self.device.messages:
        if isinstance(cmd,Command):
          f.write('#define %s 0x%2.2X\n'%(cmd.get_cname(), cmd.get_mid()))

      # print closing header guard
      f.write(guard[1])


  def generate_command_process(self, path):
    """ Generate command processing """

    with open(path,'wb') as f:
      
      filename = path.split('/')[-1]

      # print copyright and source header
      f.write(robotter.copyright)
      f.write(robotter.file_header%{'filename':filename,
                                    'date':time.asctime()})
      # prototype include
      f.write('\n')
      f.write('#include <aversive/error.h>\n')
      f.write('#include \"stratcomm.h\"\n')
      f.write('#include \"stratcomm_messages.h\"\n')
      f.write('#include \"stratcomm_payloads.h\"\n')
      f.write('#include \"stratcomm_callbacks.h\"\n')
      f.write('\n')
      # function declaration
      f.write('void stratcomm_process(stratcomm_t *sc,\n')
      f.write('                     uint8_t mid,\n')
      f.write('                     uint8_t *payload)\n')
      f.write('{\n')

      # variables declarations
      decl = {}
      for cmd in self.device.messages:
        for vname, vtype in cmd.args + cmd.retvalues:
          vname = self.get_var(vname,vtype)
          if vtype in decl.keys():
            decl[vtype].append(vname)
          else:
            decl[vtype] = [vname]
 
      for vtype, vnames in decl.iteritems():
        f.write('  %s %s;\n'%(vtype, ', '.join(set(vnames))))
      f.write('\n')

      # open switch case
      f.write('  switch(mid)\n  {\n')
      
      for cmd in self.device.messages:
        if isinstance(cmd,Command):
          f.write('    // %s : %s\n'%(cmd.name,cmd.text))
          f.write('    case %s:\n'%(cmd.get_cname()))
          
          # unpack payload
          for argname, argtype in cmd.args:
            f.write(' '*6+'%s = UNPACK_%s(sc, payload);\n'%(
                      self.get_var(argname,argtype),
                      argtype.rstrip('_t').upper()))
          
          # add debug message
          fmt_str = ','.join([ self.get_format_string(t) for v,t in cmd.args])
          fmt_args = ', '.join([ self.get_var(v,t) for v,t in cmd.args ])

          f.write(' '*6+'DEBUG(0,\"new order %s(%s) recvd\"%s);\n'%(
                    cmd.name, fmt_str,
                    '' if fmt_args == '' else ','+fmt_args) )

          # call callback
          cbf = self.Function("stratcomm_callback_"+cmd.name,
            [ (self.get_var(v,t),t) for v,t in cmd.args],
            [ (self.get_var(v,t),t) for v,t in cmd.retvalues ] )
          f.write(' '*6+'%s\n'%(cbf.get_call()))

          # pack response payload
          for retname, rettype in cmd.retvalues:
            f.write(' '*6+'stratcomm_pushReturnPayload(sc, PACK_%s(%s), sizeof(%s));\n'%(
                      rettype.rstrip('_t').upper(), self.get_var(retname,rettype), rettype))
          
          f.write(' '*6+'break;\n')
          f.write('\n')
          
      # default case
      f.write(' '*4+'default:\n')
      f.write(' '*6+'WARNING(STRATCOMM_ERROR,\"Unrecognized message 0x%2.2X\",mid);\n')
      f.write(' '*6+'break;\n')

      # close switch case
      f.write('  }//switch(mid)\n')
      
      #close function declaration
      f.write('  return;\n}\n')


  def generate_command_callbacks_header(self, path):
    """ Generate callbacks prototypes """
    with open(path, 'wb') as f:

      filename = path.split('/')[-1]
      guard = self.build_header_guard(filename)
      
      f.write(robotter.copyright)
      f.write(robotter.file_header%{'filename':filename,
                                     'date':time.asctime()})
      # print opening header guard
      f.write(guard[0])
      f.write('\n')
      f.write('#include <aversive.h>\n')
      f.write('\n')
      
      for cmd in self.device.messages:
        if isinstance(cmd,Command):
          f.write('/** @brief Command callback function :  %s */\n'%(cmd.text))
          cbf = self.Function("stratcomm_callback_"+cmd.name, cmd.args, cmd.retvalues)
          f.write(cbf.get_prototype()+'\n\n')

      # print closing header guard
      f.write(guard[1])

  def generate_command_master_send_header(self, path):
    """  """
    with open(path, 'wb') as f:
      filename = path.split('/')[-1]
      guard = self.build_header_guard(filename)

      f.write(robotter.copyright)
      f.write(robotter.file_header%{'filename':filename,
                                    'date':time.asctime()})
      # print opening header guard
      f.write(guard[0])
      f.write('\n#include <aversive.h>\n')
      f.write('#include "stratcomm.h"\n')
        
      for cmd in self.robot.get_master_messages():
        if isinstance(cmd,Command):
          f.write('/** */\n')
          mf = self.Function("stratcomm_message_"+cmd.name, cmd.args, cmd.retvalues, ('stratcomm_t','sc'), 'uint8_t')
          f.write(mf.get_prototype()+'\n')

      # print closing header guard
      f.write(guard[1])


  def generate_command_master_send_source(self, path):
    """  """
    with open(path, 'wb') as f:
      filename = path.split('/')[-1]
      
      f.write(robotter.copyright)
      f.write(robotter.file_header%{'filename':filename,
                                    'date':time.asctime()})
      f.write('\n')
      f.write('#include <i2cm.h>\n')
      f.write('#include <aversive/error.h>\n')
      f.write('#include <string.h>\n')
      f.write('#include \"stratcomm_send.h\"\n')
      f.write('\n')
      f.write('#define PAYLOAD_PUSH(buffer, value, sz) memcpy((buffer)+(pos), &(value), (sz))\n')
      f.write('\n')
      f.write('#define RECV_MAX_TRIES 20')
      f.write('\n')
      f.write('  uint8_t buffer[255];\n')
      f.write('\n')

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
          f.write('\n')
          mf = self.Function("stratcomm_message_"+cmd.name, cmd.args, cmd.retvalues, ('stratcomm_t','sc'), 'uint8_t')
          f.write(mf.get_prototype(semicolon=False)+'\n')
          f.write('{\n')
          f.write('  buffer[0] = 0x%2.2x&0xFF;\n'%(sbufsz+2))
          f.write('  buffer[1] = (0x%2.2x>>8)&0xFF;\n'%(sbufsz+2))
          f.write('  buffer[2] = 0x%2.2x;\n'%(cmd.mid))
          pit = 3
          for argv, argtype in cmd.args:
            f.write('  memset(buffer+%d, %s, sizeof(%s));\n'%(pit,argv,argtype))
            pit += self.sizeof_avr_types[argtype]
          f.write('  buffer[%d] = stratcomm_computeChecksum(buffer+2, %d);\n'%(
                      sbufsz + 3, sbufsz+1))
          f.write('  i2cm_send(0x%2.2x, buffer, %d);\n'%(cmd.get_address(),sbufsz+4))
          f.write('\n')
          if rbufsz > 0:
            f.write('  uint16_t size;\n')
            f.write('  uint8_t checksum, c_checksum, rv;\n')
            f.write('  rv = stratcomm_i2cm_recv(0x%2.2x, buffer, %d);\n'%(
                      cmd.get_address(), rbufsz+3))
            f.write('  if(rv < %d)\n'%(rbufsz+3))
            f.write('    return 0;\n')
            f.write('  size = *((uint16_t*)buffer);\n')
            f.write('  if(size != %d)\n'%(rbufsz))
            f.write('  {\n')
            f.write('    WARNING(STRATCOMM_ERROR,\n')
            f.write('             "received frame size not valid: got %d expect %d",\n')
            f.write('             size, %d);\n'%(rbufsz))
            f.write('    return 0;\n')
            f.write('  }\n')
            f.write('  checksum = (uint8_t)buffer[%d];\n'%(rbufsz+2))
            f.write('  c_checksum = stratcomm_computeChecksum(buffer+2,%d);\n'%(rbufsz))
            f.write('  if( checksum != c_checksum )\n')
            f.write('  {\n')
            f.write('    WARNING(STRATCOMM_ERROR,\n')
            f.write('             "received frame checksum not valid: got 0x%02X expect 0x%02X",\n')
            f.write('             c_checksum, checksum);\n')
            f.write('    return 0;\n')
            f.write('  }\n')
            for argv, argtype in cmd.retvalues:
              f.write('  *%s = *(%s*)(buffer+%d);\n'%(argv,argtype,pit))
              pit += self.sizeof_avr_types[argtype]
          f.write('  return 1;\n')
          f.write('}\n')

  def copy_slave_sources(self, path):
    shutil.copy( os.path.join('src', self.slave_payload_header), path)
    shutil.copy( os.path.join('src', self.slave_stratcomm_header), path)
    shutil.copy( os.path.join('src', self.slave_stratcomm_source), path)

  def copy_master_sources(self, path):
    shutil.copy( os.path.join('src', self.master_stratcomm_header), path)
    shutil.copy( os.path.join('src', self.master_stratcomm_source), path)
   
