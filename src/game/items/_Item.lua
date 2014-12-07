local Item = {}
Item.__index = Item

local globals = GLOBALS



function Item.new(id, itemTable)
  local item = setmetatable({}, Item)
  item.id = id
  item.name = itemTable.name
  item.image = itemTable.image
  item.offsetX = itemTable.offsetX
  item.offsetY = itemTable.offsetY
  item.positions = itemTable.positions
  return item
end



local lg = love.graphics
function Item:draw(pos)
  lg.setColor(255,255,255)
  lg.draw(self.image, pos.x-self.offsetX, pos.y-self.offsetY)
end

return Item