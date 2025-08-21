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
tokens : 7884
verbose: 7884 ± 4470 (range 3414 to 7884)

(contents of ../ollama_bash_lib.sh)
tokens : 23947
verbose: 23947 ± 7602 (range 16345 to 23947)
```
