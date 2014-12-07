-- --------------------------
-- Action: Funeral TV
-- --------------------------
return {
  name = "funeral tv",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/funeraltv.png"),
  score = {
    baby    = { scare = 0, boring = 10, delight = 0},
    girl    = { scare = 10, boring = 0, delight = 0},
    boy     = { scare = 5, boring = 0, delight = 5},
    emo     = { scare = 0, boring = 0, delight = 12},
    dad     = { scare = 2, boring = 8, delight = 0},
    mom     = { scare = 4, boring = 8, delight = 0},
    grandma = { scare = 4, boring = 3, delight = 5},
    grandpa = { scare = 3, boring = 5, delight = 4}
    }
  }