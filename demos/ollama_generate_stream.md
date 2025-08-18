# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Soft, swift, curious.

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:56:31:078007900: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
# <thinking>
# [DEBUG] 22:56:31:124895300: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:56:31:156263800: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:56:31:213448500: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:56:31:235627600: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:56:31:265166400: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:56:31:362136100: _is_valid_json: success
[DEBUG] 22:56:31:385666400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:56:31:415529600: _call_curl: Turbo Mode
[DEBUG] 22:56:31:446319900: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:56:31:469854300: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 22:56:32:860587900: ollama_api_post: success
[DEBUG] 22:56:32:883005600: ollama_generate_json: success
Fluffy, swift, curious.
# </thinking>


[DEBUG] 22:56:33:471093100: ollama_generate_stream: return: 0

```
