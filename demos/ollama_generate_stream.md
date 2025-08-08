# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.25

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
fluffy, swift, gentle
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 20:20:35:518199900: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 20:20:35:534674500: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 20:20:35:545512700: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 20:20:35:579372500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 20:20:35:590496600: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 20:20:35:601670800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:20:35:612479300: _call_curl: Turbo Mode
[DEBUG] 20:20:35:624290000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 20:20:37:412045400: ollama_api_post: success: return 0
[DEBUG] 20:20:37:422774600: ollama_generate_json: success: return: 0
Fluffy ears hopping[DEBUG] 20:20:37:435075200: ollama_generate_stream: return: 0

```
