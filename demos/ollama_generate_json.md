# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.6

## Demo

```bash
ollama_generate_json "granite3.3:2b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"granite3.3:2b","created_at":"2025-07-30T20:41:54.191171Z","response":"1. A rabbit is a small, often fluffy mammal known for its long ears and swift, powerful hind legs. 2. Typically characterized by their gentle demeanor and herbivorous diet, rabbits are popular pets worldwide due to their cute appearance and ease of care.","done":true,"done_reason":"stop","context":[49152,2946,49153,39558,390,17071,2821,44,30468,225,36,34,36,38,32,203,4282,884,8080,278,659,30,18909,810,25697,32,2448,884,312,17247,19551,47330,32,0,203,49152,496,49153,8591,312,40810,328,225,36,4504,28842,0,203,49152,17594,49153,35,32,399,40810,438,312,5532,30,12270,2022,2966,107,345,404,7904,8967,436,2819,1946,484,4177,461,34574,30,27196,420,552,999,5360,32,225,36,32,44677,5341,1191,810,3623,485,304,274,409,6009,271,461,7791,84,387,271,3291,2068,364,30,540,360,5960,884,23068,298,5231,5788,15216,7254,372,3623,281,1142,27983,461,12935,432,9347,32],"total_duration":2867543541,"load_duration":34530833,"prompt_eval_count":51,"prompt_eval_duration":1125967250,"eval_count":74,"eval_duration":1706188875}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "granite3.3:2b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [granite3.3:2b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 14 bytes [granite3.3:2b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"granite3.3:2b","prompt":"Describ]
{"model":"granite3.3:2b","created_at":"2025-07-30T20:41:55.614788Z","response":"Rabbits are small mammals known for their long ears and fluffy tails. They are herbivores, primarily feeding on grasses and leaves, and are recognized for their high reproductive rate.","done":true,"done_reason":"stop","context":[49152,2946,49153,39558,390,17071,2821,44,30468,225,36,34,36,38,32,203,4282,884,8080,278,659,30,18909,810,25697,32,2448,884,312,17247,19551,47330,32,0,203,49152,496,49153,8591,312,40810,328,225,36,4504,28842,0,203,49152,17594,49153,68,360,5960,884,5532,345,38169,3528,8967,436,3623,1946,484,4177,461,2022,2966,107,273,1535,32,11228,884,7791,84,387,6845,30,37897,6985,299,544,2914,2515,461,26243,30,461,884,27149,436,3623,3857,316,2445,661,7692,32],"total_duration":1325463875,"load_duration":33505541,"prompt_eval_count":51,"prompt_eval_duration":23969125,"eval_count":49,"eval_duration":1266857041}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
