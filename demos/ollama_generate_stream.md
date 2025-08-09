# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.39

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
soft, swift, curious
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:16:12:982257800: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:16:12:998957700: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:16:13:009861100: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 22:16:13:033932400: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:16:13:044717400: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:16:13:057459600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:16:13:068466000: _call_curl: Turbo Mode
[DEBUG] 22:16:13:079824700: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:16:14:321791800: ollama_api_post: success: return 0
[DEBUG] 22:16:14:333533000: ollama_generate_json: success: return: 0
Fluffy, timid, herbivorous.[DEBUG] 22:16:14:345732800: ollama_generate_stream: return: 0

```
