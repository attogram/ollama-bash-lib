# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.5

## Demo

```bash
ollama_generate_stream "llava-phi3:3.8b" "Describe a rabbit in 2 short sentences"
```
```
1. A small, furry animal with long ears and a fluffy tail that enjoys hopping around meadows.2. A cute, adorable creature with soft, floppy ears and pink nose that loves to nibble on carrots.```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "llava-phi3:3.8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [llava-phi3:3.8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [llava-phi3:3.8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 16 bytes [llava-phi3:3.8b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"llava-phi3:3.8b","prompt":"Descr]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] jq_sanitize: 99 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 99 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
A[DEBUG] jq_sanitize: 103 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 103 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 rabb[DEBUG] jq_sanitize: 99 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 99 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
it[DEBUG] jq_sanitize: 100 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 is[DEBUG] jq_sanitize: 100 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 a[DEBUG] jq_sanitize: 104 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 104 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 small[DEBUG] jq_sanitize: 98 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 98 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
,[DEBUG] jq_sanitize: 102 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 102 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 fur[DEBUG] jq_sanitize: 100 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
ry[DEBUG] jq_sanitize: 100 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 m[DEBUG] jq_sanitize: 101 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 101 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
amm[DEBUG] jq_sanitize: 100 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
al[DEBUG] jq_sanitize: 102 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 102 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 with[DEBUG] jq_sanitize: 103 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 103 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 long[DEBUG] jq_sanitize: 103 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 103 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 ears[DEBUG] jq_sanitize: 102 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 102 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 and[DEBUG] jq_sanitize: 107 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 107 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 powerful[DEBUG] jq_sanitize: 100 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 100 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 h[DEBUG] jq_sanitize: 101 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 101 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
ind[DEBUG] jq_sanitize: 103 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 103 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 legs[DEBUG] jq_sanitize: 99 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 99 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
.[DEBUG] jq_sanitize: 103 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 103 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 They[DEBUG] jq_sanitize: 102 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 102 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 are[DEBUG] jq_sanitize: 108 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 108 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 typically[DEBUG] jq_sanitize: 102 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 102 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 found[DEBUG] jq_sanitize: 101 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 101 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 in[DEBUG] jq_sanitize: 104 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 104 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 grass[DEBUG] jq_sanitize: 99 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 99 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
y[DEBUG] jq_sanitize: 105 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 105 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 fields[DEBUG] jq_sanitize: 102 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 102 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 and[DEBUG] jq_sanitize: 102 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 102 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 bur[DEBUG] jq_sanitize: 101 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 101 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
rows[DEBUG] jq_sanitize: 104 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 104 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
 under[DEBUG] jq_sanitize: 104 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 104 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
ground[DEBUG] jq_sanitize: 98 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 98 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
.[DEBUG] jq_sanitize: 552 bytes [{"model":"llava-phi3:3.8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 552 bytes [[{"model":"llava-phi3:3.8b","created_at":"2]]
[DEBUG] ollama_generate_stream: return: 0
```
