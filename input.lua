--| target = os.getenv("target")
--| if target == "nelua" then
local a: Person =
--| else
local a =
--| end
{name = "Mark", age = 20}

--| if target ~= "redbean" then
function LaunchBrowser() return false; end  -- dummy function
--| end

print(a.name, a.age)
print("hello world from $(target)")
