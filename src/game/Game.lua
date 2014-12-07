local Game = {}
Game.__index = Game

local globals = GLOBALS



function Game.new()
  local g = setmetatable({}, Game)
  g.score = {scare=0, boring=0, delight=0}
  g.scene = {
    room = require("game.objects.scene.room"),
    frame = require("game.objects.scene.frame")
  }
  g.items = requirefolder("items")
  g.actions = requirefolder("actions")
  g.people = nil
  g.state = { update = function() end } -- TODO
  return g
end



function Game:update(dt)
  self.scene.room.update(dt)
  self.scene.frame.update(dt)
  
  self.state:update(dt)
end



local lg = love.graphics
function Game:draw()
  local state = self.state
  
  -- draw room background
  self.scene.room.draw()
  
  -- draw state dependent room and tv contents
  if state.drawRoom then state:drawRoom() end
  if state.drawTV then state:drawTV() end
  
  -- draw tv frame
  self.scene.frame.draw()
  
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