-- --------------------------
-- Action: Cartoon
-- --------------------------
return {
  name = "cartoon",
  animation = love.graphics.newImage("assets/actions/cartoon_dev.png"),
  icon = love.graphics.newImage("assets/actions/cartoon_dev.png"),
  score = {
    baby    = { scared = 0, bored = 0, delight = 10},
    girl    = { scared = 0, bored = 4, delight = 4},
    boy     = { scared = 0, bored = 5, delight = 4},
    emo     = { scared = 2, bored = 6, delight = 0},
    dad     = { scared = 0, bored = 8, delight = 1},
    mom     = { scared = 0, bored = 10, delight = 0},
    grandma = { scared = 1, bored = 8, delight = 0},
    grandpa = { scared = 1, bored = 8, delight = 0}
  }
}