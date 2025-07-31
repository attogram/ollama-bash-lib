# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.21

## Demo

```bash
ollama_generate "cogito:3b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, furry mammal with long ears and a powerful hind leg that enables it to hop rapidly across the ground. Its gentle expression and soft coat give it an endearing appearance, often seen hopping through meadows or gardens in nature.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "cogito:3b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [cogito:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [cogito:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 10 bytes [cogito:3b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"cogito:3b","prompt":"Describe a ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 750 bytes
[DEBUG] json_sanitize: 750 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 750 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
A rabbit has soft, fluffy fur and large ears that help it hear predators coming from far away. Its long tail helps maintain balance while hopping on sturdy back legs through grasslands and forests.
[DEBUG] ollama_generate: return: 0
```
