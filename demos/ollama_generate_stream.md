# ollama_generate_stream
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.0

## Demo

```bash
ollama_generate_stream "cogito:3b" "Describe a rabbit in 2 short sentences"
```
```
Rabbits have soft, fluffy fur with long ears and powerful hind legs that enable them to hop quickly across the ground. They're intelligent animals known for their social nature, curiosity, and ability to live in various environments from forests to gardens.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "cogito:3b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [cogito:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [cogito:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 10 bytes [cogito:3b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"cogito:3b","prompt":"Describe a rabbit in 2 short sentences"}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] jq_sanitize: 94 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.17398Z","response":"The","done":false}]
[DEBUG] jq_sanitized: return: 0
The[DEBUG] jq_sanitize: 99 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.200807Z","response":" rabbit","done":false}]
[DEBUG] jq_sanitized: return: 0
 rabbit[DEBUG] jq_sanitize: 95 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.228658Z","response":" is","done":false}]
[DEBUG] jq_sanitized: return: 0
 is[DEBUG] jq_sanitize: 94 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.258528Z","response":" a","done":false}]
[DEBUG] jq_sanitized: return: 0
 a[DEBUG] jq_sanitize: 98 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.288611Z","response":" small","done":false}]
[DEBUG] jq_sanitized: return: 0
 small[DEBUG] jq_sanitize: 93 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.319566Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 98 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.350207Z","response":" furry","done":false}]
[DEBUG] jq_sanitized: return: 0
 furry[DEBUG] jq_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.381221Z","response":" mamm","done":false}]
[DEBUG] jq_sanitized: return: 0
 mamm[DEBUG] jq_sanitize: 94 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.412294Z","response":"al","done":false}]
[DEBUG] jq_sanitized: return: 0
al[DEBUG] jq_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.443544Z","response":" with","done":false}]
[DEBUG] jq_sanitized: return: 0
 with[DEBUG] jq_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.475117Z","response":" long","done":false}]
[DEBUG] jq_sanitized: return: 0
 long[DEBUG] jq_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.505789Z","response":" ears","done":false}]
[DEBUG] jq_sanitized: return: 0
 ears[DEBUG] jq_sanitize: 96 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.536625Z","response":" and","done":false}]
[DEBUG] jq_sanitized: return: 0
 and[DEBUG] jq_sanitize: 94 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.567751Z","response":" a","done":false}]
[DEBUG] jq_sanitized: return: 0
 a[DEBUG] jq_sanitize: 99 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.598435Z","response":" fluffy","done":false}]
[DEBUG] jq_sanitized: return: 0
 fluffy[DEBUG] jq_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.629647Z","response":" tail","done":false}]
[DEBUG] jq_sanitized: return: 0
 tail[DEBUG] jq_sanitize: 93 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.660331Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.69138Z","response":" These","done":false}]
[DEBUG] jq_sanitized: return: 0
 These[DEBUG] jq_sanitize: 102 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.722705Z","response":" creatures","done":false}]
[DEBUG] jq_sanitized: return: 0
 creatures[DEBUG] jq_sanitize: 96 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.752648Z","response":" are","done":false}]
[DEBUG] jq_sanitized: return: 0
 are[DEBUG] jq_sanitize: 98 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.785589Z","response":" known","done":false}]
[DEBUG] jq_sanitized: return: 0
 known[DEBUG] jq_sanitize: 96 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.817522Z","response":" for","done":false}]
[DEBUG] jq_sanitized: return: 0
 for[DEBUG] jq_sanitize: 98 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.847934Z","response":" their","done":false}]
[DEBUG] jq_sanitized: return: 0
 their[DEBUG] jq_sanitize: 98 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.878381Z","response":" quick","done":false}]
[DEBUG] jq_sanitized: return: 0
 quick[DEBUG] jq_sanitize: 102 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.907109Z","response":" movements","done":false}]
[DEBUG] jq_sanitized: return: 0
 movements[DEBUG] jq_sanitize: 96 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.937623Z","response":" and","done":false}]
[DEBUG] jq_sanitized: return: 0
 and[DEBUG] jq_sanitize: 99 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.968777Z","response":" gentle","done":false}]
[DEBUG] jq_sanitized: return: 0
 gentle[DEBUG] jq_sanitize: 99 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:32.999666Z","response":" nature","done":false}]
[DEBUG] jq_sanitized: return: 0
 nature[DEBUG] jq_sanitize: 92 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:33.03111Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 499 bytes [{"model":"cogito:3b","created_at":"2025-07-29T22:25:33.06278Z","response":"","done":true,"done_reason":"stop","context":[128006,882,128007,271,75885,264,39824,304,220,17,2875,23719,128009,128006,78191,128007,271,791,39824,374,264,2678,11,75519,36041,278,449,1317,25212,323,264,68661,9986,13,4314,20566,527,3967,369,872,4062,19567,323,22443,7138,13],"total_duration":978268625,"load_duration":52198875,"prompt_eval_count":18,"prompt_eval_duration":36039541,"eval_count":30,"eval_duration":888978042}]
[DEBUG] jq_sanitized: return: 0

[DEBUG] ollama_generate_stream: return: 0
```
