require("lib.stringfunctions")
require("lib.requirefolder")
require("lib.tablefunctions")
require("lib.color")

GLOBALS = { debug=false }
local globals = GLOBALS


local game



-- LOAD --
function love.load(arg)
  globals.config = require("conf")
  globals.scale = globals.config.resY / love.window.getHeight()
  globals.offX = 0
  globals.offY = 0
    
  local w,h,flags = love.window.getMode()
  
  globals.width = w
  globals.height = h
  
  if  globals.config.autoAdjustFSAA then
    local fsaa = flags.fsaa
    local ok, val = false, nil
    
    while not ok do
      flags.fsaa = fsaa
      ok = love.window.setMode(1,1,flags)
      ok = ok and pcall(love.graphics.newImage, "assets/scene/couch.png")
      ok = ok and pcall(love.graphics.newCanvas, 1280,720)
      fsaa = math.floor(fsaa/2)
    end
    
    love.window.setMode(w,h,flags)
  end
  
  math.randomseed(os.clock())
  
  love.graphics.setDefaultFilter("nearest","nearest")
  -- init font
  font = love.graphics.newImageFont("assets/font/font.png",
    " abcdefghijklmnopqrstuvwxyz"..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0"..
    "123456789.,!?-+/():;%&`'*#=[]\""..
    "äöüÄÖÜ")
  love.graphics.setFont(font)
  
  -- init cursor
  globals.cursor = {
    img = love.graphics.newImage("assets/mouse/cursor_banana_npe_3x.png"),
    alpha = 255
  }
  local invisiCursor = love.mouse.newCursor(love.image.newImageData(1,1))
  love.mouse.setCursor(invisiCursor)
  
  globals.time = 0
  
  game = require("game.Game").new()
end



-- KEYPRESSED --
function love.keypressed(key)
  game:keypressed(key)
  
  if key == "kp-" then
    globals.debug = not globals.debug
  elseif key == "kp+" then
    local frame = game.scene.tvframe
    if frame.noise.loop then
      frame:stopNoise()
    else
      frame:startNoise(true)
    end
  elseif key == "return" then
    if love.keyboard.isDown("lalt") or love.keyboard.isDown("ralt") then
      love.window.setFullscreen(not love.window.getFullscreen(), "desktop")
    end
  elseif key == "escape" then
    love.event.quit()
  elseif key == "kp/" then
    game.timer:start(function() end, 3)
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
    
    local mx,my = game.getMousePosition()
    lg.setColor(255,255,255,globals.cursor.alpha)
    lg.draw(globals.cursor.img,mx,my,0,1,1,5,5)
    
  lg.pop()
end



function love.resize(w,h)
  if not love.window.getFullscreen() then
    globals.width = w
    globals.height = h
  end

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