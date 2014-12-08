local TVFrame = {}
TVFrame.__index = TVFrame

local globals = GLOBALS
local tween = require("lib.tween")
local lg = love.graphics


local frameImage = love.graphics.newImage("assets/scene/tvframe.png")



function TVFrame.new()
  local tvf = setmetatable({}, TVFrame)
  tvf.timer = 0
  tvf.noise = {
    start = false,
    tick = 0,
    duration = 0.5,
    alpha = 0,
    scale = 6,
    sound = love.audio.newSource("assets/sounds/static.wav", "static"),
    soundloop = love.audio.newSource("assets/sounds/staticloop.wav", "static")
  }
  tvf.noise.canvas = lg.newCanvas(globals.config.resX/tvf.noise.scale, globals.config.resY/tvf.noise.scale)
  tvf.noise.soundloop:setLooping(true)
  return tvf
end



function TVFrame:startNoise(loop)
  self.noise.tick = 0
  self.noise.alpha = 255
  self.noise.start = true
  self.noise.loop = loop
end



function TVFrame:stopNoise()
  self.noise.loop = false
end



function TVFrame:update(dt)
  self.timer = self.timer + dt
  
  -- update white noise
  if self.noise.alpha > 0 then
    if self.noise.start then
      if self.noise.loop then
        self.noise.soundloop:play()
      elseif not self.noise.soundloop:isPlaying() then
        self.noise.sound:play()
      end
      self.noise.start = false
    end
    if self.noise.tick > 0 then
      self.noise.tick = self.noise.tick - dt*20
    else
      self.noise.tick = 1
      local canvas = self.noise.canvas
      local rand = math.random
      lg.setCanvas(canvas)
      lg.setPointSize(1)
      lg.setPointStyle("rough")
      for y=0,canvas:getHeight() do
        for x=0,canvas:getWidth(),2 do
          local brightness = rand(50,255)
          lg.setColor(brightness,brightness,brightness,255)
          lg.point(0.5+x, 0.5+y)
          lg.point(1.5+x, 0.5+y)
        end
      end
      lg.setCanvas()
    end
    
    if not self.noise.loop then
      self.noise.alpha = self.noise.alpha - dt*(1/self.noise.duration)*255
    end
    
    self.noise.soundloop:setVolume((self.noise.alpha/255))
    self.noise.sound:setVolume((self.noise.alpha/255))
    
    if self.noise.alpha <= 0 then
      self.noise.sound:stop()
      self.noise.soundloop:stop()
    end
  end
end



function TVFrame:draw()
  -- draw scanline
  lg.setLineWidth(1)
  local alpha = {100}
  local alphaTween = tween.new(100, alpha, {0}, 'outCirc')
  for i=0,100 do
    local scanlineY = math.floor((self.timer*globals.config.resY*0.3-i) % (globals.config.resY-10))+5
    lg.setColor(200,255,255,alpha[1])
    lg.line(5,scanlineY, globals.config.resX-5, scanlineY)
    alphaTween:update(1)
  end
  
  if self.noise.alpha > 0 then
    lg.setColor(255,255,255,self.noise.alpha)
    lg.draw(self.noise.canvas,0,0,0,self.noise.scale,self.noise.scale)
  end
  
  -- draw tv frame image
  lg.setColor(255,255,255)
  lg.draw(frameImage,0,0)
end

return TVFrame
