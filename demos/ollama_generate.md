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
Fluffy, timid, hopping.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 01:24:03:613235000: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 01:24:03:627400000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 01:24:03:636989000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 01:24:03:653304000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:24:03:661172000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:24:03:668514000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:24:03:676999000: _call_curl: Turbo Mode
[DEBUG] 01:24:03:684441000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:24:04:607978000: ollama_api_post: success: return 0
[DEBUG] 01:24:04:622346000: ollama_generate_json: success: return: 0
[DEBUG] 01:24:04:644766000: ollama_generate: result: 317 bytes
[DEBUG] 01:24:04:664202000: _is_valid_json: VALID: return 0
Fluffy, curious, swift.
[DEBUG] 01:24:04:683222000: ollama_generate: success: return: 0
```
