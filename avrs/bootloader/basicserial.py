import os
import termios
import fcntl
import struct


class BasicSerial(object):
  """
  Basic serial connection implementation.
  
  It is merely compatible with the pySerial implementation.
  """

  def __init__(self, port, baudrate=38400, bytesize=8, parity=None, stopbits=1):
    self.fd = os.open(port, os.O_RDWR|os.O_NOCTTY)
    self._baudrate = baudrate
    self._bytesize = bytesize
    self._parity = parity
    self._stopbits = stopbits
    self.configure_port()

  @property
  def baudrate(self):
    return self._baudrate

  @baudrate.setter
  def baudrate(self, baudrate):
    self._baudrate = baudrate
    self.configure_port()

  def configure_port(self):
    iflag, oflag, cflag, lflag, ispeed, ospeed, cc = termios.tcgetattr(self.fd)

    iflag &= ~(termios.INPCK|termios.ISTRIP|termios.INLCR|termios.IGNCR|termios.ICRNL|termios.IXON)
    oflag &= ~(termios.OPOST)
    cflag = (termios.CREAD|termios.CLOCAL)
    lflag = 0

    # baudrate
    try:
      ispeed = ospeed = getattr(termios, 'B%s' % self._baudrate)
    except AttributeError:
      raise ValueError("baudrate not supported")

    # bytesize
    cflag &= ~(termios.CSIZE)
    try:
      cflag |= {
          5: termios.CS5,
          6: termios.CS6,
          7: termios.CS7,
          8: termios.CS8,
          }[self._bytesize]
    except KeyError:
      raise ValueError("invalid bytesize: %r" % self._bytesize)

    # setup parity
    if self._parity in (None, 'N'):
      cflag &= ~(termios.PARENB|termios.PARODD)
    elif self._parity in (0, 'even', 'E'):
      cflag &= ~(termios.PARODD)
      cflag |=  (termios.PARENB)
    elif self._parity in (1, 'odd', 'O'):
      cflag |=  (termios.PARENB|termios.PARODD)
    else:
      raise ValueError("invalid parity: %r" % self._parity)

    # stopbits
    if self._stopbits == 1:
      cflag &= ~(termios.CSTOPB)
    elif self._stopbits == 2:
      cflag |=  (termios.CSTOPB)
    else:
      raise ValueError("invalid stopbits: %r" % self._stopbits)

    # no blocking, no timeout
    cc[termios.VMIN] = 1
    cc[termios.VTIME] = 0

    # activate settings
    termios.tcsetattr(self.fd, termios.TCSANOW, [iflag, oflag, cflag, lflag, ispeed, ospeed, cc])

  # required interface
  def read(self, size=1):
    return os.read(self.fd, size)
  def write(self, data):
    return os.write(self.fd, data)
  def fileno(self):
    return self.fd
  def inWaiting(self):
    s = fcntl.ioctl(self.fd, termios.FIONREAD, struct.pack('I', 0))
    return struct.unpack('I',s)[0]
  def flushInput(self):
    termios.tcflush(self.fd, termios.TCIFLUSH)
  def flushOutput(self):
    termios.tcflush(self.fd, termios.TCIOFLUSH)

