# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

## Demo

```bash
ollama_generate_json "gemma3n:e2b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"gemma3n:e2b","created_at":"2025-07-31T22:04:20.700251Z","response":"A rabbit is a small, long-eared mammal known for its powerful hind legs and twitching nose.  They are herbivores, often found hopping through meadows and burrows, and are beloved for their gentle nature. \n","done":true,"done_reason":"stop","context":[105,2364,107,82858,496,27973,528,236743,236778,2822,23974,106,107,105,4368,107,236776,27973,563,496,1944,236764,1440,236772,28556,121921,3224,573,1061,8632,26058,14897,532,97899,522,18410,236761,236743,2195,659,212811,236764,3187,1765,85834,1343,236743,167152,15940,532,518,217216,8548,236764,532,659,27867,573,910,2676,172639,236744,4135,236761,236743,107],"total_duration":5039583459,"load_duration":3072818459,"prompt_eval_count":17,"prompt_eval_duration":629813667,"eval_count":46,"eval_duration":1336371750}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "gemma3n:e2b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [gemma3n:e2b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 12 bytes [gemma3n:e2b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"gemma3n:e2b","prompt":"Describe ]
{"model":"gemma3n:e2b","created_at":"2025-07-31T22:04:22.249339Z","response":"A rabbit is a small, long-eared mammal known for its twitching nose and powerful hind legs. They are herbivores, often found hopping through fields and burrows, and are beloved for their cute and gentle nature. \n","done":true,"done_reason":"stop","context":[105,2364,107,82858,496,27973,528,236743,236778,2822,23974,106,107,105,4368,107,236776,27973,563,496,1944,236764,1440,236772,28556,121921,3224,573,1061,97899,522,18410,532,8632,26058,14897,236761,2195,659,212811,236764,3187,1765,85834,1343,6192,532,518,217216,8548,236764,532,659,27867,573,910,12864,532,2676,172639,236744,4135,236761,236743,107],"total_duration":1463621041,"load_duration":81407958,"prompt_eval_count":17,"prompt_eval_duration":31756250,"eval_count":47,"eval_duration":1350044917}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
