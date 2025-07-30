# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.5

## Demo

```bash
ollama_generate_json "dolphin-mistral:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"dolphin-mistral:7b","created_at":"2025-07-30T20:32:00.00466Z","response":"A rabbit is a small mammal known for its long ears and soft fur, with a characteristic hopping gait that helps them move swiftly across the ground. They are common in nature reserves and make excellent pets due to their playful and affectionate nature.","done":true,"done_reason":"stop","context":[32001,1587,13,1976,460,15052,721,262,28725,264,10865,16107,13892,28723,13,32000,28705,13,32001,2188,13,22836,264,16479,2581,297,28705,28750,2485,23748,32000,28705,13,32001,13892,13,28741,16479,2581,349,264,1741,27454,282,2651,354,871,1043,12446,304,2664,2982,28725,395,264,17845,4654,2917,319,1022,369,7263,706,2318,20029,346,2673,272,3414,28723,1306,460,3298,297,4735,26863,304,1038,8099,24642,2940,298,652,1156,1007,304,21147,380,4735,28723],"total_duration":5882015625,"load_duration":2690111292,"prompt_eval_count":37,"prompt_eval_duration":545143667,"eval_count":55,"eval_duration":2645618125}
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
[DEBUG] ollama_api_post: [/api/generate] [{"model":"dolphin-mistral:7b","prompt":"De]
{"model":"dolphin-mistral:7b","created_at":"2025-07-30T20:32:03.889524Z","response":"A rabbit is a small, furry mammal with long ears and strong hind legs, commonly found in grasslands or forests. They are herbivores that feed on leaves, stems, and fruits. Rabbits are known for their agility and can jump up to three feet high and move at speeds of about 15 miles per hour when startled.","done":true,"done_reason":"stop","context":[32001,1587,13,1976,460,15052,721,262,28725,264,10865,16107,13892,28723,13,32000,28705,13,32001,2188,13,22836,264,16479,2581,297,28705,28750,2485,23748,32000,28705,13,32001,13892,13,28741,16479,2581,349,264,1741,28725,2982,643,27454,282,395,1043,12446,304,2967,21413,7969,28725,14473,1419,297,10109,5603,442,25770,28723,1306,460,559,28726,449,3626,369,5575,356,8049,28725,341,7940,28725,304,21566,28723,17467,7669,460,2651,354,652,717,1232,304,541,6483,582,298,1712,4051,1486,304,2318,438,27480,302,684,28705,28740,28782,6052,660,5115,739,1149,1006,28723],"total_duration":3809341083,"load_duration":20520500,"prompt_eval_count":37,"prompt_eval_duration":50337375,"eval_count":77,"eval_duration":3737878791}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
