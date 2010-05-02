
require('as_i2c')
i2ch = as_i2c.open(1)

require('cvg')
function cvg.cb_recv(addr, data) return i2ch:read(addr, data) end
function cvg.cb_send(addr, data) i2ch:write(addr, data) end
function cvg.cb_sleep(usec) os.execute("usleep "..tonumber(usec)) end


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


