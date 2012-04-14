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

[-29503,61766,-29819],
[-29487,61093,-29836],

[-30628,-30398,61509],
[-30697,-30392,61183],

[248951,248858,248023],
[249005,248645,247999],

 ])
 # values in mm and rad
  x = array([

[1000*cos(pi/3),1000*sin(pi/3),0],
[1000*cos(pi/3),1000*sin(pi/3),0],

[1000*cos(pi/3),-1000*sin(pi/3),0],
[1000*cos(pi/3),-1000*sin(pi/3),0],

[0,0,4*2*pi],
[0,0,4*2*pi],

])

  # apply scale
  x = x*1000;

  robots = []

  M = dot( y.T, scipy.linalg.pinv( x.T ) )
  Mm = M
  pMm = scipy.linalg.pinv(Mm)
  robots.append(Robot(M,pMm))

  #correctif
  C = array([
  [0.91,0,0],
  [0,0.90,0],
  [50e-6,10e-6,0.982],
  #[50e-6,10e-6,0.9755],
  ])
  pMm = dot(C, pMm)
  Mm = scipy.linalg.pinv(pMm)


  def _to_cmat(x):
    return '{%s}'%(','.join([str(v) for v in x.flatten()]))

  print 'um/mrads -> motor encoder step'
  print Mm
  m = '#ifndef HROBOT_MANAGER_CONFIG_H\n'
  m+= '#define HROBOT_MANAGER_CONFIG_H\n'
  m+= 'double hrobot_motors_matrix[9]='+_to_cmat(Mm)+';\n'
  m+= '#endif//HROBOT_MANAGER_CONFIG_H\n'
  open('../../avrs/projects/unioc_asserv/hrobot_manager_config.h','wb').write(m)

  print 'motor encoder step -> um/mrads'
  print pMm
  m = '#ifndef HROBOT_MANAGER_CONFIG_H\n'
  m+= '#define HROBOT_MANAGER_CONFIG_H\n'
  m+= 'double hrobot_motors_invmatrix[9]='+_to_cmat(pMm)+';\n'
  m+= '#endif//HROBOT_MANAGER_CONFIG_H\n'
  open('../../avrs/projects/unioc_asserv/hposition_manager_config.h','wb').write(m)

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


