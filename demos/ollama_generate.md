# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.8

## Demo

```bash
ollama_generate "smollm2:360m" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is generally a small to medium sized mammal with long, brown fur and large ears. They have soft under fur and bright eyes that can be seen when they move quickly around you.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "smollm2:360m" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [smollm2:360m] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [smollm2:360m] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 13 bytes [smollm2:360m]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"smollm2:360m","prompt":"Describe]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 889 bytes
[DEBUG] json_sanitize: 889 bytes [{"model":"smollm2:360m","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 889 bytes [[{"model":"smollm2:360m","created_at":"2025]]
Rabbits are small mammals known for their long ears and fluffy tails. They have a soft fur coat that can be any color, ranging from white to brown or gray with spots of black. They are herbivores and love eating plants and leaves.
[DEBUG] ollama_generate: return: 0
```
