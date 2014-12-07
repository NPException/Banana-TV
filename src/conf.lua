function love.conf(t)
  t.version = "0.9.1"                -- The LÖVE version this game was made for (string)
  t.window.title = "Project Bananensaft"
  t.window.icon = nil                -- Filepath to an image to use as the window's icon (string)
  t.window.width = 1280              -- The window width (number)
  t.window.height = 720              -- The window height (number)
  t.window.borderless = false        -- Remove all border visuals from the window (boolean)
  t.window.resizable = true         -- Let the window be user-resizable (boolean)
  t.window.minwidth = 320            -- Minimum window width if the window is resizable (number)
  t.window.minheight = 180           -- Minimum window height if the window is resizable (number)
  t.window.vsync = false             -- Enable vertical sync (boolean)
  
  t.window.fsaa = 16                 -- The number of samples to use with multi-sampled antialiasing (number)
  t.window.display = 1               -- Index of the monitor to show the window in (number)
    
  t.modules.joystick = false         -- Enable the joystick module (boolean)
  t.modules.physics = false          -- Physics module
  
  t.console = true -- for development only
end



local config = {
  oldschool = false,
  resX = 1280,
  resY = 720
}

function config:setOldschool(oldschool)
  self.oldschool = oldschool
  self.resX = oldschool and 320 or 1280
  self.resY = oldschool and 180 or 720
end

return config
