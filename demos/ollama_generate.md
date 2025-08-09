# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.39

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
[DEBUG] 22:16:07:231558400: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:16:07:250217600: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:16:07:261553000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:16:07:286597300: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:07:298308000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:07:311123200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:16:07:323759100: _call_curl: Turbo Mode
[DEBUG] 22:16:07:335703800: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:08:552341500: ollama_api_post: success: return 0
[DEBUG] 22:16:08:563900100: ollama_generate_json: success: return: 0
[DEBUG] 22:16:08:612262900: ollama_generate: result: 355 bytes
[DEBUG] 22:16:08:642694900: _is_valid_json: VALID: return 0
Fluffy, timid, hopping.
[DEBUG] 22:16:08:678771300: ollama_generate: success: return: 0
```
