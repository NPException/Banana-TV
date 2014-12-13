-- --------------------------
-- Action: Funeral TV
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/funeraltv/ani.png")

local function resetAnimation()
  -- TODO
end


local function updateAnimation(dt)
  -- TODO
end


local lg = love.graphics
local function drawAnimation()
  lg.draw(aniImg, 0, 0)
end


return {
  name = "Sad Funerals TV",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/funeraltv/icon.png"),
  score = {
    baby    = { scared = 0, bored = 10, delight = 0},
    girl    = { scared = 10, bored = 0, delight = 0},
    boy     = { scared = 5, bored = 0, delight = 5},
    emo     = { scared = 0, bored = 0, delight = 12},
    dad     = { scared = 2, bored = 8, delight = 0},
    mom     = { scared = 4, bored = 8, delight = 0},
    grandma = { scared = 4, bored = 3, delight = 5},
    grandpa = { scared = 3, bored = 5, delight = 4}
  }
}