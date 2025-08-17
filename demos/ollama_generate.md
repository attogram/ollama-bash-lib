# ollama_generate
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
ollama_generate "ollama-not-installed" "Describe a rabbit in 3 words"
```
```
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate: error_ollama_generate_json: 1
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "ollama-not-installed" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:19:33:189819411: ollama_generate: [ollama-not-installed] [Describe a rabbit in 3 words]
[DEBUG] 00:19:33:195292213: ollama_generate_json: [ollama-not-installed] [Describe a rabbit in 3 words]
[DEBUG] 00:19:33:201352791: _is_valid_model: VALID: [ollama-not-installed]
[DEBUG] 00:19:33:213086125: ollama_generate_json: json_payload: {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:19:33:218230953: ollama_api_post: [/api/generate] {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:19:33:222932514: _call_curl: [POST] [/api/generate] {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:19:33:233694190: _is_valid_json: success
[DEBUG] 00:19:33:238524790: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 00:19:33:243623476: _call_curl: json_body: {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:19:33:248543220: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[DEBUG] 00:19:33:273925500: ollama_generate: result: 1 bytes:
[ERROR] ollama_generate: error_ollama_generate_json: 1
```
