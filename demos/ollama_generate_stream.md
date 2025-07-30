# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_generate_stream "qwen2.5vl:3b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, furry mammal with long ears and a long tail. It has a round body and a long, slender neck.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "qwen2.5vl:3b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [qwen2.5vl:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen2.5vl:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 13 bytes [qwen2.5vl:3b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen2.5vl:3b","prompt":"Describe a rabbit in 2 short sentences"}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.65418Z","response":"A","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.65418Z","response":"A","done":false}]
A[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.68535Z","response":" rabbit","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.68535Z","response":" rabbit","done":false}]
 rabbit[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.717228Z","response":" is","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.717228Z","response":" is","done":false}]
 is[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.753215Z","response":" a","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.753215Z","response":" a","done":false}]
 a[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.785846Z","response":" small","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.785846Z","response":" small","done":false}]
 small[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.81855Z","response":",","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.81855Z","response":",","done":false}]
,[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.849241Z","response":" furry","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.849241Z","response":" furry","done":false}]
 furry[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.879667Z","response":" mamm","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.879667Z","response":" mamm","done":false}]
 mamm[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.911159Z","response":"al","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.911159Z","response":"al","done":false}]
al[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.944893Z","response":" with","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.944893Z","response":" with","done":false}]
 with[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.975812Z","response":" long","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:02.975812Z","response":" long","done":false}]
 long[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.007334Z","response":" ears","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.007334Z","response":" ears","done":false}]
 ears[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.039213Z","response":" and","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.039213Z","response":" and","done":false}]
 and[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.071102Z","response":" a","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.071102Z","response":" a","done":false}]
 a[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.101505Z","response":" long","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.101505Z","response":" long","done":false}]
 long[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.131378Z","response":" tail","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.131378Z","response":" tail","done":false}]
 tail[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.160232Z","response":".","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.160232Z","response":".","done":false}]
.[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.188155Z","response":" It","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.188155Z","response":" It","done":false}]
 It[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.216627Z","response":" has","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.216627Z","response":" has","done":false}]
 has[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.245692Z","response":" a","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.245692Z","response":" a","done":false}]
 a[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.274614Z","response":" round","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.274614Z","response":" round","done":false}]
 round[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.303615Z","response":" body","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.303615Z","response":" body","done":false}]
 body[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.333278Z","response":" and","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.333278Z","response":" and","done":false}]
 and[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.361349Z","response":" a","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.361349Z","response":" a","done":false}]
 a[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.389831Z","response":" long","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.389831Z","response":" long","done":false}]
 long[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.41865Z","response":",","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.41865Z","response":",","done":false}]
,[DEBUG] jq_sanitize: 103 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.446964Z","response":" slender","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.446964Z","response":" slender","done":false}]
 slender[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.475348Z","response":" neck","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.475348Z","response":" neck","done":false}]
 neck[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.503469Z","response":".","done":false}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.503469Z","response":".","done":false}]
.[DEBUG] jq_sanitize: 543 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.531749Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,34941,278,448,1293,24230,323,264,1293,9787,13,1084,702,264,4778,2487,323,264,1293,11,72242,12975,13],"total_duration":971894750,"load_duration":49171500,"prompt_eval_count":28,"prompt_eval_duration":43947125,"eval_count":30,"eval_duration":878226750}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T16:43:03.531749Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,34941,278,448,1293,24230,323,264,1293,9787,13,1084,702,264,4778,2487,323,264,1293,11,72242,12975,13],"total_duration":971894750,"load_duration":49171500,"prompt_eval_count":28,"prompt_eval_duration":43947125,"eval_count":30,"eval_duration":878226750}]

[DEBUG] ollama_generate_stream: return: 0
```
