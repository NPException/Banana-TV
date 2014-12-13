-- --------------------------
-- Action: Romance
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/romance/ani.png")

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
  name = "Kiss Of A Rose",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/romance/icon.png"),
  score = {
    baby    = { scared = 0, bored = 2, delight = 6},
    girl    = { scared = 0, bored = 0, delight = 10},
    boy     = { scared = 0, bored = 8, delight = 2},
    emo     = { scared = 2, bored = 8, delight = 0},
    dad     = { scared = 0, bored = 8, delight = 2},
    mom     = { scared = 0, bored = 0, delight = 12},
    grandma = { scared = 0, bored = 0, delight = 12},
    grandpa = { scared = 0, bored = 8, delight = 2}
  }
}