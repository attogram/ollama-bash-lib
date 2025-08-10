# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.0

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Soft, curious, swift.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 19:44:26:130212200: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 19:44:26:161086700: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 19:44:26:186736200: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 19:44:26:223396900: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 19:44:26:253689800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 19:44:26:284751300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 19:44:26:319785600: _call_curl: Turbo Mode
[DEBUG] 19:44:26:343034900: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 19:44:27:338940700: ollama_api_post: success: return 0
[DEBUG] 19:44:27:360445700: ollama_generate_json: success: return: 0
[DEBUG] 19:44:27:413490300: ollama_generate: result: 382 bytes
[DEBUG] 19:44:27:462153100: _is_valid_json: VALID: return 0
Fluffy, timid, swift.
[DEBUG] 19:44:27:523341200: ollama_generate: success: return: 0
```
