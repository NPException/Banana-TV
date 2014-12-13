-- --------------------------
-- Action: Punch
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/punch/ani.png")

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
  name = "Teeth Remover TV",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/punch/icon.png"),
  score = {
    baby    = { scared = 6, bored = 6, delight = 0},
    girl    = { scared = 6, bored = 0, delight = 2},
    boy     = { scared = 0, bored = 2, delight = 5},
    emo     = { scared = 0, bored = 4, delight = 6},
    dad     = { scared = 0, bored = 0, delight = 8},
    mom     = { scared = 2, bored = 8, delight = 0},
    grandma = { scared = 2, bored = 8, delight = 0},
    grandpa = { scared = 0, bored = 0, delight = 8}
  }
}