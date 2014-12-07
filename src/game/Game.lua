local Game = {}
Game.__index = Game

local globals = GLOBALS



function Game.new()
  local g = setmetatable({}, Game)
  g.score = {scare=0, boring=0, delight=0}
  g.scene = {
    room = require("game.scene.room"),
    tvframe = require("game.scene.tvframe")
  }
  g.items = requirefolder("game/items")
  g.actions = requirefolder("game/actions")
  g.people = nil
  g.state = { update = function() end } -- TODO
  return g
end



function Game:update(dt)
  self.scene.room.update(dt)
  self.scene.tvframe.update(dt)
  
  self.state:update(dt)
end


local testcouch = require("game.scene.Couch").new()

local lg = love.graphics
function Game:draw()
  local state = self.state
  
  -- draw room background
  self.scene.room.draw()
  
  local mx,my = love.mouse.getPosition()
  testcouch.x = mx
  testcouch.y = my
  
  testcouch:draw()
  
  lg.setColor(255,255,255)
  lg.print("x="..mx, 50, 70)
  lg.print("y="..my, 50, 90)
  
  -- draw state dependent room and tv contents
  if state.drawRoom then state:drawRoom() end
  if state.drawTV then state:drawTV() end
  
  -- draw tv frame
  self.scene.tvframe.draw()
  
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