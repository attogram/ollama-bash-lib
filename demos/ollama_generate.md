# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.7

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
soft, agile, curious
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 23:21:39:564611000: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:21:39:570861000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:21:39:575364000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:21:39:586457000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:21:39:594921000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:21:39:602119000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:21:39:610180000: _call_curl: Turbo Mode
[DEBUG] 23:21:39:617446000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:21:40:721307000: ollama_api_post: success: return 0
[DEBUG] 23:21:40:734136000: ollama_generate_json: success: return: 0
[DEBUG] 23:21:40:755052000: ollama_generate: result: 525 bytes
[DEBUG] 23:21:40:774561000: _is_valid_json: VALID: return 0
soft, swift, playful
[DEBUG] 23:21:40:792110000: ollama_generate: success: return: 0
```
