-- --------------------------
-- Action: Balloonanimal
-- --------------------------
return {
  name = "balloonanimal",
  animation = love.graphics.newImage("assets/actions/balloonanimal_dev.png"),
  icon = love.graphics.newImage("assets/actions/balloonanimal_dev.png"),
  score = {
    baby    = { scared = 0, bored = 0, delight = 8},
    girl    = { scared = 0, bored = 6, delight = 2},
    boy     = { scared = 0, bored = 8, delight = 0},
    emo     = { scared = 2, bored = 5, delight = 0},
    dad     = { scared = 0, bored = 10, delight = 0},
    mom     = { scared = 0, bored = 9, delight = 1},
    grandma = { scared = 0, bored = 5, delight = 3},
    grandpa = { scared = 0, bored = 10, delight = 0}
  }
}