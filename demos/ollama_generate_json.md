# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.8

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
  "created_at": "2025-08-17T14:22:13.404939252Z",
  "response": "Fluffy, swift, timid.",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". Simple. Provide three words describing a rabbit. E.g., \"fluffy, timid, swift\". Should be fine. No policy issues.",
  "done": true,
  "total_duration": 526989664,
  "prompt_eval_count": 81,
  "eval_count": 57
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-17T14:22:14.371553094Z",
  "response": "Fluffy, curious, swift.",
  "thinking": "The user asks \"Describe a rabbit in 3 words\". This is straightforward. Provide three adjectives or descriptors. No policy issue. Just respond.",
  "done": true,
  "total_duration": 354823909,
  "prompt_eval_count": 81,
  "eval_count": 46
}

```
