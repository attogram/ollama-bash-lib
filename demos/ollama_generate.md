# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, swift, curious.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 01:51:50:647860000: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 01:51:50:656840000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 01:51:50:663996000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 01:51:50:677644000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:51:50:683980000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:51:50:690271000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:51:50:696421000: _call_curl: Turbo Mode
[DEBUG] 01:51:50:702311000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:51:51:949748000: ollama_api_post: success: return 0
[DEBUG] 01:51:51:960994000: ollama_generate_json: success: return: 0
[DEBUG] 01:51:51:978257000: ollama_generate: result: 428 bytes
[DEBUG] 01:51:51:993559000: _is_valid_json: VALID: return 0
Soft, hoppy, gentle
[DEBUG] 01:51:52:007867000: ollama_generate: success: return: 0
```
