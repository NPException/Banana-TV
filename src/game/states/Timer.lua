local Timer = {}
Timer.__index = Timer

local globals = GLOBALS

-- Constructor
function Timer.new()
  local timer = setmetatable({}, Timer)
  -- instanzvariablen initialisieren
  
  timer.beep = love.audio.newSource("assets/sounds/timerbeep.wav", "static")
  timer.oldtime = nil
  
  return timer
end


function Timer:update(dt)
  if self.isRunning then
    
    if self.oldtime > math.floor(self.runtime+1) and self.oldtime > 0 then
      if self.oldtime > 1 then
        self.beep:play()
      end
      self.oldtime = math.floor(self.runtime+1)
    end

    if self.runtime <= 0 then
      self.isRunning = false
      self.callback()
    end
    
    self.runtime = self.runtime - dt
  end
end


local lg = love.graphics
function Timer:draw()
  local radius = 140
  local scale = 18
  
  lg.setColor({0,0,0,170})
  lg.circle("fill",  globals.config.resX / 2 ,  globals.config.resY / 2, radius, 50)
  if self.runtime then
    local width = lg.getFont():getWidth(self.oldtime)
    local height = lg.getFont():getHeight()
    lg.setColor({255,255,255,255})
    lg.printf(self.oldtime, (globals.config.resX / 2) + 30  , globals.config.resY / 2, 5, "left", 0, scale, scale, width/2, height/2)
  end
  -- TODO draw timer
end

function Timer:start(callback, runtime)
  self.beep:play()
  self.runtime = runtime
  self.oldtime = runtime
  self.isRunning = true
  self.callback = callback
end

return Timer