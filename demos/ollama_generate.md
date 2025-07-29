# ollama_generate
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.0

## Demo

```bash
ollama_generate "mistral:7b-instruct" "Describe a rabbit in 2 short sentences"
```
```json
 A rabbit is a small mammal, typically with long ears and fluffy fur, known for its quick, hopping movements and cottontail. It is a common pet and often associated with Easter traditions.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "mistral:7b-instruct" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate: [mistral:7b-instruct] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [mistral:7b-instruct] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 20 bytes [mistral:7b-instruct]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"mistral:7b-instruct","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 827 bytes
[DEBUG] jq_sanitize: 827 bytes [{"model":"mistral:7b-instruct","created_at":"2025-07-29T17:56:59.258112Z","response":" A rabbit is a small, herbivorous mammal with long ears and fluffy fur, commonly recognized for its quick agility. It belongs to the family Leporidae and is often kept as a pet or raised for meat production.","done":true,"done_reason":"stop","context":[3,29473,28752,1032,17247,3349,1065,29473,29518,3253,24516,4,29473,1098,17247,3349,1117,1032,2509,29493,1327,29494,1217,15906,28222,1050,1163,1811,13214,1072,1740,24660,3750,29493,15241,10867,1122,1639,3704,1485,2000,29491,1429,18595,1066,1040,2773,1161,1383,1039,8073,1072,1117,3376,5326,1158,1032,6176,1210,7101,1122,10996,5653,29491],"total_duration":2534087958,"load_duration":19184250,"prompt_eval_count":13,"prompt_eval_duration":52309959,"eval_count":52,"eval_duration":2461921375}]
 A rabbit is a small, herbivorous mammal with long ears and fluffy fur, commonly recognized for its quick agility. It belongs to the family Leporidae and is often kept as a pet or raised for meat production.
[DEBUG] ollama_generate_stream_json: return: 0
```
