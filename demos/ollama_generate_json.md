# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.2

## Demo

```bash
ollama_generate_json "llava:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"llava:7b","created_at":"2025-07-30T17:45:50.970926Z","response":" A rabbit is a small, furry animal with long ears and a fluffy tail. They are known for their ability to burrow underground and their diet mainly consists of grass, leaves, and bark. ","done":true,"done_reason":"stop","context":[733,16289,28793,27984,264,16479,2581,297,28705,28750,2485,23748,733,28748,16289,28793,330,16479,2581,349,264,1741,28725,2982,643,8527,395,1043,12446,304,264,972,23892,8675,28723,1306,460,2651,354,652,5537,298,4564,671,21059,304,652,9751,11464,12335,302,10109,28725,8049,28725,304,19976,28723,28705],"total_duration":6152852875,"load_duration":3135700334,"prompt_eval_count":17,"prompt_eval_duration":898912417,"eval_count":44,"eval_duration":2116703208}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "llava:7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [llava:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 9 bytes [llava:7b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"llava:7b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
{"model":"llava:7b","created_at":"2025-07-30T17:45:54.118407Z","response":" A rabbit is a small, furry mammal. It belongs to the family Leporidae and is known for its long ears, fluffy tail, and powerful hind legs. Rabbits are commonly found in grasslands and forests around the world, and they are often kept as pets. ","done":true,"done_reason":"stop","context":[733,16289,28793,27984,264,16479,2581,297,28705,28750,2485,23748,733,28748,16289,28793,330,16479,2581,349,264,1741,28725,2982,643,27454,282,28723,661,17827,298,272,2005,393,615,271,7305,304,349,2651,354,871,1043,12446,28725,972,23892,8675,28725,304,6787,21413,7969,28723,17467,7669,460,14473,1419,297,10109,5603,304,25770,1401,272,1526,28725,304,590,460,2608,4558,390,24642,28723,28705],"total_duration":3063710750,"load_duration":19000875,"prompt_eval_count":17,"prompt_eval_duration":49703375,"eval_count":62,"eval_duration":2994226542}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
