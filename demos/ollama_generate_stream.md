# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.5

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, gentle, agile

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 13:29:26:401182800: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
# <thinking>
# [DEBUG] 13:29:26:447068700: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 13:29:26:474124400: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 13:29:26:509130300: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 13:29:26:530649300: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 13:29:26:552726300: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 13:29:26:597649300: _is_valid_json: success
[DEBUG] 13:29:26:620006700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:29:26:641678500: _call_curl: Turbo Mode
[DEBUG] 13:29:26:663976800: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 13:29:26:686133800: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 13:29:27:629722900: ollama_api_post: success
[DEBUG] 13:29:27:655966500: ollama_generate_json: success
Soft, twitching, swift.

# </thinking>

[DEBUG] 13:29:28:323651200: ollama_generate_stream: return: 0

```
