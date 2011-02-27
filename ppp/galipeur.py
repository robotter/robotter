#!/usr/bin/env python

from perlimpinpin.core import *

robot = Robot([
  Device('strat', 0x20,
    [
      Telemetry('speak', [('value','int16')]),
      Telemetry('breathe', [('one','uint8'), ('two','uint8')]),
      Telemetry('run', [('value','int32')]),
      Telemetry('time', [('hep','int32'), ('hop','int8')]),
      Telemetry('gig', [('value','uint32')]),
      ],
    ),

  Device('prop', 0x42,
    [
      Command('none', [], [],
        desc="Do nothing, just for tests"),
      Command('fortytwo', [], [('r','uint8')],
        desc="Always send back 0x42"),
      Command('goto_a_xya', [('x','int16'), ('y','int16'), ('a','int16')], [],
        desc="Order robot move to (x,y,a) in table coordinates"),
      Command('goto_r_xya', [('x','int16'), ('y','int16'), ('a','int16')], [],
        desc="Order robot move to (x,y,a) in table coordinates from robot current position"),
      Command('trajectory_set_checkpoint', [('id','uint8'), ('x','int16'), ('y','int16')], [],
        desc="Modify robot trajectory checkpoint #id"),
      Command('trajectory_run', [('n','uint8')], [],
        desc="Run trajectory from checkpoint 0 to checkpoint n"),
      Command('trajectory_status', [], [('status','uint8')],
        desc="Trajectory manager status : byte defined as (bit 0 : XY move done; bit 1 : A move done)"),
      Command('trajectory_autoset', [('s','uint8')], [],
        desc="Perform an autoset calibration on side s"),
      Command('set_a_speed', [('v','uint16'), ('a','uint16')], [],
        desc="Set robot maximum angular speed v and angular acceleration a"),
      Command('set_xy_cruise_speed', [('v','uint16'), ('a','uint16')], [],
        desc="Set robot maximum inter-checkpoints speed v and acceleration a"),
      Command('set_xy_steering_speed', [('v','uint16'), ('a','uint16')], [],
        desc="Set robot maximum on-checkpoint speed v and acceleration a"),
      Command('set_xy_stop_speed', [('v','uint16'), ('a','uint16')], [],
        desc="Set robot stop speed v and acceleration a"),
      Command('set_steering_win', [('r','uint16')], [],
        desc="Set window radius for intermediate checkpoints"),
      Command('set_stop_win', [('r','uint16'), ('l','uint16')], [],
        desc="Set window radius r and angular half-angle l for final checkpoint"),
      Command('get_xya', [], [('x','int16'), ('y','int16'), ('a','int16')],
        desc="Return robot current position (x,y,a) in table coordinates"),
      Command('set_xya', [('x','int16'), ('y','int16'), ('a','int16')], [],
        desc="Set robot current position (x,y,a) in table coordinates"),
      Command('brake', [('brake','uint8')], [],
        desc="Set motors brakes : 0 - motors enabled, 1 - motors disabled"),
      Command('get_adnsfault', [], [('fault','uint8')],
        desc="Get FAULT register from FPGA"),
      Command('get_adnssquals', [], [('sq1','uint8'), ('sq2','uint8'), ('sq3','uint8')],
        desc="Return each ADNS SQUAL (Surface QUALity)"),
      Command('get_time', [], [('sec','uint16'), ('usec', 'uint16')],
        desc="Return elapsed time sec seconds and usec microseconds since system is running"),
      Command('test', [('in','uint16')], [('out','int16')],
        desc="Complex test command"),

      Telemetry('pwms', [('pwm1','int16'), ('pwm2','int16'), ('pwm3','int16')]),

      ],

    )
])


if __name__ == '__main__':
  from perlimpinpin.gen.avr import main
  main(robot)

