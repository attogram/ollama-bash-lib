# ollama_generate_stream
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.1

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
fluffy, curious, swift

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:34:03:852927600: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
# <thinking>
# [DEBUG] 22:34:03:889916900: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:34:03:917190200: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:34:03:940315000: ollama_generate_json: stream: true
[DEBUG] 22:34:03:960838800: ollama_generate_json: thinking: false
[DEBUG] 22:34:03:995395400: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:34:04:019110700: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:34:04:040954300: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:34:04:084963800: _is_valid_json: VALID: return 0
[DEBUG] 22:34:04:116995000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:34:04:140884400: _call_curl: Turbo Mode
[DEBUG] 22:34:04:164835500: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:34:04:188269400: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 22:34:05:182639800: ollama_api_post: success
[DEBUG] 22:34:05:204387500: ollama_generate_json: success
Fluffy, timid, hoppy.

# </thinking>

[DEBUG] 22:34:05:735369300: ollama_generate_stream: return: 0

```
