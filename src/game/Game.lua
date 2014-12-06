local Game = {}
local mt = { __index = Game }

local gfx = {
  --roomImage = love.graphics.newImage("assets/scene/room.png")
}

function Game.new()
  local g = setmetatable({},mt)
  g.score = {scare=0, boring=0, delight=0}
  g.items = requirefolder("items")
  g.actions = requirefolder("actions")
  g.people = nil
  g.state = { update = function() end } -- TODO
  return g
end

function Game:update(dt)
  self.state:update(dt)
end

local lg = love.graphics
function Game:draw()
  local state = self.state
  
  -- TODO draw room --
  lg.setColor(255,255,255)
  lg.draw(gfx.roomImage,0,0)
  
  if state.drawRoom then state:drawRoom() end
  if state.drawTV then state:drawTV() end
  
  -- TODO draw tv-overlay --
  
  if state.drawGUI then state:drawGUI() end
  
  -- TODO draw score --
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