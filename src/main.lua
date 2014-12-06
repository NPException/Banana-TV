require("lib.stringfunctions")
require("lib.requirefolder")

-- LOAD --
function love.load(arg)
  
  local items = requirefolder("items")
  print()
  print("Items: ")
  for k,v in pairs(items) do
    print(k.." -> "..v.name)
  end
end

-- KEYPRESSED --
function love.keypressed(key)
end

function love.mousepressed( x, y, button )
end

-- UPDATE --
function love.update(dt)
end

-- DRAW --
function love.draw()
end

function love.resize(w,h)
end