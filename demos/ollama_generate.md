# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.23

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, quick, fluffy
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:55:08:277397400: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:55:08:294210400: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:55:08:305672500: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:55:08:332190600: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:55:08:343924600: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:55:08:354771900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:08:365390400: _call_curl: Turbo Mode
[DEBUG] 00:55:08:376023600: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:55:08:387471300: _call_curl: curl_args: -s -N -H Content-Type: application/json -H Authorization: Bearer 06ab07b80cdb4f2db7fe63336646c86f.O8ntAssNC-QUWdXK3urz4UDZ -X POST https://ollama.com/api/generate -d @-
[DEBUG] 00:55:09:346783800: ollama_api_post: success: return 0
[DEBUG] 00:55:09:357754200: ollama_generate_json: success: return: 0
[DEBUG] 00:55:09:393225600: ollama_generate: result: 445 bytes
fluffy, curious, gentle
[DEBUG] 00:55:09:436189900: ollama_generate: return: 0
```
