local Action = {}
Action.__index = Action

local globals = GLOBALS



function Action.new(id, actionTable)
  local action = setmetatable({}, Action)
  action.id = id
  action.name = actionTable.name
  action.icon = actionTable.icon
  action.animation = actionTable.animation
  action.score = actionTable.score
  return action
end


function Action:update(dt)
  
end


local lg = love.graphics
function Action:draw()
  lg.setColor(255,255,255)
  -- TODO draw action
end

return Action