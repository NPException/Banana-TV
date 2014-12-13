-- --------------------------
-- Action: Swordplay
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/swordplay/ani.png")

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
  name = "Swordsmanship TV",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon =  love.graphics.newImage("assets/actions/swordplay/icon.png"),
  score = {
    baby    = { scared = 8, bored = 2, delight = 0},
    girl    = { scared = 0, bored = 8, delight = 2},
    boy     = { scared = 0, bored = 2, delight = 8},
    emo     = { scared = 2, bored = 7, delight = 2},
    dad     = { scared = 0, bored = 3, delight = 8},
    mom     = { scared = 0, bored = 5, delight = 6},
    grandma = { scared = 0, bored = 8, delight = 3},
    grandpa = { scared = 0, bored = 2, delight = 8}
  }
}