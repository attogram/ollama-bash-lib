# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.20

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, curious, swift.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:09:22:513310200: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:09:22:531018800: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:09:22:542094100: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:09:22:566184200: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:09:22:578412700: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:09:22:589663000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:09:22:599893400: _call_curl: Turbo Mode
[DEBUG] 00:09:22:610132300: _call_curl: adding json body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:09:24:650221400: ollama_api_post: success: return 0
[DEBUG] 00:09:24:661510800: ollama_generate_json: success: return: 0
[DEBUG] 00:09:24:707934600: ollama_generate: result: 388 bytes
Fluffy, timid, hopping.
[DEBUG] 00:09:24:739087900: ollama_generate: return: 0
```
