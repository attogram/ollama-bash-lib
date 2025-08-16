# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.3

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, timid, swift.

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:50:42:655947400: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
# <thinking>
# [DEBUG] 23:50:42:700600400: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:50:42:728746800: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:50:42:750683400: ollama_generate_json: stream: true
[DEBUG] 23:50:42:772316100: ollama_generate_json: thinking: false
[DEBUG] 23:50:42:811668500: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:50:42:833933900: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:50:42:858935300: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:50:42:908860400: _is_valid_json: success
[DEBUG] 23:50:42:932533100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:50:42:955052000: _call_curl: Turbo Mode
[DEBUG] 23:50:42:985812400: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:50:43:008190100: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:50:44:180377600: ollama_api_post: success
[DEBUG] 23:50:44:201904900: ollama_generate_json: success
Fluffy, timid, speedy.
# </thinking>


[DEBUG] 23:50:44:665092100: ollama_generate_stream: return: 0

```
