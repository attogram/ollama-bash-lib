# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, agile, curious

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:09:35:968639700: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
# <thinking>
# [DEBUG] 23:09:36:015127900: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:09:36:045082400: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:09:36:104637200: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:09:36:131866200: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:09:36:168519800: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:09:36:230304100: _is_valid_json: success
[DEBUG] 23:09:36:253650900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:09:36:277171100: _call_curl: Turbo Mode
[DEBUG] 23:09:36:304633500: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:09:36:330105900: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:09:37:621426500: ollama_api_post: success
[DEBUG] 23:09:37:655272800: ollama_generate_json: success
fluffy, quick, curious

# </thinking>

[DEBUG] 23:09:39:700291600: ollama_generate_stream: return: 0

```
