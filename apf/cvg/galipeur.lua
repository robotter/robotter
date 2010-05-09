--
-- Define the Galipeur class.
--


Galipeur = class(nil, function(self, mass)
  self.mass = mass
end)

function Galipeur.get_xy(self)
  local t = unioc:call('GET_XYA')
  return t.x, t.y
end
function Galipeur.get_a(self)
  local t = unioc:call('GET_XYA')
  return t.a
end
function Galipeur.get_xya(self)
  local t = unioc:call('GET_XYA')
  return t.x, t.y, t.a
end

function Galipeur.set_speed_xy(self, v, a)
  unioc:call('SET_XY_CRUISE_SPEED', {v, a})
end
function Galipeur.set_speed_steering(self, v, a)
  unioc:call('SET_XY_STEERING_SPEED', {v, a})
end
function Galipeur.set_speed_stop(self, v, a)
  unioc:call('SET_XY_STOP_SPEED', {v, a})
end
function Galipeur.set_threshold_steering(self, r)
  unioc:call('SET_STEERING_WIN', {r})
end
function Galipeur.set_threshold_stop(self, r, l)
  unioc:call('SET_STOP_WIN', {r, l})
end
function Galipeur.set_speed_a(self, v, a)
  unioc:call('SET_A_SPEED', {v, a})
end

function Galipeur.order_xya(self, x, y, a, rel)
  if rel then
    unioc:call('GOTO_R_XYA', {x,y,a})
  else
    unioc:call('GOTO_A_XYA', {x,y,a})
  end
end
function Galipeur.order_trajectory(self, t)
  for i,pt in ipairs(t) do
    unioc:call('TRAJECTORY_SET_CHECKPOINT', {i-1, pt[1], pt[2]})
  end
  unioc:call('TRAJECTORY_SET_RUN', {#t-1})
end
function Galipeur.order_stop(self)
  unioc:call('BRAKE', {true})
end

function Galipeur.order_xy_done(self)
  return (unioc:call('TRAJECTORY_STATUS').b % 2) ~= 0
end
function Galipeur.order_a_done(self)
  return (unioc:call('TRAJECTORY_STATUS').b / 2) ~= 0
end
function Galipeur.is_waiting(self)
  return unioc:call('TRAJECTORY_STATUS').b == 3
end


