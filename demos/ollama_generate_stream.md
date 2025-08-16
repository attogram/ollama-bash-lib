# ollama_generate_stream
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, swift, curious.

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:35:17:166296800: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
# <thinking>
# [DEBUG] 23:35:17:211297600: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:35:17:237469900: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:35:17:279257000: ollama_generate_json: stream: true
[DEBUG] 23:35:17:301234400: ollama_generate_json: thinking: false
[DEBUG] 23:35:17:336416200: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:35:17:359639900: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:35:17:382135100: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:35:17:421519200: _is_valid_json: success
[DEBUG] 23:35:17:444556900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:35:17:467658000: _call_curl: Turbo Mode
[DEBUG] 23:35:17:489509400: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:35:17:514133000: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:35:19:455761300: ollama_api_post: success
[DEBUG] 23:35:19:477817200: ollama_generate_json: success
Soft, swift, curious

# </thinking>

[DEBUG] 23:35:23:678657800: ollama_generate_stream: return: 0

```
