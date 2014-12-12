-- --------------------------
-- Action: Castingshow
-- --------------------------
return {
  name = "Bananian Idol",
  animation = love.graphics.newImage("assets/actions/castingshow_dev.png"),  -- Filepath
  icon = love.graphics.newImage("assets/actions/castingshow_icon.png"),
  score = {
    baby    = { scared = 6, bored = 2, delight = 0},
    girl    = { scared = 0, bored = 0, delight = 10},
    boy     = { scared = 0, bored = 2, delight = 8},
    emo     = { scared = 0, bored = 2, delight = 5},
    dad     = { scared = 0, bored = 4, delight = 6},
    mom     = { scared = 0, bored = 0, delight = 9},
    grandma = { scared = 0, bored = 1, delight = 6},
    grandpa = { scared = 0, bored = 2, delight = 6}
  }
}