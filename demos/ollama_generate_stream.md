# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.8

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```











































































































































Gent
le
,
 quick
,
 curious



```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:23:29:963768000: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:23:29:982893000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:23:29:993143000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:23:30:011457000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
[DEBUG] 23:23:30:019315000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]
[DEBUG] 23:23:30:043103000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:23:30:051940000: _call_curl: Turbo Mode
[DEBUG] 23:23:30:056957000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"verbose":false}]





















































































































































soft
 agile
 adorable


[DEBUG] 23:23:31:312064000: ollama_api_post: success: return 0
[DEBUG] 23:23:31:324187000: ollama_generate_json: success: return: 0
[DEBUG] 23:23:31:336108000: ollama_generate_stream: return: 0

```
