-- --------------------------
-- Action: Chainsaw
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/chainsaw/ani.png")

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
  name = "Chainsaw Joe",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/chainsaw/icon.png"),
  score = {
    baby    = { scared = 12, bored = 0, delight = 0},
    girl    = { scared = 8, bored = 0, delight = 1},
    boy     = { scared = 5, bored = 0, delight = 2},
    emo     = { scared = 0, bored = 0, delight = 10},
    dad     = { scared = 2, bored = 0, delight = 4},
    mom     = { scared = 8, bored = 0, delight = 0},
    grandma = { scared = 8, bored = 0, delight = 0},
    grandpa = { scared = 7, bored = 0, delight = 0}
  }
}