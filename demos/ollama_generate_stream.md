# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Soft, curious, thump.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 00:37:52:333433300: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:37:52:368550100: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:37:52:390831900: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 00:37:52:438324200: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:37:52:474330600: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:37:52:505662500: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:37:52:528143700: _call_curl: Turbo Mode
[DEBUG] 00:37:52:566147500: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:37:53:440208200: ollama_api_post: success: return 0
[DEBUG] 00:37:53:466065600: ollama_generate_json: success: return: 0
Fluffy, swift, timid.[DEBUG] 00:37:53:493422600: ollama_generate_stream: return: 0

```
