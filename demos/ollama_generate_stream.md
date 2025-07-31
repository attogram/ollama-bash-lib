# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.10

## Demo

```bash
ollama_generate_stream "gemma3n:e2b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a cute, long-eared mammal known for its powerful hind legs, perfect for hopping. They're often found in warrens, nibbling on grasses and vegetables, and come in a variety of colors and patterns. ```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gemma3n:e2b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [gemma3n:e2b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [gemma3n:e2b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_clean: 12 bytes [gemma3n:e2b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"gemma3n:e2b","prompt":"Describe ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] json_sanitize: 94 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 94 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
A[DEBUG] json_sanitize: 101 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 rabbit[DEBUG] json_sanitize: 97 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 is[DEBUG] json_sanitize: 96 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 a[DEBUG] json_sanitize: 99 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 long[DEBUG] json_sanitize: 95 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
-[DEBUG] json_sanitize: 99 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
eared[DEBUG] json_sanitize: 95 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
,[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 furry[DEBUG] json_sanitize: 103 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 creature[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 known[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 for[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 its[DEBUG] json_sanitize: 102 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 hopping[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 and[DEBUG] json_sanitize: 101 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 twitch[DEBUG] json_sanitize: 96 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
ing[DEBUG] json_sanitize: 99 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 nose[DEBUG] json_sanitize: 95 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
.[DEBUG] json_sanitize: 99 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 They[DEBUG] json_sanitize: 95 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
'[DEBUG] json_sanitize: 96 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
re[DEBUG] json_sanitize: 105 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 105 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 herbivores[DEBUG] json_sanitize: 95 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
,[DEBUG] json_sanitize: 99 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 often[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 found[DEBUG] json_sanitize: 97 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 in[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 war[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
rens[DEBUG] json_sanitize: 95 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
,[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 and[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 are[DEBUG] json_sanitize: 102 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 beloved[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 for[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 their[DEBUG] json_sanitize: 100 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 gentle[DEBUG] json_sanitize: 101 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 nature[DEBUG] json_sanitize: 98 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 and[DEBUG] json_sanitize: 102 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 playful[DEBUG] json_sanitize: 101 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 antics[DEBUG] json_sanitize: 95 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
.[DEBUG] json_sanitize: 95 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
 [DEBUG] json_sanitize: 96 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
[DEBUG] json_sanitize: 619 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 619 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
[DEBUG] ollama_generate_stream: return: 0
```
