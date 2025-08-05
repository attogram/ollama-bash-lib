# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.4

## Demo

```bash
ollama_generate_json "gemma3:4b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gemma3:4b",
  "created_at": "2025-08-05T11:22:33.397039Z",
  "response": "Fluffy, quick, adorable.",
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
    6720,
    29130,
    236764,
    3823,
    236764,
    42579,
    236761
  ],
  "total_duration": 3676427458,
  "load_duration": 2617812958,
  "prompt_eval_count": 16,
  "prompt_eval_duration": 820285708,
  "eval_count": 8,
  "eval_duration": 236492167
}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "gemma3:4b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 13:22:33:425016000: ollama_generate_json: [gemma3:4b] [Describe a rabbit in 3 words]
[DEBUG] 13:22:33:432617000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 13:22:33:446302000: ollama_api_post: [/api/generate] [{
  "model": "gemma3:4b",
  "prompt": "Des]
[DEBUG] 13:22:33:847863000: ollama_api_post: return 0
[DEBUG] 13:22:33:856283000: ollama_generate_json: return: 0
{
  "model": "gemma3:4b",
  "created_at": "2025-08-05T11:22:33.836324Z",
  "response": "Fluffy, quick, gentle.",
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
    6720,
    29130,
    236764,
    3823,
    236764,
    14617,
    236761
  ],
  "total_duration": 371504125,
  "load_duration": 88093042,
  "prompt_eval_count": 16,
  "prompt_eval_duration": 44991584,
  "eval_count": 8,
  "eval_duration": 237986583
}

```
