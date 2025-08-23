# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

## Setup

OLLAMA_HOST: 
OBL_API: http://localhost:11434


## Demo

```bash
ollama_generate_json -m "gemma3n:e2b" -p "Describe a rabbit in 3 words"
```
```json
{
  "model": "gemma3n:e2b",
  "created_at": "2025-08-23T13:32:42.2608687Z",
  "response": "Cute, fluffy, quick. \n",
  "done": true,
  "done_reason": "stop",
  "context": [
    105,
    2364,
    107,
    82858,
    496,
    27973,
    528,
    236743,
    236800,
    4171,
    106,
    107,
    105,
    4368,
    107,
    55973,
    236764,
    7745,
    236760,
    35411,
    236764,
    3823,
    236761,
    236743,
    107
  ],
  "total_duration": 4646174500,
  "load_duration": 4275268700,
  "prompt_eval_count": 16,
  "prompt_eval_duration": 221857900,
  "eval_count": 9,
  "eval_duration": 146994200
}

```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_json -m "gemma3n:e2b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 15:32:42:326972100: ollama_generate_json: [gemma3n:e2b] [Describe a rabbit in 3 words]
[DEBUG] 15:32:42:375982400: ollama_generate_json: json_payload: {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:32:42:422972900: ollama_api_post: [/api/generate] {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:32:42:446332400: _call_curl: [POST] [/api/generate] {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:32:42:487397500: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 15:32:42:515520300: _call_curl: json_body: {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:32:42:542426000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 15:32:43:073363100: ollama_api_post: success
[DEBUG] 15:32:43:095487700: ollama_generate_json: success
{
  "model": "gemma3n:e2b",
  "created_at": "2025-08-23T13:32:43.0422504Z",
  "response": "Cute, fluffy, hopping. \n",
  "done": true,
  "done_reason": "stop",
  "context": [
    105,
    2364,
    107,
    82858,
    496,
    27973,
    528,
    236743,
    236800,
    4171,
    106,
    107,
    105,
    4368,
    107,
    55973,
    236764,
    7745,
    236760,
    35411,
    236764,
    85834,
    236761,
    236743,
    107
  ],
  "total_duration": 233288600,
  "load_duration": 104823100,
  "prompt_eval_count": 16,
  "prompt_eval_duration": 16844400,
  "eval_count": 9,
  "eval_duration": 111100900
}

```
