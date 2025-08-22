# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

## Setup

OLLAMA_HOST: http://localhost:11434
OBL_API: http://localhost:11434


## Demo

```bash
ollama_generate_json -m "mistral:7b" -p "Describe a rabbit in 3 words"
```
```json
{
  "model": "mistral:7b",
  "created_at": "2025-08-22T20:05:04.2361864Z",
  "response": " Agile, soft-furred, twitchy.",
  "done": true,
  "done_reason": "stop",
  "context": [
    3,
    29473,
    28752,
    1032,
    17247,
    3349,
    1065,
    29473,
    29538,
    3853,
    4,
    29473,
    4554,
    1314,
    29493,
    3432,
    29501,
    27479,
    1661,
    29493,
    3091,
    2754,
    29492,
    29491
  ],
  "total_duration": 1534619900,
  "load_duration": 1186046700,
  "prompt_eval_count": 12,
  "prompt_eval_duration": 88011700,
  "eval_count": 13,
  "eval_duration": 260561500
}

```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_json -m "mistral:7b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:05:04:330738200: ollama_generate_json: [mistral:7b] [Describe a rabbit in 3 words]
[DEBUG] 22:05:04:371432700: ollama_generate_json: json_payload: {"model":"mistral:7b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:05:04:420313100: ollama_api_post: [/api/generate] {"model":"mistral:7b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:05:04:450410700: _call_curl: [POST] [/api/generate] {"model":"mistral:7b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:05:04:504111600: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 22:05:04:525734800: _call_curl: json_body: {"model":"mistral:7b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:05:04:559823700: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 22:05:05:143317800: ollama_api_post: success
[DEBUG] 22:05:05:173107900: ollama_generate_json: success
{
  "model": "mistral:7b",
  "created_at": "2025-08-22T20:05:05.0407661Z",
  "response": " Fluffy, Agile, Gentle.",
  "done": true,
  "done_reason": "stop",
  "context": [
    3,
    29473,
    28752,
    1032,
    17247,
    3349,
    1065,
    29473,
    29538,
    3853,
    4,
    29473,
    3262,
    24660,
    29493,
    4554,
    1314,
    29493,
    23748,
    1059,
    29491
  ],
  "total_duration": 234752900,
  "load_duration": 8872500,
  "prompt_eval_count": 12,
  "prompt_eval_duration": 520100,
  "eval_count": 10,
  "eval_duration": 224551700
}

```
