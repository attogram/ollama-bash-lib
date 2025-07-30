# estimate_tokens

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.5
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
tokens : 4483
verbose: 4483 ± 2765 (range 1718 to 4483)

(contents of ../ollama_bash_lib.sh)
tokens : 5755
verbose: 5755 ± 1931 (range 3824 to 5755)
```
