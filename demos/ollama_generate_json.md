# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

## Demo

```bash
ollama_generate_json "mistral:7b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "mistral:7b",
  "created_at": "2025-08-04T18:28:03.6701113Z",
  "response": " Agile, cottontail, herbivore.",
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
    1045,
    2330,
    1445,
    1382,
    29493,
    1327,
    29494,
    1217,
    1199,
    29491
  ],
  "total_duration": 3022167300,
  "load_duration": 2617681400,
  "prompt_eval_count": 12,
  "prompt_eval_duration": 127709200,
  "eval_count": 14,
  "eval_duration": 276272100
}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "mistral:7b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] ollama_generate_json: [mistral:7b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "mistral:7b",
  "prompt": "De]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
{
  "model": "mistral:7b",
  "created_at": "2025-08-04T18:28:04.1372112Z",
  "response": " Playful, fluffy, hoppy.",
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
    7647,
    1775,
    29493,
    1740,
    24660,
    29493,
    5422,
    3602,
    29491
  ],
  "total_duration": 204226100,
  "load_duration": 5107900,
  "prompt_eval_count": 12,
  "prompt_eval_duration": 1035500,
  "eval_count": 10,
  "eval_duration": 197409600
}

```
