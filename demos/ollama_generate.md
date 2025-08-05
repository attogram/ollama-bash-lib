# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo

```bash
ollama_generate "dolphin3:8b" "Describe a rabbit in 3 words"
```
```
Cute, fluffy, and fast.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "dolphin3:8b" "Describe a rabbit in 3 words"`
```
```
[DEBUG] 21:03:27:830854700: ollama_generate: [dolphin3:8b] [Describe a rabbit in 3 words]
[DEBUG] 21:03:28:772466000: ollama_generate: result: 472 bytes
Cute, fluffy, hoppy.
[DEBUG] 21:03:44:805987600: ollama_generate: return: 0
```
