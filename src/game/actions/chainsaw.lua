-- --------------------------
-- Action: Chainsaw
-- --------------------------
return {
  name = "chainsaw",
  animation = love.graphics.newImage("assets/actions/chainsaw_dev.png"),  -- Filepath
  icon = love.graphics.newImage("assets/actions/chainsaw_dev.png"),
  score = {
    baby    = { scared = 12, bored = 0, delight = 0},
    girl    = { scared = 8, bored = 0, delight = 1},
    boy     = { scared = 5, bored = 0, delight = 2},
    emo     = { scared = 0, bored = 0, delight = 10},
    dad     = { scared = 2, bored = 0, delight = 4},
    mom     = { scared = 8, bored = 0, delight = 0},
    grandma = { scared = 8, bored = 0, delight = 0},
    grandpa = { scared = 7, bored = 0, delight = 0}
  }
}