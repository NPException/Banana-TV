-- --------------------------
-- Action: Cartoon
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/cartoon/ani.png")

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
  name = "The Drunksons",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/cartoon/icon.png"),
  score = {
    baby    = { scared = 0, bored = 0, delight = 10},
    girl    = { scared = 0, bored = 4, delight = 4},
    boy     = { scared = 0, bored = 5, delight = 4},
    emo     = { scared = 2, bored = 6, delight = 0},
    dad     = { scared = 0, bored = 8, delight = 1},
    mom     = { scared = 0, bored = 10, delight = 0},
    grandma = { scared = 1, bored = 8, delight = 0},
    grandpa = { scared = 1, bored = 8, delight = 0}
  }
}