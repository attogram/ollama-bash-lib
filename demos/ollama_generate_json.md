# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.4

## Demo

```bash
ollama_generate_json "gemma:2b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"gemma:2b","created_at":"2025-07-30T20:13:46.336418Z","response":"Sure, here is a description of a rabbit in 2 short sentences:\n\n* A rabbit is a small mammal with long, soft fur and a long, slender body.\n* Rabbits are herbivores and are known for their ability to eat a wide variety of plants.","done":true,"done_reason":"stop","context":[968,2997,235298,559,235298,15508,235313,1645,108,50721,476,30358,575,235248,235284,3309,26099,107,235248,108,235322,2997,235298,559,235298,15508,235313,2516,108,21404,235269,1517,603,476,5966,576,476,30358,575,235248,235284,3309,26099,235292,109,235287,586,30358,603,476,2301,59178,675,1497,235269,4072,10749,578,476,1497,235269,49918,2971,235265,108,235287,207891,708,43959,206439,578,708,3836,604,1024,7374,577,7812,476,5396,8080,576,7652,235265],"total_duration":3395583833,"load_duration":1787671500,"prompt_eval_count":30,"prompt_eval_duration":459842875,"eval_count":56,"eval_duration":1146207375}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "gemma:2b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [gemma:2b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 9 bytes [gemma:2b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"gemma:2b","prompt":"Describe a r]
{"model":"gemma:2b","created_at":"2025-07-30T20:13:47.50562Z","response":"Sure. Here's a description of a rabbit:\n\nA rabbit is a small mammal with long, soft fur that is often white or gray in color. Rabbits are herbivores and are known for their ability to hop and dig.","done":true,"done_reason":"stop","context":[968,2997,235298,559,235298,15508,235313,1645,108,50721,476,30358,575,235248,235284,3309,26099,107,235248,108,235322,2997,235298,559,235298,15508,235313,2516,108,21404,235265,5698,235303,235256,476,5966,576,476,30358,235292,109,235280,30358,603,476,2301,59178,675,1497,235269,4072,10749,674,603,3695,2674,689,13676,575,2881,235265,207891,708,43959,206439,578,708,3836,604,1024,7374,577,7451,578,3441,235265],"total_duration":1072838250,"load_duration":66040167,"prompt_eval_count":30,"prompt_eval_duration":20916083,"eval_count":48,"eval_duration":985342750}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
