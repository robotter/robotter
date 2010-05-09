--
--  Define a class method equivalent to Simulotter's one.
--

local _class_mt = {

  __call = function(cls, ...)
    local o = {}
    o = setmetatable(o,cls)
    if cls._ctor then
      cls._ctor(o, ...)
    end
    return o
  end,

  __index = function(cls, name)
    local base = rawget(cls, '_base')
    if base then
      return base[name]
    else
      return nil
    end
  end,

}

function class(base, ctor)

  local t = {
    _base = base, -- may be nil
    _ctor = ctor, -- may be nil
  }
  t.__index = t
  return setmetatable(t, _class_mt)

end

