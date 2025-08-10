# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.1

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft swift curious
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 21:40:29:525994000: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:40:29:570497700: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:40:29:593499700: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 21:40:29:637560600: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:40:29:658361300: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:40:29:681523900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:40:29:708529700: _call_curl: Turbo Mode
[DEBUG] 21:40:29:733736400: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:40:30:931275800: ollama_api_post: success: return 0
[DEBUG] 21:40:30:951969000: ollama_generate_json: success: return: 0
[DEBUG] 21:40:31:009319100: ollama_generate: result: 987 bytes
[DEBUG] 21:40:31:054931600: _is_valid_json: VALID: return 0
Gentle, swift, curious
[DEBUG] 21:40:31:101066900: ollama_generate: success: return: 0
```
