# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.7

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Soft, whiskered, boundless.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:21:46:637577000: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:21:46:648500000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:21:46:658296000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:21:46:675283000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:21:46:683421000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:21:46:690895000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:21:46:698645000: _call_curl: Turbo Mode
[DEBUG] 23:21:46:705751000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:21:47:945664000: ollama_api_post: success: return 0
[DEBUG] 23:21:47:956579000: ollama_generate_json: success: return: 0
soft, hoppy, timid[DEBUG] 23:21:47:967791000: ollama_generate_stream: return: 0

```
