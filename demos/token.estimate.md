# estimate_tokens

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.5
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
tokens : 4547
verbose: 4547 ± 2811 (range 1736 to 4547)

(contents of ../ollama_bash_lib.sh)
tokens : 5789
verbose: 5789 ± 1915 (range 3874 to 5789)
```
