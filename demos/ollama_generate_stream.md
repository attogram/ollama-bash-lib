# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.44

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Soft, swift, curious.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 00:56:03:737389200: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:56:03:759352600: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:56:03:776283000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 00:56:03:805545400: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:56:03:823053800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:56:03:841113800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:56:03:857977100: _call_curl: Turbo Mode
[DEBUG] 00:56:03:876197600: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:56:05:023483800: ollama_api_post: success: return 0
[DEBUG] 00:56:05:041882300: ollama_generate_json: success: return: 0
Playful, fluffy, swift.[DEBUG] 00:56:05:085933400: ollama_generate_stream: return: 0

```
