
import configuration.config
import generators.avrs

if __name__ == '__main__':
  
  for device in configuration.config.robot.get_devices():
    print "Generating device",device.name
    a = generators.avrs.AVRCodeGenerator(configuration.config.robot, device)
    a.generate()
