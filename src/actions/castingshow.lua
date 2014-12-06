-- --------------------------
-- Action: Castingshow
-- --------------------------
return {
  name = "castingshow",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/castingshow.png"),
  score = {
    baby    = { scare = 6, boring = 2, delight = 0},
    girl    = { scare = 0, boring = 0, delight = 10},
    boy     = { scare = 0, boring = 2, delight = 8},
    emo     = { scare = 0, boring = 2, delight = 5},
    dad     = { scare = 0, boring = 4, delight = 6},
    mom     = { scare = 0, boring = 0, delight = 9},
    grandma = { scare = 0, boring = 1, delight = 6},
    grandpa = { scare = 0, boring = 2, delight = 6}
    }
  }