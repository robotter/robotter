#!/usr/bin/env python

from perlimpinpin.core import *

robot = Robot([

  Device('prop', 0x20),
  Device('strat', 0x24),
  Device('meca', 0x28),
  Device('r3d2', 0x2C),

  # Common messages
  MsgGroupWrapper(1, [
    Order('reset', [], desc="Reset the device"),
    Order('kill', [], desc="Stop the device and all its actuators"),
    Command('ping', [('v', 'uint8')], [('r', 'uint8')], desc="Ping/pong, for tests"),
    ]),

  # Arms
  MsgGroupWrapper(0x20, [
    # arm: 0 = left, 1 = right
    # pos: 0 = mid, 1 = high, -1 = low
    Order('arm_set_pos', [('arm', 'uint8'), ('pos', 'int8')],
      desc="Move arm at given position"),
    Order('arm_release', [('arm', 'uint8')],
      desc="Release pawn grabbed by the arm"),
    Event('arm_at_pos', [('arm', 'uint8'), ('pos', 'int8')],
      desc="Arm has moved to given postion."),
    Event('arm_pawn_present', [('arm', 'uint8'), ('b', 'bool')],
      desc="Arm pawn detector state changed"),
    # certainty: cf. enum
    # x, y: position relative to robot's coordinates
    Command('arm_scan', [('arm', 'uint8')], [('certainty', 'uint8'), ('x', 'int16'), ('y', 'int16'), ('h', 'uint8')],
      desc="Scan for a pawn"),
    ]),

  # R3D2
  MsgGroupWrapper(0x38, [
    Event('r3d2_detected', [('r', 'uint16'), ('a', 'int16')],
      desc="Robot detected at given polar coordinates"),
    ]),

  ## Robot movement
  # angle in milliradians, x&y in mlllimeters
  MsgGroupWrapper(0x40, [
    Order('asserv_goto_a',[('a','int16')],
      desc="Absolute rotation"),
    Order('asserv_goto_ar',[('a','int16')],
      desc="Relative rotation"),
    Order('asserv_goto_xy',[('x','int16'),('y','int16')],
      desc="Absolute movement"),
    Order('asserv_goto_xyr',[('x','int16'),('y','int16')],
      desc="Relative movement"),

    Order('asserv_run', [('n','uint8')],
      desc='Run loaded trajectory'),
    Order('asserv_load', [('idx','uint8'),('x','int16'),('y','int16')],
      desc='Set checkpoint idx in trajectory'),

    Order('asserv_autoset', [('side','uint8')],
      desc='Perform autoset on side #'),

    Event('asserv_angle_reached',[],
      desc="Robot reach is angular target"),

    Event('asserv_trajectory_reached',[('n','uint8'),('last','bool')],
      desc="Robot reach point n (last=0 for intermediate point last=1 for last point)"),

    # units are 1/100th
    Order('asserv_set_a_speed',[('speed','uint16'),('acc','uint16')],
      desc='Change robot angular speeds'),
    # units are 1/1000th
    Order('asserv_set_xy_cruise_speed',[('speed','uint16'),('acc','uint16')],
      desc='Change robot cruise speeds'),
    Order('asserv_set_xy_steering_speed',[('speed','uint16'),('acc','uint16')],
      desc='Change robot steering speeds'),
    Order('asserv_set_xy_stop_speed',[('speed','uint16'),('acc','uint16')],
      desc='Change robot stop speeds'),

    Order('asserv_set_steering_window',[('xywin','uint16')],
      desc='Change robot steering window'),
    Order('asserv_set_stop_windows',[('xywin','uint16'),('awin','uint16')],
      desc='Change robot stop windows'),

    Order('asserv_set_position',[('x','int16'),('y','int16'),('a','int16')],
      desc='Set robot position to (x,y,a)'),

    Command('asserv_status',[],[('status','uint8')],
      desc='Get asserv status |A|XY|blocked|autoset|...|'),
    ]),

  ])


if __name__ == '__main__':
  from perlimpinpin.gen.avr import main
  main(robot)

