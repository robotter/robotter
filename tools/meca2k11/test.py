#!/usr/bin/env python

from matplotlib import pyplot as plt
import matplotlib

if __name__ == '__main__':
  f = open('val_none','r')
 
  values = []
  for l in f:
    values.append([int(d) for d in l.split(' ')])

  angles = []
  adcs = []
  for pos,adc in values:
    v = 1.0/adc
    angles.append(pos)
    adcs.append(v)

  splot = plt.subplot(111)
  splot.plot(angles,adcs)

  f = open('val_palet','r')
 
  values = []
  for l in f:
    values.append([int(d) for d in l.split(' ')])

  angles = []
  adcs = []
  for pos,adc in values:
    v = 1.0/adc
    angles.append(pos)
    adcs.append(v)

  splot = plt.subplot(111)
  splot.plot(angles,adcs)

  f = open('val_palet2','r')
 
  values = []
  for l in f:
    values.append([int(d) for d in l.split(' ')])

  angles = []
  adcs = []
  for pos,adc in values:
    v = 1.0/adc
    angles.append(pos)
    adcs.append(v)

  splot = plt.subplot(111)
  splot.plot(angles,adcs)

  f = open('val_palet_50ms','r')
 
  values = []
  for l in f:
    values.append([int(d) for d in l.split(' ')])

  angles = []
  adcs = []
  for pos,adc in values:
    v = 1.0/adc
    angles.append(pos)
    adcs.append(v)

  splot = plt.subplot(111)
  splot.plot(angles,adcs)



  plt.show()
