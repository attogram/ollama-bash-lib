# ollama_generate_stream_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.0

## Demo

```bash
ollama_generate_stream_json "codellama:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"codellama:7b","created_at":"2025-07-29T17:57:19.795601Z","response":"\n","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:19.841284Z","response":"A","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:19.886692Z","response":" rabb","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:19.932183Z","response":"it","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:19.977638Z","response":" is","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.023734Z","response":" a","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.069488Z","response":" small","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.11515Z","response":",","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.160822Z","response":" fl","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.206349Z","response":"uff","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.25183Z","response":"y","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.297324Z","response":" m","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.342847Z","response":"amm","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.388289Z","response":"al","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.43379Z","response":" with","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.479277Z","response":" long","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.524738Z","response":" ears","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.570319Z","response":" and","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.615793Z","response":" a","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.661591Z","response":" large","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.707938Z","response":" tail","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.753513Z","response":".","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.799297Z","response":" They","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.844745Z","response":" are","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.890422Z","response":" typically","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.935995Z","response":" white","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:20.982277Z","response":" or","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.028483Z","response":" gray","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.074618Z","response":" in","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.120393Z","response":" color","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.166083Z","response":" and","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.211719Z","response":" have","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.257803Z","response":" a","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.30541Z","response":" long","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.352492Z","response":",","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.398523Z","response":" thin","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.444431Z","response":" body","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.490292Z","response":" that","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.536065Z","response":" helps","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.590775Z","response":" them","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.640357Z","response":" move","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.687768Z","response":" quickly","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.733819Z","response":" through","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.779753Z","response":" their","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.825801Z","response":" under","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.874754Z","response":"ground","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.931685Z","response":" bur","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:21.980966Z","response":"rows","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.028683Z","response":".","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.077222Z","response":"","done":true,"done_reason":"stop","context":[518,25580,29962,3532,14816,29903,29958,5299,829,14816,29903,6778,13,13,4002,29581,263,27127,277,297,29871,29906,3273,25260,518,29914,25580,29962,13,13,29909,27127,277,338,263,2319,29892,1652,3096,29891,286,4850,284,411,1472,22827,322,263,2919,12464,29889,2688,526,12234,4796,470,16749,297,2927,322,505,263,1472,29892,16835,3573,393,6911,963,4337,9098,1549,1009,1090,2057,6866,5727,29889],"total_duration":5373508291,"load_duration":2658559250,"prompt_eval_count":30,"prompt_eval_duration":431135458,"eval_count":50,"eval_duration":2282452875}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "codellama:7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream_json: [codellama:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [codellama:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 13 bytes [codellama:7b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"codellama:7b","prompt":"Describe a rabbit in 2 short sentences"}]
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.189434Z","response":"A","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.235762Z","response":" rabb","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.282564Z","response":"it","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.328342Z","response":" is","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.374239Z","response":" a","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.420875Z","response":" small","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.466712Z","response":",","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.512517Z","response":" fur","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.558231Z","response":"ry","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.603793Z","response":" m","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.649652Z","response":"amm","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.695769Z","response":"al","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.741381Z","response":" with","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.787024Z","response":" large","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.832526Z","response":" ears","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.878149Z","response":" and","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.923866Z","response":" long","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:22.969704Z","response":" legs","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.015707Z","response":".","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.061714Z","response":" It","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.107698Z","response":" has","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.154984Z","response":" a","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.202155Z","response":" distinct","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.247888Z","response":"ive","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.293589Z","response":" white","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.339319Z","response":" patch","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.385964Z","response":" on","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.432078Z","response":" its","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.477663Z","response":" tail","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.523046Z","response":" and","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.568678Z","response":" is","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.614375Z","response":" known","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.660194Z","response":" for","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.708342Z","response":" its","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.75386Z","response":" ability","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.799752Z","response":" to","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.845416Z","response":" hop","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.89113Z","response":" quickly","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.936876Z","response":".","done":false}
{"model":"codellama:7b","created_at":"2025-07-29T17:57:23.982535Z","response":"","done":true,"done_reason":"stop","context":[518,25580,29962,3532,14816,29903,29958,5299,829,14816,29903,6778,13,13,4002,29581,263,27127,277,297,29871,29906,3273,25260,518,29914,25580,29962,13,29909,27127,277,338,263,2319,29892,3261,719,286,4850,284,411,2919,22827,322,1472,21152,29889,739,756,263,8359,573,4796,13261,373,967,12464,322,338,2998,363,967,11509,304,8171,9098,29889],"total_duration":1854285958,"load_duration":12850500,"prompt_eval_count":30,"prompt_eval_duration":47546334,"eval_count":40,"eval_duration":1793385875}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
