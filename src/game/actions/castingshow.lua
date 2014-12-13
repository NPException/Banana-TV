-- --------------------------
-- Action: Castingshow
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/castingshow/ani.png")

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
  name = "Bananian Idol",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/castingshow/icon.png"),
  score = {
    baby    = { scared = 6, bored = 2, delight = 0},
    girl    = { scared = 0, bored = 0, delight = 10},
    boy     = { scared = 0, bored = 2, delight = 8},
    emo     = { scared = 0, bored = 2, delight = 5},
    dad     = { scared = 0, bored = 4, delight = 6},
    mom     = { scared = 0, bored = 0, delight = 9},
    grandma = { scared = 0, bored = 1, delight = 6},
    grandpa = { scared = 0, bored = 2, delight = 6}
  }
}