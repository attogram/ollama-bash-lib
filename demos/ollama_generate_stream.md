# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.1

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Fluffy, swift, playful
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 21:40:35:352402200: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:40:35:403700000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:40:35:427437900: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 21:40:35:461758900: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 21:40:35:482407400: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 21:40:35:503558400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:40:35:536639700: _call_curl: Turbo Mode
[DEBUG] 21:40:35:557921300: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 21:40:36:558361300: ollama_api_post: success: return 0
[DEBUG] 21:40:36:580803700: ollama_generate_json: success: return: 0
Gentle, quick, adorable.[DEBUG] 21:40:36:605774000: ollama_generate_stream: return: 0

```
