# estimate_tokens

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.10
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
tokens : 4953
verbose: 4953 ± 3067 (range 1886 to 4953)

(contents of ../ollama_bash_lib.sh)
tokens : 5820
verbose: 5820 ± 1928 (range 3892 to 5820)
```
