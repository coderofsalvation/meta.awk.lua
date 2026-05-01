#!/usr/bin/env lua

function prep(file,delimiter)
  local chunk = {n=0}
  for line in file:lines() do
     if not string.find(line,"^#!") then 
       if string.find(line, delimiter) then
        table.insert(chunk, string.sub(line, #delimiter) .. "\n")
       else
        local last = 1
        line = string.gsub(line,"%%","%%") -- escape
        for text, expr, index in string.gmatch(line, "(.-)$(%b())()") do 
          last = index
          if text ~= "" then
            table.insert(chunk, string.format('io.write %q ', text))
          end
          table.insert(chunk, string.format('io.write %s', expr))
        end
        table.insert(chunk, string.format('io.write %q',
                                           string.sub(line, last).."\n"))
      end
    end
  end
  if os.getenv("DEBUG") then print( table.concat(chunk) ) end
  return load(table.concat(chunk))()
end

if arg[1] then
  delimiter = (arg[2] and "^"..arg[2]) or "^#"
  file = io.open(arg[1],"r")
  if file then
    print( prep(file,delimiter) )
  else
    print("error: file not found")
  end
else
  print("usage: [DEBUG=1] ./meta.lua yourfile.lua") 
end
