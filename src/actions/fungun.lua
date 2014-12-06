-- --------------------------
-- Action: Fungun
-- --------------------------
return {
  name = "fun gun",
  animation = nil,  -- Filepath
  icon =  love.graphics.newImage("assets/actions/fungun.png"),
  score = {
    baby    = { scare = 1, boring = 2, delight = 5},
    girl    = { scare = 0, boring = 8, delight = 0},
    boy     = { scare = 0, boring = 2, delight = 8},
    emo     = { scare = 6, boring = 0, delight = 2},
    dad     = { scare = 0, boring = 10, delight = 0},
    mom     = { scare = 0, boring = 10, delight = 0},
    grandma = { scare = 1, boring = 9, delight = 0},
    grandpa = { scare = 1, boring = 9, delight = 0}
    }
  }