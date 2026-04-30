# Metaprogramming code-generator in ~700 bytes 

```bash
▓▓▓ ▒▒▒ ▒▒▒ ▓▓▓ ███

███ ▓▓▓ ▒▒▒ ▓▓▓ ███

▓▓▓ ███ ▓▓▓ ▒▒▒ ▓▓▓

▒▒▒ ▓▓▓ ███ ▓▓▓ ▒▒▒ awk metaprogrammer 
```

Tiny awk util, huge potential.

## Usage

```bash
$ ./meta.awk input.html > output.html
```

```html
<ul>
# for( i = 0; i < 5; i++ ){
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
  <li>
   2
  </li>
  <li>
   3
  </li>
  <li>
   4
  </li>
</ul>
```

## Target C/Lua/Nelua/Rust etc

You can change the prefix (for example using lua comments `-- #` instead of `#`).
This allows for generating to various language-dialects from one source-file: 

```bash
meta.awk input.lua '--nelua' > output.nelua
```

input.lua:
```lua
--nelua print("local Person = @record{name: string, age: integer}")
local a --nelua print("local a: Person")
 = {name = "Mark", age = 20}

--nelua for( i = 0; i < 2; i++ ){
print(a.name, a.age)
print("hello world")
--nelua }
```

output.nelua:
```lua
local Person = @record{name: string, age: integer}
local a: Person
 = {name = "Mark", age = 20}

print(a.name, a.age)
print("hello world")
print(a.name, a.age)
print("hello world")
```

## Why awk 

It's tiny but everywhere..all linux distros..busybox..etc

> tip: check [cosmpolitan libc](https://justine.lol/cosmopolitan/) awk-version here: https://cosmo.zip/pub/cosmos/bin
