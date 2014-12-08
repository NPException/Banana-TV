local Room = {}
Room.__index = Room

local roomImage = love.graphics.newImage("assets/scene/room.png")
local globals = GLOBALS



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
      {x=300,y=160,type="wall"},
      {x=590,y=120,type="wall"},
      {x=955,y=180,type="wall"},
      {x=307,y=602,type="floor"},
      {x=751,y=638,type="floor"},
      {x=1111,y=535,type="floor"}
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
function Room:drawRoom()
  lg.setColor(255,255,255)
  lg.draw(roomImage,0,0)
end

function Room:drawFurniture()
  self.table:draw()
  self.couch:draw()
  
  if globals.debug then
    lg.setColor(0,255,0)
    for _,spot in ipairs(self.spots.all) do
      lg.circle("line", spot.x, spot.y, 10)
    end
  end
end


return Room
