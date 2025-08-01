# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.18

## Demo

```bash
ollama_generate_stream "gemma3n:e4b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small mammal with long ears and a fluffy tail, known for its quick hops and gentle nature. These herbivores spend their days munching on plants and staying alert for predators in their grassy habitats. ```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gemma3n:e4b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [gemma3n:e4b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [gemma3n:e4b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "gemma3n:e4b",
  "prompt": "D]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] json_sanitize: 96 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
A[DEBUG] json_sanitize: 102 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 rabbit[DEBUG] json_sanitize: 97 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 is[DEBUG] json_sanitize: 97 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 a[DEBUG] json_sanitize: 101 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 small[DEBUG] json_sanitize: 102 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 mammal[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 with[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 long[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 ears[DEBUG] json_sanitize: 96 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
,[DEBUG] json_sanitize: 97 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 a[DEBUG] json_sanitize: 102 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 fluffy[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 tail[DEBUG] json_sanitize: 96 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
,[DEBUG] json_sanitize: 99 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 and[DEBUG] json_sanitize: 104 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 104 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 powerful[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 hind[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 legs[DEBUG] json_sanitize: 101 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 built[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 for[DEBUG] json_sanitize: 103 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 hopping[DEBUG] json_sanitize: 96 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
.[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 They[DEBUG] json_sanitize: 99 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 are[DEBUG] json_sanitize: 101 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 known[DEBUG] json_sanitize: 99 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 for[DEBUG] json_sanitize: 101 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 their[DEBUG] json_sanitize: 102 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 gentle[DEBUG] json_sanitize: 102 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 nature[DEBUG] json_sanitize: 99 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 and[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 love[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 of[DEBUG] json_sanitize: 103 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 carrots[DEBUG] json_sanitize: 96 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
![DEBUG] json_sanitize: 96 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
 [DEBUG] json_sanitize: 97 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
[DEBUG] json_sanitize: 573 bytes [{"model":"gemma3n:e4b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 573 bytes [[{"model":"gemma3n:e4b","created_at":"2025-]]
[DEBUG] ollama_generate_stream: return: 0
```
