# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.40

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
  "created_at": "2025-08-09T21:02:11.95966557Z",
  "response": "soft, swift, curious",
  "thinking": "The user just asked for a description of a rabbit in 3 words. Should be a succinct description. Examples: \"soft, swift, curious\". Or \"fluffy, gentle, quick\". Or \"eager, playful, fast\". The user just wants a 3-word description. No additional commentary. So answer: three words. We'll give a short set.\n\nPick \"fluffy, graceful, swift\". Or maybe \"cheerful, agile, curious\". Just 3 words with commas. Probably \"soft, swift, curious\". That's nice. Use commas. Done.",
  "done": true,
  "total_duration": 611522797,
  "prompt_eval_count": 81,
  "eval_count": 132
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:02:12:376954900: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:02:12:387003000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:02:12:411170000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:02:12:422049300: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:02:12:432407400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:02:12:443772100: _call_curl: Turbo Mode
[DEBUG] 23:02:12:454743800: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:02:13:708326000: ollama_api_post: success: return 0
[DEBUG] 23:02:13:718254100: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-09T21:02:13.296752798Z",
  "response": "Fluffy swift curious",
  "thinking": "The user requests a short description of a rabbit in 3 words. Should be simple. Perhaps \"Soft, swift, curious\" or \"Furry, gentle, adorable\". Need exactly three words. Let's choose: \"Fluffy, quick, friendly\". Or \"Soft, swift, playful\". \"Soft, swift, curious\" seems nice.\n\nThe instruction: \"Describe a rabbit in 3 words\". So likely just three words. No extra context. Provide the three words. No punctuation maybe okay. Could say \"Fluffy, swift, curious.\" But the instruction might want three words only. Provide just three words separated by commas. Should we use punctuation? It doesn't specify no punctuation. But safer: provide exactly three words. So \"Fluffy swift curious\". I'll output that.",
  "done": true,
  "total_duration": 743827096,
  "prompt_eval_count": 81,
  "eval_count": 172
}

```
