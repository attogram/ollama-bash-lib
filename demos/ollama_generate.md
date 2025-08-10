# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.46

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
fluffy curious agile
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 16:24:44:372400300: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 16:24:44:409403200: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 16:24:44:430963200: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 16:24:44:465524900: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 16:24:44:496761100: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 16:24:44:517472800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 16:24:44:539287000: _call_curl: Turbo Mode
[DEBUG] 16:24:44:571695500: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 16:24:45:590075300: ollama_api_post: success: return 0
[DEBUG] 16:24:45:621231100: ollama_generate_json: success: return: 0
[DEBUG] 16:24:45:669712300: ollama_generate: result: 470 bytes
[DEBUG] 16:24:45:716342500: _is_valid_json: VALID: return 0
fluffy, swift, gentle
[DEBUG] 16:24:45:768580000: ollama_generate: success: return: 0
```
