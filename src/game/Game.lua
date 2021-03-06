local Game = {}
Game.__index = Game

local globals = GLOBALS



function Game.new()
  local g = setmetatable({}, Game)
  g:resetScore()
  g.scene = {
    room = require("game.scene.Room").new(),
    tvframe = require("game.scene.TVFrame").new()
  }
  
  -- initialize actions
  local Action = require("game.actions._Action")
  g.actions = {}
  for key,actionTable in pairs(requirefolder("game/actions")) do
    table.insert(g.actions, Action.new(key, actionTable))
  end
  
  -- initialize items
  local Item = require("game.items._Item")
  g.items = {}
  for key,itemTable in pairs(requirefolder("game/items")) do
    table.insert(g.items, Item.new(key, itemTable))
  end
  
  -- initialize characters
  local Character = require("game.characters._Character")
  g.characters = {}
  for key,charTable in pairs(requirefolder("game/characters")) do
    table.insert(g.characters, Character.new(key, charTable))
  end
  
  -- init timer
  g.timer = require("game.states.Timer").new()
  
  g.state = require("game.states.MenuState").new(g)
  return g
end



function Game:resetScore()
  self.score = {scared=0, bored=0, delight=0}
  self.showScore = false
  self.variant = nil
end



function Game:update(dt)
  self.scene.room:update(dt)
  
  self.scene.tvframe:update(dt)
  
  self.state:update(dt)
  
  self.timer:update(dt)
end



local lg = love.graphics
function Game:draw()
  local state = self.state
  
  
  -- draw room background
  self.scene.room:drawRoom()
  
  if state.drawWall then state:drawWall() end
  
  -- draw couch/table
  self.scene.room:drawFurniture()
  
  -- draw state dependent room and tv contents
  if state.drawRoom then state:drawRoom() end
  if state.drawTV then state:drawTV() end
  
  -- draw tv frame
  self.scene.tvframe:draw()
  
  if state.drawGUI then state:drawGUI() end
  
  -- draw timer --
  self.timer:draw()
  
  -- draw score --
  if self.showScore then
    local txtWidth = 260
    local scoreWidth = 175
    local baseRadi = 0.08
    local fontSize = 1.5
    local fontSizeNorm = 1.5
    local fontSizeGoal = 1.8
    
    -- Scared
    fontSize = fontSizeNorm
    if self.variant == "scared" then fontSize = fontSizeGoal end
    lg.setColor(238, 0, 0) -- red
    lg.printf("Scared: ", (globals.config.resX - txtWidth), 45, 50, "right", baseRadi, fontSize)
    lg.printf(self.score.scared, (globals.config.resX - scoreWidth), 51, 100, "left", baseRadi, fontSize)
    -- Bored
    fontSize = fontSizeNorm
    if self.variant == "bored" then fontSize = fontSizeGoal end
    lg.setColor(238, 238, 0) -- yellow
    lg.printf("Bored: ", (globals.config.resX - txtWidth), 75, 50, "right", baseRadi, fontSize)
    lg.printf(self.score.bored, (globals.config.resX - scoreWidth), 81, 100, "left", baseRadi, fontSize)
    -- Delight
    fontSize = fontSizeNorm
    if self.variant == "delight" then fontSize = fontSizeGoal end
    lg.setColor(0, 238, 0) -- green
    lg.printf("Delight: ", (globals.config.resX - txtWidth), 105, 50, "right", baseRadi, fontSize)
    lg.printf(self.score.delight, (globals.config.resX - scoreWidth), 111, 100, "left", baseRadi, fontSize)
  end
  
  
  if globals.debug then
    -- print FPS
    lg.setColor(255,255,255)
    lg.print(love.timer.getFPS(), 3,3,0,2,2)
  end
end



function Game:keypressed(key)
  local state = self.state
  if state.keypressed then state:keypressed(key) end
end



local function convertToGameCoords(x,y)
  x = x*globals.scale + globals.offX
  y = y*globals.scale + globals.offY
  return x,y
end


function Game.getMousePosition()
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  return convertToGameCoords(x,y)
end


function Game:mousepressed(x,y,button)
  local state = self.state
  if state.mousepressed then state:mousepressed(x,y,button) end
end



return Game