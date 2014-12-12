-- --------------------------
-- Action: Gun
-- --------------------------
return {
  name = "Real Gun Fun",
  animation = love.graphics.newImage("assets/actions/gun_dev.png"),  -- Filepath
  icon = love.graphics.newImage("assets/actions/gun_icon.png"),
  score = {
    baby    = { scared = 12, bored = 0, delight = 0},
    girl    = { scared = 6, bored = 0, delight = 3},
    boy     = { scared = 4, bored = 0, delight = 5},
    emo     = { scared = 0, bored = 0, delight = 10},
    dad     = { scared = 2, bored = 2, delight = 4},
    mom     = { scared = 8, bored = 2, delight = 0},
    grandma = { scared = 8, bored = 2, delight = 0},
    grandpa = { scared = 6, bored = 2, delight = 4}
  }
}