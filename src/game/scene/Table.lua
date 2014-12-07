local Table = {}
Table.__index = Table

local globals = GLOBALS


local gfx = {
  image = love.graphics.newImage("assets/scene/table.png"),
}



function Table.new()
  local t = setmetatable({}, Table)
  t.x = 197
  t.y = 500
  t.offX = 94
  t.offY = 127
  t.spot = {x=85 + t.x-t.offX, y=23 + t.y-t.offY, type="table"}
  return t
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