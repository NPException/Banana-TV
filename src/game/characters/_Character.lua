local Character = {}
Character.__index = Character

local globals = GLOBALS
local tween = require("lib.tween")



function Character.new(id, charTable)
  local char = setmetatable({}, Character)
  char.id = id -- this is used to map the action scores to the character
  char.name = charTable.name
  char.scale = charTable.scale
  char.images = {
    --        { loaded image,                image offset X,              image offset Y              }
    scared  = { charTable.images.scared[1],  charTable.images.scared[2],  charTable.images.scared[3]  },
    bored   = { charTable.images.bored[1],   charTable.images.bored[2],   charTable.images.bored[3]   },
    delight = { charTable.images.delight[1], charTable.images.delight[2], charTable.images.delight[3] }
  }
  char:resetMood()
  return char
end



function Character:resetMood()
  self.tilt = 0
  self.stretch = 1
  self.mood = "bored"
end



function Character:update(dt)
  if self.mood == "scared" then
    local done = true
    if self.tiltTween then
      done = self.tiltTween:update(dt)
    end
    if done then
      local easing = "inOutQuad"
      if self.tilt < 0 then
        self.tiltTween = tween.new(0.1, self, {tilt=0.02}, easing)
      else
        self.tiltTween = tween.new(0.1, self, {tilt=-0.02}, easing)
      end
    end
  elseif self.mood == "delight" then
    local done = true
    if self.stretchTween then
      done = self.stretchTween:update(dt)
    end
    if done then
      local easing = "inOutSine"
      if self.stretch < 1 then
        self.stretchTween = tween.new(0.1, self, {stretch=1.02}, easing)
      else
        self.stretchTween = tween.new(0.2, self, {stretch=0.98}, easing)
      end
    end
  end
end



function Character:updateMood(action)
  self.tilt = 0
  self.stretch = 1
  self.mood = "bored"
  local scores = action.score[self.id]
  if scores then
    local highest = 0
    for mood,score in pairs(scores) do
      if score > highest then
        highest = score
        self.mood = mood
      end
    end
  end
  return lowCopy(scores)
end



local lg = love.graphics
function Character:draw(pos)
  lg.setColor(255,255,255)
  local img = self.images[self.mood]
  lg.draw(img[1], pos.x, pos.y, self.tilt, self.scale, self.scale*self.stretch, img[2], img[3])
end

return Character