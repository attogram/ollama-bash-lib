# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0

## Demo

```bash
ollama_generate_stream "llava-llama3:8b" "Describe a rabbit in 2 short sentences"
```
```
Rabbit is a small mammal that has long ears and whiskers. The body of the rabbit is typically round, with a furry coat.```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "llava-llama3:8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [llava-llama3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [llava-llama3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_clean: 16 bytes [llava-llama3:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"llava-llama3:8b","prompt":"Descr]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] json_sanitize: 99 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
R[DEBUG] json_sanitize: 100 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
ab[DEBUG] json_sanitize: 102 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
bits[DEBUG] json_sanitize: 102 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 are[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 cute[DEBUG] json_sanitize: 99 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
,[DEBUG] json_sanitize: 102 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 furry[DEBUG] json_sanitize: 106 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 106 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 animals[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 that[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 live[DEBUG] json_sanitize: 101 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 on[DEBUG] json_sanitize: 104 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 104 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 grass[DEBUG] json_sanitize: 102 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 and[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 like[DEBUG] json_sanitize: 101 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 to[DEBUG] json_sanitize: 102 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 eat[DEBUG] json_sanitize: 105 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 105 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 leaves[DEBUG] json_sanitize: 99 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
.[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 They[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 have[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 long[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 ears[DEBUG] json_sanitize: 102 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 and[DEBUG] json_sanitize: 105 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 105 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 fluffy[DEBUG] json_sanitize: 104 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 104 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 tails[DEBUG] json_sanitize: 102 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 and[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 make[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 soft[DEBUG] json_sanitize: 100 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 100 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 b[DEBUG] json_sanitize: 101 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
unn[DEBUG] json_sanitize: 101 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
ies[DEBUG] json_sanitize: 105 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 105 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 sounds[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 when[DEBUG] json_sanitize: 103 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 103 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 they[DEBUG] json_sanitize: 102 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 102 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
 hop[DEBUG] json_sanitize: 99 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
.[DEBUG] json_sanitize: 550 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 550 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
[DEBUG] ollama_generate_stream: return: 0
```
