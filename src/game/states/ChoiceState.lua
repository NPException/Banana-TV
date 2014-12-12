local Choice = {}
Choice.__index = Choice

local globals = GLOBALS

function Choice.new(game)
  local choice = setmetatable({}, Choice)
  
  choice.game = game
  choice.started = true
  
  local partX = globals.config.resX/7
  local partY = globals.config.resY/4
  local posX = partX
  local posY = partY
  
  for _, action in ipairs(choice.game.actions) do
    
    action.iconPos = {x=posX,y=posY}
    
    posX = posX+partX
    if  posX > globals.config.resX - partX then
      posX = partX
      posY = posY + partY
    end
  end
  
  return choice
end


function Choice:update(dt)
  if self.started then
    self.started = false
    self.game.scene.tvframe:startNoise(true)
  end
end


local lg = love.graphics
function Choice:drawGUI()
  
  local mx,my = self.game:getMousePosition()
  
  local focusedAction = nil
  
  for _,action in ipairs(self.game.actions) do
    if action:isMouseOver(mx, my) then
      focusedAction = action
    end
    action:drawIcon()
  end
  
  if focusedAction then
    focusedAction:drawIconFocus()
  end
end

function Choice:mousepressed(x,y,button)
  if button == "l" then
    for _,action in ipairs(self.game.actions) do
      if action:isMouseOver(x,y) then
        self.game.run.action = action
        self.game.state = require("game.states.RunState").new(self.game)
        break
      end
      
    end
  end
end

return Choice