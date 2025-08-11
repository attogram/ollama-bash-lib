# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.5

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Cute, swift, curious.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:38:18:830142000: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:38:18:843236000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:38:18:853383000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:38:18:872156000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:38:18:881149000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:38:18:889234000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:38:18:896935000: _call_curl: Turbo Mode
[DEBUG] 22:38:18:904490000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:38:19:899764000: ollama_api_post: success: return 0
[DEBUG] 22:38:19:912558000: ollama_generate_json: success: return: 0
[DEBUG] 22:38:19:932999000: ollama_generate: result: 346 bytes
[DEBUG] 22:38:19:955604000: _is_valid_json: VALID: return 0
Curious, fluffy, playful.
[DEBUG] 22:38:19:975938000: ollama_generate: success: return: 0
```
