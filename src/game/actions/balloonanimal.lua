-- --------------------------
-- Action: Balloonanimal
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/balloonanimal/ani.png")

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
  name = "Balloon Buddies",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/balloonanimal/icon.png"),
  score = {
    baby    = { scared = 0, bored = 0, delight = 8},
    girl    = { scared = 0, bored = 6, delight = 2},
    boy     = { scared = 0, bored = 8, delight = 0},
    emo     = { scared = 2, bored = 5, delight = 0},
    dad     = { scared = 0, bored = 10, delight = 0},
    mom     = { scared = 0, bored = 9, delight = 1},
    grandma = { scared = 0, bored = 5, delight = 3},
    grandpa = { scared = 0, bored = 10, delight = 0}
  }
}