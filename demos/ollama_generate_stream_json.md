# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

## Demo

```bash
ollama_generate_stream_json "gemma3n:e4b" "Describe a rabbit in 3 words"

```
```json
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:07.3788116Z",
  "response": "Fl",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:07.4335061Z",
  "response": "uffy",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:07.4790343Z",
  "response": ",",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:07.5272794Z",
  "response": " quick",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:07.5757449Z",
  "response": ",",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:07.6219878Z",
  "response": " curious",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:07.668104Z",
  "response": ".",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:07.7144919Z",
  "response": " ",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:07.7612221Z",
  "response": "\n",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:07.8067107Z",
  "response": "",
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
    105723,
    236760,
    35411,
    236764,
    3823,
    236764,
    23210,
    236761,
    236743,
    107
  ],
  "total_duration": 3387893900,
  "load_duration": 2761411700,
  "prompt_eval_count": 16,
  "prompt_eval_duration": 196941900,
  "eval_count": 10,
  "eval_duration": 429014100
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "gemma3n:e4b" "Describe a rabbit in 3 words"

```
```json
[DEBUG] ollama_generate_stream_json: [gemma3n:e4b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: [gemma3n:e4b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "gemma3n:e4b",
  "prompt": "D]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:08.2717833Z",
  "response": "Fl",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:08.31721Z",
  "response": "uffy",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:08.3634049Z",
  "response": ",",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:08.4089408Z",
  "response": " quick",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:08.4546507Z",
  "response": ",",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:08.5003657Z",
  "response": " curious",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:08.5477679Z",
  "response": ".",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:08.5918221Z",
  "response": " ",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:08.6353103Z",
  "response": "\n",
  "done": false
}
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:09:08.6786087Z",
  "response": "",
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
    105723,
    236760,
    35411,
    236764,
    3823,
    236764,
    23210,
    236761,
    236743,
    107
  ],
  "total_duration": 510072900,
  "load_duration": 51161800,
  "prompt_eval_count": 16,
  "prompt_eval_duration": 51077500,
  "eval_count": 10,
  "eval_duration": 406781000
}
```
