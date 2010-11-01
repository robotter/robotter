
import time, re

from perlimpinpin import Device, Telemetry, Command, Message
import robotter

class AVRCodeGenerator:
  
  command_process_filename = 'command_process.c'
  command_messages_filename = 'command_messages.h'

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

  def generate(self):
    """ Generate all files """
    self.generate_command_messages(self.outdir + '/' + self.command_messages_filename)   

  def generate_command_messages(self, path):
    """ Generate orders ID defines """

    with open(path,'w') as f:
      
      filename = path.split('/')[-1]
      guard = self.build_header_guard(filename)

      # print copyright and source header
      f.write(robotter.copyright)
      f.write(robotter.file_header%{'filename':filename,
                                    'date':time.asctime()})
      # print opening header guard
      f.write(guard[0])
      
      print self.device.messages
      print f
      for cmd in self.device.messages:
        print cmd
        print f
        f.write('loutre\n')

      # print closing header guard
      f.write(guard[1])


  def generate_command_process(self, filename):
    pass
    

