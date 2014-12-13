-- --------------------------
-- Action: Detective
-- --------------------------
local tween = require("lib.tween")

local aniImg = love.graphics.newImage("assets/actions/detective/ani.png")

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
  name = "CGI Miami",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/detective/icon.png"),
  score = {
    baby    = { scared = 8, bored = 0, delight = 0},
    girl    = { scared = 2, bored = 4, delight = 2},
    boy     = { scared = 1, bored = 2, delight = 6},
    emo     = { scared = 3, bored = 0, delight = 6},
    dad     = { scared = 0, bored = 0, delight = 10},
    mom     = { scared = 2, bored = 2, delight = 6},
    grandma = { scared = 4, bored = 2, delight = 4},
    grandpa = { scared = 4, bored = 0, delight = 6}
  }
}