# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.10

## Demo

```bash
ollama_generate "granite3.3:8b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, long-eared mammal known for its powerful hind limbs and quick jumping abilities. They are often found in burrows and are herbivores, primarily consuming various types of vegetation.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "granite3.3:8b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [granite3.3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [granite3.3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 14 bytes [granite3.3:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"granite3.3:8b","prompt":"Describ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 1128 bytes
[DEBUG] json_sanitize: 1128 bytes [{"model":"granite3.3:8b","created_at":"202]
[DEBUG] json_sanitize: sanitized: 1128 bytes [[{"model":"granite3.3:8b","created_at":"202]]
A rabbit is a small, soft-furred mammal known for its long ears and powerful hind legs, which enable quick burrowing and rapid hopping. They are often found in various habitats across the globe and are herbivorous, primarily feeding on grasses, dandelions, and other plant materials.
[DEBUG] ollama_generate: return: 0
```
