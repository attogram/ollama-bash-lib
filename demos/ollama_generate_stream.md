# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.38

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, timid, swift.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 20:22:37:687101100: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 20:22:37:702347600: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 20:22:37:712578300: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 20:22:37:733297300: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 20:22:37:743298900: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 20:22:37:753117100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:22:37:763539600: _call_curl: Turbo Mode
[DEBUG] 20:22:37:773410100: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 20:22:39:205910000: ollama_api_post: success: return 0
[DEBUG] 20:22:39:216491700: ollama_generate_json: success: return: 0
Fluffy, timid, bouncy.[DEBUG] 20:22:39:226954300: ollama_generate_stream: return: 0

```
