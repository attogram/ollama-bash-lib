# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, swift, curious.

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 01:51:56:498982000: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
<thinking>
[DEBUG] 01:51:56:511141000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 01:51:56:518838000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 01:51:56:532739000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
[DEBUG] 01:51:56:539460000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
[DEBUG] 01:51:56:545811000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:51:56:552087000: _call_curl: Turbo Mode
[DEBUG] 01:51:56:558189000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
Fluffy, hopping, gentle.[DEBUG] 01:51:57:652174000: ollama_api_post: success: return 0
[DEBUG] 01:51:57:662800000: ollama_generate_json: success: return: 0


</thinking>

[DEBUG] 01:51:57:672454000: ollama_generate_stream: return: 0

```
