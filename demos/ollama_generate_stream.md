# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.6

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, swift, curious
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:55:17:493264000: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:55:17:502876000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:55:17:511584000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 22:55:17:527229000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:55:17:533944000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:55:17:539393000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:55:17:546447000: _call_curl: Turbo Mode
[DEBUG] 22:55:17:552484000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:55:18:697573000: ollama_api_post: success: return 0
[DEBUG] 22:55:18:711324000: ollama_generate_json: success: return: 0
Soft | Quick | Playful[DEBUG] 22:55:18:722227000: ollama_generate_stream: return: 0

```
