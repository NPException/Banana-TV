-- --------------------------
-- Action: Punch
-- --------------------------
return {
  name = "punch",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/punch.png"),
  score = {
    baby    = { scare = 6, boring = 6, delight = 0},
    girl    = { scare = 6, boring = 0, delight = 2},
    boy     = { scare = 0, boring = 2, delight = 5},
    emo     = { scare = 0, boring = 4, delight = 6},
    dad     = { scare = 0, boring = 0, delight = 8},
    mom     = { scare = 2, boring = 8, delight = 0},
    grandma = { scare = 2, boring = 8, delight = 0},
    grandpa = { scare = 0, boring = 0, delight = 8}
    }
  }