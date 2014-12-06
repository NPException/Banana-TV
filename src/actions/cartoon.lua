-- --------------------------
-- Action: Cartoon
-- --------------------------
return {
  name = "cartoon",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/cartoon.png"),
  score = {
    baby    = { scare = 0, boring = 0, delight = 10},
    girl    = { scare = 0, boring = 4, delight = 4},
    boy     = { scare = 0, boring = 5, delight = 4},
    emo     = { scare = 2, boring = 6, delight = 0},
    dad     = { scare = 0, boring = 8, delight = 1},
    mom     = { scare = 0, boring = 10, delight = 0},
    grandma = { scare = 1, boring = 8, delight = 0},
    grandpa = { scare = 1, boring = 8, delight = 0}
    }
  }