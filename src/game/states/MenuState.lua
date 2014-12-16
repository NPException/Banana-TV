local Menu = {}
Menu.__index = Menu

local globals = GLOBALS
local tween = require("lib.tween")
local lg = love.graphics
local hsvToRgb = hsvToRgb
local gfx = require("lib.graphics")

local moods = {
  "bored", "scared", "delight"
}

local helptext = {
  [[
    Welcome to Banana TV!
    (Use the left and right arrows to navigate)
  
    You are a little gnome inside a TV-Monitor who decides what the family members are going to watch.
    
    First, you have to decide what reactions you are aiming to cause in your audience.
    That choice will later be mentioned in the highscore.
  ]],
  [[
    Each round of the game consists of 3 different steps:
    
    == STEP 1 - the preview ==
    You will see the empty room with a few items being in it. Those items indicate the character(s) that will watch TV in step 3.
    
    == STEP 2 - the choice ==
    Now you have to decide which program you want to show to your audience. Make the choice depending on the audience you expect\
    and the goal you are trying to achieve.
  ]],
  [[
    == STEP 3 - the show ==
    At this point you will see the character(s) that will be watching your show. Depending on the choice you made in the previous\
    step, the characters might be bored, delighted or even scared by the show.
    Your scores will increased based on that.
    
    == THE END ==
    The game is over once you have reached ]]..globals.config.scorelimit..[[ points in one of the categories you did not choose.
  ]]
}



function Menu.new(game, highscore)
  local menu = setmetatable({}, Menu)
  
  game:resetScore()
  
  menu.game = game
  menu.titleScale = 8
  menu.titleTilt = 0.1
  menu:resetTitleTween()
  menu.stuff = {}
  menu.changeTimer = 0
  
  menu.titleHue = 0
  menu.titleHueTween = tween.new(1, menu, {titleHue=1}, "linear")
  
  menu.showHelp = false
  menu.helpPage = 1
  menu.highscore = highscore
  
  menu.usedChars = {}
  menu.usedItems = {}
  
  return menu
end


function Menu:resetTitleTween()
  if self.titleTilt>0 then
    self.titleTween = tween.new(2, self, {titleTilt=-0.1}, "inOutBack")
  else
    self.titleTween = tween.new(2, self, {titleTilt=0.1}, "inOutBack")
  end
end



