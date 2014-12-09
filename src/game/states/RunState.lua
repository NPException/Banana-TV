local RunState = {}
RunState.__index = RunState

local globals = GLOBALS
local tween = require("lib.tween")


function RunState.new(game)
  local state = setmetatable({}, RunState)
  state.game = game
  
  state.nextstep = "updateCharacters"
  state.started = true
  state.bubbles = {}
  state.activeBubbles = {}
  
  state.time = 0
  return state
end



function RunState:update(dt)
  if self.started then
    self.started = false
    self.game.scene.tvframe:stopNoise()
    -- reset everyones mood
    for _,entry in ipairs(self.game.run.characters) do
      entry.char.mood = "bored"
    end
  end
  
  self.time = self.time + dt
  
  for _,entry in ipairs(self.game.run.characters) do
    entry.char:update(dt)
  end
  
  if self.nextstep == "updateCharacters" and self.time > 1 then
    local ScoreBubble = require("game.states.ScoreBubble")
    for _,entry in ipairs(self.game.run.characters) do
      local bubbleSpawn = lowCopy(entry.spot)
      bubbleSpawn.y = bubbleSpawn.y - 100
      local entryScore = entry.char:updateMood(self.game.run.action)
      for scoreType,amount in pairs(entryScore) do
        if scoreType == self.game.variant then
          amount = math.floor(amount*1.5)
        end
        for i=1,amount do
          table.insert(self.bubbles, ScoreBubble.new(bubbleSpawn, self.game.score, scoreType))
        end
      end
    end
    self.nextstep = "doScoring"
  end
  
  if self.nextstep == "doScoring" then
    local allDone = true
    for _,bubble in ipairs(self.activeBubbles) do
      local done = bubble:update(dt)
      allDone = allDone and done
      -- check if score limit is reached
      if done and bubble.scoreType ~= self.game.variant
              and self.game.score[bubble.scoreType] >= globals.config.scorelimit then
        local highscore = lowCopy(self.game.score)
        highscore.variant = self.game.variant
        self.game.state = require("game.states.MenuState").new(self.game, highscore)
        self.game.scene.tvframe:startNoise(true)
      end
    end
    
    if #self.bubbles > 0 then
      if self.time > 0.2 then
        self.time = 0
        local index = math.random(1,#self.bubbles)
        self.bubbles[index]:start()
        table.insert(self.activeBubbles, self.bubbles[index])
        table.remove(self.bubbles, index)
      end
    elseif allDone then
      local switchState = function()
        self.game.state = require("game.states.PreviewState").new(self.game)
        self.game.scene.tvframe:startNoise()
      end
      self.game.timer:start(switchState, 3)
      self.nextstep = nil
    end
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
  for _,bubble in ipairs(self.activeBubbles) do
    bubble:draw()
  end
end


-- OPTIONAL --
function RunState:keypressed(key)
end


-- OPTIONAL --
function RunState:mousepressed(x,y,button)
end


return RunState
