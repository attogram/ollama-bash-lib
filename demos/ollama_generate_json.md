# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

## Demo

```bash
ollama_generate_json "gemma3n:e4b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:07:33.987238Z",
  "response": "Fluffy, quick, curious. \n",
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
  "total_duration": 5227264400,
  "load_duration": 4527123900,
  "prompt_eval_count": 16,
  "prompt_eval_duration": 277064800,
  "eval_count": 10,
  "eval_duration": 421543000
}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "gemma3n:e4b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] ollama_generate_json: [gemma3n:e4b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "gemma3n:e4b",
  "prompt": "D]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
{
  "model": "gemma3n:e4b",
  "created_at": "2025-08-03T22:07:34.8010008Z",
  "response": "Fluffy, quick, curious. \n",
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
  "total_duration": 511795500,
  "load_duration": 55892500,
  "prompt_eval_count": 16,
  "prompt_eval_duration": 47182100,
  "eval_count": 10,
  "eval_duration": 408215600
}

```
