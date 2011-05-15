#!/usr/bin/python

from basicSerial import BasicSerial as BS
import matplotlib
import matplotlib.pyplot as plt
from scipy import array,dot
import scipy, scipy.linalg, time
from math import cos,sin,radians
from scipy.constants import pi

class Robot:
  def __init__(self, M, pM):
    self.xm = 0
    self.ym = 0
    self.am = 0
    self.xsm = []
    self.ysm = []

    self.M = M
    self.pM = pM

  def update(self, v):
    dv = dot(self.pM,v.T)
    dv = dv.T[0]
    self.am += dv[2]
    
    _a = self.am/1000.0
    self.xm += dv[0]*cos(_a) - dv[1]*sin(_a)
    self.ym += dv[0]*sin(_a) + dv[1]*cos(_a)

  def show(self):
    self.xsm.append(self.xm)
    self.ysm.append(self.ym)

 

def comp():
  y = array([

[-6223,2948,2932],
[-12437,5863,5961],
[-18651,8774,8954],
[-24886,11702,11955],
[-31162,14664,14994],
[-37313,17574,17981],

[26,5392,-5365],
[92,10631,-10688],
[161,15934,-16017],
[178,21208,-21364],
[227,26557,-26723],
[328,31886,-32116],

[62738,62739,62270],
[125482,125578,124537],
[188215,188419,186789],
[250904,251246,249066],

[-62672,-62234,-62026],
[-125229,-124255,-124055],
[-187752,-186406,-186030],
[-250512,-248776,-248118],

 ])
  x = array([
[100,0,0],
[200,0,0],
[300,0,0],
[400,0,0],
[500,0,0],
[600,0,0],

[0,100,0],
[0,200,0],
[0,300,0],
[0,400,0],
[0,500,0],
[0,600,0],

[0,0,2*pi],
[0,0,4*pi],
[0,0,6*pi],
[0,0,8*pi],

[0,0,-2*pi],
[0,0,-4*pi],
[0,0,-6*pi],
[0,0,-8*pi],
])

  # apply scale
  x = x*1000;

  robots = []

  M = dot( y.T, scipy.linalg.pinv( x.T ) )
  Mm = M
  pMm = scipy.linalg.pinv(Mm)
  robots.append(Robot(M,pMm))

  print Mm
  print pMm

  return 

  # serial port
  bs = BS('/dev/ttyUSB0','38400')

  # matplotlib
  plt.ion()
  fig = plt.figure()
  ax = fig.add_subplot(111)
  plt.draw()
  # 
  lm = None

  lt = 0
  while 1:
    try:
      line = [ int(i) for i in bs.readlineCR().split(',')]
    except ValueError:
      continue

    if len(line) != 3:
      continue

    m = array([line])
    if lm is not None:
      try:
        v = m - lm
        
        for r in robots:
          r.update(v)
  
        t = time.time()
        if t - lt > 0.1:
          lt = t
          ax.clear()
          
          print "-"
          for r in robots:
            r.show();
            ax.plot(r.xsm,r.ysm)
            ax.plot([r.xm],[r.ym],'o')

            print r.xm, r.ym, r.am

          plt.draw()

      except ValueError:
        raise

    lm = m
if __name__ == '__main__':
  comp()


