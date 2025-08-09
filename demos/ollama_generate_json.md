# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.39

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
  "created_at": "2025-08-09T20:16:09.881678655Z",
  "response": "Soft, playful, swift",
  "thinking": "We need 3 words describing a rabbit. Could be \"fluffy, gentle, swift\". 3 words: \"Fluffy, playful, quick\". Provide exactly three words, separated by commas maybe. The user didn't specify comma usage, but we should respond with exactly three words. We can just give \"Fluffy, playful, quick\". Or \"Soft, graceful, swift\". Probably \"Soft, playful, swift\". Provide three words. Let's answer.",
  "done": true,
  "total_duration": 594260308,
  "prompt_eval_count": 81,
  "eval_count": 107
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:16:10:294359400: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:16:10:305118900: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:16:10:327806800: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:10:339468900: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:10:350549300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:16:10:361831900: _call_curl: Turbo Mode
[DEBUG] 22:16:10:373147800: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:11:358120600: ollama_api_post: success: return 0
[DEBUG] 22:16:11:369025600: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-09T20:16:10.920889164Z",
  "response": "fluffy quick curious",
  "thinking": "The user says: \"Describe a rabbit in 3 words\". Likely output: fluffy, quick, cute? Or \"soft, quick, curious\". Need exactly 3 words, describing a rabbit. Just respond with a phrase of three words. I think \"fluffy, quick, curious\". That's 3 words separated by spaces or commas. Just answer.",
  "done": true,
  "total_duration": 428005994,
  "prompt_eval_count": 81,
  "eval_count": 87
}

```
