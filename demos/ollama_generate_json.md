# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.5

## Demo

```bash
ollama_generate_json "llava-llama3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"llava-llama3:8b","created_at":"2025-07-30T22:45:30.180704Z","response":"Rabbits are small, furry animals with long ears and big eyes. They have strong hind legs that allow them to jump high into the air.","done":true,"done_reason":"stop","context":[128006,882,128007,198,198,75885,264,39824,304,220,17,2875,23719,128009,128006,78191,128007,198,198,49,370,11777,527,2678,11,75519,10099,449,1317,25212,323,2466,6548,13,2435,617,3831,48419,14535,430,2187,1124,311,7940,1579,1139,279,3805,13],"total_duration":1890731250,"load_duration":56312750,"prompt_eval_count":18,"prompt_eval_duration":56918875,"eval_count":31,"eval_duration":1777016291}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "llava-llama3:8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [llava-llama3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 16 bytes [llava-llama3:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"llava-llama3:8b","prompt":"Descr]
{"model":"llava-llama3:8b","created_at":"2025-07-30T22:45:32.134008Z","response":"A cute, fluffy creature with large ears and long whiskers. It has a white body covered with soft fur, and a long, strong tail.","done":true,"done_reason":"stop","context":[128006,882,128007,198,198,75885,264,39824,304,220,17,2875,23719,128009,128006,78191,128007,198,198,32,19369,11,68661,17661,449,3544,25212,323,1317,41759,388,13,1102,706,264,4251,2547,9960,449,8579,18742,11,323,264,1317,11,3831,9986,13],"total_duration":1883878542,"load_duration":54672458,"prompt_eval_count":18,"prompt_eval_duration":59277541,"eval_count":31,"eval_duration":1769426584}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
