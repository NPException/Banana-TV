local Preview = {}
Preview.__index = Preview


local mappings = require("game.characters._itemmapping")


function Preview.new(game)
  local preview = setmetatable({}, Preview)
  
  preview.game = game
  
  local run = {}
  
  run.characters = {}

  local numberOfCharacters = (math.random()<0.3) and 2 or 1
  local charsCopy = lowCopy(game.characters)
  local seatsCopy = lowCopy(game.scene.room.spots.seat)
  
  -- get random characters
  for i=1,numberOfCharacters do
    local index = math.random(1,#charsCopy)
    local seatIndex = math.random(1,#seatsCopy)
    -- put character and it's seat in the table
    table.insert(run.characters, {char=charsCopy[index], spot=seatsCopy[seatIndex]} )
    
    table.remove(charsCopy, index)
    table.remove(seatsCopy, seatIndex)
  end
  
  -- copy available items into key-value table
  local itemsCopy = {}
  for _,item in ipairs(game.items) do
    itemsCopy[item.id] = item
  end
  
  local charItems = {}
  
  -- get indicator items
  for _,entry in ipairs(run.characters) do
    local probableItems = buildProbabilityList(mappings[entry.char.id])
    -- add up to 3 items
    for i=1,math.random(1,3) do
      -- fetch item ID
      local itemID = probableItems[math.random(1,#probableItems)]
      -- remove item ID from probability list
      for k=#probableItems,1,-1 do
        if probableItems[k]==itemID then
          table.remove(probableItems, k)
        end
      end
      -- if item has not been chosen already, add it to the list
      local item = itemsCopy[itemID]
      if item then
        itemsCopy[itemID] = nil
        table.insert(charItems, item)
      end
    end
  end
  
  run.items = {}
  -- find spots for items
  local spotsCopy = lowCopy(game.scene.room.spots.all)
  for _,item in ipairs(charItems) do
    local spot
    local d = 0
    repeat
      local index = math.random(1,#spotsCopy)
      spot = spotsCopy[index]
      if item.positions[spot.type] then
        table.remove(spotsCopy, index)
      else
        spot = nil
      end
      d = d+1
    until spot
    
    table.insert(run.items, {item=item, spot=spot})
  end
  
  game.run = run
  
  preview.countdown = 2
  
  return preview
end


function Preview:update(dt)
  if self.countdown then
    self.countdown = self.countdown - dt
    if self.countdown <= 0 then
      local changeToChoice = function()
        self.game.state = require("game.states.ChoiceState").new()
      end
      self.game.timer:start(changeToChoice, 3)
      self.countdown = nil
    end
  end
end


function Preview:drawWall()
  -- draw items
  for _,entry in ipairs(self.game.run.items) do
    if entry.spot.type == "wall" then
      entry.item:draw(entry.spot)
    end
  end
end



function Preview:drawRoom()
  -- draw items
  for _,entry in ipairs(self.game.run.items) do
    if entry.spot.type ~= "wall" then
      entry.item:draw(entry.spot)
    end
  end
end



return Preview