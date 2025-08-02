# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.20

## Demo

```bash
ollama_generate_json "dolphin3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"dolphin3:8b","created_at":"2025-08-02T22:04:59.6145762Z","response":"A rabbit is a small mammal known for its long ears and fast movement. They are often seen hopping around in fields and gardens.","done":true,"done_reason":"stop","context":[128257,9125,198,2675,527,96096,11,264,11190,15592,18328,13,128256,198,128257,882,198,75885,264,39824,304,220,17,2875,23719,128256,198,128257,78191,198,32,39824,374,264,2678,36041,278,3967,369,1202,1317,25212,323,5043,7351,13,2435,527,3629,3970,93338,2212,304,5151,323,36536,13],"total_duration":3963929200,"load_duration":3197323100,"prompt_eval_count":31,"prompt_eval_duration":130688000,"eval_count":28,"eval_duration":634400500}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "dolphin3:8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [dolphin3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "dolphin3:8b",
  "prompt": "D]
{"model":"dolphin3:8b","created_at":"2025-08-02T22:05:00.7899159Z","response":"A rabbit is a small mammal with long ears and a fluffy tail. It's known for its fast hopping movements and typically has a white underside and brown or grey upper parts.","done":true,"done_reason":"stop","context":[128257,9125,198,2675,527,96096,11,264,11190,15592,18328,13,128256,198,128257,882,198,75885,264,39824,304,220,17,2875,23719,128256,198,128257,78191,198,32,39824,374,264,2678,36041,278,449,1317,25212,323,264,68661,9986,13,1102,596,3967,369,1202,5043,93338,19567,323,11383,706,264,4251,96321,323,14198,477,20366,8582,5596,13],"total_duration":874654100,"load_duration":27423000,"prompt_eval_count":31,"prompt_eval_duration":2613700,"eval_count":37,"eval_duration":844518000}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
