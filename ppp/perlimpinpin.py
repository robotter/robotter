#

class Robot:
  """ Describe robot """
  def __init__(self, devices):
    self.devices = devices
    # generate unique message IDs
    self.generate_message_ids()

  def generate_message_ids(self):
    unique_id = 0
    for device in self.devices:
      for message in device.messages:
        message.set_mid(unique_id)
        unique_id += 1

  def get_devices(self):
    return self.devices


class Device:
  """ Describe robot device (part of robot system) """

  def __init__(self, name, roid, messages=None, outdir=None):
    self.name = name
    self.roid = roid
    self.outdir = outdir
    self.messages = messages
    # assign device name to messages
    for m in self.messages:
      m.set_device_name(self.name)

class Message:
  """  """
  def __init__(self, name):
    self.name = name
    self.mid = None
    self.device_name = None

  def get_cname(self):
    return 'CM_'+self.device_name.upper()+'_'+self.name
  
  def set_device_name(self, name):
    self.device_name = name

  def get_mid(self):
    return self.mid

  def set_mid(self, mid):
    self.mid = mid

class Telemetry(Message):
  """ Describe telemetry message (from device to exterior) """  
  def __init__(self, name, payload):
    Message.__init__(self, name)


class Command(Message):
  """ Describe command message (from exterior to device) """
  def __init__(self, name, args, retvalue, text):
    Message.__init__(self, name)
    
    self.args = args
    # prefix return values with r_
    self.retvalue = [('r_'+n,t) for n,t in retvalue]
    self.text = text
