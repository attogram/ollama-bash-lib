# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, timid, adorable.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:54:59:688266000: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:54:59:699304000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:54:59:707775000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:54:59:723361000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 00:54:59:731193000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 00:54:59:738449000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:54:59:745544000: _call_curl: Turbo Mode
[DEBUG] 00:54:59:752305000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 00:55:01:080956000: ollama_api_post: success: return 0
[DEBUG] 00:55:01:092973000: ollama_generate_json: success: return: 0
[DEBUG] 00:55:01:111978000: ollama_generate: result: 401 bytes
[DEBUG] 00:55:01:133894000: _is_valid_json: VALID: return 0
Fluffy, swift, timid.
[DEBUG] 00:55:01:154141000: ollama_generate: success: return: 0
```
