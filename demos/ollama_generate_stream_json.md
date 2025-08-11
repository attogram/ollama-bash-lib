# ollama_generate_stream_json
ERROR: Ollama Not Installed
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4
./../ollama_bash_lib.sh: line 607: ollama: command not found
[ERROR] ollama_model_random: No Models Found

## Demo

```bash
ollama_generate_stream_json "" "Describe a rabbit in 3 words"

```
```json
[ERROR] _call_curl: curl error: 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate_stream_json: ollama_generate_json failed
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "" "Describe a rabbit in 3 words"

```
```json
[DEBUG] 20:11:33:738123359: ollama_generate_stream_json: [] [Describe a rabbit in 3 words]
[DEBUG] 20:11:33:742857387: ollama_generate_json: [] [Describe a rabbit in 3 words]
[DEBUG] 20:11:33:748081690: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 20:11:33:758591273: ollama_api_post: [/api/generate] [{"model":"","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 20:11:33:763611397: _call_curl: [POST] [/api/generate] [{"model":"","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 20:11:33:768465313: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 20:11:33:773433903: _call_curl: json_body: [{"model":"","prompt":"Describe a rabbit in 3 words","stream":true}]
[ERROR] _call_curl: curl error: 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate_stream_json: ollama_generate_json failed
```
