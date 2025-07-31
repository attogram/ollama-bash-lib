# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

## Demo

```bash
ollama_generate_stream_json "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.375353Z","response":"A","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.428633Z","response":" rabbit","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.48132Z","response":" is","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.534438Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.587707Z","response":" small","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.641227Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.695392Z","response":" furry","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.748998Z","response":" animal","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.801894Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.854848Z","response":" long","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.908067Z","response":" ears","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:21.961489Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.014631Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.067287Z","response":" short","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.123561Z","response":" tail","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.177507Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.23709Z","response":" often","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.289773Z","response":" associated","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.342527Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.395442Z","response":" agility","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.449001Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.501618Z","response":" quick","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.55466Z","response":" movements","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.60723Z","response":".","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.660699Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,9864,448,1293,24230,323,264,2805,9787,11,3545,5815,448,66641,323,3974,19029,13],"total_duration":6554277042,"load_duration":3543187750,"prompt_eval_count":28,"prompt_eval_duration":1724105958,"eval_count":25,"eval_duration":1286191167}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"
```
```json
[DEBUG] ollama_generate_stream_json: [qwen2.5vl:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen2.5vl:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_clean: 13 bytes [qwen2.5vl:7b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen2.5vl:7b","prompt":"Describe]
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.831043Z","response":"A","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.885373Z","response":" rabbit","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.939931Z","response":" is","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:22.994287Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.048682Z","response":" small","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.101623Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.154445Z","response":" furry","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.207848Z","response":" animal","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.262139Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.316062Z","response":" long","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.369061Z","response":" ears","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.421824Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.474754Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.528088Z","response":" short","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.580738Z","response":" tail","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.634527Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.687336Z","response":" often","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.741049Z","response":" associated","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.794811Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.848591Z","response":" agility","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.901875Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:23.955132Z","response":" quick","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:24.008318Z","response":" movements","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:24.062188Z","response":".","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-31T21:15:24.114653Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,9864,448,1293,24230,323,264,2805,9787,11,3545,5815,448,66641,323,3974,19029,13],"total_duration":1382842666,"load_duration":45226583,"prompt_eval_count":28,"prompt_eval_duration":53067583,"eval_count":25,"eval_duration":1284159334}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
