-- --------------------------
-- Action: Football
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/football/ani.png")

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
  name = "Not Hand-Egg",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon =  love.graphics.newImage("assets/actions/football/icon.png"),
  score = {
    baby    = { scared = 2, bored = 0, delight = 6},
    girl    = { scared = 0, bored = 6, delight = 3},
    boy     = { scared = 0, bored = 0, delight = 12},
    emo     = { scared = 0, bored = 2, delight = 6},
    dad     = { scared = 0, bored = 0, delight = 12},
    mom     = { scared = 0, bored = 9, delight = 0},
    grandma = { scared = 0, bored = 9, delight = 0},
    grandpa = { scared = 0, bored = 0, delight = 12}
  }
}