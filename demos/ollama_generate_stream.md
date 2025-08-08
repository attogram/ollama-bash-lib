# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.32

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Soft, timid, fluffy.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:34:09:329874800: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:34:09:346790800: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:34:09:358362300: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:34:09:381074000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:34:09:392453400: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:34:09:403231200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:34:09:414273900: _call_curl: Turbo Mode
[DEBUG] 23:34:09:425794800: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:34:10:339659800: ollama_api_post: success: return 0
[DEBUG] 23:34:10:351124200: ollama_generate_json: success: return: 0
Fluffy, timid, hopping.[DEBUG] 23:34:10:363395300: ollama_generate_stream: return: 0

```
