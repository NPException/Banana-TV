-- --------------------------
-- Action: Gun
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/gun/ani.png")

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
  name = "Real Gun Fun",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/gun/icon.png"),
  score = {
    baby    = { scared = 12, bored = 0, delight = 0},
    girl    = { scared = 6, bored = 0, delight = 3},
    boy     = { scared = 4, bored = 0, delight = 5},
    emo     = { scared = 0, bored = 0, delight = 10},
    dad     = { scared = 2, bored = 2, delight = 4},
    mom     = { scared = 8, bored = 2, delight = 0},
    grandma = { scared = 8, bored = 2, delight = 0},
    grandpa = { scared = 6, bored = 2, delight = 4}
  }
}