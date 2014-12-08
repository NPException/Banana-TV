local State = {}
State.__index = State



function State.new(game)
  local state = setmetatable({}, State)
  
  state.game = game
  
  return state
end


function State:update(dt)
end


-- OPTIONAL -- draws everything that is placed at the wall, behind the couch
function State:drawWall()
  

-- OPTIONAL -- draws everything on or in front of the couch
function State:drawRoom()
end


-- OPTIONAL -- draws whatever should be on the tv screen. is overlayed by the tv-frame
function State:drawTV()
end


-- OPTIONAL -- draws GUI elements of this state. is drawn on top of the tv-frame
function State:drawGUI()
end


-- OPTIONAL --
function State:keypressed(key)
end


-- OPTIONAL --
function State:mousepressed(x,y,button)
end


return State