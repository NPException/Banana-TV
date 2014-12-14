local Timer = {}
Timer.__index = Timer

local globals = GLOBALS

-- Constructor
function Timer.new()
  local timer = setmetatable({}, Timer)
  
  timer.isStarted = true
  timer.runtime = 0
  timer.oldtime = 0
  timer.isRunning = false
  timer.callback = nil
  timer.beep = love.audio.newSource("assets/sounds/timerbeep.wav", "static")
  
  return timer
end


function Timer:update(dt)
  if self.isRunning then
    if self.isStarted then
      self.beep:play()
      self.isStarted = false
    end
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
    
    self.runtime = self.runtime - dt*1.1
  end
end


local lg = love.graphics
function Timer:draw()
  if self.isRunning then
    local radius = 140
    local scale = 18

    lg.setColor({0,0,0,100})
    lg.circle("fill",  globals.config.resX / 2 ,  globals.config.resY / 2, radius)
  
    local width = lg.getFont():getWidth("0")
    local height = lg.getFont():getHeight()
    lg.setColor({255,255,255,180})
    lg.print(self.oldtime, globals.config.resX/2, globals.config.resY/2, 0, scale, scale, width/2-0.5, height/2-0.5)
  end
end

function Timer:start(callback, runtime)
  self.isStarted = true
  self.runtime = runtime
  self.oldtime = runtime
  self.isRunning = true
  self.callback = callback
end

return Timer