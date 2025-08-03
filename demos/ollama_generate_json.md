# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

## Demo

```bash
ollama_generate_json "qwen2.5vl:7b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "qwen2.5vl:7b",
  "created_at": "2025-08-03T21:28:08.9340124Z",
  "response": "Fluffy, cute, hopping.",
  "done": true,
  "done_reason": "stop",
  "context": [
    151644,
    8948,
    198,
    2610,
    525,
    264,
    10950,
    17847,
    13,
    151645,
    198,
    151644,
    872,
    198,
    74785,
    264,
    38724,
    304,
    220,
    18,
    4244,
    151645,
    198,
    151644,
    77091,
    198,
    3882,
    29877,
    11,
    18838,
    11,
    92238,
    13
  ],
  "total_duration": 3373741800,
  "load_duration": 2996682100,
  "prompt_eval_count": 27,
  "prompt_eval_duration": 147494600,
  "eval_count": 8,
  "eval_duration": 229059800
}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "qwen2.5vl:7b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] ollama_generate_json: [qwen2.5vl:7b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "qwen2.5vl:7b",
  "prompt": "]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
{
  "model": "qwen2.5vl:7b",
  "created_at": "2025-08-03T21:28:09.4737468Z",
  "response": "Fluffy, cute, hopping.",
  "done": true,
  "done_reason": "stop",
  "context": [
    151644,
    8948,
    198,
    2610,
    525,
    264,
    10950,
    17847,
    13,
    151645,
    198,
    151644,
    872,
    198,
    74785,
    264,
    38724,
    304,
    220,
    18,
    4244,
    151645,
    198,
    151644,
    77091,
    198,
    3882,
    29877,
    11,
    18838,
    11,
    92238,
    13
  ],
  "total_duration": 266742900,
  "load_duration": 26817300,
  "prompt_eval_count": 27,
  "prompt_eval_duration": 31528700,
  "eval_count": 8,
  "eval_duration": 208396900
}

```
