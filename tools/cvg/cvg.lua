
-- check cvg and I2C functions
assert(type(cvg) == 'table', "invalid 'cvg' value")
assert(type(cvg.i2c_send) == 'function', "invalid 'cvg.i2c_send' value")
assert(type(cvg.i2c_recv) == 'function', "invalid 'cvg.i2c_send' value")


-- Slave metatable, define slave methods
-- do not edit
cvg.slave_mt = {

  -- Find buffer data with given id
  get_data = function(self, id)
    for k,v in ipairs(self.buffer) do
      if v.name == id then
        do return v end
      end
    end
    return nil
  end,

  -- Send data
  -- params may be a string or a table of byte values (raw data), or a table of
  -- named (typed) values
  send = function(self, id, params)

    d = self:get_data(id)
    assert(d ~= nil, "id not found: "..tostring(id))

    assert(d.mode ~= 'R', "invalid access: "..id.." is not writable")

    local sout  -- output string
    if type(params) == 'string' then
      -- raw params (string)
      sout = params
    elseif type(params) == 'table' then
      -- table params
      if params[1] == nil then
        -- named values
        sout = ''
        for pk,pv in ipairs(d.params) do
          local x = params[pv.name]
          if type(x) == 'string' then
            -- string
            assert(#x == pv.size, "invalid size for param '"..pv.name.."'")
            sout = sout .. x
          elseif type(x) == 'number' then
            -- number
            x = math.floor(x)
            for i=1,pv.size do
              sout = sout .. string.char( x % 256 )
              x = math.floor(x / 256)
            end
            assert(x==0 or x==-1, "value overflow for param '"..pv.name.."'")
          elseif type(x) == 'boolean' then
            sout = sout .. (x and '\1' or '\0')
          else
            error("invalid type for param '"..pv.name.."'")
          end
        end
      else
        -- anonymous values
        sout = string.char( unpack(params) )
      end
    else
      error("invalid params type")
    end

    assert(#sout == d.size, "invalid data size: expected "..tostring(d.size).." got "..tostring(#sout))
    cvg.i2c_send(self.roid, d.offset, sout)

  end,

  -- Receive raw data as a string
  recv_raw = function(self, id)

    d = self:get_data(id)
    assert(d ~= nil, "id not found: "..tostring(id))

    assert(d.mode ~= 'W', "invalid access: "..id.." is not readable")

    return cvg.i2c_recv(self.roid, d.offset, d.size)

  end,

  -- Receive data as a table of data
  recv = function(self, id)

    d = self:get_data(id)
    assert(d ~= nil, "id not found: "..tostring(id))

    assert(d.mode ~= 'W', "invalid access: "..id.." is not readable")

    sdata = cvg.i2c_recv(self.roid, d.offset, d.size)

    local t = {}
    local i = 1
    for pk,pv in ipairs(d.params) do
      s = sdata:sub(i,i+pv.size-1)
      if pv.fmt == 's' then
        t[pv.name] = s
      elseif pv.fmt == 'b' then
        t[pv.name] = s[1] ~= 0
      else -- 'd' or 'u'
        local x = 0
        local m = 1
        for j=1,pv.size do
          x = x + s:byte(j) * m
          m = m * 256
        end
        -- transform to negative value if needed
        if pv.fmt == 'd' and x > m/2 then
          x = x - m
        end
        t[pv.name] = x
      end
      i = i + pv.size
    end

    return t

  end

}
cvg.slave_mt.__index = cvg.slave_mt


-- Create a slave from a table
-- Check data and fill out some fields
--
-- t should have the following format:
--   t = {
--     roid = 42,
--     buffer = {
--       { name = 'MESSAGE_NAME', mode = <MODE>,  params = {
--         {name='pname', size=2, fmt=<FMT>},
--         ...
--       } },
--       ...
--     }
--   }
--
-- <MODE> is 'R', 'W', or 'RW'
-- <FMT> is 'u' (unsigned), 'd' (signed), 'b' (boolean) or 's' (string)
--
function cvg.slave_init(t)

  assert(type(t) == 'table', "invalid slave type")
  t.roid = math.floor(t.roid)
  assert(t.roid > 0 and t.roid < 256, "invalid 'roid' value")
  assert(type(t.buffer) == 'table', "missing 'buffer' field")

  local offset = 2  -- sub-addresses start at 2
  for k,v in ipairs(t.buffer) do
    assert(type(v) == 'table', "invalid 'buffer' element")
    -- checks fields
    assert(type(v.name) == 'string', "invalid 'name' field")
    assert(type(v.params) == 'table', "invalid 'params' field")
    assert(#v.params > 0, "empty 'params' field")
    s = v.mode
    assert(s=='R' or s=='W' or s=='RW', "unexpected 'mode' value: "..tostring(s))

    -- offset
    if v.offset == nil then
      v.offset = offset
    else
      v.offset = tonumber(v.offset)
      assert(v.offset == offset, "offset mismatch, expected "..tostring(offset).." got "..tostring(v.offset))
    end

    -- params
    local poffset, size
    size = 0
    for pk,pv in ipairs(v.params) do
      assert(type(pv) == 'table', "invalid 'params' element")
      -- checks fields
      assert(type(pv.name) == 'string', "invalid 'name' field")
      pv.size = math.floor(pv.size)
      assert(pv.size > 0, "invalid 'size' value: "..tostring(pv.size))
      s = pv.fmt
      assert(s=='u' or s=='d' or s=='b' or s=='s', "unexpected 'fmt' value: "..tostring(s))
      if s == 'b' then assert(pv.size == 1, "size must be 1 for boolean values") end
      size = size + pv.size
    end

    -- size
    assert(size < 256-2, "buffer size is too big: "..tostring(size))
    if v.size == nil then
      v.size = size
    else
      v.size = tonumber(v.size)
      assert(v.size == size, "size mismatch, expected "..tostring(size).." got "..tostring(v.size))
    end

    offset = offset + size

  end

  return setmetatable(t, cvg.slave_mt)

end

