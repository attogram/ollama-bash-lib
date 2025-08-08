# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.29

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, curious, swift.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:53:00:067578600: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:53:00:083258200: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:53:00:093633700: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 22:53:00:116165700: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:53:00:127568800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:53:00:137705800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:53:00:148702700: _call_curl: Turbo Mode
[DEBUG] 22:53:00:158950300: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:53:01:293789600: ollama_api_post: success: return 0
[DEBUG] 22:53:01:305270200: ollama_generate_json: success: return: 0
Fluffy, timid, swift.[DEBUG] 22:53:01:317931600: ollama_generate_stream: return: 0

```
