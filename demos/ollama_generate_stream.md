# ollama_generate_stream
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.9

## Demo

```bash
ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:120b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:27:20:937775500: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:27:20:953632700: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:27:20:966534600: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:27:20:988706700: ollama_api_post: [ollama.com/api/generate] [{
  "model": "gpt-oss:120b",
  "prompt": "]
[DEBUG] 23:27:21:225195400: ollama_api_post: return 0
[DEBUG] 23:27:21:236498000: ollama_generate_json: return: 0
[DEBUG] 23:27:21:248119800: ollama_generate_stream: return: 0

```
