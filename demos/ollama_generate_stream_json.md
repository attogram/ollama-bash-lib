# ollama_generate_stream_json
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.9

## Demo

```bash
ollama_generate_stream_json "gpt-oss:120b" "Describe a rabbit in 3 words"

```
```json
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "gpt-oss:120b" "Describe a rabbit in 3 words"

```
```json
[DEBUG] 23:27:22:856634000: ollama_generate_stream_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:27:22:867080800: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:27:22:878779000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 23:27:22:901290300: ollama_api_post: [ollama.com/api/generate] [{
  "model": "gpt-oss:120b",
  "prompt": "]
[DEBUG] 23:27:23:232148500: ollama_api_post: return 0
[DEBUG] 23:27:23:243397600: ollama_generate_json: return: 0
[DEBUG] 23:27:23:254206800: ollama_generate_stream_json: return: 0
```
