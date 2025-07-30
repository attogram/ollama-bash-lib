# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0

## Demo

```bash
ollama_generate "qwen2.5vl:3b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, furry mammal with long ears and a long tail. It has a round body and a long, slender neck.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "qwen2.5vl:3b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [qwen2.5vl:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen2.5vl:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 13 bytes [qwen2.5vl:3b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen2.5vl:3b","prompt":"Describe]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 654 bytes
[DEBUG] json_sanitize: 654 bytes [{"model":"qwen2.5vl:3b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 654 bytes [[{"model":"qwen2.5vl:3b","created_at":"2025]]
A rabbit is a small, furry mammal with long ears and a long tail. It has a round body and a long, slender neck.
[DEBUG] ollama_generate: return: 0
```
