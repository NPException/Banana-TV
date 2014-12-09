local Bubble = {}
Bubble.__index = Bubble

local globals = GLOBALS
local tween = require("lib.tween")

local sounds = {
  bored = love.audio.newSource("assets/sounds/bored.wav", "static"),
  scared = love.audio.newSource("assets/sounds/scared.wav", "static"),
  delight = love.audio.newSource("assets/sounds/delight.wav", "static")
}

local img = love.graphics.newImage("assets/other/scorebubble.png")


function Bubble.new(startPosition, adjustableScores, scoreType)
  local bubble = setmetatable({}, Bubble)
  
  bubble.alive = false
  bubble.done = false
  
  bubble.scoreType = scoreType
  bubble.scores = adjustableScores
  bubble.x = startPosition.x
  bubble.y = startPosition.y
  bubble.tilt = math.random()*math.pi*2
  bubble.alpha = 255
  
  local duration = math.random()*0.5+0.7
  
  bubble.tweens = {
    tween.new(duration, bubble, {x=globals.config.resX-175}, "inQuad" ),
    tween.new(duration, bubble, {y=77}, "outBack"),
    tween.new(duration, bubble, {tilt=bubble.tilt+math.pi*2},"linear"),
    tween.new(duration, bubble, {alpha=0}, "outQuad")
  }
  
  return bubble
end


function Bubble:start()
  self.alive = true
  local sound = sounds[self.scoreType]
  if sound:isPlaying() then
    sound:rewind()
  else
    sound:play()
  end
end


function Bubble:update(dt)
  if not self.alive then return self.done end
  
  local allDone = true
  for _,tw in ipairs(self.tweens) do
    local done = tw:update(dt)
    allDone = allDone and done
  end
  
  if allDone and not self.done then
    self.alive = false
    self.scores[self.scoreType] = self.scores[self.scoreType] + 1
  end
  
  self.done = allDone
  return self.done
end


local lg = love.graphics
function Bubble:draw()
  if not self.alive then return end
  
  if self.scoreType == "scared" then
    lg.setColor(238,0,0, self.alpha)
  elseif self.scoreType == "delight" then
    lg.setColor(0,238,0, self.alpha)
  else
    lg.setColor(238,238,0, self.alpha)
  end
  lg.draw(img, self.x, self.y, self.tilt, 3,3, img:getWidth()/2, img:getHeight()/2)
end


return Bubble