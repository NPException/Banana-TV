function buildProbabilityList(tbl)
  local list = {}
  for key,count in pairs(tbl) do
    if (count < 1) then
      error("count for key is lower than 1!")
    end
    for i=1,count do
      table.insert(list,key)
    end
  end
  return list
end



function lowCopy(tbl)
  local copy = {}
  for k,v in pairs(tbl) do
    copy[k] = v 
  end
  return copy
end