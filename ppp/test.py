
import configuration
import avrs

if __name__ == '__main__':
  
  for device in configuration.robot.get_devices():
    a = avrs.AVRCodeGenerator(configuration.robot, device)
    a.generate()
