# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

## Demo

```bash
ollama_generate_stream_json "mistral:7b" "Describe a rabbit in 3 words"

```
```json
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.081287Z",
  "response": " Ag",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.1095782Z",
  "response": "ile",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.1319784Z",
  "response": ",",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.1546421Z",
  "response": " fl",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.1772406Z",
  "response": "uffy",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.1987873Z",
  "response": ",",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.2185518Z",
  "response": " hop",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.2382692Z",
  "response": "py",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.2580786Z",
  "response": ".",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.2777385Z",
  "response": "",
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
    1740,
    24660,
    29493,
    5422,
    3602,
    29491
  ],
  "total_duration": 2949226600,
  "load_duration": 2619665800,
  "prompt_eval_count": 12,
  "prompt_eval_duration": 130521800,
  "eval_count": 10,
  "eval_duration": 198044600
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "mistral:7b" "Describe a rabbit in 3 words"

```
```json
[DEBUG] ollama_generate_stream_json: [mistral:7b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: [mistral:7b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "mistral:7b",
  "prompt": "De]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.5846478Z",
  "response": " Ag",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.6041886Z",
  "response": "ile",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.6238812Z",
  "response": ",",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.6434608Z",
  "response": " fl",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.6631362Z",
  "response": "uffy",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.6827864Z",
  "response": ",",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.7026837Z",
  "response": " tim",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.7231021Z",
  "response": "id",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.742313Z",
  "response": ".",
  "done": false
}
{
  "model": "mistral:7b",
  "created_at": "2025-08-03T21:31:22.762958Z",
  "response": "",
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
    1740,
    24660,
    29493,
    5872,
    1081,
    29491
  ],
  "total_duration": 203669900,
  "load_duration": 5118600,
  "prompt_eval_count": 12,
  "prompt_eval_duration": 1016400,
  "eval_count": 10,
  "eval_duration": 197078100
}
```
