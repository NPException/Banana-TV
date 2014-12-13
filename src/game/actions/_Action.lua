local Action = {}
Action.__index = Action

local globals = GLOBALS
local gfx = require("lib.graphics")

function Action.new(id, actionTable)
  local action = setmetatable({}, Action)
  action.id = id
  action.name = actionTable.name
  action.icon = actionTable.icon
  action.iconPos = nil
  action.iconOffset = {
    x = (((action.icon:getWidth()%2) > 0) and 0.5 or 0),
    y = (((action.icon:getHeight()%2) > 0) and 0.5 or 0)
  }
  action.animation = actionTable.animation
  action.score = actionTable.score
  return action
end


function Action:reset()
  if self.animation.reset then
    self.animation.reset()
  end
end


function Action:update(dt)
  if self.animation.update then
    self.animation.update(dt)
  end
end


function Action:isMouseOver(mx, my)
  local pos = self.iconPos
  local width = self.icon:getWidth()
  local height = self.icon:getHeight()
  local x,y = pos.x-width/2, pos.y-height/2
  
  if x <= mx and mx <= x+width
    and y <= my and my <= y+height then
    return true 
  else
    return false
  end
end



local lg = love.graphics
function Action:draw()
  lg.push()
  lg.scale(4,4)
  lg.setColor(255,255,255,150)
  if self.animation.draw then
    self.animation.draw()
  end
  lg.pop()
end



function Action:drawIcon()
  local icon = self.icon
  local pos = self.iconPos
  local off = self.iconOffset
  lg.setColor(255,255,255)
  
  lg.draw(icon, pos.x, pos.y, 0, 1, 1, icon:getWidth()/2 + off.x, icon:getHeight()/2 + off.y)
end


function Action:drawIconFocus()
  lg.setColor(0,0,0, 170)
  lg.circle("fill", self.iconPos.x, self.iconPos.y, self.icon:getWidth()*0.9)
  
  self:drawIcon()
  
  gfx.printTiltedWithBackground(self.name, self.iconPos.x, self.iconPos.y+self.icon:getHeight()/2, 1.5, {238,238,0}, 0.1)
end


return Action