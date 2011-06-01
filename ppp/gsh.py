#!/usr/bin/env python

import pshit
from galipeur import robot
import math
import time
from math import pi

conn = pshit.Serial('/dev/ttyUSB0', 38400)
b = GBinding(conn, robot, 'strat')
cl = pshit.Client(b)

prop = cl.prop
meca = cl.meca

class DO:
  def __init__(self, **kw):
    for k,v in kw.items():
      setattr(self, k, v)

vv = DO()
vv.arm_pawn_present = [False, False]
vv.arm_pawn_grabbed = [False, False]
vv.arm_pos = [0, 0]
vv.arm_overtorque = [False, False]
vv.scanner_detected = [None, None]
vv.asserv_status = DO(
    a = False,
    xy = False,
    blocked = False,
    autoset = False,
    )
vv.r3d2_detection = DO( r=0, a=0 )
vv.last_robot_pos = None
vv.last_scan_result = None
vv.asserv_autoset_done = None


class GBinding(pshit.ShellBinding):

  def on_message(self, msg, src, args):
    name = msg.name
    if name == 'arm_at_pos':
      vv.arm_pos[args['arm']] = args['pos']
    elif name == 'arm_pawn_present':
      vv.arm_pawn_present[args['arm']] = args['b']
    elif name == 'arm_overtorque':
      vv.arm_overtorque[args['arm']] = True
    elif name == 'scanner_threshold':
      vv.scanner_detected[args['arm']] = args['status'] == 0
    elif name == 'r3d2_detected':
      vv.r3d2_detection = DO(
          r = args['r'],
          a = ppp2rad(args['a']),
          )
      avoidance_cb()
    elif name == 'asserv_angle_reached':
      vv.asserv_status.a = True
    elif name == 'asserv_trajectory_reached':
      if args['last']:
        vv.asserv_status.xy = True
    elif name == 'asserv_status_r':
      v = args['status']
      vv.asserv_status = DO(
          a       = (v & 1) != 0,
          xy      = (v & 2) != 0,
          blocked = (v & 4) != 0,
          autoset = (v & 8) != 0,
          )
    elif name == 'asserv_get_position':
      vv.last_robot_pos = DO(
          x = args['x'],
          y = args['y'],
          a = ppp2rad(args['a']),
          )
    elif name == 'arm_scan_r':
      vv.last_scan_result = DO(**args)
    elif name == 'asserv_autoset_r':
      vv.asserv_autoset_done = True

    pshit.ShellBinding.on_message(self, msg, src, args)

def ppp2rad(cls, v):
  return v/1000.
def rad2ppp(cls, v):
  return v*1000.

# waiting time for wait methods
TWAIT = 0.1


def goto_a(a):
  prop.asserv_goto_a(rad2pp(a))
  vv.asserv_status.a = False
def goto_ar(a):
  prop.asserv_goto_ar(rad2pp(a))
  vv.asserv_status.a = False
def goto_xy(x, y):
  prop.asserv_goto_xy(x, y)
  vv.asserv_status.xy = False
def goto_xyr(x, y):
  prop.asserv_goto_xyr(x, y)
  vv.asserv_status.xy = False
def goto_traj(lxy):
  for i,(x,y) in enumerate(lxy):
    prop.asserv_load(i, x, y)
  prop.asserv_run(len(lxy))
  vv.asserv_status.xy = False


def arm_set_pos(arm, pos):
  meca.arm_set_pos(arm, pos)
def arm_release(arm):
  meca.arm_release(arm)
  vv.arm_pawn_grabbed[arm] = False

def arm_grab(arm):
  assert not vv.arm_pawn_grabbed[arm], "arm %u has already grabbed a pawn"%arm
  arm_set_pos(arm, -1)
  arm_overtorque[arm] = False
  while arm_pos[arm] != -1 and not arm_overtorque[arm]:
    time.sleep(TWAIT)
  arm_set_pos(arm, 1)
  wait_arm_pos(arm, 1)
  arm_pawn_grabbed[arm] = arm_pawn_present[arm]


