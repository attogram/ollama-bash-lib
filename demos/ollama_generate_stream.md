# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.4

## Demo

```bash
ollama_generate_stream "gemma3:1b" "Describe a rabbit in 2 short sentences"
```
```
A fluffy rabbit with bright eyes and twitching whiskers, it hops with playful energy through the meadow. Its delicate ears and soft fur make it a charming and gentle creature.```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gemma3:1b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [gemma3:1b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [gemma3:1b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 10 bytes [gemma3:1b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"gemma3:1b","prompt":"Describe a ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] jq_sanitize: 93 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 93 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
A[DEBUG] jq_sanitize: 99 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 99 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 rabbit[DEBUG] jq_sanitize: 95 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 95 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 is[DEBUG] jq_sanitize: 94 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 94 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 a[DEBUG] jq_sanitize: 98 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 98 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 small[DEBUG] jq_sanitize: 93 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 93 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
,[DEBUG] jq_sanitize: 99 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 99 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 fluffy[DEBUG] jq_sanitize: 101 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 101 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 creature[DEBUG] jq_sanitize: 97 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 97 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 with[DEBUG] jq_sanitize: 97 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 97 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 long[DEBUG] jq_sanitize: 97 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 97 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 ears[DEBUG] jq_sanitize: 96 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 96 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 and[DEBUG] jq_sanitize: 94 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 94 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 a[DEBUG] jq_sanitize: 98 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 98 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 twitch[DEBUG] jq_sanitize: 94 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 94 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
ing[DEBUG] jq_sanitize: 97 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 97 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 nose[DEBUG] jq_sanitize: 92 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 92 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
,[DEBUG] jq_sanitize: 102 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 102 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 perfectly[DEBUG] jq_sanitize: 100 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 adapted[DEBUG] jq_sanitize: 96 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 96 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 for[DEBUG] jq_sanitize: 100 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 hopping[DEBUG] jq_sanitize: 100 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 through[DEBUG] jq_sanitize: 100 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 meadows[DEBUG] jq_sanitize: 96 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 96 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 and[DEBUG] jq_sanitize: 100 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 gardens[DEBUG] jq_sanitize: 93 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 93 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
.[DEBUG] jq_sanitize: 96 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 96 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 They[DEBUG] jq_sanitize: 96 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 96 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 are[DEBUG] jq_sanitize: 98 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 98 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 known[DEBUG] jq_sanitize: 96 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 96 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 for[DEBUG] jq_sanitize: 98 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 98 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 their[DEBUG] jq_sanitize: 101 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 101 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 delicate[DEBUG] jq_sanitize: 93 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 93 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
,[DEBUG] jq_sanitize: 98 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 98 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 white[DEBUG] jq_sanitize: 96 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 96 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 fur[DEBUG] jq_sanitize: 96 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 96 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 and[DEBUG] jq_sanitize: 100 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 playful[DEBUG] jq_sanitize: 99 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 99 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
 nature[DEBUG] jq_sanitize: 93 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 93 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
.[DEBUG] jq_sanitize: 562 bytes [{"model":"gemma3:1b","created_at":"2025-07]
[DEBUG] jq_sanitize: sanitized: 562 bytes [[{"model":"gemma3:1b","created_at":"2025-07]]
[DEBUG] ollama_generate_stream: return: 0
```
