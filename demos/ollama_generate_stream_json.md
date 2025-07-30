# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_generate_stream_json "qwen2.5-coder:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:07.823559Z","response":"A","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:07.877836Z","response":" cute","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:07.93182Z","response":" and","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:07.98557Z","response":" fluffy","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.041949Z","response":" creature","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.096496Z","response":" with","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.150205Z","response":" long","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.205376Z","response":" ears","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.260454Z","response":".","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.316129Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,1207,16948,11,3465,553,54364,14817,13,1446,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,18838,323,67561,17218,448,1293,24230,13],"total_duration":4064163375,"load_duration":3094840750,"prompt_eval_count":37,"prompt_eval_duration":475280875,"eval_count":10,"eval_duration":493262500}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "qwen2.5-coder:7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream_json: [qwen2.5-coder:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen2.5-coder:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 17 bytes [qwen2.5-coder:7b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen2.5-coder:7b","prompt":"Describe a rabbit in 2 short sentences"}]
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.517754Z","response":"A","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.575109Z","response":" cute","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.630361Z","response":" and","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.685693Z","response":" fluffy","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.740254Z","response":" creature","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.795506Z","response":" with","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.850788Z","response":" soft","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.904689Z","response":" fur","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:08.958524Z","response":" and","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.013863Z","response":" long","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.069538Z","response":" ears","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.124203Z","response":".","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.178057Z","response":" Known","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.231473Z","response":" for","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.286209Z","response":" hopping","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.343763Z","response":" on","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.404221Z","response":" their","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.463071Z","response":" back","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.520134Z","response":" legs","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.575845Z","response":" and","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.632097Z","response":" being","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.687075Z","response":" playful","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.741007Z","response":".","done":false}
{"model":"qwen2.5-coder:7b","created_at":"2025-07-30T16:43:09.795599Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,1207,16948,11,3465,553,54364,14817,13,1446,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,18838,323,67561,17218,448,8413,18241,323,1293,24230,13,48286,369,92238,389,862,1182,14201,323,1660,56069,13],"total_duration":1390601958,"load_duration":54781541,"prompt_eval_count":37,"prompt_eval_duration":55698666,"eval_count":24,"eval_duration":1279411542}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

[DEBUG] ollama_generate_stream_json: return: 0
```
