# estimate_tokens

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0
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
tokens : 4544
verbose: 4544 ± 2808 (range 1736 to 4544)

(contents of ../ollama_bash_lib.sh)
tokens : 5762
verbose: 5762 ± 1917 (range 3845 to 5762)
```
