# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.8

## Demo

```bash
ollama_generate_stream_json "hermes3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.013435Z","response":"A","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.067543Z","response":" rabbit","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.122525Z","response":" is","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.176505Z","response":" a","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.231376Z","response":" small","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.285592Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.339757Z","response":" furry","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.394559Z","response":" mamm","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.448543Z","response":"al","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.502775Z","response":" known","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.558247Z","response":" for","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.612914Z","response":" its","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.666786Z","response":" long","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.725627Z","response":" ears","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.782194Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.837328Z","response":" strong","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.891977Z","response":" hind","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:23.946261Z","response":" legs","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.000301Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.062213Z","response":" and","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.128558Z","response":" ability","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.200223Z","response":" to","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.416933Z","response":" reproduce","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.475174Z","response":" quickly","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.531615Z","response":".","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.594696Z","response":" It","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.658996Z","response":"'s","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.716814Z","response":" also","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.772548Z","response":" commonly","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.827977Z","response":" associated","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.884107Z","response":" with","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.938514Z","response":" the","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:24.994315Z","response":" children","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.050916Z","response":"'s","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.106216Z","response":" story","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.166232Z","response":" \"","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.221052Z","response":"Peter","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.275351Z","response":" Rabbit","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.331244Z","response":"\"","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.387649Z","response":" by","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.442693Z","response":" Be","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.497073Z","response":"atrix","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.551637Z","response":" Potter","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.607915Z","response":".","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.662677Z","response":"","done":true,"done_reason":"stop","context":[128039,882,198,75885,264,39824,304,220,17,2875,23719,128040,198,128039,78191,198,32,39824,374,264,2678,11,75519,36041,278,3967,369,1202,1317,25212,11,3831,48419,14535,11,323,5845,311,23645,6288,13,1102,596,1101,17037,5938,449,279,2911,596,3446,330,37659,49431,1,555,2893,2619,30427,13],"total_duration":7632288875,"load_duration":3380045000,"prompt_eval_count":17,"prompt_eval_duration":1595137958,"eval_count":45,"eval_duration":2651183208}
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
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.86804Z","response":"A","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.929183Z","response":" rabbit","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:25.986105Z","response":" is","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.043141Z","response":" a","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.100487Z","response":" small","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.154915Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.209561Z","response":" fluffy","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.263733Z","response":" mamm","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.318016Z","response":"al","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.372144Z","response":" with","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.426304Z","response":" long","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.480704Z","response":" ears","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.534734Z","response":" and","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.5919Z","response":" a","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.646588Z","response":" cute","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.700362Z","response":",","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.754849Z","response":" rounded","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.809138Z","response":" face","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.864267Z","response":".","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.918608Z","response":" It","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:26.972813Z","response":"'s","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.027455Z","response":" known","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.082703Z","response":" for","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.136873Z","response":" its","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.191029Z","response":" playful","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.245644Z","response":" nature","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.29986Z","response":" and","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.354063Z","response":" hops","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.408794Z","response":" around","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.462918Z","response":" grass","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.517029Z","response":"y","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.571866Z","response":" fields","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.62656Z","response":" and","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.680666Z","response":" gardens","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.73723Z","response":".","done":false}
{"model":"hermes3:8b","created_at":"2025-07-31T18:05:27.794385Z","response":"","done":true,"done_reason":"stop","context":[128039,882,198,75885,264,39824,304,220,17,2875,23719,128040,198,128039,78191,198,32,39824,374,264,2678,11,68661,36041,278,449,1317,25212,323,264,19369,11,18460,3663,13,1102,596,3967,369,1202,57169,7138,323,59218,2212,16763,88,5151,323,36536,13],"total_duration":2057193084,"load_duration":67917750,"prompt_eval_count":17,"prompt_eval_duration":61308375,"eval_count":36,"eval_duration":1927357125}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
