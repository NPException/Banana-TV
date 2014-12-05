
-- LOAD --
function love.load(arg)
end

-- KEYPRESSED --
function love.keypressed(key)
end

function love.mousepressed( x, y, button )
end

-- UPDATE --
function love.update(dt)
  labelTween:update(dt)
end

-- DRAW --
function love.draw()
  love.graphics.setColor(255,255,255)
  love.graphics.print(label.text, label.x, label.y)
end

function love.resize(w,h)
end