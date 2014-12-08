local Choice = {}
Choice.__index = Choice

local globals = GLOBALS

function Choice.new(game)
  local choice = setmetatable({}, Choice)
  
  choice.game = game
  choice.started = true
  
  choice.actions = {}
  
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
  
  
  for _,entry in ipairs(self.actions) do
    
    local action = entry.action
    local rect = entry.rect
    
    lg.setColor(0,0,0,200)
    lg.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
    lg.setColor(255,255,255)
    lg.draw(action.icon, rect.x, rect.y, 0,
            rect.w/action.icon:getWidth(), rect.h/action.icon:getHeight())

  end
end

function Choice:mousepressed(x,y,button)
  
end

return Choice