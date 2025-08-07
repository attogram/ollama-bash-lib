# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.23

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, hopping, timid.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 00:55:14:037027900: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:55:14:054208900: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:55:14:065804700: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 00:55:14:090189200: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:55:14:101577200: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:55:14:113824200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:14:125342000: _call_curl: Turbo Mode
[DEBUG] 00:55:14:137281300: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 00:55:14:148584200: _call_curl: curl_args: -s -N -H Content-Type: application/json -H Authorization: Bearer 06ab07b80cdb4f2db7fe63336646c86f.O8ntAssNC-QUWdXK3urz4UDZ -X POST https://ollama.com/api/generate -d @-
[DEBUG] 00:55:15:184447500: ollama_api_post: success: return 0
[DEBUG] 00:55:15:198016900: ollama_generate_json: success: return: 0
Soft, fluffy, agile.[DEBUG] 00:55:15:211599000: ollama_generate_stream: return: 0

```
