-- --------------------------
-- Action: Romance
-- --------------------------
return {
  name = "romance",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/romance.png"),
  score = {
    baby    = { scare = 0, boring = 2, delight = 6},
    girl    = { scare = 0, boring = 0, delight = 10},
    boy     = { scare = 0, boring = 8, delight = 2},
    emo     = { scare = 2, boring = 8, delight = 0},
    dad     = { scare = 0, boring = 8, delight = 2},
    mom     = { scare = 0, boring = 0, delight = 12},
    grandma = { scare = 0, boring = 0, delight = 12},
    grandpa = { scare = 0, boring = 8, delight = 2}
    }
  }