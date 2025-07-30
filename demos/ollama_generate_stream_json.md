# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0

## Demo

```bash
ollama_generate_stream_json "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:21.820181Z","response":"A","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:21.873261Z","response":" rabbit","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:21.92633Z","response":" is","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:21.980082Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.033173Z","response":" small","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.086901Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.140169Z","response":" furry","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.193435Z","response":" animal","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.246438Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.29942Z","response":" long","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.353878Z","response":" ears","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.408122Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.461676Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.519966Z","response":" short","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.574839Z","response":" tail","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.629177Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.681957Z","response":" often","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.734937Z","response":" associated","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.788036Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.840554Z","response":" agility","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.893741Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.94652Z","response":" quick","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:22.999455Z","response":" movements","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.053302Z","response":".","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.107354Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,9864,448,1293,24230,323,264,2805,9787,11,3545,5815,448,66641,323,3974,19029,13],"total_duration":6540113500,"load_duration":3514214334,"prompt_eval_count":28,"prompt_eval_duration":1736417625,"eval_count":25,"eval_duration":1287768500}
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
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.292662Z","response":"A","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.348055Z","response":" rabbit","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.402603Z","response":" is","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.45657Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.511105Z","response":" small","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.564066Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.617432Z","response":" furry","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.670692Z","response":" animal","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.723381Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.77903Z","response":" long","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.832495Z","response":" ears","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.885207Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.938057Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:23.991166Z","response":" short","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.044331Z","response":" tail","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.097701Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.151513Z","response":" often","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.204682Z","response":" associated","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.25758Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.310694Z","response":" agility","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.363736Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.417203Z","response":" quick","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.470608Z","response":" movements","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.523334Z","response":".","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-07-30T21:19:24.576915Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,9864,448,1293,24230,323,264,2805,9787,11,3545,5815,448,66641,323,3974,19029,13],"total_duration":1392976458,"load_duration":52614458,"prompt_eval_count":28,"prompt_eval_duration":54944041,"eval_count":25,"eval_duration":1284847834}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
