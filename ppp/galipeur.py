from configuration.perlimpinpin import Robot, SlaveDevice, MasterDevice, Telemetry, Command

robot = Robot([
  MasterDevice('strat', 0x20,
    [
      Telemetry('SPEAK', [('value','int16')]),
      Telemetry('BREATHE', [('one','uint8'), ('two','uint8')]),
      Telemetry('RUN', [('value','int32')]),
      Telemetry('TIME', [('hep','int32'), ('hop','int8')]),
      Telemetry('GIG', [('value','uint32')]),
      ],
    uartnum = 0,
    outdir = '../avrs/projects/unioc_strat/'
    ),

  SlaveDevice('prop', 0x42,
    [
      Command('NONE', [], [],
        desc="Do nothing, just for tests"),
      Command('FORTYTWO', [], [('r','uint8')],
        desc="Always send back 0x42"),
      Command('GOTO_A_XYA', [('x','int16'), ('y','int16'), ('a','int16')], [],
        desc="Order robot move to (x,y,a) in table coordinates"),
      Command('GOTO_R_XYA', [('x','int16'), ('y','int16'), ('a','int16')], [],
        desc="Order robot move to (x,y,a) in table coordinates from robot current position"),
      Command('TRAJECTORY_SET_CHECKPOINT', [('id','uint8'), ('x','int16'), ('y','int16')], [],
        desc="Modify robot trajectory checkpoint #id"),
      Command('TRAJECTORY_RUN', [('n','uint8')], [],
        desc="Run trajectory from checkpoint 0 to checkpoint n"),
      Command('TRAJECTORY_STATUS', [], [('status','uint8')],
        desc="Trajectory manager status : byte defined as (bit 0 : XY move done; bit 1 : A move done)"),
      Command('TRAJECTORY_AUTOSET', [('s','uint8')], [],
        desc="Perform an autoset calibration on side s"),
      Command('SET_A_SPEED', [('v','uint16'), ('a','uint16')], [],
        desc="Set robot maximum angular speed v and angular acceleration a"),
      Command('SET_XY_CRUISE_SPEED', [('v','uint16'), ('a','uint16')], [],
        desc="Set robot maximum inter-checkpoints speed v and acceleration a"),
      Command('SET_XY_STEERING_SPEED', [('v','uint16'), ('a','uint16')], [],
        desc="Set robot maximum on-checkpoint speed v and acceleration a"),
      Command('SET_XY_STOP_SPEED', [('v','uint16'), ('a','uint16')], [],
        desc="Set robot stop speed v and acceleration a"),
      Command('SET_STEERING_WIN', [('r','uint16')], [],
        desc="Set window radius for intermediate checkpoints"),
      Command('SET_STOP_WIN', [('r','uint16'), ('l','uint16')], [],
        desc="Set window radius r and angular half-angle l for final checkpoint"),
      Command('GET_XYA', [], [('x','int16'), ('y','int16'), ('a','int16')],
        desc="Return robot current position (x,y,a) in table coordinates"),
      Command('SET_XYA', [('x','int16'), ('y','int16'), ('a','int16')], [],
        desc="Set robot current position (x,y,a) in table coordinates"),
      Command('BRAKE', [('brake','uint8')], [],
        desc="Set motors brakes : 0 - motors enabled, 1 - motors disabled"),
      Command('GET_ADNSFAULT', [], [('fault','uint8')],
        desc="Get FAULT register from FPGA"),
      Command('GET_ADNSSQUALS', [], [('sq1','uint8'), ('sq2','uint8'), ('sq3','uint8')],
        desc="Return each ADNS SQUAL (Surface QUALity)"),
      Command('GET_TIME', [], [('sec','uint16'), ('usec', 'uint16')],
        desc="Return elapsed time sec seconds and usec microseconds since system is running"),
      Command('TEST', [('in','uint16')], [('out','int16')],
        desc="Complex test command"),

      Telemetry('PWMS', [('pwm1','int16'), ('pwm2','int16'), ('pwm3','int16')]),

      ],

    uartnum = 1,
    outdir = '../avrs/projects/unioc_asserv/'
    )
])
