-- --------------------------
-- Action: Cookshow
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/cookshow/ani.png")

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
  name = "Burnt Toast TV",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/cookshow/icon.png"),
  score = {
    baby    = { scared = 0, bored = 8, delight = 2},
    girl    = { scared = 0, bored = 2, delight = 4},
    boy     = { scared = 0, bored = 6, delight = 0},
    emo     = { scared = 0, bored = 8, delight = 2},
    dad     = { scared = 0, bored = 4, delight = 4},
    mom     = { scared = 0, bored = 0, delight = 8},
    grandma = { scared = 0, bored = 0, delight = 8},
    grandpa = { scared = 0, bored = 2, delight = 6}
  }
}