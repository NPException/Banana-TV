-- --------------------------
-- Action: Chainsaw
-- --------------------------
return {
  name = "chainsaw",
  animation = nil,  -- Filepath
  icon = love.graphics.newImage("assets/actions/chainsaw.png"),
  score = {
    baby    = { scare = 12, boring = 0, delight = 0},
    girl    = { scare = 8, boring = 0, delight = 1},
    boy     = { scare = 5, boring = 0, delight = 2},
    emo     = { scare = 0, boring = 0, delight = 10},
    dad     = { scare = 2, boring = 0, delight = 4},
    mom     = { scare = 8, boring = 0, delight = 0},
    grandma = { scare = 8, boring = 0, delight = 0},
    grandpa = { scare = 7, boring = 0, delight = 0}
    }
  }