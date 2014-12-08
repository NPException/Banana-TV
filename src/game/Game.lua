local Game = {}
Game.__index = Game

local globals = GLOBALS



function Game.new()
  local g = setmetatable({}, Game)
  g.score = {scared=2151, bored=99999, delight=221}
  g.showScore = false
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


-- TEST STUFF
local moods = {
  "bored", "scared", "delight"
}


function Game:update(dt)
  self.scene.room:update(dt)
  self.scene.tvframe:update(dt)
  
  local currentMood = moods[math.floor((globals.time%3)+1)]
  for _,char in pairs(self.characters) do
    char.mood = currentMood
  end
  
  self.state:update(dt)
  self.timer:update(dt)
end



local lg = love.graphics
function Game:draw()
  local mx,my = love.mouse.getPosition() -- for debuging only
  
  local state = self.state
  
  -- draw room background
  self.scene.room:draw()
  
  local count = 0
  for _,char in ipairs(self.characters) do
    char:draw({x=globals.offX+(mx+count*200/globals.scale)*globals.scale, y=globals.offY+my*globals.scale})
    count = count + 1
  end
  
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
    local scoreWidth = 180
    local baseRadi = 0.08
    local fontSize = 1.5
    -- Scared
    lg.setColor(238, 0, 0) -- red
    lg.printf("Scared: ", (globals.config.resX - txtWidth), 45, 50, "right", baseRadi, fontSize)
    lg.printf(self.score.scared, (globals.config.resX - scoreWidth), 51, 100, "left", baseRadi, fontSize)
    -- Bored
    lg.setColor(238, 238, 0) -- yellow
    lg.printf("Bored: ", (globals.config.resX - txtWidth), 75, 50, "right", baseRadi, fontSize)
    lg.printf(self.score.bored, (globals.config.resX - scoreWidth), 81, 100, "left", baseRadi, fontSize)
    -- Delight
    lg.setColor(0, 238, 0) -- green
    lg.printf("Delight: ", (globals.config.resX - txtWidth), 105, 50, "right", baseRadi, fontSize)
    lg.printf(self.score.delight, (globals.config.resX - scoreWidth), 111, 100, "left", baseRadi, fontSize)
  end


  if globals.debug then
    lg.print(love.timer.getFPS(), 1,1)
  end
end



function Game:keypressed(key)
  local state = self.state
  if state.keypressed then state:keypressed(key) end
end



function Game:mousepressed(x,y,button)
  local state = self.state
  if state.mousepressed then state:mousepressed(x,y,button) end
end



return Game