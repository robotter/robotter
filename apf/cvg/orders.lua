--
-- Include and configure elements related to I2C orders.
--
-- Loaded modules:
--   as_i2c  low level I2C interface
--   cvg     the CVG module
-- Elements are added to the global environment:
--   i2ch    low level I2C object (from as_i2c)
--   unioc   UNIOC-NG CVG slave
--   meca    Meca board CVG slave
--

require('as_i2c')
i2ch = as_i2c.open(1)

require('cvg')
function cvg.cb_recv(addr, size) return i2ch:read(addr, size) end
function cvg.cb_send(addr, data) i2ch:write(addr, data) end
function cvg.cb_sleep(sec) os.execute("usleep "..math.floor(sec*1000000)) end
cvg.default_polldt = 0.02
cvg.default_tout = 5


unioc = cvg.slave_init({
  roid = 0x20,
  name = 'UNIOC-NG',
  orders = {
    { id=0x00, name = 'NONE' },
    { id=0x01, name = 'FORTYTWO', ret = {
      {name='v', size=1, fmt='u'},
    } },
    { id=0x10, name = 'GOTO_A_XYA', args = {
      {name='x', size=2, fmt='d'},
      {name='y', size=2, fmt='d'},
      {name='a', size=2, fmt='d'}
    } },
    { id=0x11, name = 'GOTO_R_XYA', args = {
      {name='x', size=2, fmt='d'},
      {name='y', size=2, fmt='d'},
      {name='a', size=2, fmt='d'}
    } },
    { id=0x20, name = 'TRAJECTORY_SET_CHECKPOINT', args = {
      {name='i', size=1, fmt='u'},
      {name='x', size=2, fmt='d'},
      {name='y', size=2, fmt='d'}
    } },
    { id=0x21, name = 'TRAJECTORY_SET_RUN', args = {
      {name='n', size=1, fmt='u'},
    } },
    { id=0x22, name = 'TRAJECTORY_STATUS', ret = {
      {name='b', size=1, fmt='u'},
    } },
    { id=0x23, name = 'TRAJECTORY_AUTOSET', args = {
      {name='n', size=1, fmt='u'},
    } },
    { id=0x30, name = 'SET_A_SPEED', args = {
      {name='v', size=2, fmt='u'},
      {name='a', size=2, fmt='u'}
    } },
    { id=0x31, name = 'SET_XY_CRUISE_SPEED', args = {
      {name='v', size=2, fmt='u'},
      {name='a', size=2, fmt='u'}
    } },
    { id=0x32, name = 'SET_XY_STEERING_SPEED', args = {
      {name='v', size=2, fmt='u'},
      {name='a', size=2, fmt='u'}
    } },
    { id=0x33, name = 'SET_XY_STOP_SPEED', args = {
      {name='v', size=2, fmt='u'},
      {name='a', size=2, fmt='u'}
    } },
    { id=0x34, name = 'SET_STEERING_WIN', args = {
      {name='r', size=2, fmt='u'},
    } },
    { id=0x35, name = 'SET_STOP_WIN', args = {
      {name='r', size=2, fmt='u'},
      {name='l', size=2, fmt='u'},
    } },
    { id=0x40, name = 'GET_XYA', ret = {
      {name='x', size=2, fmt='d'},
      {name='y', size=2, fmt='d'},
      {name='a', size=2, fmt='d'}
    } },
    { id=0x41, name = 'SET_XYA', args = {
      {name='x', size=2, fmt='d'},
      {name='y', size=2, fmt='d'},
      {name='a', size=2, fmt='d'}
    } },
    { id=0x50, name = 'BRAKE', ret = {
      {name='b', size=1, fmt='b'},
    } },
    { id=0x51, name = 'GET_ADNSFAULT', ret = {
      {name='fault', size=1, fmt='u'},
    } },
    { id=0x52, name = 'GET_ADNSSQUALS', ret = {
      {name='squal1', size=1, fmt='u'},
      {name='squal2', size=1, fmt='u'},
      {name='squal3', size=1, fmt='u'},
    } },
    { id=0x53, name = 'GET_TIME', ret = {
      {name='sec',  size=4, fmt='u'},
      {name='usec', size=4, fmt='u'},
    } },
  },
})


meca = cvg.slave_init({
  -- n = 0: left
  -- n = 1: right
  roid = 0x21,
  name = 'Meca',
  orders = {
    { id=0x00, name = 'NONE' },
    { id=0x01, name = 'FORTYTWO', ret = {
      {name='v', size=1, fmt='u'},
    } },
    { id=0x10, name = 'CLAMP_OPEN', args = {
      {name='n', size=1, fmt='u'},
    } },
    { id=0x11, name = 'CLAMP_CLOSE', args = {
      {name='n', size=1, fmt='u'},
    } },
    { id=0x15, name = 'CLAMP_IS_OPENED', args = {
      {name='n', size=1, fmt='u'},
    }, ret = {
      {name='v', size=1, fmt='b'},
    } },
    { id=0x16, name = 'CLAMP_IS_CLOSED', args = {
      {name='n', size=1, fmt='u'},
    }, ret = {
      {name='v', size=1, fmt='b'},
    } },
    { id=0x20, name = 'CLAMP_RAISE', args = {
      {name='n', size=1, fmt='u'},
    } },
    { id=0x21, name = 'CLAMP_LOWER', args = {
      {name='n', size=1, fmt='u'},
    } },
    { id=0x25, name = 'CLAMP_IS_RAISED', args = {
      {name='n', size=1, fmt='u'},
    }, ret = {
      {name='v', size=1, fmt='b'},
    } },
    { id=0x26, name = 'CLAMP_IS_LOWERED', args = {
      {name='n', size=1, fmt='u'},
    }, ret = {
      {name='v', size=1, fmt='b'},
    } },
    { id=0x53, name = 'GET_TIME', ret = {
      {name='sec',  size=4, fmt='u'},
      {name='usec', size=4, fmt='u'},
    } },
  },
})


