# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.5

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, swift, curious.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:38:25:179413000: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:38:25:192298000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:38:25:203268000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 22:38:25:221740000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:38:25:230474000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:38:25:238293000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:38:25:245277000: _call_curl: Turbo Mode
[DEBUG] 22:38:25:252151000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:38:27:064641000: ollama_api_post: success: return 0
[DEBUG] 22:38:27:077180000: ollama_generate_json: success: return: 0
fluffy quick curious[DEBUG] 22:38:27:090972000: ollama_generate_stream: return: 0

```
