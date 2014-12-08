-- --------------------------
-- Action: Swordplay
-- --------------------------
return {
  name = "swordplay",
  animation = love.graphics.newImage("assets/actions/swordplay_dev.png"),  -- Filepath
  icon =  love.graphics.newImage("assets/actions/swordplay_dev.png"),
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