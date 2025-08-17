# ollama_generate_json
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

## Setup

OLLAMA_HOST:
OLLAMA_LIB_API: http://localhost:11434

[ERROR] ollama_model_random: ollama is not installed

## Demo

```bash
ollama_generate_json "ollama-not-installed" "Describe a rabbit in 3 words"
```
```json
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "ollama-not-installed" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:19:33:348578943: ollama_generate_json: [ollama-not-installed] [Describe a rabbit in 3 words]
[DEBUG] 00:19:33:354074336: _is_valid_model: VALID: [ollama-not-installed]
[DEBUG] 00:19:33:364537911: ollama_generate_json: json_payload: {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:19:33:369385721: ollama_api_post: [/api/generate] {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:19:33:374393519: _call_curl: [POST] [/api/generate] {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:19:33:384640604: _is_valid_json: success
[DEBUG] 00:19:33:389768660: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 00:19:33:395190636: _call_curl: json_body: {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:19:33:400103640: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed

```
