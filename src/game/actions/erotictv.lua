-- --------------------------
-- Action: erotic tv
-- --------------------------
return {
  name = "erotic tv",
  animation = love.graphics.newImage("assets/actions/erotictv_dev.png"),  -- Filepath
  icon = love.graphics.newImage("assets/actions/erotictv_dev.png"),
  score = {
    baby    = { scared = 6, bored = 0, delight = 4},
    girl    = { scared = 6, bored = 2, delight = 1},
    boy     = { scared = 0, bored = 2, delight = 8},
    emo     = { scared = 4, bored = 4, delight = 4},
    dad     = { scared = 1, bored = 0, delight = 12},
    mom     = { scared = 8, bored = 2, delight = 0},
    grandma = { scared = 8, bored = 2, delight = 0},
    grandpa = { scared = 2, bored = 0, delight = 10}
  }
}