--
-- Fake as_i2c module, for tests/debug without the real module.
--
-- To override the load of the actual as_i2c module, use:
--    lua -l as_i2c_fake script.lua
--
-- The read implementation returns random data, thus executing orders will fail.
-- The debug attribute can be set to true to dump exchanged data.
--

as_i2c = {
  debug = false,
}

local _mt = {

  read = function(self, addr, size)
    -- pseudo-random data
    local data = ''
    for i=1,size-1 do
      local n = (i*0x42) % 256
      data = data .. string.char(n)
    end
    if as_i2c.debug then
      local s = ''
      for i=1,#data do
        s = s .. string.format(" %02X", data:byte(i))
      end
      print(string.format("as_i2c_fake: RECV @ %02X : %s", addr, s))
    end
    return data
  end,

  write = function(self, addr, data)
    if as_i2c.debug then
      local s = ''
      for i=1,#data do
        s = s .. string.format(" %02X", data:byte(i))
      end
      print(string.format("as_i2c_fake: SEND @ %02X : %s", addr, s))
    end
  end
}
_mt.__index = _mt

function as_i2c.open(id)
  local o = { id=id }
  return setmetatable(o, _mt)
end

module('as_i2c')

