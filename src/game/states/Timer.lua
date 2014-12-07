local Timer = {}
Timer.__index = Timer

local globals = GLOBALS


-- Constructor
function Timer.new()
  local timer = setmetatable({}, Timer)
  -- instanzvariablen initialisieren
  return timer
end


function Timer:update(dt)
  
end


local lg = love.graphics
function Timer:draw()
  lg.setColor(255,255,255)
  -- TODO draw timer
end

return Timer