# ollama_generate_stream_json
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4
[ERROR] ollama_model_random: ollama is not installed

## Demo

```bash
ollama_generate_stream_json "ollama-not-installed" "Describe a rabbit in 3 words"

```
```json
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate_stream_json: ollama_generate_json failed
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "ollama-not-installed" "Describe a rabbit in 3 words"

```
```json
[DEBUG] 00:19:33:647121203: ollama_generate_stream_json: [ollama-not-installed] [Describe a rabbit in 3 words]
[DEBUG] 00:19:33:651842709: ollama_generate_json: [ollama-not-installed] [Describe a rabbit in 3 words]
[DEBUG] 00:19:33:657213132: _is_valid_model: VALID: [ollama-not-installed]
[DEBUG] 00:19:33:667661798: ollama_generate_json: json_payload: {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:19:33:672513528: ollama_api_post: [/api/generate] {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:19:33:677535711: _call_curl: [POST] [/api/generate] {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:19:33:688540840: _is_valid_json: success
[DEBUG] 00:19:33:693662074: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 00:19:33:699027913: _call_curl: json_body: {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:19:33:704227450: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate_stream_json: ollama_generate_json failed
```
