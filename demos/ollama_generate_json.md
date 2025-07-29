# ollama_generate_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1

## Demo

```bash
ollama_generate_json "llava-phi3:3.8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"llava-phi3:3.8b","created_at":"2025-07-29T18:42:41.586797Z","response":"\nA bunny is a small, furry mammal known for its long ears and strong hind legs. Rabbits are herbivores, which means they primarily eat grass and vegetables.","done":true,"done_reason":"stop","context":[32010,29871,13,4002,29581,263,27127,277,297,29871,29906,3273,25260,32007,29871,13,32001,29871,13,13,29909,289,348,1460,338,263,2319,29892,3261,719,286,4850,284,2998,363,967,1472,22827,322,4549,298,513,21152,29889,390,8846,1169,526,902,29890,440,2361,29892,607,2794,896,19434,17545,17455,322,18655,1849,29889],"total_duration":3755642958,"load_duration":2123504666,"prompt_eval_count":20,"prompt_eval_duration":285510625,"eval_count":45,"eval_duration":1345984791}```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "llava-phi3:3.8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [llava-phi3:3.8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 16 bytes [llava-phi3:3.8b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"llava-phi3:3.8b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
{"model":"llava-phi3:3.8b","created_at":"2025-07-29T18:42:43.482451Z","response":"1. A bunny is a cute, fluffy creature with long ears and a short tail.\n2. Rabbits are herbivores that typically live in burrows or hutches and can run at speeds of up to 45 mph.","done":true,"done_reason":"stop","context":[32010,29871,13,4002,29581,263,27127,277,297,29871,29906,3273,25260,32007,29871,13,32001,29871,13,29896,29889,319,289,348,1460,338,263,274,1082,29892,1652,3096,29891,23940,411,1472,22827,322,263,3273,12464,29889,13,29906,29889,390,8846,1169,526,902,29890,440,2361,393,12234,5735,297,6866,5727,470,298,329,6609,322,508,1065,472,961,5779,310,701,304,29871,29946,29945,286,561,29889],"total_duration":1842153000,"load_duration":11766250,"prompt_eval_count":20,"prompt_eval_duration":30432333,"eval_count":60,"eval_duration":1799530917}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
```
