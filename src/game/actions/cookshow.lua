-- --------------------------
-- Action: Cookshow
-- --------------------------
return {
  name = "cookshow",
  animation = love.graphics.newImage("assets/actions/cookshow_dev.png"),  -- Filepath
  icon = love.graphics.newImage("assets/actions/cookshow_dev.png"),
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