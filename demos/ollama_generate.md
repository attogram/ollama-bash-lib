# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.0

## Demo

```bash
ollama_generate "mistral:7b" "Describe a rabbit in 2 short sentences"
```
```
 A rabbit is a small, herbivorous mammal known for its long ears, fluffy tail, and quick agility. It's a common pet and a symbol of productivity due to its continuous chewing motion.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "mistral:7b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [mistral:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [mistral:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 11 bytes [mistral:7b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"mistral:7b","prompt":"Describe a]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 808 bytes
[DEBUG] json_sanitize: 808 bytes [{"model":"mistral:7b","created_at":"2025-0]
[DEBUG] json_sanitize: sanitized: 808 bytes [[{"model":"mistral:7b","created_at":"2025-0]]
 A rabbit is a small mammal with long ears, fluffy tail, and soft fur, known for its quick agility and herbivorous diet. It's a common pet and is often associated with the Easter holiday symbolically.
[DEBUG] ollama_generate: return: 0
```
