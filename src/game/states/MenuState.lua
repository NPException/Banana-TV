local Menu = {}
Menu.__index = Menu

local globals = GLOBALS
local tween = require("lib.tween")
local lg = love.graphics

local moods = {
  "bored", "scared", "delight"
}



function Menu.new(game)
  local menu = setmetatable({}, Menu)
  menu.game = game
  menu.titleScale = 8
  menu.titleTilt = 0.1
  menu:resetTitleTween()
  menu.stuff = {}
  menu.changeTimer = 0
  
  local width = lg.getFont():getWidth("Banana TV")
  local height = lg.getFont():getHeight()
  menu.titlecanvas = lg.newCanvas(width,height)
  lg.setCanvas(menu.titlecanvas)
    lg.setColor(255,230,0)
    lg.print("Banana")
  lg.setCanvas()
  
  menu.titleHue = 0
  menu.titleHueTween = tween.new(1, menu, {titleHue=255}, "linear")
  
  return menu
end


function Menu:resetTitleTween()
  if self.titleTilt>0 then
    self.titleTween = tween.new(2, self, {titleTilt=-0.1}, "inOutBack")
  else
    self.titleTween = tween.new(2, self, {titleTilt=0.1}, "inOutBack")
  end
end



function Menu:update(dt)
  local titleTweenComplete = self.titleTween:update(dt)
  if titleTweenComplete then
    self:resetTitleTween()
  end
  
  local titleHueTweenComplete = self.titleHueTween:update(dt)
  if titleHueTweenComplete then
    self.titleHueTween:reset()
  end
  
  lg.setCanvas(self.titlecanvas)
    local width = lg.getFont():getWidth("Banana ")
    lg.setColor(HSVtoRGB(self.titleHue,255,255))
    lg.print("TV",width)
  lg.setCanvas()
  
  self.changeTimer = self.changeTimer - dt
  
  if self.changeTimer < 0 then
    self.changeTimer = math.random(3,7)
    self.game.scene.tvframe:startNoise()
    
    self.usedChars = {}
    self.usedItems = {}
    
    for _,spot in ipairs(self.game.scene.room.spots.all) do
      local continue = false
      -- check characters first
      if spot.type == "seat" and math.random() < 0.7 then
        local char
        repeat
          char = self.game.characters[math.random(1,#self.game.characters)]
          local alreadyInUse = false
          for _,v in ipairs(self.usedChars) do
            if v.drawable == char then
              alreadyInUse = true
              break
            end
          end
        until not alreadyInUse
        char.mood = moods[math.random(1,#moods)]
        table.insert(self.usedChars, {drawable=char, spot=spot})
        continue = true
      end
      
      if not continue and math.random() < 0.1 then
        local item
--        repeat
          item = self.game.items[math.random(1,#self.game.items)]
          local alreadyInUse = false
          for _,v in ipairs(self.usedItems) do
            if v.drawable == item then
              alreadyInUse = true
              break
            end
          end
--        until not alreadyInUse
        table.insert(self.usedItems, {drawable=item, spot=spot})
        continue = true
      end
    end
  end
end



function Menu:drawRoom()
  -- draw items
  for _,entry in ipairs(self.usedItems) do
    entry.drawable:draw(entry.spot)
  end
  -- draw characters
  for _,entry in ipairs(self.usedChars) do
    entry.drawable:draw(entry.spot)
  end
end



function Menu:drawTV()
  local width = self.titlecanvas:getWidth()
  local height = self.titlecanvas:getHeight()
  lg.setColor(255,255,255,255)
  love.graphics.draw(self.titlecanvas, globals.config.resX/2, 160, self.titleTilt, self.titleScale, self.titleScale, width/2, height/2)
end
  


function Menu:drawGUI()
end



return Menu