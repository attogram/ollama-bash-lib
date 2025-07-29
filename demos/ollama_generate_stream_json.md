# ollama_generate_stream_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1

## Demo

```bash
ollama_generate_stream_json "dolphin3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.241727Z","response":"A","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.297302Z","response":" rabbit","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.352669Z","response":" is","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.407852Z","response":" a","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.463387Z","response":" small","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.518446Z","response":" mamm","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.573581Z","response":"al","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.629838Z","response":" known","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.686646Z","response":" for","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.742623Z","response":" its","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.797896Z","response":" long","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.853001Z","response":" ears","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.90774Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:43.962816Z","response":" fluffy","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.017981Z","response":" fur","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.073179Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.128437Z","response":" It","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.183515Z","response":" is","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.238341Z","response":" an","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.293486Z","response":" agile","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.348684Z","response":" creature","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.403573Z","response":" that","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.458039Z","response":" can","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.512699Z","response":" hop","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.56739Z","response":" around","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.622035Z","response":" quickly","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.68507Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.749912Z","response":" dig","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.812859Z","response":" underground","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.869592Z","response":" bur","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.927083Z","response":"rows","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:44.986013Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.04465Z","response":"","done":true,"done_reason":"stop","context":[128257,9125,198,2675,527,96096,11,264,11190,15592,18328,13,128256,198,128257,882,198,75885,264,39824,304,220,17,2875,23719,128256,198,128257,78191,198,32,39824,374,264,2678,36041,278,3967,369,1202,1317,25212,323,68661,18742,13,1102,374,459,62565,17661,430,649,7598,2212,6288,323,4170,26326,7951,1849,13],"total_duration":6288193959,"load_duration":3271086959,"prompt_eval_count":31,"prompt_eval_duration":1212121291,"eval_count":33,"eval_duration":1803684167}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "dolphin3:8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream_json: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 12 bytes [dolphin3:8b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"dolphin3:8b","prompt":"Describe a rabbit in 2 short sentences"}]
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.212988Z","response":"A","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.269793Z","response":" rabbit","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.325024Z","response":" is","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.380193Z","response":" a","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.435875Z","response":" small","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.491337Z","response":" mamm","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.547654Z","response":"al","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.604207Z","response":" with","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.660671Z","response":" long","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.717757Z","response":" ears","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.773768Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.828402Z","response":" a","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.882878Z","response":" fluffy","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.937455Z","response":" white","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:45.991955Z","response":" coat","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.046697Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.101292Z","response":" They","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.155903Z","response":" are","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.210525Z","response":" known","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.265385Z","response":" for","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.319964Z","response":" their","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.374558Z","response":" quick","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.429334Z","response":" movements","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.483814Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.538437Z","response":" adorable","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.592915Z","response":" behavior","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.647357Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-07-29T18:47:46.702209Z","response":"","done":true,"done_reason":"stop","context":[128257,9125,198,2675,527,96096,11,264,11190,15592,18328,13,128256,198,128257,882,198,75885,264,39824,304,220,17,2875,23719,128256,198,128257,78191,198,32,39824,374,264,2678,36041,278,449,1317,25212,323,264,68661,4251,23724,13,2435,527,3967,369,872,4062,19567,323,41708,7865,13],"total_duration":1606417750,"load_duration":53851500,"prompt_eval_count":31,"prompt_eval_duration":61858500,"eval_count":28,"eval_duration":1490133125}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

[DEBUG] ollama_generate_stream_json: return: 0
```
