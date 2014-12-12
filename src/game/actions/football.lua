-- --------------------------
-- Action: Football
-- --------------------------
return {
  name = "Not Hand-Egg",
  animation = love.graphics.newImage("assets/actions/football_dev.png"),  -- Filepath
  icon =  love.graphics.newImage("assets/actions/football_icon.png"),
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