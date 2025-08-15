# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.8

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
fluffy playful quick
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 23:23:24:028669000: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:23:24:039883000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:23:24:048189000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:23:24:063186000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:23:24:070452000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:23:24:078290000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:23:24:086001000: _call_curl: Turbo Mode
[DEBUG] 23:23:24:093917000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:23:25:320027000: ollama_api_post: success: return 0
[DEBUG] 23:23:25:335562000: ollama_generate_json: success: return: 0
[DEBUG] 23:23:25:360982000: ollama_generate: result: 759 bytes
[DEBUG] 23:23:25:381840000: _is_valid_json: VALID: return 0
Gentle, fluffy, playful
[DEBUG] 23:23:25:399418000: ollama_generate: success: return: 0
```
