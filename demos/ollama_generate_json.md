# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.2

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-17T19:24:40.930465994Z",
  "response": "Fluffy, curious, swift.",
  "thinking": "The user asks to \"Describe a rabbit in 3 words\". Simple. Provide three adjectives or descriptors. Should be safe. Provide maybe \"fluffy, curious, swift\". That works.",
  "done": true,
  "total_duration": 524000876,
  "prompt_eval_count": 81,
  "eval_count": 55
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-17T19:24:42.335609094Z",
  "response": "Fluffy, swift, curious.",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". This is a simple request. No disallowed content. Provide three words like \"soft, hopping, fluffy\". Should be three words. Provide maybe \"soft, quick, adorable\". Or \"fluffy, swift, timid\". Just three words.",
  "done": true,
  "total_duration": 695583752,
  "prompt_eval_count": 81,
  "eval_count": 78
}

```
