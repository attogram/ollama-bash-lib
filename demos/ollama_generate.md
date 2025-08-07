# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.24

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, swift, curious.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:59:19:702437400: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:59:19:717820400: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:59:19:728755100: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:59:19:752295500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:59:19:763346400: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:59:19:774198100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:59:19:784261000: _call_curl: Turbo Mode
[DEBUG] 00:59:19:795061600: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:59:20:973867100: ollama_api_post: success: return 0
[DEBUG] 00:59:20:985254400: ollama_generate_json: success: return: 0
[DEBUG] 00:59:21:037865500: ollama_generate: result: 721 bytes
fluffy, quick, hopping
[DEBUG] 00:59:21:066104400: ollama_generate: return: 0
```
