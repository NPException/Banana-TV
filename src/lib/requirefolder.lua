require("lib.stringfunctions")

function requirefolder(folder)
  local results = {}
  
  local lfs = love.filesystem
  local filesTable = lfs.getDirectoryItems(folder)
  for i,filename in ipairs(filesTable) do
    if not filename:startsWith("_") and filename:endsWith(".lua") then
      local file = folder.."/"..filename
      if lfs.isFile(file) then
        local ok, result = pcall(require, file:sub(1,file:len()-4))
        if ok then
          results[filename:sub(1,filename:len()-4)] = result
        else
          print(result)
        end
      end
    end
  end
  
  return results
end