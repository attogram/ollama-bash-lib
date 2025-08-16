# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Soft, hopping, timid.

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 00:18:02:929849500: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
# <thinking>
# [DEBUG] 00:18:02:991007100: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:18:03:019732300: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 00:18:03:054811800: ollama_generate_json: stream: true
[DEBUG] 00:18:03:089417500: ollama_generate_json: thinking: false
[DEBUG] 00:18:03:124930300: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:18:03:146646200: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:18:03:183835900: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:18:03:227944900: _is_valid_json: success
[DEBUG] 00:18:03:256192200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:18:03:283154200: _call_curl: Turbo Mode
[DEBUG] 00:18:03:310228300: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 00:18:03:334200600: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 00:18:04:249191700: ollama_api_post: success
[DEBUG] 00:18:04:275240200: ollama_generate_json: success
Fluffy, timid, swift.
# </thinking>


[DEBUG] 00:18:04:979919000: ollama_generate_stream: return: 0

```
