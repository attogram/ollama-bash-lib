# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.10

## Demo

```bash
ollama_generate_json "qwen2.5-coder:7b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "qwen2.5-coder:7b",
  "created_at": "2025-08-06T12:11:12.678354Z",
  "response": "Energetic, cute, fluffy.",
  "done": true,
  "done_reason": "stop",
  "context": [
    151644,
    8948,
    198,
    2610,
    525,
    1207,
    16948,
    11,
    3465,
    553,
    54364,
    14817,
    13,
    1446,
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
    36,
    1194,
    35224,
    11,
    18838,
    11,
    67561,
    13
  ],
  "total_duration": 3959889417,
  "load_duration": 3085134833,
  "prompt_eval_count": 36,
  "prompt_eval_duration": 454161625,
  "eval_count": 9,
  "eval_duration": 419865417
}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "qwen2.5-coder:7b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 14:11:12:690024000: ollama_generate_json: [qwen2.5-coder:7b] [Describe a rabbit in 3 words]
[DEBUG] 14:11:12:699497000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 14:11:12:723304000: ollama_api_post: [/api/generate] [{"model":"qwen2.5-coder:7b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 14:11:12:735563000: _call_curl: [POST] [/api/generate] [{"model":"qwen2.5-coder:7b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 14:11:12:745351000: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 14:11:12:756646000: _call_curl: adding json body
[DEBUG] 14:11:13:284053000: ollama_api_post: success: return 0
[DEBUG] 14:11:13:296071000: ollama_generate_json: return: 0
{
  "model": "qwen2.5-coder:7b",
  "created_at": "2025-08-06T12:11:13.268006Z",
  "response": "Fuzzy, cute, hopping.",
  "done": true,
  "done_reason": "stop",
  "context": [
    151644,
    8948,
    198,
    2610,
    525,
    1207,
    16948,
    11,
    3465,
    553,
    54364,
    14817,
    13,
    1446,
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
    37,
    34758,
    11,
    18838,
    11,
    92238,
    13
  ],
  "total_duration": 486297584,
  "load_duration": 48514000,
  "prompt_eval_count": 36,
  "prompt_eval_duration": 62653334,
  "eval_count": 8,
  "eval_duration": 374557125
}

```
