# ollama_generate_stream
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.26

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Playful, fluffy, hopping.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:26:26:126849700: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:26:26:144850000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:26:26:159369200: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 22:26:26:184695700: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:26:26:203310100: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:26:26:215862200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:26:26:226630500: _call_curl: Turbo Mode
[DEBUG] 22:26:26:238897400: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 22:26:27:116309400: ollama_api_post: success: return 0
[DEBUG] 22:26:27:126735700: ollama_generate_json: success: return: 0
Soft, quick, playful.[DEBUG] 22:26:27:138834800: ollama_generate_stream: return: 0

```
