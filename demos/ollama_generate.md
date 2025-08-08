# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.32

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, curious, playful 🚀
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 23:33:59:536401300: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:33:59:553501300: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:33:59:565263600: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:33:59:591947900: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:33:59:604757400: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:33:59:617908200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:33:59:630823900: _call_curl: Turbo Mode
[DEBUG] 23:33:59:642240300: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:34:00:717537300: ollama_api_post: success: return 0
[DEBUG] 23:34:00:728521400: ollama_generate_json: success: return: 0
[DEBUG] 23:34:00:767524600: ollama_generate: result: 467 bytes
Fluffy, curious, swift.
[DEBUG] 23:34:00:794949000: ollama_generate: return: 0
```
