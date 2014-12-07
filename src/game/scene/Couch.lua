local Couch = {}
Couch.__index = Couch

local globals = GLOBALS


local gfx = {
  couchImage = love.graphics.newImage("assets/scene/couch.png"),
}



function Couch.new()
  local c = setmetatable({}, Couch)
  c.x = 0
  c.y = 0
  c.offX = 370
  c.offY = 220
  c.seats = {
    {x=230, y=166},
    {x=490, y=147}
  }
  return c
end



function Couch:update(dt)
end



local lg = love.graphics
function Couch:draw()
  if not globals.config.oldschool then
    lg.setColor(255,255,255,100)
    lg.draw(gfx.couchImage, self.x-self.offX, self.y-self.offY)
  end
end



return Couch