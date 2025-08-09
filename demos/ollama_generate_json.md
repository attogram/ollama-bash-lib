# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.38

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
  "created_at": "2025-08-09T18:22:33.901538992Z",
  "response": "Soft, quick, curious",
  "thinking": "User: \"Describe a rabbit in 3 words\"\n\nWe need to output three words describing a rabbit. Likely \"soft\", \"brown\", \"playful\", but pick three relevant words. Just answer with three words. Probably \"fluffy\", \"leap\", \"cute\" - but \"leap\" is noun. They want a description: \"fluffy\", \"furred\", \"agile\". Or \"soft\", \"quick\", \"cuddly\". Many answers possible. They want three words. We just output three words separated by spaces or commas. Probably separated by commas.\n\nI'll output: \"fluffy, agile, playful\"\n\nBut maybe they want a concise description. Let's answer with three words: \"Fluffy, swift, curious\". Or \"Soft, quick, friendly\". I'll pick: \"soft, quick, curious\". That's straightforward. But maybe \"soft fur, quick hop, curious eyes\". Too long. But okay.\n\nThe instructions: \"Describe a rabbit in 3 words\". So I will answer: \"Soft, quick, curious\"\n\nNo extra context.",
  "done": true,
  "total_duration": 922784823,
  "prompt_eval_count": 81,
  "eval_count": 235
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 20:22:34:450924700: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 20:22:34:462041600: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 20:22:34:483913600: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:22:34:494196500: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:22:34:505194200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:22:34:515487800: _call_curl: Turbo Mode
[DEBUG] 20:22:34:526601000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:22:36:080904200: ollama_api_post: success: return 0
[DEBUG] 20:22:36:092536300: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-09T18:22:35.559010136Z",
  "response": "soft quick hopper",
  "thinking": "We need 3 words describing a rabbit. Should be concise. Could be humorous. Provide exactly three words. They didn't ask for punctuation constraints, but likely just three words separated by spaces. Maybe capitalized? Provide exactly 3 words. I'll output \"Soft, swift, fluffy\". But that's four words if counting commas? Actually \"Soft, swift, fluffy\" has 3 words when ignoring commas? It might be considered 3 distinct words: Soft, swift, fluffy. Might be okay, but the commas might make it look like three words. Alternatively \"Soft swift fluffy\" would be 3 words. I'd give something like \"Soft, swift, fluffy\" maybe with commas for readability. But it's still 3 words. I'll just give \"Soft swift fluffy\". In analysis I think it's fine.\n\nBut maybe they want to describe a rabbit in 3 words, so I can reply: \"fluffy quick hopper\". That's 3 words: fluffy, quick, hopper. That fits. Or \"cute quick nimble\". That is 3 words. I'll choose \"soft quick fluffy\" or \"fluffy quick hopper\".\n\nBetter to pick something that captures a rabbit: \"soft quick hopper\" (soft, quick, hopper). That's 3. I'll answer with that.\n\nLet's output exactly 3 words separated by spaces (no commas). I'll respond: \"soft quick hopper\".",
  "done": true,
  "total_duration": 1031552533,
  "prompt_eval_count": 81,
  "eval_count": 291
}

```
