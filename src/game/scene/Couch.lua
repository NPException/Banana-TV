local Couch = {}
Couch.__index = Couch

local globals = GLOBALS


local image = love.graphics.newImage("assets/scene/couch.png")



function Couch.new()
  local c = setmetatable({}, Couch)
  c.x = 640
  c.y = 440
  c.offX = 370
  c.offY = 220
  c.seats = {
    {x=200, y=166, type="seat"},
    {x=500, y=147, type="seat"}
  }
  c.armrests = {
    {x=670,y=70, type="armrest"},
    {x=54,y=82, type="armrest"}
  }
  return c
end



function Couch:update(dt)
end



local lg = love.graphics
function Couch:draw()
  if not globals.config.oldschool then
    lg.setColor(255,255,255)
    lg.draw(image, self.x-self.offX, self.y-self.offY)
  end
end



return Couch