function Menu:keypressed(key)
  if self.highscore then
    self.highscore = nil
    return
  end
  
  local gameVariant = nil
  
  if key == "1" or key == "kp1" then
    gameVariant = "delight"
  elseif key == "2" or key == "kp2" then
    gameVariant = "bored"
  elseif key == "3" or key == "kp3" then
    gameVariant = "scared"
  elseif key == "4" or key == "kp4" then
    self.showHelp = not self.showHelp
  elseif self.showHelp then
    if key=="left" then
      self.helpPage = math.max(1, self.helpPage-1)
    elseif key == "right" then
      self.helpPage = math.min(#helptext, self.helpPage+1)
    end
  elseif key == "x" then
    self.changeTimer = 0
  end
  
  if gameVariant then
    self.game.variant = gameVariant
    self.game.showScore = true
    self.game.state = require("game.states.PreviewState").new(self.game)
    self.game.scene.tvframe:startNoise()
    for _, action in ipairs(self.game.actions) do
      action:setRoundsUnavailable(0)
    end
  end
end


local pickCanvas
function Menu:mousepressed(x, y, button)
  if self.highscore then
    self:keypressed("space")
    return
  end
  
--  lg.push()
--    if not pickCanvas then
--      pickCanvas = lg.newCanvas(globals.config.resX, globals.config.resY)
--    end
--    lg.setCanvas(pickCanvas)
--      lg.setBackgroundColor(0,0,0)
--      lg.clear()
--      self:drawGUI(true)
--    lg.setCanvas()
--  lg.pop()

--  local r = pickCanvas:getPixel(x,y)
  
  
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
  
  self.changeTimer = self.changeTimer - dt
  
  if self.changeTimer < 0 then
    self.changeTimer = math.random(3,7)
    if not self.highscore then
      self.game.scene.tvframe:startNoise()
    end
    
    self.usedChars = {}
    self.usedItems = {}
    
    local charsCopy = lowCopy(self.game.characters)
    local itemsCopy = lowCopy(self.game.items)
    
    for _,spot in ipairs(self.game.scene.room.spots.all) do
      local continue = false
      -- check characters first
      if spot.type == "seat" and math.random() < 0.7 then
        local index = math.random(1,#charsCopy)
        local char = charsCopy[index]
        table.remove(charsCopy, index)
        
        char.mood = moods[math.random(1,#moods)]
        table.insert(self.usedChars, {char=char, spot=spot})
        continue = true
      end
      
      if not continue and math.random() < 0.2 and #itemsCopy>0 then
        local item
        local index
        for i=1,100 do
          index = math.random(1,#itemsCopy)
          item = itemsCopy[index]
          if item.positions[spot.type] then
            break
          else
            item = nil
          end
        end
        
        if item then
          table.remove(itemsCopy, index)
          table.insert(self.usedItems, {item=item, spot=spot})
        end
      end
    end
  end
  
  for _,entry in ipairs(self.usedChars) do
    entry.char:update(dt)
  end
end


function Menu:drawWall()
  -- draw items
  for _,entry in ipairs(self.usedItems) do
    if entry.spot.type == "wall" then
      entry.item:draw(entry.spot)
    end
  end
end


function Menu:drawRoom()
  -- draw items
  for _,entry in ipairs(self.usedItems) do
    if entry.spot.type ~= "wall" then
      entry.item:draw(entry.spot)
    end
  end
  -- draw characters
  for _,entry in ipairs(self.usedChars) do
    entry.char:draw(entry.spot)
  end
end



function Menu:printTitle()
  lg.push()
    lg.translate(globals.config.resX/2,160)
    lg.rotate(self.titleTilt)
    lg.scale(self.titleScale)
    
    local width = lg.getFont():getWidth("Banana TV")
    local height = lg.getFont():getHeight()
    local half = globals.config.resX/2
    local alpha = 170
    lg.setColor(255,230,0,alpha)
    lg.print("Banana",0,0,0,1,1,width/2,height/2)
    
    local partwidth = lg.getFont():getWidth("Banana ")
    local r,g,b = hsvToRgb(self.titleHue,1,1)
    lg.setColor(r,g,b,alpha)
    lg.print("TV",partwidth, 0, 0, 1, 1, width/2, height/2)
    
    lg.setColor(255,255,255,alpha)
    lg.print("Your chance to ruin multiple lifes!", 0,0, 0, 0.25,0.25, width*2, -height*1.5)
  lg.pop()
end



function Menu:drawGUI(pickmode)
  if pickCanvas then
    lg.setColor(255,255,255)
    lg.draw(pickCanvas, 0, globals.config.resY)
  end
  if self.showHelp then
    local x = globals.config.resX/12
    local y = globals.config.resY/6
    local offY = y*0.3
    local w = globals.config.resX - (x*2)
    local h = globals.config.resY - (y*2)
    lg.setColor(0,0,0,230)
    lg.rectangle("fill", x-10, y-10-offY, w+20, h+20)
    
    lg.setColor(255,255,255)
    local scale = 2
    lg.printf(helptext[self.helpPage], x, y-offY, w/scale, "left", 0, scale, scale)
    
    local fontH = lg.getFont():getHeight()
    lg.setColor(238,238,0)
    if self.helpPage > 1 then
      lg.printf("Previous", x, y-offY+h-fontH*scale, w/scale, "left", 0, scale, scale)
    end
    lg.printf("Page "..self.helpPage.."/"..#helptext, x, y-offY+h-fontH*scale, w/scale, "center", 0, scale, scale)
    if self.helpPage < #helptext then
      lg.printf("Next", x, y-offY+h-fontH*scale, w/scale, "right", 0, scale, scale)
    end
    
    local half = globals.config.resX/2
    lg.setColor(255,255,255)
    gfx.printTiltedWithBackground("Press [4] to go back", half, y+h+offY, 2, {255,255,255}, 0.05 )
    
  else
    local half = globals.config.resX/2
    self:printTitle()
    
    if self.highscore then
      local height = 320
      gfx.printTiltedWithBackground("Delight: "..self.highscore.delight, half, height,     self.highscore.variant=="delight" and 4 or 3, {0,238,0},     0.05)
      gfx.printTiltedWithBackground("Bored: "..self.highscore.bored,     half, height+90,  self.highscore.variant=="bored" and 4 or 3,   {238,238,0},   0.05)
      gfx.printTiltedWithBackground("Scared: "..self.highscore.scared,   half, height+180, self.highscore.variant=="scared" and 4 or 3,  {238,0,0},     0.05)
      gfx.printTiltedWithBackground("- Press any key to continue -",     half, height+300, 2,                                            {255,255,255}, 0.05)
    else
      local height = 450
      gfx.printTiltedWithBackground("[1] Delight people",    half, height,     3, {0,238,0}     ,0.05, pickmode)
      gfx.printTiltedWithBackground("[2] Make people bored", half, height+70,  3, {238,238,0}   ,0.05, pickmode)
      gfx.printTiltedWithBackground("[3] Scare people",      half, height+140, 3, {238,0,0}     ,0.05, pickmode)
      gfx.printTiltedWithBackground("[4] HOW TO PLAY",       half, height+200, 2, {255,255,255} ,0.05, pickmode)
    end
  end
end



return Menu