# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.43

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
[DEBUG] 00:18:49:383425500: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:18:49:406575900: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:18:49:424142100: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:18:49:456519300: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:18:49:474752500: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:18:49:490243600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:18:49:507992900: _call_curl: Turbo Mode
[DEBUG] 00:18:49:524562000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:18:50:495567400: ollama_api_post: success: return 0
[DEBUG] 00:18:50:512924700: ollama_generate_json: success: return: 0
[DEBUG] 00:18:50:556371300: ollama_generate: result: 301 bytes
[DEBUG] 00:18:50:590384400: _is_valid_json: VALID: return 0
soft, swift, curious
[DEBUG] 00:18:50:629100700: ollama_generate: success: return: 0
```
