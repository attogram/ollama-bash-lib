# estimate_tokens

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.2
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
tokens : 4443
verbose: 4443 ± 2681 (range 1762 to 4443)

(contents of ../ollama_bash_lib.sh)
tokens : 5841
verbose: 5841 ± 1991 (range 3850 to 5841)
```
