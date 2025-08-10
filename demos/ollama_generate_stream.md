# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.46

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, timid, hopping.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 16:24:50:403455400: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 16:24:50:429483400: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 16:24:50:461610300: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 16:24:50:504752500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 16:24:50:527903800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 16:24:50:548980700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 16:24:50:571825800: _call_curl: Turbo Mode
[DEBUG] 16:24:50:592463600: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 16:24:51:637462500: ollama_api_post: success: return 0
[DEBUG] 16:24:51:660725200: ollama_generate_json: success: return: 0
Fluffy, timid, hopping.[DEBUG] 16:24:51:683587400: ollama_generate_stream: return: 0

```
