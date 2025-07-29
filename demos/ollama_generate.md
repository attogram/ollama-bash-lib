# ollama_generate
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1

## Demo

```bash
ollama_generate "smollm2:1.7b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small mammal with large ears, fluffy fur, and typically white or colored spots. It primarily feeds on plants and has a hopping motion.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "smollm2:1.7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate: [smollm2:1.7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [smollm2:1.7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 13 bytes [smollm2:1.7b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"smollm2:1.7b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 762 bytes
[DEBUG] jq_sanitize: 762 bytes [{"model":"smollm2:1.7b","created_at":"2025-07-29T18:42:37.636348Z","response":"Rabbits are small mammals with long ears, strong hind legs, and fluffy fur. They live on land, mostly eat plants, and are known for their ability to dig burrows.","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,34750,9229,359,1165,10793,351,986,10006,28,1837,12959,7225,28,284,33391,9462,30,1069,2330,335,1666,28,5199,3134,2109,28,284,359,1343,327,480,2470,288,2047,35433,30],"total_duration":1003501709,"load_duration":38371667,"prompt_eval_count":37,"prompt_eval_duration":28497333,"eval_count":37,"eval_duration":935328417}]
Rabbits are small mammals with long ears, strong hind legs, and fluffy fur. They live on land, mostly eat plants, and are known for their ability to dig burrows.
[DEBUG] ollama_generate_stream_json: return: 0
```
