# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.40

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
fluffy, quick, curious
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 23:02:09:594318000: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:02:09:611718900: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:02:09:622823900: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:02:09:644844400: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:02:09:656056800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:02:09:667456300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:02:09:678773500: _call_curl: Turbo Mode
[DEBUG] 23:02:09:689072300: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:02:10:631192800: ollama_api_post: success: return 0
[DEBUG] 23:02:10:644964600: ollama_generate_json: success: return: 0
[DEBUG] 23:02:10:692816400: ollama_generate: result: 374 bytes
[DEBUG] 23:02:10:724418700: _is_valid_json: VALID: return 0
Soft, swift, curious.
[DEBUG] 23:02:10:756393900: ollama_generate: success: return: 0
```
