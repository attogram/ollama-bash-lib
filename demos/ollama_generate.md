# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_generate "smollm2:1.7b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, furry mammal with large ears and long hind legs. It has sharp teeth, soft fur on its body, and lives in burrows or grassy fields.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "smollm2:1.7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate: [smollm2:1.7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [smollm2:1.7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 13 bytes [smollm2:1.7b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"smollm2:1.7b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 626 bytes
[DEBUG] jq_sanitize: 626 bytes [{"model":"smollm2:1.7b","created_at":"2025-07-30T16:08:04.218877Z","response":"A rabbit is a small mammal with long ears and fur. It hops on its back legs to move around.","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,49,16024,314,253,1165,24366,351,986,10006,284,9462,30,657,38660,335,624,1056,7225,288,1485,1130,30],"total_duration":627293250,"load_duration":34938833,"prompt_eval_count":37,"prompt_eval_duration":27303500,"eval_count":23,"eval_duration":564067667}]
[DEBUG] jq_sanitized: sanitized: [{"model":"smollm2:1.7b","created_at":"2025-07-30T16:08:04.218877Z","response":"A rabbit is a small mammal with long ears and fur. It hops on its back legs to move around.","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,49,16024,314,253,1165,24366,351,986,10006,284,9462,30,657,38660,335,624,1056,7225,288,1485,1130,30],"total_duration":627293250,"load_duration":34938833,"prompt_eval_count":37,"prompt_eval_duration":27303500,"eval_count":23,"eval_duration":564067667}]
A rabbit is a small mammal with long ears and fur. It hops on its back legs to move around.
[DEBUG] ollama_generate_stream_json: return: 0
```
