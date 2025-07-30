# ollama_generate_stream_json

A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_generate_stream_json "smollm2:360m" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.429849Z","response":"A","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.44121Z","response":" rabbit","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.452637Z","response":" is","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.46423Z","response":" a","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.475801Z","response":" small","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.48747Z","response":" to","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.499154Z","response":" medium","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.510933Z","response":"-","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.522827Z","response":"sized","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.534783Z","response":" animal","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.547244Z","response":" with","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.55957Z","response":" fluffy","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.571464Z","response":" white","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.583159Z","response":" fur","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.594777Z","response":" and","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.60613Z","response":" a","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.617358Z","response":" round","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.628746Z","response":" body","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.640141Z","response":".","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.651323Z","response":" It","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.662756Z","response":" typically","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.674049Z","response":" has","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.685223Z","response":" a","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.696366Z","response":" long","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.707545Z","response":" tail","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.718574Z","response":" that","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.729772Z","response":" can","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.74105Z","response":" be","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.752309Z","response":" brown","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.763463Z","response":" or","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.774745Z","response":" gray","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.785989Z","response":"ish","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.797165Z","response":",","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.808344Z","response":" and","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.819573Z","response":" it","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.830903Z","response":" often","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.842155Z","response":" hops","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.853535Z","response":" around","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.864851Z","response":" when","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.876108Z","response":" running","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.887358Z","response":".","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:24.898541Z","response":"","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,2,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,49,16024,314,253,1165,288,5641,29,12254,3161,351,33391,2537,9462,284,253,5075,1248,30,657,3431,553,253,986,5193,338,416,325,6354,355,11013,621,28,284,357,1129,38660,1130,645,4108,30],"total_duration":1492804875,"load_duration":916572166,"prompt_eval_count":38,"prompt_eval_duration":105352167,"eval_count":42,"eval_duration":469328208}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "smollm2:360m" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream_json: [smollm2:360m] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [smollm2:360m] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 13 bytes [smollm2:360m]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"smollm2:360m","prompt":"Describe a rabbit in 2 short sentences"}]
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.005479Z","response":"A","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.01739Z","response":" rabbit","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.030094Z","response":" is","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.043607Z","response":" small","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.057384Z","response":" and","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.071606Z","response":" furry","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.086371Z","response":" with","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.100933Z","response":" large","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.116018Z","response":" eyes","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.13049Z","response":".","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.145274Z","response":" It","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.160291Z","response":" has","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.174845Z","response":" long","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.189384Z","response":" ears","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.204041Z","response":" and","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.219013Z","response":" sometimes","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.234113Z","response":" white","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.248839Z","response":" patches","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.263776Z","response":" on","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.278812Z","response":" its","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.293688Z","response":" belly","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.308154Z","response":".","done":false}
{"model":"smollm2:360m","created_at":"2025-07-30T10:43:25.322856Z","response":"","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,2,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,49,16024,314,1165,284,31036,351,1507,3497,30,657,553,986,10006,284,2406,2537,14681,335,624,18747,30],"total_duration":352528667,"load_duration":22006125,"prompt_eval_count":38,"prompt_eval_duration":12078792,"eval_count":23,"eval_duration":317632208}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

[DEBUG] ollama_generate_stream_json: return: 0
```
