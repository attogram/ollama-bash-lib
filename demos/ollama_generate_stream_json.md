# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.25

## Demo

```bash
ollama_generate_stream_json "dolphin3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:00.867628Z","response":"A","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:00.9214831Z","response":" rabbit","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:00.9713971Z","response":" is","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.0192344Z","response":" a","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.0667566Z","response":" small","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.1142577Z","response":" mamm","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.1606179Z","response":"al","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.207927Z","response":" known","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.2547062Z","response":" for","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.3026473Z","response":" its","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.349538Z","response":" long","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.3953813Z","response":" ears","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.4437644Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.4900755Z","response":" soft","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.5379197Z","response":" fur","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.5842776Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.6318509Z","response":" It","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.6811861Z","response":" is","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.7280576Z","response":" often","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.7753887Z","response":" seen","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.8228656Z","response":" hopping","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.8706555Z","response":" around","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.9206185Z","response":" in","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:01.9660096Z","response":" grass","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:02.0145536Z","response":"y","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:02.0636235Z","response":" fields","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:02.1114414Z","response":" or","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:02.1601217Z","response":" bur","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:02.2074315Z","response":"rowing","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:02.2559429Z","response":" underground","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:02.3025276Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:02.3519154Z","response":"","done":true,"done_reason":"stop","context":[128257,9125,198,2675,527,96096,11,264,11190,15592,18328,13,128256,198,128257,882,198,75885,264,39824,304,220,17,2875,23719,128256,198,128257,78191,198,32,39824,374,264,2678,36041,278,3967,369,1202,1317,25212,323,8579,18742,13,1102,374,3629,3970,93338,2212,304,16763,88,5151,477,7951,25156,26326,13],"total_duration":5397760600,"load_duration":3691191000,"prompt_eval_count":31,"prompt_eval_duration":220642000,"eval_count":32,"eval_duration":1485422000}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "dolphin3:8b" "Describe a rabbit in 2 short sentences"
```
```json
[DEBUG] ollama_generate_stream_json: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_clean: 12 bytes [dolphin3:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"dolphin3:8b","prompt":"Describe ]
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.2417988Z","response":"A","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.2903084Z","response":" rabbit","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.3403017Z","response":" is","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.389512Z","response":" a","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.4362354Z","response":" small","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.4843723Z","response":" mamm","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.5306678Z","response":"al","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.5770326Z","response":" with","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.6229744Z","response":" long","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.670993Z","response":" ears","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.7209532Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.7680811Z","response":" fluffy","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.8152102Z","response":" fur","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.8626588Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.9090941Z","response":" They","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:03.9548996Z","response":" are","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.0024503Z","response":" known","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.0516615Z","response":" for","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.0974079Z","response":" their","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.1444445Z","response":" fast","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.1920409Z","response":" hopping","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.2386868Z","response":" movements","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.2866633Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.3325596Z","response":" their","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.3803089Z","response":" ability","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.427274Z","response":" to","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.4752902Z","response":" multiply","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.5215482Z","response":" rapidly","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.5702132Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-01T19:22:04.6179283Z","response":"","done":true,"done_reason":"stop","context":[128257,9125,198,2675,527,96096,11,264,11190,15592,18328,13,128256,198,128257,882,198,75885,264,39824,304,220,17,2875,23719,128256,198,128257,78191,198,32,39824,374,264,2678,36041,278,449,1317,25212,323,68661,18742,13,2435,527,3967,369,872,5043,93338,19567,323,872,5845,311,31370,19019,13],"total_duration":1454616200,"load_duration":27751400,"prompt_eval_count":31,"prompt_eval_duration":48476100,"eval_count":30,"eval_duration":1377871000}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
