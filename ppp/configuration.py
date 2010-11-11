
from perlimpinpin import Robot, SlaveDevice, MasterDevice, Telemetry, Command

robot = Robot([
  MasterDevice('strat', 0x20,
  outdir = '../avrs/projects/unioc_strat/'
  ),
  
  SlaveDevice('prop', 0x42, [
            Command('NONE', [], [],
              "Do nothing, just for tests"),
            Command('FORTYTWO', [], [('r','uint8_t')],
              "Always send back 0x42"),
            Command('GOTO_A_XYA', [('x','int16_t'), ('y','int16_t'), ('a','int16_t')], [],
              "Order robot move to (x,y,a) in table coordinates"),
            Command('GOTO_R_XYA', [('x','int16_t'), ('y','int16_t'), ('a','int16_t')], [],
              "Order robot move to (x,y,a) in table coordinates from robot current position"),
            Command('TRAJECTORY_SET_CHECKPOINT', [('id','uint8_t'), ('x','int16_t'), ('y','int16_t')], [],
              "Modify robot trajectory checkpoint #id"),
            Command('TRAJECTORY_RUN', [('n','uint8_t')], [],
              "Run trajectory from checkpoint 0 to checkpoint n"),
            Command('TRAJECTORY_STATUS', [], [('status','uint8_t')],
              "Trajectory manager status : byte defined as (bit 0 : XY move done; bit 1 : A move done)"),
            Command('TRAJECTORY_AUTOSET', [('s','uint8_t')], [],
              "Perform an autoset calibration on side s"),
            Command('SET_A_SPEED', [('v','uint16_t'), ('a','uint16_t')], [],
              "Set robot maximum angular speed v and angular acceleration a"),
            Command('SET_XY_CRUISE_SPEED', [('v','uint16_t'), ('a','uint16_t')], [],
              "Set robot maximum inter-checkpoints speed v and acceleration a"),
            Command('SET_XY_STEERING_SPEED', [('v','uint16_t'), ('a','uint16_t')], [],
              "Set robot maximum on-checkpoint speed v and acceleration a"),
            Command('SET_XY_STOP_SPEED', [('v','uint16_t'), ('a','uint16_t')], [],
              "Set robot stop speed v and acceleration a"),
            Command('SET_STEERING_WIN', [('r','uint16_t')], [],
              "Set window radius for intermediate checkpoints"),
            Command('SET_STOP_WIN', [('r','uint16_t'), ('l','uint16_t')], [],
              "Set window radius r and angular half-angle l for final checkpoint"),
            Command('GET_XYA', [], [('x','int16_t'), ('y','int16_t'), ('a','int16_t')],
              "Return robot current position (x,y,a) in table coordinates"),
            Command('SET_XYA', [('x','int16_t'), ('y','int16_t'), ('a','int16_t')], [],
              "Set robot current position (x,y,a) in table coordinates"),
            Command('BRAKE', [('brake','uint8_t')], [],
              "Set motors brakes : 0 - motors enabled, 1 - motors disabled"),
            Command('GET_ADNSFAULT', [], [('fault','uint8_t')],
              "Get FAULT register from FPGA"),
            Command('GET_ADNSSQUALS', [], [('sq1','uint8_t'), ('sq2','uint8_t'), ('sq3','uint8_t')],
              "Return each ADNS SQUAL (Surface QUALity)"),
            Command('GET_TIME', [], [('sec','uint16_t'), ('usec', 'uint16_t')],
              "Return time sec seconds and usec microseconds since card is running"),
            Command('TEST', [('in','uint16_t')], [('out','int16_t')],
              "Complex test command")
            ],
            outdir = '../avrs/projects/unioc_asserv/'
          )
])
