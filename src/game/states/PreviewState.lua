local Preview = {}
Preview.__index = Preview



function Preview.new(game)
  local preview = setmetatable({}, Preview)
  
  preview.game = game
  preview.game.run = {}
  preview.charitems = {}
  
  preview.game.run.char = preview.game.characters[math.random(1,#preview.game.characters)]
  local tmpChar = preview.game.run.char
  
  preview.charitems = require("game.characters._itemmapping")[tmpChar.id]
  
  
  
  return preview
end


function Preview:update(dt)
end

