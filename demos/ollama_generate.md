# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.5

## Demo

```bash
ollama_generate "smollm2:360m" "Describe a rabbit in 2 short sentences"
```
```
A bunny is often described as small and fluffy with spots. It's cute and cuddly with its ears raised up and it loves to hop around on the ground.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "smollm2:360m" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate: [smollm2:360m] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [smollm2:360m] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 13 bytes [smollm2:360m]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"smollm2:360m","prompt":"Describe]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 934 bytes
[DEBUG] jq_sanitize: 934 bytes [{"model":"smollm2:360m","created_at":"2025]
[DEBUG] jq_sanitize: sanitized: 934 bytes [[{"model":"smollm2:360m","created_at":"2025]]
The huffing of the wind and the soft rustle of the leaves as a rabbit scurries across the meadow. The bright green of its coat blending seamlessly into the vibrant background of wildflowers. Its small, round head and fluffy ears are a sight to behold.
[DEBUG] ollama_generate_stream_json: return: 0
```
