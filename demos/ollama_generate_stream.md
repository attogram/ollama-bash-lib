# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.13

## Demo

```bash
ollama_generate_stream "deepseek-r1:8b" "Describe a rabbit in 2 short sentences"
```
```
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "deepseek-r1:8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [deepseek-r1:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [deepseek-r1:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "deepseek-r1:8b",
  "prompt":]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream: return: 0
```
