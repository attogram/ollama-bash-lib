# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

## Demo

```bash
ollama_generate "granite3.3:8b" "Describe a rabbit in 3 words"
```
```
"Fluffy, Long-eared, Hopping."
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "granite3.3:8b" "Describe a rabbit in 3 words"`
```
```
[DEBUG] ollama_generate: [granite3.3:8b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: [granite3.3:8b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "granite3.3:8b",
  "prompt": ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 583 bytes
Small, fluffy, hopping mammal.
[DEBUG] ollama_generate: return: 0
```
