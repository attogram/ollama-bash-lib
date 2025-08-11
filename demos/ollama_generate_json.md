# ollama_generate_json
ERROR: Ollama Not Installed
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4

## Setup

OLLAMA_HOST:
OLLAMA_LIB_API: http://localhost:11434

./../ollama_bash_lib.sh: line 607: ollama: command not found
[ERROR] ollama_model_random: No Models Found

## Demo

```bash
ollama_generate_json "" "Describe a rabbit in 3 words"
```
```json
[ERROR] _call_curl: curl error: 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 20:11:33:489540461: ollama_generate_json: [] [Describe a rabbit in 3 words]
[DEBUG] 20:11:33:494533881: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 20:11:33:505099481: ollama_api_post: [/api/generate] [{"model":"","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:11:33:509904066: _call_curl: [POST] [/api/generate] [{"model":"","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:11:33:514699087: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 20:11:33:519727932: _call_curl: json_body: [{"model":"","prompt":"Describe a rabbit in 3 words","stream":false}]
[ERROR] _call_curl: curl error: 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed

```
