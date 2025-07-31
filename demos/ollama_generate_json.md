# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.8

## Demo

```bash
ollama_generate_json "smollm2:360m" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"smollm2:360m","created_at":"2025-07-31T18:05:12.467735Z","response":"A rabbit is typically slender and agile. It has large eyes that give it an adorable expression while its long legs allow it to move quickly across the ground. It usually has spots on its fur which can be brown or gray, with a rounded tail at the end of its back.","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,2,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,49,16024,314,3431,27833,284,31888,30,657,553,1507,3497,338,1928,357,354,39166,4352,979,624,986,7225,1167,357,288,1485,3112,1699,260,2118,30,657,2007,553,9265,335,624,9462,527,416,325,6354,355,11013,28,351,253,17421,5193,418,260,1112,282,624,1056,30],"total_duration":1011243792,"load_duration":31854250,"prompt_eval_count":38,"prompt_eval_duration":18120709,"eval_count":57,"eval_duration":960528458}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "smollm2:360m" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [smollm2:360m] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 13 bytes [smollm2:360m]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"smollm2:360m","prompt":"Describe]
{"model":"smollm2:360m","created_at":"2025-07-31T18:05:12.87696Z","response":"A bunny is small and cute. It has fluffy fur with big brown eyes and round ears.","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,2,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,49,41172,314,1165,284,25489,30,657,553,33391,9462,351,2066,6354,3497,284,5075,10006,30],"total_duration":325181917,"load_duration":31335542,"prompt_eval_count":38,"prompt_eval_duration":14789208,"eval_count":20,"eval_duration":278331333}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
