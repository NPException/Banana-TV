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
  local width = lg.getFont():getWidth("Banana TV")
  local height = lg.getFont():getHeight()
  lg.setColor(255,255,255,200)
  love.graphics.print("Banana TV", globals.config.resX/2, 160, self.titleTilt, self.titleScale, self.titleScale, width/2, height/2)
end
  


function Menu:drawGUI()
end



return Menu