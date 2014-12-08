-- --------------------------
-- Action: Fungun
-- --------------------------
return {
  name = "fungun",
  animation = love.graphics.newImage("assets/actions/fungun_dev.png"),  -- Filepath
  icon =  love.graphics.newImage("assets/actions/fungun_dev.png"),
  score = {
    baby    = { scared = 1, bored = 2, delight = 5},
    girl    = { scared = 0, bored = 8, delight = 0},
    boy     = { scared = 0, bored = 2, delight = 8},
    emo     = { scared = 6, bored = 0, delight = 2},
    dad     = { scared = 0, bored = 10, delight = 0},
    mom     = { scared = 0, bored = 10, delight = 0},
    grandma = { scared = 1, bored = 9, delight = 0},
    grandpa = { scared = 1, bored = 9, delight = 0}
  }
}