# ollama_generate_stream
ERROR: Ollama Not Installed
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4
./../ollama_bash_lib.sh: line 607: ollama: command not found
[ERROR] ollama_model_random: No Models Found

## Demo

```bash
ollama_generate_stream "" "Describe a rabbit in 3 words"
```
```
[ERROR] _call_curl: curl error: 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate_stream: error_ollama_generate_json: 1

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 20:11:33:601338791: ollama_generate_stream: [] [Describe a rabbit in 3 words]
[DEBUG] 20:11:33:606622922: ollama_generate_json: [] [Describe a rabbit in 3 words]
[DEBUG] 20:11:33:611483381: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 20:11:33:622032007: ollama_api_post: [/api/generate] [{"model":"","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 20:11:33:627174174: _call_curl: [POST] [/api/generate] [{"model":"","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 20:11:33:632192434: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 20:11:33:637504037: _call_curl: json_body: [{"model":"","prompt":"Describe a rabbit in 3 words","stream":true}]
[ERROR] _call_curl: curl error: 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate_stream: error_ollama_generate_json: 1

```
