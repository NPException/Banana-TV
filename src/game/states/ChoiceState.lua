local Choice = {}
Choice.__index = Choice

local globals = GLOBALS

function Choice.new(game)
  local choice = setmetatable({}, Choice)
  
  choice.game = game
  
  return choice
end


function Choice:update(dt)
  self.game.scene.tvframe:startNoise(true)
end

local lg = love.graphics
function Choice:drawGUI()
  local imgX = 100
  local imgY = 100
  local scale = 0.5
  for _,v in pairs(self.game.actions) do
    lg.rectangle("fill", imgX, imgY, 160, 85)
    lg.draw(lg.newImage("assets/actions/" .. v.name .. "_dev.png"),imgX,imgY, 0, scale)
    imgX = imgX + 180
    if  imgX > globals.config.resX - 180 then
      imgX = 100
      imgY = imgY + 100
    end
    
  end
end

return Choice