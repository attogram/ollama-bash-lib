# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.41

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, timid, agile.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 23:11:59:204440400: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:11:59:229262700: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:11:59:246382700: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:11:59:276941800: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:11:59:295507000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:11:59:313748700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:11:59:331201900: _call_curl: Turbo Mode
[DEBUG] 23:11:59:349677700: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:12:00:351146400: ollama_api_post: success: return 0
[DEBUG] 23:12:00:370570000: ollama_generate_json: success: return: 0
[DEBUG] 23:12:00:428918900: ollama_generate: result: 357 bytes
[DEBUG] 23:12:00:477223600: _is_valid_json: VALID: return 0
Fluffy, timid, hopping.
[DEBUG] 23:12:00:522375700: ollama_generate: success: return: 0
```
