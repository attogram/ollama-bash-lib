# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.8

## Demo

```bash
ollama_generate_stream "smollm2:1.7b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small mammal with fluffy fur and large ears. It hops around quickly on its long hind legs and loves to eat plants.```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "smollm2:1.7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [smollm2:1.7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [smollm2:1.7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_clean: 13 bytes [smollm2:1.7b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"smollm2:1.7b","prompt":"Describe]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] json_sanitize: 96 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
A[DEBUG] json_sanitize: 101 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 bunny[DEBUG] json_sanitize: 98 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 is[DEBUG] json_sanitize: 101 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 often[DEBUG] json_sanitize: 101 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 small[DEBUG] json_sanitize: 99 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 and[DEBUG] json_sanitize: 102 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 fluffy[DEBUG] json_sanitize: 100 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 with[DEBUG] json_sanitize: 100 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 large[DEBUG] json_sanitize: 100 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 ears[DEBUG] json_sanitize: 96 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
,[DEBUG] json_sanitize: 100 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 known[DEBUG] json_sanitize: 99 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 for[DEBUG] json_sanitize: 99 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 its[DEBUG] json_sanitize: 102 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 playful[DEBUG] json_sanitize: 102 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 nature[DEBUG] json_sanitize: 99 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 and[DEBUG] json_sanitize: 102 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 hopping[DEBUG] json_sanitize: 105 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 105 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 abilities[DEBUG] json_sanitize: 96 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
.[DEBUG] json_sanitize: 98 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 It[DEBUG] json_sanitize: 99 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 can[DEBUG] json_sanitize: 98 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 be[DEBUG] json_sanitize: 101 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 found[DEBUG] json_sanitize: 98 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 in[DEBUG] json_sanitize: 103 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 various[DEBUG] json_sanitize: 101 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 colors[DEBUG] json_sanitize: 105 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 105 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 depending[DEBUG] json_sanitize: 98 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 on[DEBUG] json_sanitize: 99 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 the[DEBUG] json_sanitize: 101 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 breed[DEBUG] json_sanitize: 99 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 and[DEBUG] json_sanitize: 103 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
 species[DEBUG] json_sanitize: 96 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
.[DEBUG] json_sanitize: 589 bytes [{"model":"smollm2:1.7b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 589 bytes [[{"model":"smollm2:1.7b","created_at":"2025]]
[DEBUG] ollama_generate_stream: return: 0
```
