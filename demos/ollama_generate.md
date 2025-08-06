# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.10

## Demo

```bash
ollama_generate "gemma3n:e4b" "Describe a rabbit in 3 words"
```
```
Fluffy, quick, curious. 

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "gemma3n:e4b" "Describe a rabbit in 3 words"`
```
```
[DEBUG] 14:11:04:985095000: ollama_generate: [gemma3n:e4b] [Describe a rabbit in 3 words]
[DEBUG] 14:11:04:992863000: ollama_generate_json: [gemma3n:e4b] [Describe a rabbit in 3 words]
[DEBUG] 14:11:04:999189000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 14:11:05:013747000: ollama_api_post: [/api/generate] [{"model":"gemma3n:e4b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 14:11:05:020219000: _call_curl: [POST] [/api/generate] [{"model":"gemma3n:e4b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 14:11:05:026755000: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 14:11:05:033485000: _call_curl: adding json body
[DEBUG] 14:11:05:710686000: ollama_api_post: success: return 0
[DEBUG] 14:11:05:721413000: ollama_generate_json: return: 0
[DEBUG] 14:11:05:739470000: ollama_generate: result: 438 bytes
Fluffy, quick, curious. 

[DEBUG] 14:11:08:639789000: ollama_generate: return: 0
```
