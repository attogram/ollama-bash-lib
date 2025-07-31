# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.12

## Demo

```bash
ollama_generate "minicpm-v:8b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is small mammal with long ears and fur that ranges from white to brown, grey or black. They are known for their keen senses of sight, hearing, smell and taste, making them good hunters but also easy prey when threatened by predators such as foxes and eagles.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "minicpm-v:8b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [minicpm-v:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [minicpm-v:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 13 bytes [minicpm-v:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"minicpm-v:8b","prompt":"Describe]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 748 bytes
[DEBUG] json_sanitize: 748 bytes [{"model":"minicpm-v:8b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 748 bytes [[{"model":"minicpm-v:8b","created_at":"2025]]
A rabbit is an adorable, fluffy mammal with long ears and powerful hind legs. They are known for their swift agility, playful behavior, and delicious diet of veggies like carrots! 🐰🥕✨
[DEBUG] ollama_generate: return: 0
```
