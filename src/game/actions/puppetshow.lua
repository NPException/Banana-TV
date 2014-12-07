-- --------------------------
-- Action: Puppetshow
-- --------------------------
return {
  name = "puppet show",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/puppetshow.png"),
  score = {
    baby    = { scared = 0, bored = 0, delight = 10},
    girl    = { scared = 0, bored = 8, delight = 4},
    boy     = { scared = 0, bored = 10, delight = 0},
    emo     = { scared = 2, bored = 8, delight = 0},
    dad     = { scared = 0, bored = 10, delight = 0},
    mom     = { scared = 0, bored = 9, delight = 1},
    grandma = { scared = 0, bored = 8, delight = 2},
    grandpa = { scared = 0, bored = 10, delight = 0}
  }
}