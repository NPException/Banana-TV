-- --------------------------
-- Action: Balloonanimal
-- --------------------------
return {
  name = "balloonanimal",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/balloonanimal.png"),
  score = {
    baby    = { scare = 0, boring = 0, delight = 8},
    girl    = { scare = 0, boring = 6, delight = 2},
    boy     = { scare = 0, boring = 8, delight = 0},
    emo     = { scare = 2, boring = 5, delight = 0},
    dad     = { scare = 0, boring = 10, delight = 0},
    mom     = { scare = 0, boring = 9, delight = 1},
    grandma = { scare = 0, boring = 5, delight = 3},
    grandpa = { scare = 0, boring = 10, delight = 0}
    }
  }