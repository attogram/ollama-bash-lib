# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, timid, curious.

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:38:21:640989000: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:38:21:650167000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:38:21:657456000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:38:21:671609000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
[DEBUG] 23:38:21:678133000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
[DEBUG] 23:38:21:685928000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:38:21:692523000: _call_curl: Turbo Mode
[DEBUG] 23:38:21:700883000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
[DEBUG] 23:38:22:676367000: ollama_api_post: success: return 0
[DEBUG] 23:38:22:683339000: ollama_generate_json: success: return: 0
Swift, fluffy, curious.
[DEBUG] 23:38:22:745509000: ollama_generate_stream: return: 0

```
