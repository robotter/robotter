
import time, re, os

from perlimpinpin import Device, Telemetry, Command, Message
import robotter

class AVRCodeGenerator:
  
  command_process_filename = 'stratcomm_process.c'
  command_messages_filename = 'stratcomm_messages.h'
  command_callback_header_filename = 'stratcomm_callbacks.h'

  class CallbackFunction:
    
    def __init__(self, name, args, retvalues):
      self.name = name
      self.args = args
      self.retvalues = retvalues
    
    def get_call(self):
      cb_args = ', '.join(    [ v for v,t in self.args]
                            +[ '&'+v for v,t in self.retvalues])
      return 'stratcomm_callback_%s(%s);'%(self.name.lower(), cb_args)
    
    def get_prototype(self):
      dargs = ', '.join( [ '%s %s'%(t,v) for v,t in self.args ]
                      + [ '%s *%s'%(t,v) for v,t in self.retvalues])
      if dargs == '':
        dargs = 'void'

      return 'void stratcomm_callback_%s(%s);'%(self.name.lower(), dargs)

  def __init__(self, device):
    self.device = device
    
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
    self.generate_command_messages( os.path.join(self.outdir,
                                      self.command_messages_filename))
    self.generate_command_process( os.path.join(self.outdir,
                                      self.command_process_filename))
    self.generate_command_callbacks_header( os.path.join(self.outdir,
                                              self.command_callback_header_filename))

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
          f.write('#define %s 0x%4.4X\n'%(cmd.get_cname(), cmd.get_mid()))

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
      f.write('                     uint16_t mid,\n')
      f.write('                     uint8_t *payload)\n')
      f.write('{\n')

      # variables declarations
      decl = {}
      for cmd in self.device.messages:
        for vname, vtype in cmd.args + cmd.retvalue:
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
          cbf = self.CallbackFunction(cmd.name, 
            [ (self.get_var(v,t),t) for v,t in cmd.args],
            [ (self.get_var(v,t),t) for v,t in cmd.retvalue ] )
          f.write(' '*6+'%s\n'%(cbf.get_call()))

          # pack response payload
          for retname, rettype in cmd.retvalue:
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
          cbf = self.CallbackFunction(cmd.name, cmd.args, cmd.retvalue)
          f.write(cbf.get_prototype()+'\n\n')

      # print closing header guard
      f.write(guard[1])

