# Metaprogramming code-generator in ~700 bytes 

```bash
▓▓▓ ▒▒▒ ▒▒▒ ▓▓▓ ███

███ ▓▓▓ ▒▒▒ ▓▓▓ ███

▓▓▓ ███ ▓▓▓ ▒▒▒ ▓▓▓

▒▒▒ ▓▓▓ ███ ▓▓▓ ▒▒▒ awk metaprogrammer 
```

Tiny awk util, huge potential.

## Usage (Basic templates)

```bash
$ ./meta.awk input.html > output.html
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
$ target=redbean meta.awk input.lua '--|' > out.redbean.lua
$ target=nelua   meta.awk input.lua '--|' > out.nelua 
$ target=lua     meta.awk input.lua '--|' > out.lua 
```

input.lua:
```lua
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
```

out.nelua:
```lua
local a: Person =
{name = "Mark", age = 20}

function LaunchBrowser() return false; end  -- dummy function

print(a.name, a.age)
print("hello world")
print(a.name, a.age)
print("hello world")
```

out.redbean.lua:
```lua
local a =
{name = "Mark", age = 20}
```

out.lua:
```lua
local a =
{name = "Mark", age = 20}

function LaunchBrowser() return false; end  -- dummy function
```

## Why

Lua is awesome, and its various cool dialects (teal / nelua) allow targeting web/games/esp32 from the same lua-code.

## Why awk 

It's tiny but everywhere..all linux distros..busybox..etc

> tip: check [cosmpolitan libc](https://justine.lol/cosmopolitan/) awk-version here: https://cosmo.zip/pub/cosmos/bin
