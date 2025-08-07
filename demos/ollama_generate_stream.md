# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.24

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, curious, swift.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 00:59:25:381157500: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:59:25:396319200: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:59:25:406986700: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 00:59:25:442128300: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:59:25:452908800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:59:25:463608600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:59:25:474015500: _call_curl: Turbo Mode
[DEBUG] 00:59:25:485424200: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:59:26:485534600: ollama_api_post: success: return 0
[DEBUG] 00:59:26:498026200: ollama_generate_json: success: return: 0
fluffy, swift, gentle[DEBUG] 00:59:26:510284300: ollama_generate_stream: return: 0

```
