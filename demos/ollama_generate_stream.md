# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, swift, timid.

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 00:55:06:095106000: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
<thinking>
[DEBUG] 00:55:06:108005000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:55:06:117786000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 00:55:06:134761000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
[DEBUG] 00:55:06:143269000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
[DEBUG] 00:55:06:151443000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:06:159232000: _call_curl: Turbo Mode
[DEBUG] 00:55:06:165796000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
Fluffy, swift, curious.[DEBUG] 00:55:07:420958000: ollama_api_post: success: return 0
[DEBUG] 00:55:07:428850000: ollama_generate_json: success: return: 0


</thinking>

[DEBUG] 00:55:07:438440000: ollama_generate_stream: return: 0

```
