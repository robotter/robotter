#

class Robot:
  """ Describe robot """
  def __init__(self, devices):
    self.devices = devices
    # generate unique message IDs
    self.setup_messages()
    
    self.master_messages = []
    for device in self.devices:
      if isinstance(device, SlaveDevice):
        self.master_messages += device.messages

  def setup_messages(self):
    unique_id = 0
    for device in self.devices:
      if isinstance(device, SlaveDevice):
        for message in device.messages:
          message.set_mid(unique_id)
          unique_id += 1

  def get_devices(self):
    return self.devices

  def get_master_messages(self):
    return self.master_messages

class Device:
  """ Describe robot device (part of robot system) """
  def __init__(self, name, roid, outdir=None):
    self.name = name
    self.roid = roid
    self.outdir = outdir

class SlaveDevice(Device):
  def __init__(self, name, roid, messages=None, outdir=None):
    Device.__init__(self, name, roid, outdir)
    self.messages = messages
    # assign device name and device address to messages
    for m in self.messages:
      m.set_device_name(self.name)
      m.set_address(self.roid)

class MasterDevice(Device):
  pass

class Message:
  """  """
  def __init__(self, name):
    self.name = name
    self.mid = None
    self.device_name = None
    self.addr = None

  def get_cname(self):
    return 'CM_'+self.device_name.upper()+'_'+self.name
  
  def set_device_name(self, name):
    self.device_name = name

  def get_mid(self):
    return self.mid

  def set_mid(self, mid):
    self.mid = mid

  def set_address(self, addr):
    self.addr = addr

  def get_address(self):
    return self.addr

class Telemetry(Message):
  """ Describe telemetry message (from device to exterior) """  
  def __init__(self, name, payload):
    Message.__init__(self, name)


class Command(Message):
  """ Describe command message (from exterior to device) """
  def __init__(self, name, args, retvalues, text):
    Message.__init__(self, name)
    
    self.args = args
    # prefix return values with r_
    self.retvalues = [('r_'+n,t) for n,t in retvalues]
    self.text = text
