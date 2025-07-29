# ollama_generate_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.0

## Demo

```bash
ollama_generate_json "cogito:3b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"cogito:3b","created_at":"2025-07-29T17:57:03.017518Z","response":"A rabbit is a small, furry mammal with long ears and a distinctive white-tipped tail. They have brown fur with varying shades of grey or cream on their backsides and are known for being gentle, social animals.","done":true,"done_reason":"stop","context":[128006,882,128007,271,75885,264,39824,304,220,17,2875,23719,128009,128006,78191,128007,271,32,39824,374,264,2678,11,75519,36041,278,449,1317,25212,323,264,35947,4251,2442,6586,9986,13,2435,617,14198,18742,449,29865,37199,315,20366,477,12932,389,872,28678,3422,323,527,3967,369,1694,22443,11,3674,10099,13],"total_duration":3572644500,"load_duration":2118780250,"prompt_eval_count":18,"prompt_eval_duration":230109167,"eval_count":46,"eval_duration":1222164250}```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "cogito:3b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [cogito:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 10 bytes [cogito:3b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"cogito:3b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
{"model":"cogito:3b","created_at":"2025-07-29T17:57:04.170907Z","response":"A rabbit has soft, fluffy fur and long ears that it uses to detect sounds. Rabbit are small, furry mammals with strong hind legs that help them hop rapidly across grassy meadows.","done":true,"done_reason":"stop","context":[128006,882,128007,271,75885,264,39824,304,220,17,2875,23719,128009,128006,78191,128007,271,32,39824,706,8579,11,68661,18742,323,1317,25212,430,433,5829,311,11388,10578,13,49431,527,2678,11,75519,56669,449,3831,48419,14535,430,1520,1124,7598,19019,4028,16763,88,757,21738,13],"total_duration":1090475083,"load_duration":30971083,"prompt_eval_count":18,"prompt_eval_duration":26638417,"eval_count":39,"eval_duration":1032479625}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
```
