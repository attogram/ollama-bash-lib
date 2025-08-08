# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.34

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Soft, fluffy, swift.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 00:51:06:202928300: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:51:06:219715900: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:51:06:231297900: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 00:51:06:256259900: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:51:06:267912500: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:51:06:279367700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:51:06:291594900: _call_curl: Turbo Mode
[DEBUG] 00:51:06:302059600: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:51:07:245877800: ollama_api_post: success: return 0
[DEBUG] 00:51:07:258991900: ollama_generate_json: success: return: 0
Fluffy, timid, hoppy.[DEBUG] 00:51:07:271125600: ollama_generate_stream: return: 0

```
