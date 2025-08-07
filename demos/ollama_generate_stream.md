# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.19

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, gentle, swift.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:06:08:168977500: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:06:08:186332600: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:06:08:198601400: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 22:06:08:223400200: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:06:08:235350800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:06:08:247924400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:06:08:259904000: _call_curl: Turbo Mode
[DEBUG] 22:06:08:271092900: _call_curl: adding json body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:06:09:207247300: ollama_api_post: success: return 0
[DEBUG] 22:06:09:218511300: ollama_generate_json: success: return: 0
soft, swift, adorable[DEBUG] 22:06:10:348252400: ollama_generate_stream: return: 0

```
