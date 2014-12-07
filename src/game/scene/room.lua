local room = {}

local globals = GLOBALS

local gfx = {
  roomImage = love.graphics.newImage("assets/scene/room.png"),
  roomDevImages = {
    love.graphics.newImage("assets/scene/room_dev_1.png"),
    love.graphics.newImage("assets/scene/room_dev_2.png"),
    love.graphics.newImage("assets/scene/room_dev_3.png")
  },
  roomDevImageIndex = 1
}

function room.update(dt)
  if globals.config.oldschool then
    gfx.roomDevImageIndex = math.ceil((globals.time*7) % 3)
  end
end

local lg = love.graphics
function room.draw()
  lg.setColor(255,255,255)
  if globals.config.oldschool then
    lg.draw(gfx.roomDevImages[gfx.roomDevImageIndex],0,0)
  else
    lg.draw(gfx.roomImage,0,0)
  end
end

return room