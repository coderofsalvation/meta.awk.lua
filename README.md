# Metaprogramming code-generators in ~700 bytes 

```bash
▓▓▓ ▒▒▒ ▒▒▒ ▓▓▓ ███

███ ▓▓▓ ▒▒▒ ▓▓▓ ███

▓▓▓ ███ ▓▓▓ ▒▒▒ ▓▓▓

▒▒▒ ▓▓▓ ███ ▓▓▓ ▒▒▒ awk metaprogrammer 
```

Tiny scripts, huge potential.
#preprocessor #awk #lua #permacomputing #lite

## Usage (Basic templates)

> **NOTE**: `meta.awk` and `meta.lua` are interchangable. For exotic operating systems without lua/awk: [check here](#portablebinaries)

```bash
$ ./meta.awk input.html > output.html
$ ./meta.lua input.html > output.html
```

```html
<ul>
# for( i = 0; i < 2; i++ ){
  <li>
#   print("   "i) 
  </li>
# }
</ul>
```

output.html:
```html
<ul>
  <li>
   0
  </li>
  <li>
   1
  </li>
</ul>
```

## Multilanguage preprocessor 

You can change the prefix (`#`) to fit other languages better.
Here's a 3-in-1 demo which generates nelua/redbean-specific code from lua-code:

```bash
$ target=redbean meta.lua input.lua '--|' > out.redbean.lua
$ target=nelua   meta.lua input.lua '--|' > out.nelua 
$ target=lua     meta.lua input.lua '--|' > out.lua 
```

input.lua:
```lua
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
```

out.nelua:
```lua
local a: Person =
{name = "Mark", age = 20}
function LaunchBrowser() return false; end  -- dummy function

print(a.name, a.age)
print("hello world from nelua")

```

out.redbean.lua:
```lua
local a =
{name = "Mark", age = 20}

print(a.name, a.age)
print("hello world from redbean")

```

out.lua:
```lua
local a =
{name = "Mark", age = 20}
function LaunchBrowser() return false; end  -- dummy function

print(a.name, a.age)
print("hello world from lua")

```

## Portable binaries

Chances are your OS already has lua/awk installed.
However:

> TIP: see portable [crossplatform awk/lua binaries](https://cosmo.zip/pub/cosmos/bin/) thanks to [cosmopolitan libc](https://justine.lol/cosmopolitan/)♥) (don't forget to run `chmod +x awk lua`)


## Why

AWK is awesome, its tiny and usually preinstalled on many Os'ses..linux distros..busybox..etc
Lua is awesome, and tiny and has various cool dialects (teal / nelua) allow targeting web/games/esp32 from the same lua-code.
