#!/usr/bin/env python

from perlimpinpin.core import *

robot = Robot([

  Device('prop', 0x20),
  Device('strat', 0x24),
  Device('meca', 0x28),

  Command('ping', [('v', 'uint8')], [('r', 'uint8')], desc="Ping/pong, for tests"),

  ##  Arms
  # arm : 0 = left, 1 = right
  # pos : 0 = mid, 1 = high, -1 = low
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

  ])


if __name__ == '__main__':
  from perlimpinpin.gen.avr import main
  main(robot)

