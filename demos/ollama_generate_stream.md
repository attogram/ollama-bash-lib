# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.10

## Demo

```bash
ollama_generate_stream "granite3.3:2b" "Describe a rabbit in 3 words"
```
```
Fluffy Furrier
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "granite3.3:2b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 14:11:23:787115000: ollama_generate_stream: [granite3.3:2b] [Describe a rabbit in 3 words]
[DEBUG] 14:11:23:790712000: ollama_generate_json: [granite3.3:2b] [Describe a rabbit in 3 words]
[DEBUG] 14:11:23:793800000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 14:11:23:802410000: ollama_api_post: [/api/generate] [{"model":"granite3.3:2b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 14:11:23:805390000: _call_curl: [POST] [/api/generate] [{"model":"granite3.3:2b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 14:11:23:808298000: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 14:11:23:811374000: _call_curl: adding json body
[DEBUG] 14:11:24:185597000: ollama_api_post: success: return 0
[DEBUG] 14:11:24:190825000: ollama_generate_json: return: 0
Fluffy Jumper, Nibbler.[DEBUG] 14:11:36:275131000: ollama_generate_stream: return: 0

```
