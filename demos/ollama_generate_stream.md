# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.20

## Demo

```bash
ollama_generate_stream "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, furry animal with long ears and a short tail, often associated with agility and quick movements.```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [qwen2.5vl:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen2.5vl:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "qwen2.5vl:7b",
  "prompt": "]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] json_sanitize: 97 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
A[DEBUG] json_sanitize: 102 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 rabbit[DEBUG] json_sanitize: 99 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 is[DEBUG] json_sanitize: 98 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 a[DEBUG] json_sanitize: 102 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 small[DEBUG] json_sanitize: 97 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
,[DEBUG] json_sanitize: 102 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 furry[DEBUG] json_sanitize: 103 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 animal[DEBUG] json_sanitize: 101 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 with[DEBUG] json_sanitize: 100 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 long[DEBUG] json_sanitize: 100 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 ears[DEBUG] json_sanitize: 100 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 and[DEBUG] json_sanitize: 98 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 a[DEBUG] json_sanitize: 102 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 short[DEBUG] json_sanitize: 101 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 tail[DEBUG] json_sanitize: 97 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
,[DEBUG] json_sanitize: 102 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 often[DEBUG] json_sanitize: 106 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 106 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 associated[DEBUG] json_sanitize: 101 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 with[DEBUG] json_sanitize: 104 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 104 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 agility[DEBUG] json_sanitize: 100 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 and[DEBUG] json_sanitize: 102 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 quick[DEBUG] json_sanitize: 106 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 106 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
 movements[DEBUG] json_sanitize: 97 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
.[DEBUG] json_sanitize: 525 bytes [{"model":"qwen2.5vl:7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 525 bytes [[{"model":"qwen2.5vl:7b","created_at":"2025]]
[DEBUG] ollama_generate_stream: return: 0
```
