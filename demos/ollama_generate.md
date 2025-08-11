# ollama_generate
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
ollama_generate "" "Describe a rabbit in 3 words"
```
```
[ERROR] _call_curl: curl error: 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate: error_ollama_generate_json: 1
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "" "Describe a rabbit in 3 words"
```
```
[DEBUG] 20:11:33:350598562: ollama_generate: [] [Describe a rabbit in 3 words]
[DEBUG] 20:11:33:356122161: ollama_generate_json: [] [Describe a rabbit in 3 words]
[DEBUG] 20:11:33:361311462: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 20:11:33:371620693: ollama_api_post: [/api/generate] [{"model":"","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:11:33:376424271: _call_curl: [POST] [/api/generate] [{"model":"","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:11:33:381346042: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 20:11:33:386306975: _call_curl: json_body: [{"model":"","prompt":"Describe a rabbit in 3 words","stream":false}]
[ERROR] _call_curl: curl error: 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[DEBUG] 20:11:33:411494113: ollama_generate: result: 1 bytes
[ERROR] ollama_generate: error_ollama_generate_json: 1
```
