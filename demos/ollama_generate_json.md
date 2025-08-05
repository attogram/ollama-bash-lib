# ollama_generate_json
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo

```bash
ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:18:44:699215500: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:18:44:711467700: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:18:44:734269600: ollama_api_post: [/api/generate] [{
  "model": "gpt-oss:120b",
  "prompt": "]
[DEBUG] 23:18:44:834487100: ollama_api_post: return 0
[DEBUG] 23:18:44:845701500: ollama_generate_json: return: 0

```
