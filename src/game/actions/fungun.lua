-- --------------------------
-- Action: Fungun
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/fungun/ani.png")

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
  name = "Fake Gun Fun",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon =  love.graphics.newImage("assets/actions/fungun/icon.png"),
  score = {
    baby    = { scared = 1, bored = 2, delight = 5},
    girl    = { scared = 0, bored = 8, delight = 0},
    boy     = { scared = 0, bored = 2, delight = 8},
    emo     = { scared = 6, bored = 0, delight = 2},
    dad     = { scared = 0, bored = 10, delight = 0},
    mom     = { scared = 0, bored = 10, delight = 0},
    grandma = { scared = 1, bored = 9, delight = 0},
    grandpa = { scared = 1, bored = 9, delight = 0}
  }
}