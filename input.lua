--| target = ENVIRON["target"]

--| if( target == "nelua" ){
local a: Person =
--| }else{
local a =
--| }
{name = "Mark", age = 20}

--| if( target != "redbean" ){
function LaunchBrowser() return false; end  -- dummy function
--| }

--| if( target == "nelua" ){
--|   for( i = 0; i < 2; i++ ){
print(a.name, a.age)
print("hello world")
--|   }
--| }
