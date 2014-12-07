local Character = {}
Character.__index = Character

local globals = GLOBALS



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
  char.mood = "bored"
  return char
end



function Character:update(action)
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
end



local lg = love.graphics
function Character:draw(pos)
  lg.setColor(255,255,255)
  local img = self.images[self.mood]
  lg.draw(img[1], pos.x-img[2]*self.scale, pos.y-img[3]*self.scale, 0, self.scale, self.scale)
end

return Character