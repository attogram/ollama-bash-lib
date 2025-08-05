# ollama_generate_stream
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

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
[DEBUG] 23:18:45:569134600: ollama_generate_stream: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:18:45:585770700: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:18:45:596024700: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:18:45:618243400: ollama_api_post: [/api/generate] [{
  "model": "gpt-oss:120b",
  "prompt": "]
[DEBUG] 23:18:45:719651700: ollama_api_post: return 0
[DEBUG] 23:18:45:730178700: ollama_generate_json: return: 0
[DEBUG] 23:18:45:741939200: ollama_generate_stream: return: 0

```
