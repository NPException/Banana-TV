-- --------------------------
-- Action: erotic tv
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/erotictv/ani.png")

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
  name = "Bouncy Boobies",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/erotictv/icon.png"),
  score = {
    baby    = { scared = 6, bored = 0, delight = 4},
    girl    = { scared = 6, bored = 2, delight = 1},
    boy     = { scared = 0, bored = 2, delight = 8},
    emo     = { scared = 4, bored = 4, delight = 4},
    dad     = { scared = 1, bored = 0, delight = 12},
    mom     = { scared = 8, bored = 2, delight = 0},
    grandma = { scared = 8, bored = 2, delight = 0},
    grandpa = { scared = 2, bored = 0, delight = 10}
  }
}