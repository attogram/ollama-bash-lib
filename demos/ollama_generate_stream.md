# ollama_generate_stream
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.27

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
[DEBUG] 22:40:35:386709100: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:40:35:403431700: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:40:35:417087000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 22:40:35:441037500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:40:35:451902200: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:40:35:462648900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:40:35:474240300: _call_curl: Turbo Mode
[DEBUG] 22:40:35:484231100: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:40:36:476089900: ollama_api_post: success: return 0
[DEBUG] 22:40:36:487787200: ollama_generate_json: success: return: 0
Fluffy, swift, curious.[DEBUG] 22:40:36:499134600: ollama_generate_stream: return: 0

```
