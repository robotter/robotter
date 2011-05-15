#!/usr/bin/python

import math
from basicSerial import BasicSerial as BS
import matplotlib
import matplotlib.pyplot as plt
from scipy import array,dot,eye
from scipy.linalg import norm
import scipy, scipy.linalg, time
from math import cos,sin,radians
from scipy.constants import pi
import matplotlib.cm as cm

def main():

  pM = array([[-10.86875093, 5.53375458, 5.39700173],
              [ -0.08183981, 9.39777427, -9.3669796 ],
              [  0.03245103, 0.03405628,  0.03413506]])

  # serial port
  bs = BS('/dev/ttyUSB0','38400')

  # matplotlib
  plt.ion()
  fig = plt.figure(figsize=(12,10))
  ax = fig.add_subplot(111)
  plt.draw()
  # 
  lm = None


  xp, yp = [],[]
  xs, ys = [],[]
  xns, yns = [],[]
  xnp, ynp = [],[]
  lt = 0
  ls1 = None
  ls3 = None
  s1_state = False
  s3_state = False
  s1_m = 50
  s3_m = 50

  # Kalmann

  xn,yn,an = 150.0,0.0,0.0
  X = array([[150.0,0.0,0.0]]).T

  P = eye(3,3)
  P[2][2] = 0.001


  # sensors noise
  R = array([10,10])

  # state noise
  Q = scipy.diag(array([ 1e-3, 1e-3, 1e-5]))

  S1_pos = array([    4, 118])
  S3_pos = array([ -104, -55])
  Rline = 0
  Lline = -100

  while 1:

    # ----------------------------------------------------
    # get data from serial
    try:
      line = [ int(i) for i in bs.readlineCR().split(',')]
    except ValueError:
      continue

    if len(line) != 5:
      continue

    m = array(line[2:5])
    s3 = line[0]
    s1 = line[1]

    if lm is not None:
      try:
        v = m - lm
        
        # -----------------------------------
        # get rising edge on color detection

        s1_m = 0.6*s1_m + 0.4*s1
        s3_m = 0.6*s3_m + 0.4*s3

        s1_trig,s3_trig = False,False
        
        if s1_state:
          if s1_m < 60:
            s1_state = False
            s1_trig = True
        else:
          if s1_m > 80:
            s1_state = True
            s1_trig = True

        if s3_state:
          if s3_m < 60:
            s3_state = False
            s3_trig = True
        else:
          if s3_m > 80:
            s3_state = True
            s3_trig = True

        # ------------------
        # compute position w/out kalman
        
        dv = dot(pM,v.T)
        dv /= 1000.0
        dx,dy,da = dv

        xn += dx*cos(an) - dy*sin(an)
        yn += dx*sin(an) + dy*cos(an)
        an += da

        # ------------------
        # propagate
        
        x,y,a = X
        
        dv = dot(pM,v.T)
        
        # scale dv to mm / rads
        dv /= 1000.0
        dx,dy,da = dv

        X += array([[ dx*cos(a) - dy*sin(a),
                     dx*sin(a) + dy*cos(a),
                     dv[2]]]).T

        F = eye(3,3)
        F[0][2] =  -dx*sin(a) -dy*cos(a)
        F[1][2] = dx*cos(a) - dy*sin(a)
        
        B = array([[ cos(a), -sin(a), 0],
                   [ sin(a),  cos(a), 0],
                   [ 0,       0,       1]])

        P = dot(F,dot(P,F.T))
        if norm(dv) > 0.01:
          P += dot(dot(B,Q),B.T)
        
        # -------------------
        # update

        if s1_trig:
          # determine closest line to S1 
          if s1_trig:
            sensor_pos = S1_pos
#          if s3_trig:
 #           sensor_pos = S3_pos

          sx,sy = sensor_pos
          S1 = array([ X[0][0] + sx*cos(a) - sy*sin(a),
                       X[1][0] + sx*sin(a) + sy*cos(a) ])

          dL = abs(Lline - S1[0])
          dR = abs(Rline - S1[0])
          
          Lx = None
          if dR < dL:
            # right line crossed
            Lx = Rline
          else:
            # left line crossed
            Lx = Lline
          

          # ----------------
          # update kalman

          y = Lx - S1[0]
          print "UPDATE",Lx,y

          H = array([[1, 0, -sx*sin(a) - sy*cos(a)]])

          S = dot(H,dot(P,H.T)) + R[0]

          # gain
          K = dot(P,(H.T)/S)
          
          # update state
          X += dot(K,y)
          
          P = dot((eye(3,3) - dot(K,H)),P)
          #P = P - dot(K,dot(S,K.T))

        if True:
          print "--"
          print math.sqrt(math.fabs(P[0][0]))
          print math.sqrt(math.fabs(P[1][1]))
          print math.sqrt(math.fabs(P[2][2]))
          print P
        # --------------------
        # show robot position

        if s1_trig:
          sx,sy = S1_pos
          xp.append(X[0][0] + sx*cos(a) - sy*sin(a) )
          yp.append(X[1][0] + sx*sin(a) + sy*cos(a) )
          xnp.append(xn + sx*cos(an) - sy*sin(an) )
          ynp.append(yn + sx*sin(an) + sy*cos(an) )

        #if s3_trig:
        #  sx,sy = S3_pos
        #  xp.append(X[0][0] + sx*cos(a) - sy*sin(a) )
        #  yp.append(X[1][0] + sx*sin(a) + sy*cos(a) )
        #  xnp.append(xn + sx*cos(an) - sy*sin(an) )
        #  ynp.append(yn + sx*sin(an) + sy*cos(an) )


        t = time.time()
        if t - lt > 0.5:
          lt = t
          ax.clear()

          xns.append(xn)
          yns.append(yn)

          xs.append(X[0][0])
          ys.append(X[1][0])

          plt.axvline(x=Rline,color='r')
          plt.axvline(x=Lline,color='r')

          ax.plot(xns,yns,color='b')
          ax.plot(xnp,ynp,'o',color='b')

          ax.plot(xs,ys,color='g')
          ax.plot(xp,yp,'o',color='g')

          #bx.imshow(P,cmap=cm.gray, interpolation='nearest')

          plt.draw()

      except ValueError:
        raise

    lm = m
if __name__ == '__main__':
  main()


