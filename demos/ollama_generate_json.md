# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.1

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
  "created_at": "2025-08-17T18:32:12.775969946Z",
  "response": "Fluffy, swift, timid.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". Simple request, no policy violations. Provide three words describing a rabbit. Eg: \"fluffy, swift, timid\". Should be fine.",
  "done": true,
  "total_duration": 718589582,
  "prompt_eval_count": 81,
  "eval_count": 58
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-17T18:32:14.157115793Z",
  "response": "Fluffy, timid, hoppy.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is a straightforward request, not disallowed. Provide three words describing a rabbit. Could be \"fluffy, timid, hoppy\". Let's respond.",
  "done": true,
  "total_duration": 786777385,
  "prompt_eval_count": 81,
  "eval_count": 62
}

```
