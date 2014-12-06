-- --------------------------
-- Action: Football
-- --------------------------
return {
  name = "football",
  animation = nil,  -- Filepath
  icon =  love.graphics.newImage("assets/actions/football.png"),
  score = {
    baby    = { scare = 2, boring = 0, delight = 6},
    girl    = { scare = 0, boring = 6, delight = 3},
    boy     = { scare = 0, boring = 0, delight = 12},
    emo     = { scare = 0, boring = 2, delight = 6},
    dad     = { scare = 0, boring = 0, delight = 12},
    mom     = { scare = 0, boring = 9, delight = 0},
    grandma = { scare = 0, boring = 9, delight = 0},
    grandpa = { scare = 0, boring = 0, delight = 12}
    }
  }