return {
  name = "item",
  image = love.graphics.newImage("assets/items/image.png"),
  offsetX = 0,
  offsetY = 0,
  positions = { -- positions where the item can appear
    wall=true,
    armrest=true,
    seats=true,
    table=true,
    floor=true
  }
}