#!/usr/bin/python

import termios, sys, select, os, re, time

class TeapotApp:
  """Teapot application
  
    Teapot : Rob'Otter tip like application

  """
  # -- serial --
  filename="/dev/ttyUSB0"
  speed=9600
  output="/tmp/teapot"

  bufferSize = 2048;

  def __init__(self, _filename, _speed):
 
    # Manage program arguments
    if _filename is not None:
      self.filename = _filename

    if _speed is not None:
      self.speed = _speed

    # Save termios for stdout at startup
    self.saveLocalTermios()

    # Open serial line
    self.serial =  os.open(self.filename, os.O_RDWR | os.O_NDELAY)
    
    # Save termios for serial line
    self.saveSerialTermios()
    
  def main(self):


    # Set local & serial termios
    self.setSerialTermios()

    #
    while 1:
      
      # wait for data in either stdin or serial line
      rds,_,_ = select.select([self.serial,sys.stdin],[],[])
 
      # select was trigged by the serial line
      # transfer bytes to stdout
      if self.serial in rds :

        buffer = os.read( self.serial, self.bufferSize)
        os.write( sys.stdout.fileno(), buffer)

      # select was trigged by stdin
      # transfer bytes to serial line
      if sys.stdin in rds:
        buffer = os.read( sys.stdin.fileno(), self.bufferSize)
        os.write( self.serial, buffer)

    #! while 1

  def quit(self):
    self.restoreLocalTermios()
    self.restoreSerialTermios()
    os.close(self.serial)

  
  # -- tools --

  def getBaudRateFlag(self):

    print "DEBUG "+self.speed
    if self.speed == 0:
      return termios.B0
    if self.speed == 50:
      return termios.B50
    if self.speed == 75:
      return termios.B75
    if self.speed == 110:
      return termios.B110
    if self.speed == 134:
      return termios.B134
    if self.speed == 150:
      return termios.B150
    if self.speed == 200:
      return termios.B200
    if self.speed == 300:
      return termios.B300
    if self.speed == 600:
      return termios.B600
    if self.speed == 1200:
      return termios.B1200
    if self.speed == 1800:
      return termios.B1800
    if self.speed == 2400:
      return termios.B2400
    if self.speed == 4800:
      return termios.B4800
    if self.speed == 9600:
      return termios.B9600
    if self.speed == 19200:
      return termios.B19200
    if self.speed == 38400:
      return termios.B38400
    if self.speed == 57600:
      return termios.B57600
    if self.speed == 115200:
      return termios.B115200
    if self.speed == 230400:
      return termios.B230400
    if self.speed == 460800:
      return termios.B460800

    return termios.B9600

  # -- termios functions --
  
  def saveLocalTermios(self):
    """ Save local termios
    """
    self.savetio_local = termios.tcgetattr(sys.stdout)

  def restoreLocalTermios(self):
    """ Restore local termios
    """
    termios.tcsetattr(sys.stdout, termios.TCSANOW, self.savetio_local)

  def saveSerialTermios(self):
    """ Save serial termios
    """
    self.savetio_serial = termios.tcgetattr(self.serial)

  def restoreSerialTermios(self):
    """ Restore serial termios
    """
    termios.tcsetattr(sys.stdout,
                      termios.TCSANOW, self.savetio_serial)

  def setLocalTermios(self):
    """ Set local termios
    """
    
    # get current termios
    tio = termios.tcgetattr(self.serial)
    
    # do not translate carriage return to newline
    tio[0] = tio[0] & ~termios.ICRNL

    # various magic from tip
    tio[3] = 0
    tio[6][termios.VMIN] = 1
    tio[6][termios.VTIME] = 0

    # set new termios
    termios.tcsetattr(sys.stdout, termios.TCSANOW, tio)

  def setSerialTermios(self):
    """ Set serial termios for serial line
    """

    # get current termios
    tio = termios.tcgetattr(self.serial)

    # cflags :
    # CREAD - allow input
    # HUPCL - send hangup when the last process clone the tty
    tio[2] = termios.CREAD | termios.HUPCL
    # CS8 - 8 databits per serial frame
    tio[2] |= termios.CS8
    # baudrate
    tio[2] |= self.getBaudRateFlag()
      
    # cc :
    # And more magic from tip
    tio[6][termios.VMIN] = 1
    tio[6][termios.VTIME] = 0   

    # set new termios
    termios.tcsetattr(self.serial, termios.TCSANOW, tio)



if __name__ == '__main__':
  import optparse
  parser = optparse.OptionParser(usage="usage: %prog [options]")
  parser.add_option("-l","--serial",dest="serial", metavar="SERIAL",
                      help="use serial port SERIAL (default /dev/ttyUSB0)")
  parser.add_option("-s","--speed",dest="speed", metavar="SPEED",
                      help="set baud rate to SPEED (default 9600)")
  parser.add_option("-o","--output",dest="output", metavar="OUTPUT",
                      help="set output data file (default /tmp/teapot)")

  opts, args = parser.parse_args()

  app=TeapotApp(opts.serial,opts.speed)
  app.main()

  app.quit()
