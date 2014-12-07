local Table = {}
Table.__index = Table

local globals = GLOBALS


local gfx = {
  image = love.graphics.newImage("assets/scene/table.png"),
}



function Table.new()
  local c = setmetatable({}, Table)
  c.x = 197
  c.y = 500
  c.offX = 94
  c.offY = 127
  c.spot = {x=85, y=23, type="table"}
  return c
end



function Table:update(dt)
end



local lg = love.graphics
function Table:draw()
  if not globals.config.oldschool then
    lg.setColor(255,255,255)
    lg.draw(gfx.image, self.x-self.offX, self.y-self.offY)
  end
end



return Table