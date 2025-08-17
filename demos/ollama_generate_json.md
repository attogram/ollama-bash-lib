# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.7

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
  "created_at": "2025-08-17T12:59:31.794067183Z",
  "response": "Fluffy, quick, curious.",
  "thinking": "The user: \"Describe a rabbit in 3 words\". They want presumably a short phrase: 3 words describing a rabbit. So we need exactly 3 words. Could be \"fluffy, quick, curious\" but that is 3 words? Actually \"fluffy quick curious\" is 3 words but no punctuation. However we might want them separated by commas? The ask is \"Describe a rabbit in 3 words\". We can respond with a phrase like \"Soft, swift, inquisitive.\" That's 3 words. But maybe they want just 3 words? \"Soft, swift, inquisitive.\" That's 3 words. Or \"Cuddly, spry, quiet\". That's 3 words. Or \"Playful, gentle, fast\". That's 3 words. I'm going to give something witty: \"Soft, energetic, curious\". That's 3 words. I'd say \"Soft, energetic, curious\". They might also want \"Fluffy, quick, inquisitive\". This fits. We'll deliver. Should we separate by commas? Probably fine. I'll just give 3 words separated by commas.",
  "done": true,
  "total_duration": 874712035,
  "prompt_eval_count": 81,
  "eval_count": 242
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-17T12:59:32.771608124Z",
  "response": "Soft, agile, curious.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". We need to provide three words to describe a rabbit. Simple answer: \"fluffy, playful, gentle\". Should be concise. Possibly: \"Soft, quick, curious.\" I'll answer.",
  "done": true,
  "total_duration": 378118578,
  "prompt_eval_count": 81,
  "eval_count": 67
}

```
