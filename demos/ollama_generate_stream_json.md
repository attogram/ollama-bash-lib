# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.12

## Demo

```bash
ollama_generate_stream_json "qwen2.5-coder:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:23.693839Z","response":"C","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:23.748325Z","response":"ute","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:23.80249Z","response":" and","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:23.858319Z","response":" fluffy","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:23.91472Z","response":",","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:23.970921Z","response":" with","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.026303Z","response":" long","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.081783Z","response":" ears","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.135277Z","response":" and","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.190165Z","response":" a","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.244666Z","response":" bush","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.299947Z","response":"y","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.355202Z","response":" tail","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.409285Z","response":".","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.464962Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,1207,16948,11,3465,553,54364,14817,13,1446,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,34,1070,323,67561,11,448,1293,24230,323,264,29673,88,9787,13],"total_duration":4331978083,"load_duration":3026764750,"prompt_eval_count":37,"prompt_eval_duration":532786417,"eval_count":15,"eval_duration":771880583}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "qwen2.5-coder:7b" "Describe a rabbit in 2 short sentences"
```
```json
[DEBUG] ollama_generate_stream_json: [qwen2.5-coder:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen2.5-coder:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_clean: 17 bytes [qwen2.5-coder:7b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen2.5-coder:7b","prompt":"Desc]
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.649783Z","response":"A","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.716592Z","response":" cute","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.78264Z","response":" and","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.852129Z","response":" fluffy","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.915726Z","response":" animal","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:24.976684Z","response":" with","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.031562Z","response":" long","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.087991Z","response":" ears","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.144141Z","response":" and","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.198476Z","response":" a","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.253239Z","response":" big","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.307398Z","response":" tail","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.362343Z","response":".","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.417708Z","response":" Known","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.474068Z","response":" for","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.528193Z","response":" hopping","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.583634Z","response":" around","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.638081Z","response":" and","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.693542Z","response":" being","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.748073Z","response":" playful","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.805065Z","response":".","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-31T21:04:25.860701Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,1207,16948,11,3465,553,54364,14817,13,1446,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,18838,323,67561,9864,448,1293,24230,323,264,2409,9787,13,48286,369,92238,2163,323,1660,56069,13],"total_duration":1314176959,"load_duration":46518625,"prompt_eval_count":37,"prompt_eval_duration":54838667,"eval_count":22,"eval_duration":1212339917}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
