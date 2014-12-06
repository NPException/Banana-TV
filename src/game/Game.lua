local Game = {}
local mt = { __index = Game }

local globals = GLOBALS
local tween = require("lib.tween")

local gfx = {
  roomImages = {
    love.graphics.newImage("assets/scene/room1.png"),
    love.graphics.newImage("assets/scene/room2.png"),
    love.graphics.newImage("assets/scene/room3.png")
  },
  roomImageIndex = 1,
  frameImage = love.graphics.newImage("assets/scene/tvframe.png"),
  
  roomGood = love.graphics.newImage("assets/scene/room_good.png"),
  frameGood = love.graphics.newImage("assets/scene/tvframe_good.png")
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
  gfx.roomImageIndex = math.ceil((globals.time*7) % 3)
  
  self.state:update(dt)
end



local lg = love.graphics
function Game:draw()
  local state = self.state
  
  -- draw room background
  lg.setColor(255,255,255)
  --lg.draw(gfx.roomImages[gfx.roomImageIndex],0,0)
  lg.draw(gfx.roomGood,0,0)
  
  -- draw state dependent room and tv contents
  if state.drawRoom then state:drawRoom() end
  if state.drawTV then state:drawTV() end
  
  -- draw scanline
  lg.setLineWidth(1)
  local alpha = {150}
  local alphaTween = tween.new(100, alpha, {0}, 'outCirc')
  for i=0,100 do
    local scanlineY = math.floor((globals.time*globals.config.resY*0.3-i) % (globals.config.resY-10))+5
    lg.setColor(200,255,255,alpha[1])
    lg.line(5,scanlineY, globals.config.resX-5, scanlineY)
    alphaTween:update(1)
  end
  
  -- draw tv frame image
  lg.setColor(255,255,255)
  --lg.draw(gfx.frameImage,0,0)
  lg.draw(gfx.frameGood,0,0)
  
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