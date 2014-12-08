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
  local radius = 100
  
  lg.setColor(255,255,255)
  lg.circle("fill", globals.config.resX - ( globals.config.resX / 2 ), globals.config.resY - ( globals.config.resY / 2), radius, 50)
  if self.runtime then
    lg.printf(self.oldtime, globals.config.resX - ( globals.config.resX / 2 ), globals.config.resY - ( globals.config.resY / 2),5)
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