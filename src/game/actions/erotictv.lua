-- --------------------------
-- Action: erotic tv
-- --------------------------
return {
  name = "erotic tv",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/erotictv.png"),
  score = {
    baby    = { scare = 6, boring = 0, delight = 4},
    girl    = { scare = 6, boring = 2, delight = 1},
    boy     = { scare = 0, boring = 2, delight = 8},
    emo     = { scare = 4, boring = 4, delight = 4},
    dad     = { scare = 1, boring = 0, delight = 12},
    mom     = { scare = 8, boring = 2, delight = 0},
    grandma = { scare = 8, boring = 2, delight = 0},
    grandpa = { scare = 2, boring = 0, delight = 10}
    }
  }