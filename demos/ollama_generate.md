# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.20

## Demo

```bash
ollama_generate "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, furry animal with long ears and a short tail, often associated with agility and quick movements.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [qwen2.5vl:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen2.5vl:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "qwen2.5vl:7b",
  "prompt": "]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 640 bytes
[DEBUG] json_sanitize: 640 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 640 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
A rabbit is a small, furry animal with long ears and a short tail, often associated with agility and quick movements.
[DEBUG] ollama_generate: return: 0
```
