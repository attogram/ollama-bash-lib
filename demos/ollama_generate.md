# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.5

## Demo

```bash
ollama_generate "granite3.3:2b" "Describe a rabbit in 2 short sentences"
```
```
Rabbits are small mammals known for their fluffy tails and long ears, often symbolizing grace and gentleness. They are herbivores, primarily feeding on grasses and leafy vegetables, with a unique digestive process that allows them to live almost exclusively on plant matter.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "granite3.3:2b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [granite3.3:2b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [granite3.3:2b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 14 bytes [granite3.3:2b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"granite3.3:2b","prompt":"Describ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 1104 bytes
[DEBUG] jq_sanitize: 1104 bytes [{"model":"granite3.3:2b","created_at":"202]
[DEBUG] jq_sanitize: sanitized: 1104 bytes [[{"model":"granite3.3:2b","created_at":"202]]
1. A rabbit is a small, fluffy mammal known for its long ears and powerful hind legs, capable of rapid hopping. 2. They are herbivores, primarily grazing on grass and plant materials, and are often recognized by their twitching noses, used to detect food or danger.
[DEBUG] ollama_generate_stream_json: return: 0
```
