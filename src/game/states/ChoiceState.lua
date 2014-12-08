local Choice = {}
Choice.__index = Choice

local globals = GLOBALS

function Choice.new(game)
  local choice = setmetatable({}, Choice)
  
  choice.game = game
  choice.started = true
  
  choice.actions = {
      -- { action=_THEACTION_, rect={x=0,y=0,w=128,h=128} }
  }
  
  local partX = globals.config.resX/7
  local partY = globals.config.resY/4
  local imgX = partX
  local imgY = partY
  
  local size = 128
  
  for _, action in ipairs(choice.game.actions) do
    
    table.insert(choice.actions,{ action=action, rect={x=imgX,y=imgY,w=size,h=size}})
    
    imgX = imgX+partX
    if  imgX > globals.config.resX - partX then
      imgX = partX
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
    local imgX = entry.rect.x
    local imgY = entry.rect.y
    
    local size = entry.rect.w -- or set global size
    
    lg.setColor(0,0,0,200)
    lg.rectangle("fill", imgX-size/2, imgY-size/2, size, size)
    lg.setColor(255,255,255)
    lg.draw(action.icon,imgX,imgY, 0, size/action.icon:getWidth(), size/action.icon:getHeight(),
            action.icon:getWidth()/2,action.icon:getHeight()/2)

  end
end

function Choice:mousepressed(x,y,button)
  
end

return Choice