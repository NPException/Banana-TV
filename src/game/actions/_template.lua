-- --------------------------
-- Action: 
-- --------------------------
local tween = require("lib.tween")

-- Example variables for animation
local backgroundImg = love.graphics.newImage("assets/actions/templateaction/someBackground.png")
local bunnyImg = love.graphics.newImage("assets/actions/templateaction/bunny.png")
local bunnyPosition = {x=12, y=30}
local positionTween = tween.new(3, bunnyPosition, {x=19, y=4}, "linear")
-- tween.new( duration in seconds, table to modify, table with target values, type of easing)


local function resetAnimation()
  -- reset whole animation to its start values
  positionTween:reset()
end


local function updateAnimation(dt)
  -- do stuff, for example tweening
  local isTweenComplete = positionTween:update(dt)
end


local lg = love.graphics
local function drawAnimation()
  -- draw stuff
  --     ( image  , x position     , y position )
  lg.draw(bunnyImg, bunnyPosition.x, bunnyPosition.y)
end


return {
  name = "",
  animation = {
    reset  = resetAnimation,
    update = updateAnimation,
    draw   = drawAnimation
  },
  icon = love.graphics.newImage("assets/actions/placeholder.txt"),
  score = {
    baby    = { scared = 0, bored = 0, delight = 0},
    girl    = { scared = 0, bored = 0, delight = 0},
    boy     = { scared = 0, bored = 0, delight = 0},
    emo     = { scared = 0, bored = 0, delight = 0},
    dad     = { scared = 0, bored = 0, delight = 0},
    mom     = { scared = 0, bored = 0, delight = 0},
    grandma = { scared = 0, bored = 0, delight = 0},
    grandpa = { scared = 0, bored = 0, delight = 0}
  }
}