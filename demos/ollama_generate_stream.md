# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.41

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Soft, speedy, whiskered.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:12:05:162620400: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:12:05:184856400: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:12:05:202074000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:12:05:232488500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:12:05:249650600: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:12:05:266295400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:12:05:284289000: _call_curl: Turbo Mode
[DEBUG] 23:12:05:301593800: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:12:06:503842000: ollama_api_post: success: return 0
[DEBUG] 23:12:06:521749400: ollama_generate_json: success: return: 0
Soft, fluffy, timid.[DEBUG] 23:12:06:549202300: ollama_generate_stream: return: 0

```
