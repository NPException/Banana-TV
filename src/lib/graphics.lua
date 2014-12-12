local graphics = {}

local lg = love.graphics

function graphics.printTiltedWithBackground(text, x, y, scale, color, tilt, pickmode)
  local width = lg.getFont():getWidth(text)+4
  local height = lg.getFont():getHeight()+4
  
  lg.push()
    lg.translate(x,y)
    lg.scale(scale,scale)
    lg.rotate(tilt)
    if pickmode then
      lg.setColor(color)
      lg.rectangle("fill",-width/2,-height/2,width, height)
    else
      lg.setColor(0,0,0,170)
      lg.rectangle("fill",-width/2,-height/2,width, height)
      lg.setColor(color)
      lg.print(text, 2-width/2, 2-height/2)
    end
  lg.pop()
end
  
return graphics