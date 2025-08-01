# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.24
./../ollama_bash_lib.sh: line 479: 000852500: value too great for base (error token is "000852500")

## Demo

```bash
ollama_generate_json "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T19:13:06.6515699Z","response":"A rabbit is a small, furry animal with long ears and a short tail, often associated with agility and quick movements.","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,9864,448,1293,24230,323,264,2805,9787,11,3545,5815,448,66641,323,3974,19029,13],"total_duration":8875491100,"load_duration":7772531700,"prompt_eval_count":28,"prompt_eval_duration":209191700,"eval_count":25,"eval_duration":893264000}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "qwen2.5vl:7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [qwen2.5vl:7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 13 bytes [qwen2.5vl:7b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen2.5vl:7b","prompt":"Describe]
{"model":"qwen2.5vl:7b","created_at":"2025-08-01T19:13:08.4257202Z","response":"A rabbit is a small, furry animal with long ears and a short tail, often associated with agility and quick movements.","done":true,"done_reason":"stop","context":[151644,8948,198,2610,525,264,10950,17847,13,151645,198,151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,32,38724,374,264,2613,11,74419,9864,448,1293,24230,323,264,2805,9787,11,3545,5815,448,66641,323,3974,19029,13],"total_duration":1001544200,"load_duration":25893100,"prompt_eval_count":28,"prompt_eval_duration":41359400,"eval_count":25,"eval_duration":933775800}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
