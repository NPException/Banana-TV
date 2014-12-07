local Room = {}
Room.__index = Room

local roomImage = love.graphics.newImage("assets/scene/room.png")



function Room.new()
  local r = setmetatable({}, Room)
  
  r.couch = require("game.scene.Couch").new()
  r.table = require("game.scene.Table").new()
  return r
end



function Room:update(dt)
  self.table:update(dt)
  self.couch:update(dt)
end



local lg = love.graphics
function Room:draw()
  lg.setColor(255,255,255)
  lg.draw(roomImage,0,0)
  
  self.table:draw()
  self.couch:draw()
end



return Room
