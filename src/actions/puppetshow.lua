-- --------------------------
-- Action: Puppetshow
-- --------------------------
return {
  name = "puppet show",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/puppetshow.png"),
  score = {
    baby    = { scare = 0, boring = 0, delight = 10},
    girl    = { scare = 0, boring = 8, delight = 4},
    boy     = { scare = 0, boring = 10, delight = 0},
    emo     = { scare = 2, boring = 8, delight = 0},
    dad     = { scare = 0, boring = 10, delight = 0},
    mom     = { scare = 0, boring = 9 delight = 1},
    grandma = { scare = 0, boring = 8, delight = 2},
    grandpa = { scare = 0, boring = 10, delight = 0}
    }
  }