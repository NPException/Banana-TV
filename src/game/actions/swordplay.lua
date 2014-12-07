-- --------------------------
-- Action: Swordplay
-- --------------------------
return {
  name = "swordplay",
  animation = nil,  -- Filepath
  icon =  love.graphics.newImage("assets/actions/swordplay.png"),
  score = {
    baby    = { scare = 8, boring = 2, delight = 0},
    girl    = { scare = 0, boring = 8, delight = 2},
    boy     = { scare = 0, boring = 2, delight = 8},
    emo     = { scare = 2, boring = 7, delight = 2},
    dad     = { scare = 0, boring = 3, delight = 8},
    mom     = { scare = 0, boring = 5, delight = 6},
    grandma = { scare = 0, boring = 8, delight = 3},
    grandpa = { scare = 0, boring = 2, delight = 8}
    }
  }