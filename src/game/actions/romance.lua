-- --------------------------
-- Action: Romance
-- --------------------------
return {
  name = "romance",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/romance.png"),
  score = {
    baby    = { scared = 0, bored = 2, delight = 6},
    girl    = { scared = 0, bored = 0, delight = 10},
    boy     = { scared = 0, bored = 8, delight = 2},
    emo     = { scared = 2, bored = 8, delight = 0},
    dad     = { scared = 0, bored = 8, delight = 2},
    mom     = { scared = 0, bored = 0, delight = 12},
    grandma = { scared = 0, bored = 0, delight = 12},
    grandpa = { scared = 0, bored = 8, delight = 2}
  }
}