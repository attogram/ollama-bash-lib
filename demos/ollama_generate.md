# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.44

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Fluffy, playful, gentle.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:55:56:720370300: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:55:56:742330700: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:55:56:759092300: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:55:56:790041500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:55:56:807223800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:55:56:824229300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:56:841862400: _call_curl: Turbo Mode
[DEBUG] 00:55:56:859654900: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:55:57:963061300: ollama_api_post: success: return 0
[DEBUG] 00:55:57:980180500: ollama_generate_json: success: return: 0
[DEBUG] 00:55:58:040327000: ollama_generate: result: 518 bytes
[DEBUG] 00:55:58:072120700: _is_valid_json: VALID: return 0
Gentle, swift, fluffy.
[DEBUG] 00:55:58:110067700: ollama_generate: success: return: 0
```
