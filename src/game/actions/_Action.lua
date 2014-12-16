local Action = {}
Action.__index = Action

local globals = GLOBALS
local lg = love.graphics
local gfx = require("lib.graphics")


local function convertToGreyScale(image)
  local data = image:getData()
  local greyData = love.image.newImageData(image:getWidth(), image:getHeight())
  for y=0,data:getHeight()-1 do
    for x=0,data:getWidth()-1 do
      local r,g,b,a = data:getPixel(x,y)
      local avg = (r+g+b)/3
      greyData:setPixel(x,y,avg,avg,avg,a)
    end
  end
  return lg.newImage(greyData)
end


function Action.new(id, actionTable)
  local action = setmetatable({}, Action)
  action.id = id
  action.name = actionTable.name
  action.icon = actionTable.icon
  action.iconGrey = convertToGreyScale(action.icon)
  action.roundsUnavailable = 0
  action.iconPos = nil
  action.iconOffset = {
    x = (((action.icon:getWidth()%2) > 0) and 0.5 or 0),
    y = (((action.icon:getHeight()%2) > 0) and 0.5 or 0)
  }
  action.animation = actionTable.animation
  action.score = actionTable.score
  return action
end


function Action:setRoundsUnavailable(num)
  self.roundsUnavailable = num
end


function Action:decreaseRoundsUnavailable()
  self.roundsUnavailable = self.roundsUnavailable - 1
  if self.roundsUnavailable < 0 then
    self.roundsUnavailable = 0
  end
end


function Action:isAvailable()
  return self.roundsUnavailable <= 0
end


function Action:resetAnimation()
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
  local available = self:isAvailable()
  local icon = available and self.icon or self.iconGrey
  local pos = self.iconPos
  local off = self.iconOffset
  
  lg.setColor(255,255,255)
  lg.draw(icon, pos.x, pos.y, 0, 1, 1, icon:getWidth()/2 + off.x, icon:getHeight()/2 + off.y)
  
  if not available then
    local y = self.iconPos.y-self.icon:getHeight()/4
    gfx.printTiltedWithBackground("Locked for", self.iconPos.x, y, 1.5, {238,0,0}, 0.1)
    gfx.printTiltedWithBackground(self.roundsUnavailable, self.iconPos.x-icon:getWidth()/2.5, y+icon:getHeight()/3, 2.5, {238,0,0}, 0.1)
    local word = (self.roundsUnavailable > 1) and "Rounds" or "Round"
    gfx.printTiltedWithBackground(word, self.iconPos.x+icon:getWidth()/4, y+icon:getHeight()/2.5, 1.5, {238,0,0}, 0.1)
  end
end


function Action:drawIconFocus()
  local available = self:isAvailable()
  
  if available then
    local ox,oy = 15,10
    lg.push()
    lg.translate(-ox,-oy)
    lg.setColor(0,0,0, 170)
    lg.circle("fill", self.iconPos.x+ox, self.iconPos.y+oy, self.icon:getWidth()*0.91)
    lg.setColor(255,255,255)
    lg.circle("fill", self.iconPos.x, self.iconPos.y, self.icon:getWidth()*0.9)
  end
  
  self:drawIcon()
  
  local color = available and {238,238,0} or {200,200,200}
  gfx.printTiltedWithBackground(self.name, self.iconPos.x, self.iconPos.y+self.icon:getHeight()/2, 1.5, color, 0.1)
  
  if available then
    lg.pop()
  end
end


return Action