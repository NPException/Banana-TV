local Game = {}
Game.__index = Game

local globals = GLOBALS



function Game.new()
  local g = setmetatable({}, Game)
  g.score = {scare=0, boring=0, delight=0}
  g.scene = {
    room = require("game.scene.Room").new(),
    tvframe = require("game.scene.TVFrame").new()
  }
  
  g.items = requirefolder("game/items")
  g.actions = requirefolder("game/actions")
  
  -- initialize characters
  local Character = require("game.characters._Character")
  g.characters = {}
  for key,charTable in pairs(requirefolder("game/characters")) do
    g.characters[key] = Character.new(key, charTable)
  end
  
  g.state = { update = function() end } -- TODO
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
end



local lg = love.graphics
function Game:draw()
  local mx,my = love.mouse.getPosition() -- for debuging only
  
  local state = self.state
  
  -- draw room background
  self.scene.room:draw()
  
--  local count = 0
--  for _,char in pairs(self.characters) do
--    char:draw({x=mx+count*200, y=my})
--    count = count + 1
--  end
  self.characters.emo:draw({x=mx, y=my})
  
  -- draw state dependent room and tv contents
  if state.drawRoom then state:drawRoom() end
  if state.drawTV then state:drawTV() end
  
  -- draw tv frame
  self.scene.tvframe:draw()
  
  if state.drawGUI then state:drawGUI() end
  
  -- TODO draw score --
  
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