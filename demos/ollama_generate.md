# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.6

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Fluffy, curious, swift.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:55:10:877575000: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:55:10:888865000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:55:10:898799000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:55:10:913885000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:55:10:921057000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:55:10:929233000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:55:10:937662000: _call_curl: Turbo Mode
[DEBUG] 22:55:10:945696000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:55:12:048159000: ollama_api_post: success: return 0
[DEBUG] 22:55:12:060757000: ollama_generate_json: success: return: 0
[DEBUG] 22:55:12:084541000: ollama_generate: result: 435 bytes
[DEBUG] 22:55:12:104045000: _is_valid_json: VALID: return 0
Soft, agile, playful.
[DEBUG] 22:55:12:123193000: ollama_generate: success: return: 0
```
