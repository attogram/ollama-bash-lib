# ollama_generate_stream
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1

## Demo

```bash
ollama_generate_stream "qwen2.5-coder:7b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small mammal known for its soft fur and long ears. It's often associated with speed and agility.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "qwen2.5-coder:7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [qwen2.5-coder:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen2.5-coder:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 17 bytes [qwen2.5-coder:7b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen2.5-coder:7b","prompt":"Describe a rabbit in 2 short sentences"}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:48.922847Z","response":"A","done":false}]
A[DEBUG] jq_sanitize: 106 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:48.978967Z","response":" rabbit","done":false}]
 rabbit[DEBUG] jq_sanitize: 102 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.035984Z","response":" is","done":false}]
 is[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.093026Z","response":" a","done":false}]
 a[DEBUG] jq_sanitize: 105 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.147372Z","response":" small","done":false}]
 small[DEBUG] jq_sanitize: 104 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.200113Z","response":" mamm","done":false}]
 mamm[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.252675Z","response":"al","done":false}]
al[DEBUG] jq_sanitize: 105 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.304674Z","response":" known","done":false}]
 known[DEBUG] jq_sanitize: 103 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.356648Z","response":" for","done":false}]
 for[DEBUG] jq_sanitize: 103 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.408611Z","response":" its","done":false}]
 its[DEBUG] jq_sanitize: 104 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.460615Z","response":" soft","done":false}]
 soft[DEBUG] jq_sanitize: 103 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.512581Z","response":" fur","done":false}]
 fur[DEBUG] jq_sanitize: 103 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.564591Z","response":" and","done":false}]
 and[DEBUG] jq_sanitize: 104 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.616561Z","response":" long","done":false}]
 long[DEBUG] jq_sanitize: 102 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.6686Z","response":" ears","done":false}]
 ears[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.720943Z","response":".","done":false}]
.[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.77322Z","response":" It","done":false}]
 It[DEBUG] jq_sanitize: 102 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.825419Z","response":" is","done":false}]
 is[DEBUG] jq_sanitize: 102 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.877664Z","response":" an","done":false}]
 an[DEBUG] jq_sanitize: 111 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.929688Z","response":" intelligent","done":false}]
 intelligent[DEBUG] jq_sanitize: 106 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:49.981814Z","response":" animal","done":false}]
 animal[DEBUG] jq_sanitize: 104 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:50.034125Z","response":" that","done":false}]
 that[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:50.08641Z","response":" is","done":false}]
 is[DEBUG] jq_sanitize: 105 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:50.138697Z","response":" often","done":false}]
 often[DEBUG] jq_sanitize: 104 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:50.190715Z","response":" kept","done":false}]
 kept[DEBUG] jq_sanitize: 102 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:50.243299Z","response":" as","done":false}]
 as[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:50.295315Z","response":" a","done":false}]
 a[DEBUG] jq_sanitize: 103 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:50.347241Z","response":" pet","done":false}]
 pet[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:50.399475Z","response":".","done":false}]
.[DEBUG] jq_sanitize: 598 bytes [{"model":"qwen2.5-coder:7b","created_at":"2025-07-29T18:42:50.451633Z","response":"","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,1207,16948,11,3465,553,54364,14817,13,1446,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,34941,278,3881,369,1181,8413,18241,323,1293,24230,13,1084,374,458,24514,9864,429,374,3545,8604,438,264,6753,13],"total_duration":1650613209,"load_duration":58194834,"prompt_eval_count":37,"prompt_eval_duration":61381625,"eval_count":30,"eval_duration":1530272167}]

[DEBUG] ollama_generate_stream: return: 0
```
