# estimate_tokens

```
estimate_tokens "string"
estimate_tokens "string" 1 (verbose)

My hovercraft is full of eels
tokens : 8
verbose: 8 ± 1 (range 7 to 8)

我的气垫船上满是鳗鱼
tokens : 7
verbose: 7 ± 6 (range 1 to 7)

(contents of ../README.md)
tokens : 7955
verbose: 7955 ± 4522 (range 3433 to 7955)

(contents of ../ollama_bash_lib.sh)
tokens : 24540
verbose: 24540 ± 7740 (range 16800 to 24540)
```
