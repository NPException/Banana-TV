require("lib.stringfunctions")
require("lib.requirefolder")

GLOBALS = { debug=false }
local globals = GLOBALS



local game

-- LOAD --
function love.load(arg)
  globals.config = require("conf")
  globals.scale = globals.config.resY / love.window.getHeight()
  globals.offX = 0
  globals.offY = 0
  
  love.graphics.setDefaultFilter("nearest","nearest")
  -- init font
  font = love.graphics.newImageFont("assets/font/font.png",
    " abcdefghijklmnopqrstuvwxyz"..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0"..
    "123456789.,!?-+/():;%&`'*#=[]\""..
    "äöüÄÖÜ")
  love.graphics.setFont(font)

  globals.time = 0
  
  game = require("game.Game").new()
end

-- KEYPRESSED --
function love.keypressed(key)
  game:keypressed(key)
  
  if key == "kp-" then
    globals.debug = not globals.debug
  elseif key == "kp+" then
    game.scene.tvframe:startNoise()
  elseif key == "return" then
    if love.keyboard.isDown("lalt") or love.keyboard.isDown("ralt") then
      love.window.setFullscreen(not love.window.getFullscreen(), "desktop")
    end
  elseif key == "escape" then
    love.event.quit()
  elseif key == "kp1" then
    game.timer:start(function() game.scene.tvframe:startNoise() end, 3)
  end
end

function love.mousepressed( x, y, button )
  game:mousepressed(x,y,button)
end

-- UPDATE --
function love.update(dt)
  globals.time = globals.time + dt
  game:update(dt)
end

-- DRAW --
local lg = love.graphics
function love.draw()
  lg.push()
  lg.scale(1/globals.scale, 1/globals.scale)
  lg.translate(-globals.offX, -globals.offY)
  
    game:draw()
    
  lg.pop()
end

function love.resize(w,h)
  local sx = globals.config.resX / w
  local sy = globals.config.resY / h
  
  if sx < sy then
    globals.offX = (globals.config.resX - w*sy)/2
    globals.offY = 0
  elseif sy < sx then
    globals.offX = 0
    globals.offY = (globals.config.resY - h*sx)/2
  else
    globals.offX = 0
    globals.offY = 0
  end
  
  globals.scale = math.max(sx,sy)
end