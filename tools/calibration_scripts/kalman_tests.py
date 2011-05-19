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
  fig = plt.figure(figsize=(10,10))
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

  # 
  squal = scipy.zeros((100,100))

  # Kalmann

  xn,yn,an = -200.0,-200.0,0.0
  X = array([[xn,yn,an]]).T

  P = eye(3,3)
  P[2][2] = 1

  # sensors noise
  R = array([400,400])

  # state noise
  Q = scipy.diag(array([ 1e-3, 1e-3, 1e-4]))

  S1_pos = array([    4, 118])
  S3_pos = array([ -104, -55])
  VRline = 0
  VLline = +50

  HRline = 0
  HLline = +50

  

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
          if s1_m < 70:
            s1_state = False
            s1_trig = True
        else:
          if s1_m > 80:
            s1_state = True
            s1_trig = True

        if s3_state:
          if s3_m < 70:
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
        
        (x,),(y,),(a,) = X
        
        dv = dot(pM,v.T)
        
        # scale dv to mm / rads
        dv /= 1000.0
        dx,dy,da = dv

        X += array([[ dx*cos(a) - dy*sin(a),
                     dx*sin(a) + dy*cos(a),
                     dv[2]]]).T

        F = eye(3,3)
        F[0][2] = -dx*sin(a) -dy*cos(a)
        F[1][2] = dx*cos(a) - dy*sin(a)
        
        B = array([[ cos(a), -sin(a), 0],
                   [ sin(a),  cos(a), 0],
                   [ 0,       0,      1]])

        P = dot(F,dot(P,F.T))
        if norm(dv) > 0.01:
          #P += dot(dot(B,Q),B.T)
          P += Q
        
        # -------------------
        # update

        if s1_trig or s3_trig:
          # determine closest line to S1 
          if s1_trig:
            sensor_pos = S1_pos
          if s3_trig:
            sensor_pos = S3_pos

          sx,sy = sensor_pos
          S1 = array([ X[0][0] + sx*cos(a) - sy*sin(a),
                       X[1][0] + sx*sin(a) + sy*cos(a) ])

          dXL = abs(VLline - S1[0])
          dXR = abs(VRline - S1[0])
          
          dYL = abs(HLline - S1[1])
          dYR = abs(HRline - S1[1])

          Lx = None
          dX = min(dXR,dXL)
          if dXR < dXL:
            Lx = VRline
          else:
            Lx = VLline
          
          Ly = None
          dY = min(dYR,dYL)
          if dYR < dYL:
            Ly = HRline
          else:
            Ly = HLline


          # ----------------
          # update kalman

          delta = abs(dX-dY)
          print "dX=",dX," dY=",dY," delta=",delta

          if delta < 20:
            # too close do nothing
            pass

          else:
            if dX < dY:
              y = Lx - S1[0]
              print ">> X UPDATE ",Lx,y
              H = array([[1, 0, -sx*sin(a) - sy*cos(a)]])
              S = dot(H,dot(P,H.T)) + R[0]

            else:
              y = Ly - S1[1]
              print ">> Y UPDATE",Ly,y
              H = array([[0, 1, sx*cos(a) - sy*sin(a)]])
              S = dot(H,dot(P,H.T)) + R[1]
              
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


        # ---- 
        # plot squal

        def _set_squal(y,x,s):
          if (0 < x < 100) and (0 < y < 100):
            squal[y][x] = s

        (x,),(y,),(a,) = X

        sx,sy = S1_pos
        _x = X[0][0] + sx*cos(a) - sy*sin(a) 
        _y = X[1][0] + sx*sin(a) + sy*cos(a)
        _set_squal(int(-_y/10+50),int(_x/10+50),s1_m)

        sx,sy = S3_pos
        _x = X[0][0] + sx*cos(a) - sy*sin(a)
        _y = X[1][0] + sx*sin(a) + sy*cos(a)
        _set_squal(int(-_y/10+50),int(_x/10+50),s3_m)

        # --------------------
        # show robot position

        if s1_trig:
          sx,sy = S1_pos
          xp.append(X[0][0] + sx*cos(a) - sy*sin(a) )
          yp.append(X[1][0] + sx*sin(a) + sy*cos(a) )
          xnp.append(xn + sx*cos(an) - sy*sin(an) )
          ynp.append(yn + sx*sin(an) + sy*cos(an) )
          
          xp = xp[-20:]
          yp = yp[-20:]
          xnp = xnp[-20:]
          ynp = ynp[-20:]


        if s3_trig:
          sx,sy = S3_pos
          xp.append(X[0][0] + sx*cos(a) - sy*sin(a) )
          yp.append(X[1][0] + sx*sin(a) + sy*cos(a) )
          xnp.append(xn + sx*cos(an) - sy*sin(an) )
          ynp.append(yn + sx*sin(an) + sy*cos(an) )


        t = time.time()
        if t - lt > 0.2:
          lt = t
          ax.clear()

          xns.append(xn)
          yns.append(yn)

          xs.append(X[0][0])
          ys.append(X[1][0])

          xns = xns[-200:]
          yns = yns[-200:]

          xs = xs[-200:]
          ys = ys[-200:]

          xr,yr,ar = X[0][0],X[1][0],X[2][0]

          plt.axvline(x=VRline,color='r')
          plt.axvline(x=VLline,color='r')
          plt.axhline(y=HRline,color='r')
          plt.axhline(y=HLline,color='r')

          ax.plot(xns,yns,color='b')
          ax.plot(xnp,ynp,'o',color='b')

          ax.plot([xn+cos(an+0.5*pi)*200.0,
                   xn+cos(an+1.1666*pi)*200.0,
                   xn+cos(an+1.8333*pi)*200.0,
                   xn+cos(an+0.5*pi)*200.0],
                  [yn+sin(an+0.5*pi)*200.0,
                   yn+sin(an+1.1666*pi)*200.0,
                   yn+sin(an+1.8333*pi)*200.0,
                   yn+sin(an+0.5*pi)*200.0],color='b',linewidth=3)

          ax.plot(xs,ys,color='g')
          ax.plot(xp,yp,'o',color='g')
          #ax.plot([xr, xr+cos(ar+0.5*pi)*10.0],[yr, yr+sin(ar+0.5*pi)*10.0],color='r',linewidth=2)
          ax.plot([xr+cos(an+0.5*pi)*200.0,
                   xr+cos(an+1.1666*pi)*200.0,
                   xr+cos(an+1.8333*pi)*200.0,
                   xr+cos(an+0.5*pi)*200.0],
                  [yr+sin(an+0.5*pi)*200.0,
                   yr+sin(an+1.1666*pi)*200.0,
                   yr+sin(an+1.8333*pi)*200.0,
                   yr+sin(an+0.5*pi)*200.0],color='g',linewidth=3)

          ax.imshow(squal,cmap=cm.gist_yarg, interpolation='nearest', extent=(-500,+500,-500,+500))
          
          plt.axis([-500,+500,-500,+500])
    
          plt.draw()

      except ValueError:
        raise

    lm = m
if __name__ == '__main__':
  main()


