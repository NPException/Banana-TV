-- --------------------------
-- Action: Concert
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/concert/ani.png")

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
  name = "The Generics Live",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/concert/icon.png"),
  score = {
    baby    = { scared = 4, bored = 5, delight = 2},
    girl    = { scared = 0, bored = 0, delight = 12},
    boy     = { scared = 0, bored = 6, delight = 2},
    emo     = { scared = 4, bored = 4, delight = 0},
    dad     = { scared = 0, bored = 8, delight = 1},
    mom     = { scared = 0, bored = 8, delight = 2},
    grandma = { scared = 2, bored = 8, delight = 0},
    grandpa = { scared = 0, bored = 8, delight = 0}
  }
}