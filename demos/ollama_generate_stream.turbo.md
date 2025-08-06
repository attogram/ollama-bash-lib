# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.14

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, quick, timid.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 00:48:09:336144300: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:48:09:353929100: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:48:09:365054000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 00:48:09:392451900: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:48:09:405278500: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:48:09:417564700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:48:09:428763000: _call_curl: Turbo Mode
[DEBUG] 00:48:09:440643600: _call_curl: adding json body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:48:10:572085900: ollama_api_post: success: return 0
[DEBUG] 00:48:10:585073000: ollama_generate_json: success: return: 0
Fluffy, timid, hopping.[DEBUG] 00:48:57:974722200: ollama_generate_stream: return: 0

```
