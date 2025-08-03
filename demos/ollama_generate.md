# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.21

## Demo

```bash
ollama_generate "granite3.3:8b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, long-eared mammal known for its powerful hind limbs and distinctive breeding habits. They are often found in burrows or warrens and primarily herbivorous, feeding on grasses, dandelions, and various vegetables.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "granite3.3:8b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [granite3.3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [granite3.3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "granite3.3:8b",
  "prompt": ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 924 bytes
[DEBUG] json_sanitize: 924 bytes [{"model":"granite3.3:8b","created_at":"202]
[DEBUG] json_sanitize: sanitized: 924 bytes [[{"model":"granite3.3:8b","created_at":"202]]
A rabbit is a small, long-eared mammal known for its powerful hind limbs and quick burrowing abilities. They are herbivores, primarily consuming various grasses, forbs, and leafy greens.
[DEBUG] ollama_generate: return: 0
```
