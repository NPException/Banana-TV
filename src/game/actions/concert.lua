-- --------------------------
-- Action: Concert
-- --------------------------
return {
  name = "concert",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/concert.png"),
  score = {
    baby    = { scare = 4, boring = 5, delight = 2},
    girl    = { scare = 0, boring = 0, delight = 12},
    boy     = { scare = 0, boring = 6, delight = 2},
    emo     = { scare = 4, boring = 4, delight = 0},
    dad     = { scare = 0, boring = 8, delight = 1},
    mom     = { scare = 0, boring = 8, delight = 2},
    grandma = { scare = 2, boring = 8, delight = 0},
    grandpa = { scare = 0, boring = 8, delight = 0}
    }
  }