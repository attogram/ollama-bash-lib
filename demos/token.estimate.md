# estimate_tokens

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0
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
tokens : 5110
verbose: 5110 ± 3153 (range 1957 to 5110)

(contents of ../ollama_bash_lib.sh)
tokens : 5850
verbose: 5850 ± 1825 (range 4025 to 5850)
```
