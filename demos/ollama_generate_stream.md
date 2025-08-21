# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.8

## Demo

```bash
ollama_generate_stream -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"
```
```
Fluffy,swift,curious.

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 11:36:31:730206000: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
# <thinking>
# [DEBUG] 11:36:31:745916000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 11:36:31:760431000: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:36:31:773025000: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:36:31:779906000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:36:31:793096000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 11:36:31:799319000: _call_curl: Turbo Mode
[DEBUG] 11:36:31:805500000: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:36:31:811520000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 11:36:32:627738000: ollama_api_post: success
[DEBUG] 11:36:32:636711000: ollama_generate_json: success
Fluffy,swift,curious.

# </thinking>

[DEBUG] 11:36:32:901306000: ollama_generate_stream: success

```
