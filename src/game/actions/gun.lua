-- --------------------------
-- Action: Gun
-- --------------------------
return {
  name = "gun",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/gun.png"),
  score = {
    baby    = { scare = 12, boring = 0, delight = 0},
    girl    = { scare = 6, boring = 0, delight = 3},
    boy     = { scare = 4, boring = 0, delight = 5},
    emo     = { scare = 0, boring = 0, delight = 10},
    dad     = { scare = 2, boring = 2, delight = 4},
    mom     = { scare = 8, boring = 2, delight = 0},
    grandma = { scare = 8, boring = 2, delight = 0},
    grandpa = { scare = 6, boring = 2, delight = 4}
    }
  }