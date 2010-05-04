
cvg = {}

-- Default callback, raise an error.
local cb_default = function()
  error("callbacks not set")
end

-- Configuration attributes.
-- Can be modified by the user.

-- Recv and send methods which will be used.
cvg.cb_send = cb_default -- cb_send(addr, data)
cvg.cb_recv = cb_default -- cb_recv(addr, size) -> string
-- Sleep method
cvg.cb_sleep = cb_default -- cb_sleep(sec)

-- Default polldt value for call method.
cvg.default_polldt = 0.1
-- Default tout value for call method.
cvg.default_tout = 3


-- Slave metatable, define slave methods.
local slave_mt = {

  -- Find order with given id or name
  get_order = function(self, id)
    for k,v in ipairs(self.orders) do
      if v.id == id or v.name == id then
        do return v end
      end
    end
    return nil
  end,

  -- Send raw order payload.
  send_raw = function(self, o, data)
    assert(#data == o.args.size, "invalid params size: expected "..tostring(o.args.size).." got "..tostring(#data))
    cvg.cb_send(self.roid, string.char(o.id, #data)..data)
  end,

  -- Send data.
  --   id: order id or name
  --   params: string or table of byte values (raw data), or table of named
  --           (typed) values, defaults to an empty table
  send = function(self, id, params)

    local o = self:get_order(id)
    assert(o ~= nil, "order not found: "..tostring(id))

    local sout  -- output string
    if params == nil then params = {} end
    if type(params) == 'string' then
      -- raw params (string)
      sout = params
    elseif type(params) == 'table' then
      -- table params
      local named_values = params[1] == nil
      sout = ''
      for pk,pv in ipairs(o.args) do
        if named_values then pk = pv.name end
        local x = params[pk]
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
      error("invalid params type")
    end

    self:send_raw(o, sout)

  end,

  -- Receive raw order response as a string.
  -- If payload is empty and order has an non-empty, nil is returned.
  recv_raw = function(self, o)

    local data = cvg.cb_recv(self.roid, o.ret.size+1)
    if o.ret.size == 0 then
      assert( data == '\0', "invalid data for empty response")
      return ''
    else
      if data:byte(1) == 0 then
        return nil -- no payload
      end
      assert( #data == o.ret.size+1, "invalid data size")
      local ret = data:sub(2)
      assert( data:byte(1) == o.ret.size, "invalid payload size")
      return ret
    end

  end,

  -- Receive data as a table indexed by parameters names and integers.
  -- Return nil if data is not ready.
  recv = function(self, id)

    local o = self:get_order(id)
    assert(o ~= nil, "order not found: "..tostring(id))

    local sdata = self:recv_raw(o)
    if sdata == nil then
      return nil
    end

    local t = {}
    local i = 1
    for pk,pv in ipairs(o.ret) do
      s = sdata:sub(i,i+pv.size-1)
      local v
      if pv.fmt == 's' then
        v = s
      elseif pv.fmt == 'b' then
        v = s:byte(1) ~= 0
      else -- 'd' or 'u'
        local x = 0
        local m = 1
        for j=1,pv.size do
          x = x + s:byte(j) * m
          m = m * 256
        end
        -- transform to negative value if needed
        if pv.fmt == 'o' and x > m/2 then
          x = x - m
        end
        v = x
      end
      i = i + pv.size
      -- values stored for named key and integer key
      t[pv.name] = v
      t[pk] = v
    end

    return t

  end,


  -- Send data and poll until a response is received or timeout expires.
  -- Return data as a table or nil on timeout.
  -- The method always wait polldt between send and receive.
  -- Warning: the timeout only consider the polling waiting time and not the
  -- actual elapsed time.
  call = function(self, id, params, polldt, tout)
    if not polldt then polldt = cvg.default_polldt end
    if not tout then tout = cvg.default_tout end
    self:send(id, params)
    local ttot = 0
    while ttot < tout do
      if ttot + polldt >= tout then
        cvg.cb_sleep( tout-ttot )
        ttot = tout
      else
        cvg.cb_sleep( polldt )
        ttot = ttot + polldt
      end
      local ret = self:recv(id)
      if ret ~= nil then return ret end
    end
    return nil
  end,

}
slave_mt.__index = slave_mt


-- Check a slave parameter table, set its size.
local function check_params(t)
  local poffset = 0
  for pk,pv in ipairs(t) do
    assert(type(t) == 'table', "invalid parameter element")
    -- checks fields
    assert(type(pv.name) == 'string', "invalid 'name' field")
    assert(type(pv.size) == 'number', "invalid 'size' field")
    pv.size = math.floor(pv.size)
    assert(pv.size > 0, "invalid 'size' value: "..tostring(pv.size))
    s = pv.fmt
    assert(s=='u' or s=='d' or s=='b' or s=='s', "unexpected 'fmt' value: "..tostring(s))
    if s == 'b' then assert(pv.size == 1, "size must be 1 for boolean values") end
    pv.offset = poffset
    poffset = poffset + pv.size
  end
  t.size = poffset
end


-- Create a slave from a table.
-- Check data and fill out some fields.
-- Note: given table is modified in-place.
--
-- t should have the following format (some fields are optional)
--   t = {
--     roid = 42,
--     orders = {
--       { id=0x12, name = 'MESSAGE_NAME', args = <PARAMS>, ret = <PARAMS> },
--       ...
--     }
--   }
-- 
-- with <PARAMS> = {
--   { name = 'param_name', size = byte_size, fmt = <FMT>
--   ...
-- }
--
-- <FMT> is 'u' (unsigned), 'd' (signed), 'b' (boolean) or 's' (string)
--
function cvg.slave_init(t)

  assert(type(t) == 'table', "invalid slave type")
  assert(t.roid, "invalid 'roid' value")
  t.roid = math.floor(t.roid)
  assert(t.roid > 0 and t.roid < 256, "invalid 'roid' value")
  assert(type(t.orders) == 'table', "missing 'orders' field")

  local t_ids = {}  -- to check multiple use of ids/names
  local t_names = {}
  for k,v in ipairs(t.orders) do
    assert(type(v) == 'table', "invalid 'orders' element")
    -- checks fields
    v.id = math.floor(v.id)
    assert(type(v.id) == 'number', "invalid 'id' field")
    assert(type(v.name) == 'string', "invalid 'name' field")
    assert( not t_ids[v.id], "order ID already used")
    assert( not t_names[v.name], "order name already used")
    t_ids[v.id] = true
    t_names[v.name] = true
    if v.args == nil then v.args = {} end
    if v.ret == nil then v.ret = {} end
    assert(type(v.args) == 'table', "invalid 'args' field")
    assert(type(v.ret) == 'table', "invalid 'ret' field")

    -- check parameters, compute size
    check_params(v.args)
    check_params(v.ret)
  end

  return setmetatable(t, slave_mt)

end


-- Create module
module('cvg')

