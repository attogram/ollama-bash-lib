# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.43

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
[DEBUG] 00:18:54:991672800: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:18:55:015720100: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:18:55:036143900: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 00:18:55:065392100: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:18:55:083563100: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:18:55:100524400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:18:55:118988100: _call_curl: Turbo Mode
[DEBUG] 00:18:55:136141300: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:18:56:350056100: ollama_api_post: success: return 0
[DEBUG] 00:18:56:366835000: ollama_generate_json: success: return: 0
soft, curious, playful[DEBUG] 00:18:56:383766400: ollama_generate_stream: return: 0

```
