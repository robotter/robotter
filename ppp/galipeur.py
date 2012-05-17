#!/usr/bin/env python

from perlimpinpin.core import *

robot = Robot([

  Device('prop', 0x20),
  Device('meca', 0x28),
  Device('r3d2', 0x2C),

  # Common messages
  TransactionGroup(1, [
    Order('reset', [], desc="Reset the device"),
    Order('kill', [], desc="Stop the device and all its actuators"),
    Command('ping', [('v', 'uint8')], [('r', 'uint8')], desc="Ping/pong, for tests"),
    Event('start', [], desc="Device is up and running"),
    ]),

  # Meca
  TransactionGroup(0x20, [
    # arm, angles: see enums
    Order('arm_set_angle', [('arm', 'uint8'), ('angle', 'uint8')],
      desc="Move arm at given angle"),
    Event('arm_overtorque', [('arm', 'uint8')],
      desc="Arm overtorque"),
    Event('arm_at_angle', [('arm', 'uint8'), ('angle', 'uint8')],
      desc="Arm has moved to given angle"),
    Order('brush_stop', [('now', 'bool')],
      desc="Stop brush, if now is false brush will go to close position before stopping"),
    Order('brush_set_speed', [('speed', 'uint16')],
      desc="Set brush speed, between 0 and 4095"),
    Command('brush_get_pos', [], [('pos', 'uint16')],
      desc="Get brush position"),
    ]),

  # R3D2
  TransactionGroup(0x60, [
    Event('r3d2_detected', [('r', 'uint16'), ('a', 'int16')],
      desc="Robot detected at given polar coordinates"),
    Event('r3d2_disappeared', [],
      desc="A previously detected robot just disappeared"),
    Command('r3d2_set_state', [('state', 'bool')], [],
      desc="Enable or disable R3D2 (motor and sensor)"),
    Order('r3d2_enable_uart_ui', [],
      desc="Enable the UART UI (and disable PPP)"),
    Command('r3d2_get_conf', [], [('motor_speed', 'uint16'),
      ('detection_threshold', 'uint8'), ('motor_watchdog_timeout', 'uint8'),
      ('angle_offset', 'int16'), ('distance_coef', 'uint16')],
      desc="Retrieve R3D2 configuration values"),
    Command('r3d2_set_conf', [('motor_speed', 'uint16'),
      ('detection_threshold', 'uint8'), ('motor_watchdog_timeout', 'uint8'),
      ('angle_offset', 'int16'), ('distance_coef', 'uint16')], [],
      desc="Set R3D2 configuration values"),
    Order('r3d2_write_to_eeprom', [],
      desc="Save configuration to EEPROM"),
    Order('r3d2_calibrate_angle_offset', [('a', 'int16')],
      desc="Update angle offset from object angle"),
    Order('r3d2_calibrate_distance_coef', [('d', 'uint16')],
      desc="Update distance coef from object distance"),
    ]),

  ## Robot movement
  # angle in milliradians, x&y in mlllimeters
  TransactionGroup(0xC0, [
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

    Command('asserv_autoset', [('side','uint8'),('x','int16'),('y','int16')], [],
      desc='Perform autoset on side #, send answer when autoset is done.'),

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

    Command('asserv_get_position',[],[('x','int16'),('y','int16'),('a','int16')],
      desc='Get robot position'),

    Order('force_avoidance',[('b','bool')],
      desc='Force avoidance system (false:normal,true:detection forced)'),
    ]),
  ])


if __name__ == '__main__':
  from perlimpinpin.gen.avr import main
  main(robot)

