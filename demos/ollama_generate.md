# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.2

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, swift, timid.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:16:04:244968900: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:16:04:272006100: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:16:04:294730700: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:16:04:327000800: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:04:348735500: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:04:372469200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:16:04:394404100: _call_curl: Turbo Mode
[DEBUG] 22:16:04:415342500: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:05:335124100: ollama_api_post: success: return 0
[DEBUG] 22:16:05:357856400: ollama_generate_json: success: return: 0
[DEBUG] 22:16:05:411625200: ollama_generate: result: 383 bytes
[DEBUG] 22:16:05:457314100: _is_valid_json: VALID: return 0
Soft, hopping, timid.
[DEBUG] 22:16:05:511291700: ollama_generate: success: return: 0
```
