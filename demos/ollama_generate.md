# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.18

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
[DEBUG] 21:46:31:992212800: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:46:32:010512100: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:46:32:021097000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 21:46:32:047440000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:46:32:058990600: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:46:32:070449100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:46:32:084234100: _call_curl: Turbo Mode
[DEBUG] 21:46:32:096752200: _call_curl: adding json body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:46:33:222584800: ollama_api_post: success: return 0
[DEBUG] 21:46:33:234779600: ollama_generate_json: success: return: 0
[DEBUG] 21:46:33:286908700: ollama_generate: result: 610 bytes
[DEBUG] 21:46:33:302788300: _escape_control_characters: Safe Mode OFF
Fluffy, playful, quick.
[DEBUG] 21:46:33:317937400: ollama_generate: return: 0
```
