# ollama_generate
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1

## Demo

```bash
ollama_generate "dolphin-mistral:7b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, long-eared mammal with soft fur and a bushy tail. They are known for their agility, speed, and excellent sense of hearing.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "dolphin-mistral:7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate: [dolphin-mistral:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [dolphin-mistral:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 19 bytes [dolphin-mistral:7b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"dolphin-mistral:7b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 879 bytes
[DEBUG] jq_sanitize: 879 bytes [{"model":"dolphin-mistral:7b","created_at":"2025-07-29T18:47:21.35047Z","response":"A rabbit is a small, furry mammal known for its long ears and speedy movements. They live mainly in burrows and can be found in various environments such as grasslands, forests, and deserts.","done":true,"done_reason":"stop","context":[32001,1587,13,1976,460,15052,721,262,28725,264,10865,16107,13892,28723,13,32000,28705,13,32001,2188,13,22836,264,16479,2581,297,28705,28750,2485,23748,32000,28705,13,32001,13892,13,28741,16479,2581,349,264,1741,28725,2982,643,27454,282,2651,354,871,1043,12446,304,4975,28724,15071,28723,1306,2943,11464,297,4564,3541,304,541,347,1419,297,4118,20031,1259,390,10109,5603,28725,25770,28725,304,634,9916,28723],"total_duration":2277145041,"load_duration":27502166,"prompt_eval_count":37,"prompt_eval_duration":49406459,"eval_count":46,"eval_duration":2199506375}]
A rabbit is a small, furry mammal known for its long ears and speedy movements. They live mainly in burrows and can be found in various environments such as grasslands, forests, and deserts.
[DEBUG] ollama_generate_stream_json: return: 0
```
