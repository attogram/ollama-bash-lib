# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.40

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, timid, energetic.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:02:15:426678200: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:02:15:442588800: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:02:15:453400100: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:02:15:476477300: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:02:15:487929000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:02:15:498543600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:02:15:508833500: _call_curl: Turbo Mode
[DEBUG] 23:02:15:520078300: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:02:17:065786100: ollama_api_post: success: return 0
[DEBUG] 23:02:17:076735500: ollama_generate_json: success: return: 0
fluffy, swift, timid[DEBUG] 23:02:17:088312400: ollama_generate_stream: return: 0

```
