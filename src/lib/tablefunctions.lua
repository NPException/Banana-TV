function buildProbabilityList(table)
  local list = {}
  for key,count in pairs(table) do
    if (count < 1) then
      error("count for key is lower than 1!")
    end
    for i=1,count do
      table.insert(list,key)
    end
  end
  return list
end