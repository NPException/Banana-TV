local RunState = {}
RunState.__index = RunState

local globals = GLOBALS



function RunState.new(game)
  local state = setmetatable({}, RunState)
  state.game = game
  
  state.nextstep = "updateCharacters"
  state.started = true
  
  state.time = 0
  return state
end


function RunState:update(dt)
  if self.started then
    self.started = false
    self.game.scene.tvframe:stopNoise()
  end
  
  self.time = self.time + dt
  
  for _,entry in ipairs(self.game.run.characters) do
    entry.char:update(dt)
  end
  
  if self.time > 1 and self.nextstep == "updateCharacters" then
    for _,entry in ipairs(self.game.run.characters) do
      entry.scores = entry.char:updateMood(self.game.run.action)
    end
    self.nextstep = "doScoring"
  end
end



function RunState:drawWall()
  -- draw items
  for _,entry in ipairs(self.game.run.items) do
    if entry.spot.type == "wall" then
      entry.item:draw(entry.spot)
    end
  end
end



function RunState:drawRoom()
  -- draw items
  for _,entry in ipairs(self.game.run.items) do
    if entry.spot.type ~= "wall" then
      entry.item:draw(entry.spot)
    end
  end
  -- draw characters
  for _,entry in ipairs(self.game.run.characters) do
    entry.char:draw(entry.spot)
  end
end



local lg = love.graphics
function RunState:drawTV()
  local  actionImage = self.game.run.action.animation
  lg.setColor(255,255,255,150)
  lg.draw(actionImage, 0, 0, 0, globals.config.resX/actionImage:getWidth(), globals.config.resY/actionImage:getHeight())
end


-- OPTIONAL -- draws GUI elements of this state. is drawn on top of the tv-frame
function RunState:drawGUI()
end


-- OPTIONAL --
function RunState:keypressed(key)
end


-- OPTIONAL --
function RunState:mousepressed(x,y,button)
end


return RunState