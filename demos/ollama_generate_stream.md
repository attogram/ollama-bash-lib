# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.2

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Playful, fluffy, swift.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:16:09:832500900: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:16:09:859669600: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:16:09:881622400: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 22:16:09:915820300: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:16:09:938905900: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:16:09:970835800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:16:10:002481800: _call_curl: Turbo Mode
[DEBUG] 22:16:10:025191100: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:16:11:195485100: ollama_api_post: success: return 0
[DEBUG] 22:16:11:224714400: ollama_generate_json: success: return: 0
Fluffy, swift, curious.[DEBUG] 22:16:11:258741700: ollama_generate_stream: return: 0

```
