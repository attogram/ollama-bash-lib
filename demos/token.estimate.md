# estimate_tokens

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.20
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
tokens : 5076
verbose: 5076 ± 3118 (range 1958 to 5076)

(contents of ../ollama_bash_lib.sh)
tokens : 5704
verbose: 5704 ± 1818 (range 3886 to 5704)
```
