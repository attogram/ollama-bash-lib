# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_generate_json "dolphin-mistral:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"dolphin-mistral:7b","created_at":"2025-07-30T16:42:55.582153Z","response":"A rabbit is a small mammal known for its long ears and quick movements, often found in grassy fields and meadows. It is a herbivore that feeds on plants and has sharp teeth for chewing its food efficiently.","done":true,"done_reason":"stop","context":[32001,1587,13,1976,460,15052,721,262,28725,264,10865,16107,13892,28723,13,32000,28705,13,32001,2188,13,22836,264,16479,2581,297,28705,28750,2485,23748,32000,28705,13,32001,13892,13,28741,16479,2581,349,264,1741,27454,282,2651,354,871,1043,12446,304,2936,15071,28725,2608,1419,297,10109,28724,5080,304,528,13456,28723,661,349,264,559,28726,449,431,369,5575,28713,356,9923,304,659,10227,9033,354,997,9988,871,2887,23463,28723],"total_duration":6030111459,"load_duration":2879550625,"prompt_eval_count":37,"prompt_eval_duration":654605416,"eval_count":51,"eval_duration":2492253209}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "dolphin-mistral:7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [dolphin-mistral:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 19 bytes [dolphin-mistral:7b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"dolphin-mistral:7b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
{"model":"dolphin-mistral:7b","created_at":"2025-07-30T16:42:58.175565Z","response":"A rabbit is a small mammal with long ears, soft fur, and an agile body that allows it to move quickly through grassy fields. They are social animals known for their rapid movements and ability to navigate narrow spaces with ease.","done":true,"done_reason":"stop","context":[32001,1587,13,1976,460,15052,721,262,28725,264,10865,16107,13892,28723,13,32000,28705,13,32001,2188,13,22836,264,16479,2581,297,28705,28750,2485,23748,32000,28705,13,32001,13892,13,28741,16479,2581,349,264,1741,27454,282,395,1043,12446,28725,2664,2982,28725,304,396,717,546,2187,369,5976,378,298,2318,4377,1059,10109,28724,5080,28723,1306,460,2809,8222,2651,354,652,8421,15071,304,5537,298,22689,8484,10599,395,12801,28723],"total_duration":2518527333,"load_duration":21910750,"prompt_eval_count":37,"prompt_eval_duration":51519291,"eval_count":50,"eval_duration":2444455792}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
