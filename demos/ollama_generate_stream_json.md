# ollama_generate_stream_json
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo

```bash
ollama_generate_stream_json "gpt-oss:20b" "Describe a rabbit in 3 words"

```
```json
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "gpt-oss:20b" "Describe a rabbit in 3 words"

```
```json
[DEBUG] 23:18:46:978446300: ollama_generate_stream_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:18:46:992910300: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:18:47:003288300: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:18:47:026837600: ollama_api_post: [/api/generate] [{
  "model": "gpt-oss:20b",
  "prompt": "D]
[DEBUG] 23:18:47:252566600: ollama_api_post: return 0
[DEBUG] 23:18:47:263091300: ollama_generate_json: return: 0
[DEBUG] 23:18:47:273439800: ollama_generate_stream_json: return: 0
```
