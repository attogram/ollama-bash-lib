# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_generate_json "smollm2:360m" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"smollm2:360m","created_at":"2025-07-30T16:08:06.127966Z","response":"1. A rabbit is typically small and slender, with a fluffy coat of brown fur that can range from light to dark gray depending on the species.\n\n2. They have large ears that are often floppy and long, which help them listen for sounds while they forage or run at high speed.","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,2,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,33,30,330,16024,314,3431,1165,284,27833,28,351,253,33391,10078,282,6354,9462,338,416,1845,429,1420,288,3605,11013,4509,335,260,1772,30,1116,34,30,1069,457,1507,10006,338,359,1129,45674,284,986,28,527,724,601,5872,327,4598,979,502,21108,355,1658,418,904,3547,30],"total_duration":1700858958,"load_duration":908208875,"prompt_eval_count":38,"prompt_eval_duration":120086417,"eval_count":60,"eval_duration":671442625}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "smollm2:360m" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [smollm2:360m] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 13 bytes [smollm2:360m]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"smollm2:360m","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
{"model":"smollm2:360m","created_at":"2025-07-30T16:08:06.772919Z","response":"A rabbit is a cute and fluffy animal known for its small size and gentle nature. It has soft fur, large eyes, and can hop quite well on two legs.","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,2,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,49,16024,314,253,25489,284,33391,3161,1343,327,624,1165,2203,284,9154,2177,30,657,553,2375,9462,28,1507,3497,28,284,416,4432,3100,876,335,827,7225,30],"total_duration":554248917,"load_duration":29502917,"prompt_eval_count":38,"prompt_eval_duration":14004291,"eval_count":35,"eval_duration":509742209}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
