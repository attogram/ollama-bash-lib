# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.10

## Demo

```bash
ollama_generate_json "granite3.3:2b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"granite3.3:2b","created_at":"2025-07-31T18:33:18.686991Z","response":"1. A rabbit is a small, fluffy mammal known for its long ears and rapid hopping ability. 2. They are herbivorous, primarily feeding on grasses and other vegetation, and are often associated with purity and gentleness in various cultures.","done":true,"done_reason":"stop","context":[49152,2946,49153,39558,390,17071,2821,44,30468,225,36,34,36,38,32,203,4282,884,8080,278,659,30,18909,810,25697,32,2448,884,312,17247,19551,47330,32,0,203,49152,496,49153,8591,312,40810,328,225,36,4504,28842,0,203,49152,17594,49153,35,32,399,40810,438,312,5532,30,2022,2966,107,345,404,7904,8967,436,2819,1946,484,4177,461,26671,23592,7075,13609,32,225,36,32,11228,884,7791,84,387,271,3291,30,37897,6985,299,544,2914,2515,461,1604,5292,371,367,30,461,884,12270,5746,623,298,3673,461,485,304,1657,503,328,10297,40765,3009,32],"total_duration":3359924083,"load_duration":1524495458,"prompt_eval_count":51,"prompt_eval_duration":307725667,"eval_count":67,"eval_duration":1525981000}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "granite3.3:2b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [granite3.3:2b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 14 bytes [granite3.3:2b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"granite3.3:2b","prompt":"Describ]
{"model":"granite3.3:2b","created_at":"2025-07-31T18:33:21.272535Z","response":"1. A rabbit is a small, predominantly white, fluffy mammal known for its long ears and powerful hind legs, capable of hopping at high speeds over various terrains. 2. They are herbivorous, feeding primarily on grasses, leaves, and roots, with a distinctive, rapid tail-thumping behavior when startled or agitated.","done":true,"done_reason":"stop","context":[49152,2946,49153,39558,390,17071,2821,44,30468,225,36,34,36,38,32,203,4282,884,8080,278,659,30,18909,810,25697,32,2448,884,312,17247,19551,47330,32,0,203,49152,496,49153,8591,312,40810,328,225,36,4504,28842,0,203,49152,17594,49153,35,32,399,40810,438,312,5532,30,4626,418,30512,631,8400,30,2022,2966,107,345,404,7904,8967,436,2819,1946,484,4177,461,27196,420,552,999,5360,30,31582,432,23592,7075,821,3857,8227,101,2288,10297,273,530,1907,32,225,36,32,11228,884,7791,84,387,271,3291,30,6985,299,37897,544,2914,2515,30,26243,30,461,33032,30,623,312,19088,661,30,26671,13203,31,349,2277,299,5853,1412,1477,1231,556,1894,283,733,32],"total_duration":2500621666,"load_duration":20802375,"prompt_eval_count":51,"prompt_eval_duration":23280584,"eval_count":91,"eval_duration":2455885583}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
