-- --------------------------
-- Action: Detective
-- --------------------------
return {
  name = "detective with magnifier",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/detective.png"),
  score = {
    baby    = { scare = 8, boring = 0, delight = 0},
    girl    = { scare = 2, boring = 4, delight = 2},
    boy     = { scare = 1, boring = 2, delight = 6},
    emo     = { scare = 3, boring = 0, delight = 6},
    dad     = { scare = 0, boring = 0, delight = 10},
    mom     = { scare = 2, boring = 2, delight = 6},
    grandma = { scare = 4, boring = 2, delight = 4},
    grandpa = { scare = 4, boring = 0, delight = 6}
    }
  }