-- --------------------------
-- Action: Concert
-- --------------------------
return {
  name = "concert",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/concert.png"),
  score = {
    baby    = { scared = 4, bored = 5, delight = 2},
    girl    = { scared = 0, bored = 0, delight = 12},
    boy     = { scared = 0, bored = 6, delight = 2},
    emo     = { scared = 4, bored = 4, delight = 0},
    dad     = { scared = 0, bored = 8, delight = 1},
    mom     = { scared = 0, bored = 8, delight = 2},
    grandma = { scared = 2, bored = 8, delight = 0},
    grandpa = { scared = 0, bored = 8, delight = 0}
  }
}