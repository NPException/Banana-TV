-- --------------------------
-- Action: Funeral TV
-- --------------------------
return {
  name = "Sad Funerals TV",
  animation = love.graphics.newImage("assets/actions/funeraltv_dev.png"),  -- Filepath
  icon = love.graphics.newImage("assets/actions/funeraltv_icon.png"),
  score = {
    baby    = { scared = 0, bored = 10, delight = 0},
    girl    = { scared = 10, bored = 0, delight = 0},
    boy     = { scared = 5, bored = 0, delight = 5},
    emo     = { scared = 0, bored = 0, delight = 12},
    dad     = { scared = 2, bored = 8, delight = 0},
    mom     = { scared = 4, bored = 8, delight = 0},
    grandma = { scared = 4, bored = 3, delight = 5},
    grandpa = { scared = 3, bored = 5, delight = 4}
  }
}