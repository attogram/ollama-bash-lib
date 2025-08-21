# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.9

## Demo

```bash
ollama_generate_stream -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```
Fluffy,curious,swift.

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 11:55:13:950204000: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
#### <thinking>
#### [DEBUG] 11:55:13:964942000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 11:55:13:978980000: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:55:13:991456000: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:55:13:998040000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:55:14:012915000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 11:55:14:019555000: _call_curl: Turbo Mode
[DEBUG] 11:55:14:025627000: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:55:14:031356000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 11:55:15:026839000: ollama_api_post: success
[DEBUG] 11:55:15:038148000: ollama_generate_json: success
Soft,nimble,playful.

#### </thinking>

[DEBUG] 11:55:15:959000000: ollama_generate_stream: success

```
