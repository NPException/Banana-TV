local Room = {}
Room.__index = Room

local roomImage = love.graphics.newImage("assets/scene/room.png")



function Room.new()
  local r = setmetatable({}, Room)
  
  r.couch = require("game.scene.Couch").new()
  r.table = require("game.scene.Table").new()
  
  r.spots = {
    -- lists by type are filled later
    wall = {},
    armrest = {},
    seat = {},
    table = {},
    floor = {},
    
    -- all spots in the room itself. (wall and floor)
    all = {
      
    }
  }
  
  for _,spot in ipairs(r.couch.armrests) do
    table.insert(r.spots.all, spot)
  end
  for _,spot in ipairs(r.couch.seats) do
    table.insert(r.spots.all, spot)
  end
  table.insert(r.spots.all, r.table.spot)
  
  for _,spot in ipairs(r.spots.all) do
    if spot.type == "wall" then
      table.insert(r.spots.wall, spot)
    elseif spot.type == "armrest" then
      table.insert(r.spots.armrest, spot)
    elseif spot.type == "seat" then
      table.insert(r.spots.seat, spot)
    elseif spot.type == "table" then
      table.insert(r.spots.table, spot)
    elseif spot.type == "floor" then
      table.insert(r.spots.floor, spot)
    else
      print("Unkown spot type: "..spot.type)
    end
  end
  
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
