# estimate_tokens

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.18
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
tokens : 5013
verbose: 5013 ± 3095 (range 1918 to 5013)

(contents of ../ollama_bash_lib.sh)
tokens : 5772
verbose: 5772 ± 1815 (range 3957 to 5772)
```
