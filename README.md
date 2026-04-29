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
$ ./meta.awk input.txt > output.html
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

## Target C/Lua/Rust etc

You can change the prefix (for example using lua comments `-- #` instead of `#`):

```
$ ./meta.awk input.txt "--" > output.lua
```

## Why awk 

It's tiny but everywhere..all linux distros..busybox..etc

> tip: check [cosmpolitan libc](https://justine.lol/cosmopolitan/) awk-version here: https://cosmo.zip/pub/cosmos/bin
