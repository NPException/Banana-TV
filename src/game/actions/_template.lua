-- --------------------------
-- Action: 
-- --------------------------
return {
  name = "",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/placeholder.txt"),
  score = {
    baby    = { scared = 0, bored = 0, delight = 0},
    girl    = { scared = 0, bored = 0, delight = 0},
    boy     = { scared = 0, bored = 0, delight = 0},
    emo     = { scared = 0, bored = 0, delight = 0},
    dad     = { scared = 0, bored = 0, delight = 0},
    mom     = { scared = 0, bored = 0, delight = 0},
    grandma = { scared = 0, bored = 0, delight = 0},
    grandpa = { scared = 0, bored = 0, delight = 0}
  }
}