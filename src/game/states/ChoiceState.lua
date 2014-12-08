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
  local partX = globals.config.resX/7
  local partY = globals.config.resY/4
  local imgX = partX
  local imgY = partY
  
  local size = 128
  
  for _,action in pairs(self.game.actions) do
    lg.setColor(0,0,0,200)
    lg.rectangle("fill", imgX-size/2, imgY-size/2, size, size)
    lg.setColor(255,255,255)
    lg.draw(action.icon,imgX,imgY, 0, size/action.icon:getWidth(), size/action.icon:getHeight(),
            action.icon:getWidth()/2,action.icon:getHeight()/2)
    imgX = imgX+partX
    if  imgX > globals.config.resX - partX then
      imgX = partX
      imgY = imgY + partY
    end
    
  end
end

return Choice