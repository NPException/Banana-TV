-- --------------------------
-- Action: Cookshow
-- --------------------------
return {
  name = "cookshow",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/cookshow.png"),
  score = {
    baby    = { scare = 0, boring = 8, delight = 2},
    girl    = { scare = 0, boring = 2, delight = 4},
    boy     = { scare = 0, boring = 6, delight = 0},
    emo     = { scare = 0, boring = 8, delight = 2},
    dad     = { scare = 0, boring = 4, delight = 4},
    mom     = { scare = 0, boring = 0, delight = 8},
    grandma = { scare = 0, boring = 0, delight = 8},
    grandpa = { scare = 0, boring = 2, delight = 6}
    }
  }