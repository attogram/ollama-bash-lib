# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, swift, playful.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:37:46:974482600: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:37:47:004254300: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:37:47:027645800: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:37:47:061603200: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:37:47:099066600: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:37:47:122741800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:37:47:144511000: _call_curl: Turbo Mode
[DEBUG] 00:37:47:175981200: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:37:48:187971900: ollama_api_post: success: return 0
[DEBUG] 00:37:48:209691700: ollama_generate_json: success: return: 0
[DEBUG] 00:37:48:264520400: ollama_generate: result: 514 bytes
[DEBUG] 00:37:48:324875200: _is_valid_json: VALID: return 0
fluffy, curious, energetic
[DEBUG] 00:37:48:370819600: ollama_generate: success: return: 0
```
