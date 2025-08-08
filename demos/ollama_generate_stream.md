# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.30

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, timid, hoppy.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:07:31:523298600: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:07:31:539087600: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:07:31:549838900: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:07:31:573018100: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:07:31:584319700: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:07:31:594567900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:07:31:606384700: _call_curl: Turbo Mode
[DEBUG] 23:07:31:617506600: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 23:07:32:655748800: ollama_api_post: success: return 0
[DEBUG] 23:07:32:666336300: ollama_generate_json: success: return: 0
Fluffy, timid, hopping.[DEBUG] 23:07:32:677691400: ollama_generate_stream: return: 0

```
