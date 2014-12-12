local Choice = {}
Choice.__index = Choice

local globals = GLOBALS

function Choice.new(game)
  local choice = setmetatable({}, Choice)
  
  choice.game = game
  choice.started = true
  
  choice.actions = {}
  if not choice.lastactions then
    choice.lastactions = {}
  end
  
  local size = 128
  
  local partX = globals.config.resX/7
  local partY = globals.config.resY/4
  local imgX = partX - size/2
  local imgY = partY - size/2
  
  for _, action in ipairs(choice.game.actions) do
    
    table.insert(choice.actions,{ action=action, rect={x=imgX,y=imgY,w=size,h=size}})
    
    imgX = imgX+partX
    if  imgX > globals.config.resX - partX then
      imgX = partX - size/2
      imgY = imgY + partY
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
  
  local focusRect = nil
  
  for _,entry in ipairs(self.actions) do
    
    local action = entry.action
    local rect = entry.rect
    local isLastUsed = false
    lg.setColor(255,255,255)
    lg.draw(action.icon, rect.x, rect.y, 0,
            rect.w/action.icon:getWidth(), rect.h/action.icon:getHeight())
    
    for _,last in ipairs(self.lastactions) do
      print(last)
      if last == action.name then
        isLastUsed = true
      end
    end
    
    if (rect.x <= mx
          and rect.x+rect.w  >=  mx
          and rect.y <= my
          and rect.y+rect.h >= my
          and isLastUsed == false) then
      focusRect = rect
    end
  end
  
  if focusRect then
    lg.setLineWidth(7)
    lg.setColor(238,238,0)   
    love.graphics.circle("line", focusRect.x+focusRect.w/2, focusRect.y+focusRect.h/2, focusRect.w*0.7)
  end
end

function Choice:mousepressed(x,y,button)
  if button == "l" then
    for _,entry in ipairs(self.actions) do
      local action = entry.action
      local rect = entry.rect
      
      if (rect.x <= x
          and rect.x+rect.w  >=  x
          and rect.y <= y
          and rect.y+rect.h >= y) then
        table.insert(self.lastactions, action.name)
        self.game.run.action = action
        self.game.state = require("game.states.RunState").new(self.game)
        break
      end
      
    end
  end
end

return Choice