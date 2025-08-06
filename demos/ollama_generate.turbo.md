# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.14

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Fluffy, Nimble, Curious
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:47:09:497142700: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:47:09:513689800: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:47:09:524084500: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:47:09:548880600: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:47:09:560133200: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:47:09:570858200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:47:09:581594000: _call_curl: Turbo Mode
[DEBUG] 00:47:09:593426000: _call_curl: adding json body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:47:10:794862100: ollama_api_post: success: return 0
[DEBUG] 00:47:10:805455400: ollama_generate_json: success: return: 0
[DEBUG] 00:47:10:845521900: ollama_generate: result: 696 bytes
Soft, quick, curious
[DEBUG] 00:47:16:194530500: ollama_generate: return: 0
```