def wait_asserv_status(xy, a):
  if xy:
    print "waiting for XY"
    while not vv.asserv_status.xy:
      time.sleep(TWAIT)
  if a:
    print "waiting for A"
    while not vv.asserv_status.a:
      time.sleep(TWAIT)

def wait_arm_pos(arm, pos):
  print "waiting for arm %u at %d" % (arm, pos)
  while vv.arm_pos[karm] != pos:
    time.sleep(TWAIT)

def get_robot_pos():
  vv.last_robot_pos = None
  prop.asserv_get_position()
  while vv.last_robot_pos is None:
    time.sleep(TWAIT)
  return vv.last_robot_pos

def arm_scan(arm):
  vv.last_scan_result = None
  meca.arm_scan(arm)
  while vv.last_scan_result is None:
    time.sleep(TWAIT)
  return vv.last_scan_result

def asserv_autoset(side, x, y):
  vv.asserv_autoset_done = False
  prop.asserv_autoset(side, x, y)
  while not vv.asserv_autoset_done:
    time.sleep(TWAIT)


vv.avoidance_cb_called = False
def avoidance_cb():
  if vv.avoidance_cb_called:
    return
  try:
    vv.avoidance_cb_called = True
    while r3d2_detection.r < 50:
      time.sleep(TWAIT)
  finally:
    vv.avoidance_cb_called = False


def av_set_position(x,y,a):
  prop.asserv_set_position(x,y, rad2pp(a))

def subscribe():
  cl.subscribe(0)
def reset_all():
  cl.reset(0)


def homo():
  subscribe()

  sqr = 350.
  # for blue side
  arm_a = (-math.pi/6, math.pi/6)

  av_set_position(1300., 2100./2-15, pi)
  arm_set_pos(0,1)
  arm_set_pos(1,1)
  av_goto_xyr(-0.6*sqr, -50)
  wait_at_pos(False)
  arm_grabbed = [False, False]

  karm = 1

  # go to the first pawn
  av_goto_xy(2.5*sqr, 2.5*sqr)
  wait_at_pos()
  arm_set_pos(karm,0)
  wait_arm_pos(karm, 0)
  print "ARM at pos 0"
  av_goto_xyr(-0.4*sqr, -0.4*sqr)
  wait_at_pos(False)

  for i in range(30):
    time.sleep(0.1) #XXX:debug
    if vv.arm_pawn_present[karm]:
      break
  if vv.arm_pawn_present[karm]:
    print "pawn 3: YES"
    arm_set_pos(karm,-1)
    wait_arm_pos(karm, -1)
    arm_grabbed[karm] = True
    karm = 0
    arm_set_pos(karm, 0)
    av_goto_a( -2./3*pi )
  else:
    print "pawn 3: NO"

  #XXX
  av_goto_xyr(0,0)
  return

  # go to the next pawn in the column
  av_goto_xy( 2*sqr, 2*sqr )
  wait_at_pos()
  for i in range(1,-3,-1):
    av_goto_xy( 2*sqr, (i+0.15)*sqr )
    wait_at_pos(False)
    if vv.arm_pawn_present[karm]:
      print "pawn %d: YES" % i
      arm_set_pos(0,-1)
      while vv.arm_pos[karm] != -1:
        time.sleep(TWAIT)
      arm_grabbed[karm] = True
      if karm == 0:
        print "two pawns grabbed"
        break
      karm = 0
    else:
      print "pawn %d: NO" % i

  av_goto_xyr(0,0)
  assert arm_grabbed[karm], "second pawn not found"

  # drop the first pawn


if __name__ == '__main__':
  b.listen_start()
  subscribe()
  from IPython.Shell import IPShellEmbed
  ipshell = IPShellEmbed(['-pi1','ppp [\#]: '])
  ipshell()


