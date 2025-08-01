# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.24

## Demo

```bash
ollama_generate "gemma3n:e4b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small mammal with long ears, a fluffy tail, and powerful hind legs built for hopping. They are known for their gentle nature and love of carrots! 

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "gemma3n:e4b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [gemma3n:e4b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [gemma3n:e4b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 12 bytes [gemma3n:e4b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"gemma3n:e4b","prompt":"Describe ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 856 bytes
[DEBUG] json_sanitize: 856 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 856 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
A rabbit is a small mammal with long ears and a fluffy tail, known for its quick hops and gentle nature. They are herbivores, spending their days nibbling on plants and often live in underground burrows for shelter. 

[DEBUG] ollama_generate: return: 0
```
