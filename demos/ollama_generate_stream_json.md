# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.5

## Demo

```bash
ollama_generate_stream_json "hermes3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.164357Z","response":"A","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.215435Z","response":" rabbit","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.266714Z","response":" is","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.318169Z","response":" a","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.369515Z","response":" small","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.420811Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.472185Z","response":" furry","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.523451Z","response":" mamm","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.57504Z","response":"al","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.627966Z","response":" known","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.680179Z","response":" for","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.732067Z","response":" its","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.783643Z","response":" long","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.835117Z","response":" ears","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.886708Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.938505Z","response":" powerful","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:53.990027Z","response":" hind","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.04637Z","response":" legs","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.099851Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.151426Z","response":" and","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.202778Z","response":" ability","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.254127Z","response":" to","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.30547Z","response":" reproduce","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.35686Z","response":" rapidly","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.408242Z","response":".","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.459642Z","response":" It","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.511314Z","response":" is","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.562855Z","response":" also","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.616526Z","response":" sometimes","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.669408Z","response":" referred","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.722243Z","response":" to","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.775059Z","response":" as","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.830562Z","response":" a","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.883478Z","response":" bunny","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.937105Z","response":" or","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:54.990713Z","response":" a","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.045892Z","response":" con","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.098379Z","response":"ey","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.1502Z","response":".","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.202046Z","response":"","done":true,"done_reason":"stop","context":[128039,882,198,75885,264,39824,304,220,17,2875,23719,128040,198,128039,78191,198,32,39824,374,264,2678,11,75519,36041,278,3967,369,1202,1317,25212,11,8147,48419,14535,11,323,5845,311,23645,19019,13,1102,374,1101,7170,14183,311,439,264,76614,477,264,390,1216,13],"total_duration":6241630209,"load_duration":3373802875,"prompt_eval_count":17,"prompt_eval_duration":827627875,"eval_count":40,"eval_duration":2039253333}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "hermes3:8b" "Describe a rabbit in 2 short sentences"
```
```json
[DEBUG] ollama_generate_stream_json: [hermes3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [hermes3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_clean: 11 bytes [hermes3:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"hermes3:8b","prompt":"Describe a]
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.378707Z","response":"A","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.432948Z","response":" rabbit","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.486555Z","response":" is","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.538136Z","response":" a","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.589492Z","response":" small","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.641087Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.692265Z","response":" fluffy","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.743382Z","response":" mamm","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.794467Z","response":"al","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.845793Z","response":" known","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.89699Z","response":" for","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.948381Z","response":" its","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:55.999875Z","response":" long","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.052134Z","response":" ears","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.104193Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.155508Z","response":" strong","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.207056Z","response":" hind","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.258661Z","response":" legs","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.31018Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.361639Z","response":" and","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.412952Z","response":" a","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.464193Z","response":" distinctive","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.515381Z","response":" bunny","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.566526Z","response":"-shaped","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.61799Z","response":" tail","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.669227Z","response":".","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.722277Z","response":" Rab","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.776523Z","response":"bits","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.828942Z","response":" are","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.88028Z","response":" adorable","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.93179Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:56.983188Z","response":" playful","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.035075Z","response":" creatures","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.087191Z","response":" that","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.13899Z","response":" are","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.190374Z","response":" often","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.241635Z","response":" kept","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.292911Z","response":" as","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.344186Z","response":" pets","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.395374Z","response":" or","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.446705Z","response":" found","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.498378Z","response":" in","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.550351Z","response":" natural","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.602557Z","response":" habitats","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.655315Z","response":".","done":false}
{"model":"hermes3:8b","created_at":"2025-07-30T22:45:57.70668Z","response":"","done":true,"done_reason":"stop","context":[128039,882,198,75885,264,39824,304,220,17,2875,23719,128040,198,128039,78191,198,32,39824,374,264,2678,11,68661,36041,278,3967,369,1202,1317,25212,11,3831,48419,14535,11,323,264,35947,76614,35831,9986,13,36824,11777,527,41708,11,57169,20566,430,527,3629,8774,439,26159,477,1766,304,5933,71699,13],"total_duration":2434494166,"load_duration":53702041,"prompt_eval_count":17,"prompt_eval_duration":51407000,"eval_count":46,"eval_duration":2328842209}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
