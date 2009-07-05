#!python

import socket, struct, sys, time


if __name__ == "__main__":
  import optparse
  parser = optparse.OptionParser(
      usage='usage: %prog [opts]'
      )
  parser.add_option('-n', '--hostname', dest='host',
      help="server hostname (default: localhost)")
  parser.add_option('-p', '--port', dest='port', type='int',
      help="server port (default: 9999)")
  parser.set_defaults(
      host = 'localhost',
      port = 9999
      )
  opts, args = parser.parse_args()

  # Connect to server
  sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  sock.connect((opts.host, opts.port))
  fp = sock.makefile('r')
  print >>sys.stderr, "Connected to %s:%d" % (opts.host, opts.port)

  # Wait for beginning of data
  while fp.readline() != "DATA\n": pass

  print >>sys.stderr, "Start acquisition"

  # Receive data from the server and shut down
  fmt = '6i3Bxh3h3i'
  fmt_size = struct.calcsize(fmt)
  # element format: ( time, adns[6], squals[3], compass, pwm[3], heds[3] )
  data = []
  while True:
    s = fp.read(fmt_size)
    if s is None or len(s) != fmt_size:
      break # end of data
    a = struct.unpack(fmt, s)
    d = ( time.time(), a[0:6], a[6:9], a[9], a[10:13], a[13:16] )
    print "%f %s" % (time.time(), ' '.join(str(x) for x in a))
    data.append(d)

  sock.close()


