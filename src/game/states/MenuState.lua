local Menu = {}
Menu.__index = Menu

local globals = GLOBALS
local tween = require("lib.tween")
local lg = love.graphics




function Menu.new()
  local menu = setmetatable({}, Menu)
  menu.titleScale = 8
  menu.titleTilt = 0.1
  menu:resetTitleTween()
  return menu
end


function Menu:resetTitleTween()
  if self.titleTilt>0 then
    self.titleTween = tween.new(2, self, {titleTilt=-0.1}, 'inOutBack')
  else
    self.titleTween = tween.new(2, self, {titleTilt=0.1}, 'inOutBack')
  end
end


function Menu:update(dt)
  local titleTweenComplete = self.titleTween:update(dt)
  if titleTweenComplete then
    self:resetTitleTween()
  end
end



function Menu:drawRoom()
end



function Menu:drawTV()
  local width = lg.getFont():getWidth("Banana TV")
  local height = lg.getFont():getHeight()
  lg.setColor(255,255,255)
  love.graphics.print("Banana TV", globals.config.resX/2, 160, self.titleTilt, self.titleScale, self.titleScale, width/2, height/2)
end
  


function Menu:drawGUI()
end



return Menu