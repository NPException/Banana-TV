local frame = {}

local globals = GLOBALS
local tween = require("lib.tween")

local gfx = {
  frameImage = love.graphics.newImage("assets/scene/tvframe.png"),
  frameImageDev = love.graphics.newImage("assets/scene/tvframe_dev.png")
}



function frame.update(dt)
end

local lg = love.graphics
function frame.draw()
  -- draw scanline
  lg.setLineWidth(1)
  local alpha = {150}
  local alphaTween = tween.new(100, alpha, {0}, 'outCirc')
  for i=0,100 do
    local scanlineY = math.floor((globals.time*globals.config.resY*0.3-i) % (globals.config.resY-10))+5
    lg.setColor(200,255,255,alpha[1])
    lg.line(5,scanlineY, globals.config.resX-5, scanlineY)
    alphaTween:update(1)
  end
  
  -- draw tv frame image
  lg.setColor(255,255,255)
  if globals.config.oldschool then
    lg.draw(gfx.frameImageDev,0,0)
  else
    lg.draw(gfx.frameImage,0,0)
  end
end

return frame