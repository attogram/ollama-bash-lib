# ollama_generate_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1

## Demo

```bash
ollama_generate_json "granite3.3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"granite3.3:8b","created_at":"2025-07-29T18:47:29.444919Z","response":"1. Rabbits are small, long-eared mammals known for their powerful hind limbs and quick reproduction rates. 2. They primarily inhabit meadows, woods, forests, and grasslands, feeding on grasses, dandelions, and various vegetables.","done":true,"done_reason":"stop","context":[49152,2946,49153,39558,390,17071,2821,44,30468,225,36,34,36,38,32,203,4282,884,8080,278,659,30,18909,810,25697,32,2448,884,312,17247,19551,47330,32,0,203,49152,496,49153,8591,312,40810,328,225,36,4504,28842,0,203,49152,17594,49153,35,32,559,360,5960,884,5532,30,1946,31,87,1941,345,38169,3528,8967,436,3623,27196,420,552,1024,1232,101,461,8271,41485,26059,32,225,36,32,11228,37897,328,44007,597,4111,101,30,41878,101,30,3496,21437,30,461,2914,350,25746,30,6985,299,544,2914,2515,30,13085,4025,1785,30,461,10297,5292,371,6975,32],"total_duration":7914706959,"load_duration":3193249459,"prompt_eval_count":51,"prompt_eval_duration":670974959,"eval_count":68,"eval_duration":4049786791}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "granite3.3:8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [granite3.3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 14 bytes [granite3.3:8b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"granite3.3:8b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
{"model":"granite3.3:8b","created_at":"2025-07-29T18:47:33.31835Z","response":"A rabbit is a small, soft-furred mammal known for its long ears and powerful hind legs, which enable quick bursts of speed. They are herbivores, primarily consuming grasses or soft plants, and are often found in burrows or warrens.","done":true,"done_reason":"stop","context":[49152,2946,49153,39558,390,17071,2821,44,30468,225,36,34,36,38,32,203,4282,884,8080,278,659,30,18909,810,25697,32,2448,884,312,17247,19551,47330,32,0,203,49152,496,49153,8591,312,40810,328,225,36,4504,28842,0,203,49152,17594,49153,51,40810,438,312,5532,30,16783,31,88,9638,345,404,7904,8967,436,2819,1946,484,4177,461,27196,420,552,999,5360,30,1510,5352,8271,23598,21437,432,8227,32,11228,884,7791,84,387,6845,30,37897,44097,2914,2515,556,16783,1278,2376,30,461,884,12270,2431,328,23598,2138,556,18515,1575,101,32],"total_duration":3821257792,"load_duration":17762250,"prompt_eval_count":51,"prompt_eval_duration":60934334,"eval_count":63,"eval_duration":3741950041}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
