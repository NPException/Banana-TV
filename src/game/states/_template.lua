local State = {}
State.__index = State



function State.new(game)
  local state = setmetatable({}, State)
  
  state.game = game
  
  return state
end


function State:update(dt)
end


-- OPTIONAL --
function State:drawRoom()
end


-- OPTIONAL --
function State:drawTV()
end


-- OPTIONAL --
function State:drawGUI()
end


-- OPTIONAL --
function State:keypressed(key)
end


-- OPTIONAL --
function State:mousepressed(x,y,button)
end


return State