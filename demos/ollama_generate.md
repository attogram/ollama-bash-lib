# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.6

## Demo

```bash
ollama_generate "dolphin3:8b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small mammal with long ears and a fluffy tail. It is known for its ability to hop quickly and for its role in spreading grass seeds through its diet of grass.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "dolphin3:8b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 12 bytes [dolphin3:8b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"dolphin3:8b","prompt":"Describe ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 715 bytes
[DEBUG] jq_sanitize: 715 bytes [{"model":"dolphin3:8b","created_at":"2025-]
[DEBUG] jq_sanitize: sanitized: 715 bytes [[{"model":"dolphin3:8b","created_at":"2025-]]
A rabbit is a small mammal with long ears and a fluffy white coat. It has strong hind legs that allow it to hop quickly through its habitat.
[DEBUG] ollama_generate: return: 0
```
