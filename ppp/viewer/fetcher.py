from struct import unpack
from time import time

from basicSerial import BasicSerial
from threading import Thread
import configuration.config as config

from configuration.perlimpinpin import Telemetry
from generators.avrs import AVRCodeGenerator

class TelemetryFetcher(Thread):

  def __init__(self, device, baudrate=38400):
    Thread.__init__(self)
    self.bs = BasicSerial(device, baudrate)
    self.callback = None
    self.running = True

  def parse_message(self, data):
    mid = ord(data[0])
    for device in config.robot.devices:
      for msg in device.messages:
        if isinstance(msg,Telemetry):
          if mid == msg.mid:
            # build pack format string
            vnames = []
            fmt = AVRCodeGenerator.pack_endian
            for argname, argtype in  msg.payload:
              vnames.append(argname)
              fmt += AVRCodeGenerator.pack_fmt[argtype]
            values = unpack( fmt, ''.join(data[1:]))
            if self.callback:
              self.callback({'device':device,
                              'message':msg,
                              'date':time(),
                              'values':zip(vnames,values)})

  def run(self):
    state = 0
    ll = ''
    sz = None
    while self.running:
      frame = self.bs.read(1024)
      for c in frame:
        # header
        if state == 0 or state == 1:
          if c == '\xFF':
            state += 1
          else:
            state = 0
        # length (low byte)
        elif state == 2:
          ll = ord(c)
          state += 1
        # length (hi byte)
        elif state == 3:
          lh = ord(c)
          sz = ll + lh*256
          state += 1
          data = []
        # data
        elif state == 4:
          data.append(c)
          if len(data) >= sz:
            state += 1
        # check sum
        elif state == 5:
          chksum = ord(c)
          # if checksum is correct
          if chksum == (sum([ord(c) for c in data])+lh+ll)%256:
            self.parse_message(data)
          state = 0

  def quit(self):
    self.running = False
