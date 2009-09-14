--
-- Sample use of cvg.lua
--

-- elements which should be defined in C
cvg = {}
function cvg.i2c_send(addr, offset, data)
  local s = ''
  for i=1,#data do
    s = s .. string.format(" %02X", data:byte(i))
  end
  print(string.format("SEND @ %02X+%02X : %s", addr, offset, s))
end
function cvg.i2c_recv(addr, offset, size)
  local data = ''
  local s = ''
  for i=1,size do
    local n = (i*0x42) % 256
    data = data .. string.char( n )
    s = s .. string.format(" %02X", n)
  end
  print(string.format("RECV @ %02X+%02X : %s", addr, offset, s))
  return data
end


-- execute cvg.lua
loadfile('cvg.lua')()


-- slave description
slave = {
  roid = 0x42,
  buffer = {
    { name = 'POSITION_TARGET_A_XYA', mode = 'W',  params = {
      {name='x', size=2, fmt='d'},
      {name='y', size=2, fmt='d'},
      {name='a', size=2, fmt='d'}
    } },
    { name = 'POSITION_TARGET_R_XYA', mode = 'W',  params = {
      {name='x', size=2, fmt='d'},
      {name='y', size=2, fmt='d'},
      {name='a', size=2, fmt='d'}
    } },
    { name = 'POSITION_CURRENT_XYA',  mode = 'RW', params = {
      {name='x', size=2, fmt='d'},
      {name='y', size=2, fmt='d'},
      {name='a', size=2, fmt='d'}
    } },
    { name = 'SPEED_XY',              mode = 'W',  params = {
      {name='speed', size=2, fmt='d'},
      {name='acc',   size=2, fmt='d'}
    } },
    { name = 'SPEED_A',               mode = 'W',  params = {
      {name='speed', size=2, fmt='d'},
      {name='acc',   size=2, fmt='d'}
    } },
    { name = 'BRAKE',                 mode = 'W',  params = {
      {name='brake', size=1, fmt='b'}
    } },
    { name = 'AUTOSET',               mode = 'RW', params = {
      {name='border', size=1, fmt='u'}
    } },
    { name = 'COMPASS',               mode = 'W',  params = {
      {name='active', size=1, fmt='b'}
    } },
    { name = 'STATUS',                mode = 'R',  params = {
      {name='status', size=1, fmt='u'}
    } },
  },
}


-- create slave
slave = cvg.slave_init(slave)

-- interact!
slave:send('SPEED_XY', {0x61,0x62,0x63,42})
slave:send('POSITION_TARGET_R_XYA', { x=':)', y=0x63, a=-2 })
t = slave:recv('POSITION_CURRENT_XYA')
print(string.format("  x: %d, y: %d, a: %d", t.x, t.y, t.a))


