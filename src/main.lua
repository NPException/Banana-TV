require("lib.stringfunctions")
require("lib.requirefolder")

GLOBALS = { debug=false }
local globals = GLOBALS

local gfxvars = {}

local game
local timer = require("game.states.Timer").new() -- test
-- LOAD --
function love.load(arg)
  globals.config = require("conf")
  gfxvars.scale = globals.config.resY / love.window.getHeight()
  gfxvars.offX = 0
  gfxvars.offY = 0
  
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
    timer:start(function() print("Fertig!") end, 3)
  end
end

function love.mousepressed( x, y, button )
  game:mousepressed(x,y,button)
end

-- UPDATE --
function love.update(dt)
  globals.time = globals.time + dt
  game:update(dt)
  timer:update(dt)
end

-- DRAW --
local lg = love.graphics
function love.draw()
  lg.push()
  lg.scale(1/gfxvars.scale, 1/gfxvars.scale)
  lg.translate(-gfxvars.offX, -gfxvars.offY)
  
    game:draw()
    timer:draw()
    
  lg.pop()
end

function love.resize(w,h)
  local sx = globals.config.resX / w
  local sy = globals.config.resY / h
  
  if sx < sy then
    gfxvars.offX = (globals.config.resX - w*sy)/2
    gfxvars.offY = 0
  elseif sy < sx then
    gfxvars.offX = 0
    gfxvars.offY = (globals.config.resY - h*sx)/2
  else
    gfxvars.offX = 0
    gfxvars.offY = 0
  end
  
  gfxvars.scale = math.max(sx,sy)
end