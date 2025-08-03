# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.21

## Demo

```bash
ollama_generate_json "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"qwen2.5vl:7b","created_at":"2025-08-03T18:54:41.2149398Z","response":"A rabbit is a small, furry animal with long ears and a short tail, often associated with agility and quick movements.","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,9864,448,1293,24230,323,264,2805,9787,11,3545,5815,448,66641,323,3974,19029,13],"total_duration":3065182500,"load_duration":2175701100,"prompt_eval_count":28,"prompt_eval_duration":138610200,"eval_count":25,"eval_duration":749857300}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [qwen2.5vl:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "qwen2.5vl:7b",
  "prompt": "]
{"model":"qwen2.5vl:7b","created_at":"2025-08-03T18:54:42.2773609Z","response":"A rabbit is a small, furry animal with long ears and a short tail, often associated with agility and quick movements.","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,9864,448,1293,24230,323,264,2805,9787,11,3545,5815,448,66641,323,3974,19029,13],"total_duration":788832300,"load_duration":26233700,"prompt_eval_count":28,"prompt_eval_duration":31686100,"eval_count":25,"eval_duration":730381900}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
