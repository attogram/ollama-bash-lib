# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.35

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, swift, curious.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 13:10:48:676397400: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 13:10:48:690834700: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 13:10:48:700485300: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 13:10:48:721523900: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 13:10:48:731282000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 13:10:48:741457600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:10:48:750764800: _call_curl: Turbo Mode
[DEBUG] 13:10:48:762029500: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 13:10:49:825919300: ollama_api_post: success: return 0
[DEBUG] 13:10:49:835460600: ollama_generate_json: success: return: 0
Fluffy, timid, hopping.[DEBUG] 13:10:49:846189900: ollama_generate_stream: return: 0

```
