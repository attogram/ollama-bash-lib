# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.18

## Demo

```bash
ollama_generate_stream_json "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:43.9361328Z","response":"A","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:43.9756192Z","response":" rabbit","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.0095338Z","response":" is","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.0430875Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.0743064Z","response":" small","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.1064432Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.1369285Z","response":" furry","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.1684146Z","response":" animal","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.1993482Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.2297752Z","response":" long","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.2604259Z","response":" ears","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.2908137Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.3204482Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.3501884Z","response":" short","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.3806738Z","response":" tail","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.4106878Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.4407204Z","response":" often","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.4700319Z","response":" associated","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.4994193Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.5287382Z","response":" agility","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.5582786Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.5882201Z","response":" quick","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.6193882Z","response":" movements","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.6496812Z","response":".","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:44.6794518Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,9864,448,1293,24230,323,264,2805,9787,11,3545,5815,448,66641,323,3974,19029,13],"total_duration":8693394200,"load_duration":7801697800,"prompt_eval_count":28,"prompt_eval_duration":147362800,"eval_count":25,"eval_duration":743826800}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"
```
```json
[DEBUG] ollama_generate_stream_json: [qwen2.5vl:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen2.5vl:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "qwen2.5vl:7b",
  "prompt": "]
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.1461222Z","response":"A","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.1747566Z","response":" rabbit","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.2038237Z","response":" is","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.2334346Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.263054Z","response":" small","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.2935689Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.3227782Z","response":" furry","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.3528042Z","response":" animal","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.3829117Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.4127713Z","response":" long","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.4436818Z","response":" ears","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.4736654Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.5033397Z","response":" a","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.5330902Z","response":" short","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.5624118Z","response":" tail","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.5918642Z","response":",","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.6215704Z","response":" often","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.6510326Z","response":" associated","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.6810252Z","response":" with","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.7104498Z","response":" agility","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.7404347Z","response":" and","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.7700644Z","response":" quick","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.8011863Z","response":" movements","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.8306324Z","response":".","done":false}
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T23:49:45.8607476Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,9864,448,1293,24230,323,264,2805,9787,11,3545,5815,448,66641,323,3974,19029,13],"total_duration":774253100,"load_duration":26505800,"prompt_eval_count":28,"prompt_eval_duration":32094100,"eval_count":25,"eval_duration":715129800}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
