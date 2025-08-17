# ollama_generate_stream
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4
[ERROR] ollama_model_random: ollama is not installed

## Demo

```bash
ollama_generate_stream "ollama-not-installed" "Describe a rabbit in 3 words"
```
```
# <thinking>
# [ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed

# </thinking>

[ERROR] ollama_generate_stream: ollama_generate_json failed with code 1

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "ollama-not-installed" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 00:19:33:494849572: ollama_generate_stream: [ollama-not-installed] [Describe a rabbit in 3 words]
# <thinking>
# [DEBUG] 00:19:33:501905124: ollama_generate_json: [ollama-not-installed] [Describe a rabbit in 3 words]
[DEBUG] 00:19:33:507943990: _is_valid_model: VALID: [ollama-not-installed]
[DEBUG] 00:19:33:519046978: ollama_generate_json: json_payload: {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:19:33:524048286: ollama_api_post: [/api/generate] {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:19:33:528937867: _call_curl: [POST] [/api/generate] {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:19:33:539917091: _is_valid_json: success
[DEBUG] 00:19:33:544863488: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 00:19:33:550205847: _call_curl: json_body: {"model":"ollama-not-installed","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:19:33:555245961: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed

# </thinking>

[ERROR] ollama_generate_stream: ollama_generate_json failed with code 1

```
