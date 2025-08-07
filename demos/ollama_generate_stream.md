# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.20

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Fluffy, quick, playful.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 00:09:32:502237200: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:09:32:521551300: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:09:32:533804200: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 00:09:32:560088700: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:09:32:574487300: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:09:32:587463500: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:09:32:601401100: _call_curl: Turbo Mode
[DEBUG] 00:09:32:613935600: _call_curl: adding json body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:09:33:845131200: ollama_api_post: success: return 0
[DEBUG] 00:09:33:857410600: ollama_generate_json: success: return: 0
Soft, Curious, Agile[DEBUG] 00:09:37:529370500: ollama_generate_stream: return: 0

```
