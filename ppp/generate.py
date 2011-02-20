#!/usr/bin/env python

import configuration.config
import generators.avrs

if __name__ == '__main__':
  
  for device in configuration.config.robot.devices:
    print "Generating device",device.name
    a = generators.avrs.AVRCodeGenerator(device)
    a.generate()

