function string:startsWith( piece )
  return (piece == "") or (self:sub(1,piece:len()) == piece)
end
 
function string:endsWith( piece )
  return (piece == "") or (self:sub(-piece:len()) == piece)
end