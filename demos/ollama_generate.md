# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.24

## Demo

```bash
ollama_generate "dolphin3:8b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small mammal with long ears and a fluffy tail. Rabbits are known for their quick reproduction rate and are popular pets due to their docile nature.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "dolphin3:8b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 12 bytes [dolphin3:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"dolphin3:8b","prompt":"Describe ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 723 bytes
[DEBUG] json_sanitize: 723 bytes [{"model":"dolphin3:8b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 723 bytes [[{"model":"dolphin3:8b","created_at":"2025-]]
A rabbit is a small mammal known for its long ears and fluffy white tail. It hops around using its strong back legs and has a soft fur coat.
[DEBUG] ollama_generate: return: 0
```
