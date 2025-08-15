# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, swift, curious.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 23:38:15:980758000: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:38:15:993509000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:38:16:002918000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:38:16:019126000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:38:16:026842000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:38:16:036200000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:38:16:042693000: _call_curl: Turbo Mode
[DEBUG] 23:38:16:050769000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:38:16:965853000: ollama_api_post: success: return 0
[DEBUG] 23:38:16:979430000: ollama_generate_json: success: return: 0
[DEBUG] 23:38:17:002837000: ollama_generate: result: 494 bytes
[DEBUG] 23:38:17:022019000: _is_valid_json: VALID: return 0
Fluffy, agile, curious
[DEBUG] 23:38:17:044377000: ollama_generate: success: return: 0
```
