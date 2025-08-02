# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.20

## Demo

```bash
ollama_generate_stream_json "dolphin3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.4452655Z","response":"A","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.4724632Z","response":" rabbit","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.496107Z","response":" is","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.5188217Z","response":" a","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.5413507Z","response":" small","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.5634174Z","response":" mamm","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.5861703Z","response":"al","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.6083739Z","response":" known","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.6307825Z","response":" for","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.6547152Z","response":" its","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.6763913Z","response":" long","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.6984838Z","response":" ears","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.7223599Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.7438978Z","response":" fluffy","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.7663058Z","response":" fur","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.7903263Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.8117102Z","response":" Rab","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.8338592Z","response":"bits","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.8570763Z","response":" often","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.879207Z","response":" hop","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.9013187Z","response":" around","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.9252412Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.9470659Z","response":" can","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.9692466Z","response":" be","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:23.9929402Z","response":" found","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.0148661Z","response":" in","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.0392197Z","response":" various","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.0619313Z","response":" colors","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.0834695Z","response":" including","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.1062769Z","response":" white","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.1284779Z","response":",","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.1514588Z","response":" brown","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.1743753Z","response":",","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.1971117Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.2217903Z","response":" gray","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.2437572Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.2664907Z","response":"","done":true,"done_reason":"stop","context":[128257,9125,198,2675,527,96096,11,264,11190,15592,18328,13,128256,198,128257,882,198,75885,264,39824,304,220,17,2875,23719,128256,198,128257,78191,198,32,39824,374,264,2678,36041,278,3967,369,1202,1317,25212,323,68661,18742,13,36824,11777,3629,7598,2212,323,649,387,1766,304,5370,8146,2737,4251,11,14198,11,323,18004,13],"total_duration":2609028500,"load_duration":1667040600,"prompt_eval_count":31,"prompt_eval_duration":116817000,"eval_count":37,"eval_duration":824111500}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "dolphin3:8b" "Describe a rabbit in 2 short sentences"
```
```json
[DEBUG] ollama_generate_stream_json: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "dolphin3:8b",
  "prompt": "D]
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.6063312Z","response":"A","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.6289879Z","response":" rabbit","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.6522416Z","response":" is","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.6752987Z","response":" a","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.696877Z","response":" small","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.720099Z","response":" mamm","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.7432706Z","response":"al","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.7659085Z","response":" known","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.786874Z","response":" for","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.8111298Z","response":" its","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.8338981Z","response":" long","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.8566916Z","response":" ears","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.8785367Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.9012786Z","response":" fluffy","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.9246747Z","response":" tail","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.9465511Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.9700012Z","response":" They","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:24.9924308Z","response":" typically","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.0155116Z","response":" have","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.0376836Z","response":" soft","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.0611249Z","response":" fur","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.083977Z","response":" and","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.1068415Z","response":" hop","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.1290981Z","response":" around","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.1520263Z","response":" using","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.1747555Z","response":" their","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.1972252Z","response":" powerful","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.219694Z","response":" hind","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.2420451Z","response":" legs","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.2643734Z","response":".","done":false}
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:25.2882703Z","response":"","done":true,"done_reason":"stop","context":[128257,9125,198,2675,527,96096,11,264,11190,15592,18328,13,128256,198,128257,882,198,75885,264,39824,304,220,17,2875,23719,128256,198,128257,78191,198,32,39824,374,264,2678,36041,278,3967,369,1202,1317,25212,323,68661,9986,13,2435,11383,617,8579,18742,323,7598,2212,1701,872,8147,48419,14535,13],"total_duration":735187200,"load_duration":27962900,"prompt_eval_count":31,"prompt_eval_duration":2096200,"eval_count":31,"eval_duration":703599200}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
