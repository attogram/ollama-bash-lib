# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.6

## Demo

```bash
ollama_generate_stream_json "llava:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.198125Z","response":" A","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.248378Z","response":" rab","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.298162Z","response":"bit","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.347373Z","response":" is","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.397029Z","response":" a","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.446483Z","response":" small","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.495906Z","response":",","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.545414Z","response":" her","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.594814Z","response":"b","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.643932Z","response":"iv","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.692923Z","response":"orous","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.741719Z","response":" mamm","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.789979Z","response":"al","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.839005Z","response":" known","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.887385Z","response":" for","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.936122Z","response":" its","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:12.984417Z","response":" long","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.033207Z","response":" ears","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.082107Z","response":" and","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.131414Z","response":" fl","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.180527Z","response":"uffy","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.22921Z","response":" tail","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.278203Z","response":".","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.326987Z","response":" They","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.375008Z","response":" are","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.423566Z","response":" commonly","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.472121Z","response":" found","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.52206Z","response":" in","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.571539Z","response":" grass","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.620681Z","response":"lands","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.669601Z","response":" and","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.718Z","response":" me","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.767106Z","response":"adows","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.816211Z","response":",","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.86542Z","response":" where","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.91446Z","response":" they","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:13.963602Z","response":" gra","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.012149Z","response":"ze","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.060792Z","response":" on","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.109176Z","response":" veget","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.158404Z","response":"ation","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.206525Z","response":".","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.255535Z","response":" ","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.306333Z","response":"","done":true,"done_reason":"stop","context":[733,16289,28793,27984,264,16479,2581,297,28705,28750,2485,23748,733,28748,16289,28793,330,16479,2581,349,264,1741,28725,559,28726,449,15138,27454,282,2651,354,871,1043,12446,304,972,23892,8675,28723,1306,460,14473,1419,297,10109,5603,304,528,13456,28725,970,590,18216,1374,356,10035,352,28723,28705],"total_duration":5613780000,"load_duration":3131101959,"prompt_eval_count":17,"prompt_eval_duration":372040208,"eval_count":44,"eval_duration":2108621417}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "llava:7b" "Describe a rabbit in 2 short sentences"
```
```json
[DEBUG] ollama_generate_stream_json: [llava:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [llava:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 9 bytes [llava:7b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"llava:7b","prompt":"Describe a r]
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.437171Z","response":" A","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.487506Z","response":" rab","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.537976Z","response":"bit","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.588475Z","response":" is","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.63889Z","response":" a","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.688728Z","response":" small","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.737591Z","response":",","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.786172Z","response":" fur","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.834272Z","response":"ry","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.882552Z","response":" mamm","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.930898Z","response":"al","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:14.978865Z","response":" with","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.027526Z","response":" long","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.075946Z","response":" ears","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.124207Z","response":" and","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.172109Z","response":" a","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.220691Z","response":" fl","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.269001Z","response":"uffy","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.316998Z","response":" tail","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.365462Z","response":".","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.413906Z","response":" They","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.46272Z","response":" are","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.510879Z","response":" known","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.559725Z","response":" for","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.607958Z","response":" their","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.656794Z","response":" ability","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.705875Z","response":" to","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.755593Z","response":" produce","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.804733Z","response":" a","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.854143Z","response":" lot","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.902422Z","response":" of","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.95048Z","response":" po","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:15.999003Z","response":"op","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.048643Z","response":" and","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.097465Z","response":" are","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.145857Z","response":" often","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.194306Z","response":" kept","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.243596Z","response":" as","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.294726Z","response":" pets","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.344912Z","response":" or","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.398292Z","response":" raised","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.448347Z","response":" for","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.496581Z","response":" their","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.545264Z","response":" meat","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.59365Z","response":" and","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.64253Z","response":" fur","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.691751Z","response":".","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.741681Z","response":" ","done":false}
{"model":"llava:7b","created_at":"2025-07-30T20:42:16.79197Z","response":"","done":true,"done_reason":"stop","context":[733,16289,28793,27984,264,16479,2581,297,28705,28750,2485,23748,733,28748,16289,28793,330,16479,2581,349,264,1741,28725,2982,643,27454,282,395,1043,12446,304,264,972,23892,8675,28723,1306,460,2651,354,652,5537,298,7072,264,2055,302,1627,410,304,460,2608,4558,390,24642,442,6333,354,652,10228,304,2982,28723,28705],"total_duration":2419097917,"load_duration":12877667,"prompt_eval_count":17,"prompt_eval_duration":50073959,"eval_count":49,"eval_duration":2355541708}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
