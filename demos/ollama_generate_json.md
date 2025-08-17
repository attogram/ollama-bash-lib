# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.0

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-17T17:44:01.302567041Z",
  "response": "Soft, curious, hopping.",
  "thinking": "User: \"Describe a rabbit in 3 words\". They probably want something like \"soft, hop, cute\" maybe. Provide exactly 3 words. Let's comply.",
  "done": true,
  "total_duration": 351401085,
  "prompt_eval_count": 81,
  "eval_count": 50
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-17T17:44:02.512177127Z",
  "response": "Soft, fluffy, playful.",
  "thinking": "The user: \"Describe a rabbit in 3 words\". They want a description in 3 words. Likely something like \"Fluffy, swift, curious\". Maybe \"Soft, quick, playful\". We should provide exactly 3 words. Let's choose \"Soft, swift, curious\". Possibly want them separated by commas. Ensure exactly 3 words. We can do \"Soft fluffy curious\". Wait need 3 words. Could be \"Soft\", \"Fluffy\", \"Playful\". That's 3. Let's provide: \"Soft, fluffy, playful\". That is 3 words separated by commas. Good.",
  "done": true,
  "total_duration": 619896591,
  "prompt_eval_count": 81,
  "eval_count": 139
}

```
