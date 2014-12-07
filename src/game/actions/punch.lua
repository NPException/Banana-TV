-- --------------------------
-- Action: Punch
-- --------------------------
return {
  name = "punch",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/punch.png"),
  score = {
    baby    = { scared = 6, bored = 6, delight = 0},
    girl    = { scared = 6, bored = 0, delight = 2},
    boy     = { scared = 0, bored = 2, delight = 5},
    emo     = { scared = 0, bored = 4, delight = 6},
    dad     = { scared = 0, bored = 0, delight = 8},
    mom     = { scared = 2, bored = 8, delight = 0},
    grandma = { scared = 2, bored = 8, delight = 0},
    grandpa = { scared = 0, bored = 0, delight = 8}
  }
}