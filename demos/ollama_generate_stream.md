# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.0

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, quick, curious
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 19:44:32:200412600: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 19:44:32:227576300: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 19:44:32:250616100: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 19:44:32:284751100: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 19:44:32:320586800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 19:44:32:348920700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 19:44:32:371472000: _call_curl: Turbo Mode
[DEBUG] 19:44:32:396536700: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 19:44:33:641441200: ollama_api_post: success: return 0
[DEBUG] 19:44:33:664586000: ollama_generate_json: success: return: 0
Soft quick playful[DEBUG] 19:44:33:690295200: ollama_generate_stream: return: 0

```
