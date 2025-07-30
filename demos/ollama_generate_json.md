# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0

## Demo

```bash
ollama_generate_json "mistral:7b-instruct" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"mistral:7b-instruct","created_at":"2025-07-30T21:18:32.459948Z","response":" A rabbit is a small, herbivorous mammal with long ears, fluffy fur, and a long tail. It is known for its quick hopping motion and burrowing habits.","done":true,"done_reason":"stop","context":[3,29473,28752,1032,17247,3349,1065,29473,29518,3253,24516,4,29473,1098,17247,3349,1117,1032,2509,29493,1327,29494,1217,15906,28222,1050,1163,1811,13214,29493,1740,24660,3750,29493,1072,1032,1811,9443,29491,1429,1117,3419,1122,1639,3704,5422,3685,8804,1072,5332,1439,1056,20073,29491],"total_duration":5520645625,"load_duration":2636092250,"prompt_eval_count":13,"prompt_eval_duration":808752167,"eval_count":42,"eval_duration":2074941375}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "mistral:7b-instruct" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [mistral:7b-instruct] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 20 bytes [mistral:7b-instruct]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"mistral:7b-instruct","prompt":"D]
{"model":"mistral:7b-instruct","created_at":"2025-07-30T21:18:34.579378Z","response":" A rabbit is a small, herbivorous mammal with long ears, fluffy tail, and a cottontail. It's commonly found hopping around open grasslands.","done":true,"done_reason":"stop","context":[3,29473,28752,1032,17247,3349,1065,29473,29518,3253,24516,4,29473,1098,17247,3349,1117,1032,2509,29493,1327,29494,1217,15906,28222,1050,1163,1811,13214,29493,1740,24660,9443,29493,1072,1032,1045,2330,1445,1382,29491,1429,29510,29481,15241,2187,5422,3685,2169,2333,10877,6371,29491],"total_duration":2030667375,"load_duration":22350167,"prompt_eval_count":13,"prompt_eval_duration":49851875,"eval_count":41,"eval_duration":1957643000}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
