import os, termios, fcntl, struct

class BasicSerial:
  """Basic serial connection implementation."""

  def __init__(self, device, baudrate=38400, bytesize=8, parity=None, stopbits=1):
    self.fd = os.open(device, os.O_RDWR|os.O_NOCTTY)

    iflag, oflag, cflag, lflag, ispeed, ospeed, cc = termios.tcgetattr(self.fd)

    iflag &= ~(termios.INPCK|termios.ISTRIP|termios.INLCR|termios.IGNCR|termios.ICRNL|termios.IXON)
    oflag &= ~(termios.OPOST)
    cflag = (termios.CREAD|termios.CLOCAL)
    lflag = 0

    # baudrate
    try:
      ispeed = ospeed = getattr(termios, 'B%s' % baudrate)
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
          }[bytesize]
    except KeyError:
      raise ValueError("invalid bytesize: %r" % bytesize)

    # setup parity
    if parity is None:
      cflag &= ~(termios.PARENB|termios.PARODD)
    elif parity == 0 or parity == 'even':
      cflag &= ~(termios.PARODD)
      cflag |=  (termios.PARENB)
    elif parity == 1 or parity == 'odd':
      cflag |=  (termios.PARENB|termios.PARODD)
    else:
      raise ValueError("invalid parity: %r" % parity)

    # stopbits
    if stopbits == 1:
        cflag &= ~(termios.CSTOPB)
    elif stopsbits == 2:
        cflag |=  (termios.CSTOPB)
    else:
      raise ValueError("invalid stopbits: %r" % stopbits)

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

  def readlineCR(self):
    s = ""
    while 1:
      c = os.read(self.fd, 1)
      if c == '\r':
        return s
      s = s+c

  def getfd(self):
    return self.fd

  def flushInput(self):
    termios.tcflush(self.fd, termios.TCIFLUSH)

  def flushOutput(self):
    termios.tcflush(self.fd, termios.TCIOFLUSH)

