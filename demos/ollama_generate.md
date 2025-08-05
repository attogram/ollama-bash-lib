# ollama_generate
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```
[DEBUG] 23:18:43:408918500: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:18:43:736765200: ollama_generate: result: 1 bytes
[DEBUG] 23:18:43:779109800: ollama_generate: return: 0
```
