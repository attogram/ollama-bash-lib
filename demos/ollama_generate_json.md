# ollama_generate_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.0

## Demo

```bash
ollama_generate_json "llava-llama3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"llava-llama3:8b","created_at":"2025-07-29T22:25:24.62111Z","response":"A rabbit is a small, furry animal that has long ears and legs. The body of a rabbit is round with short fur on its back and sides.","done":true,"done_reason":"stop","context":[128006,882,128007,198,198,75885,264,39824,304,220,17,2875,23719,128009,128006,78191,128007,198,198,32,39824,374,264,2678,11,75519,10065,430,706,1317,25212,323,14535,13,578,2547,315,264,39824,374,4883,449,2875,18742,389,1202,1203,323,11314,13],"total_duration":5774357416,"load_duration":3743452291,"prompt_eval_count":18,"prompt_eval_duration":340801375,"eval_count":32,"eval_duration":1689470041}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "llava-llama3:8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [llava-llama3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 16 bytes [llava-llama3:8b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"llava-llama3:8b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
{"model":"llava-llama3:8b","created_at":"2025-07-29T22:25:27.392604Z","response":"A rabbit is a small, furry mammal that typically has long ears and can be found eating grass, leaves or other types of vegetation. They are known for their cute appearance and the fact that they are often associated with Easter celebrations.","done":true,"done_reason":"stop","context":[128006,882,128007,198,198,75885,264,39824,304,220,17,2875,23719,128009,128006,78191,128007,198,198,32,39824,374,264,2678,11,75519,36041,278,430,11383,706,1317,25212,323,649,387,1766,12459,16763,11,11141,477,1023,4595,315,54832,13,2435,527,3967,369,872,19369,11341,323,279,2144,430,814,527,3629,5938,449,33500,47674,13],"total_duration":2697559458,"load_duration":61482083,"prompt_eval_count":18,"prompt_eval_duration":62905125,"eval_count":48,"eval_duration":2572674875}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
