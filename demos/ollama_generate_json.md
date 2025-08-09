# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.43

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
  "created_at": "2025-08-09T22:18:51.769241046Z",
  "response": "gentle, fluffy, nimble",
  "thinking": "We need to answer: \"Describe a rabbit in 3 words.\" So produce three words describing a rabbit, maybe like \"gentle, fluffy, swift\" or \"soft, curious, cute\" etc. The answer should be a list of 3 words. Probably no extra context, just three words. We can decide. Let's produce: \"soft, swift, curious.\" That works. Or \"gentle, fluffy, playful.\" We'll go with \"gentle, fluffy, nimble.\" That's good.",
  "done": true,
  "total_duration": 593745055,
  "prompt_eval_count": 81,
  "eval_count": 120
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:18:52:234163300: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:18:52:252226700: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:18:52:282689500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:18:52:299465100: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:18:52:317053600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:18:52:334394300: _call_curl: Turbo Mode
[DEBUG] 00:18:52:351163700: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:18:53:299779000: ollama_api_post: success: return 0
[DEBUG] 00:18:53:318427800: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-09T22:18:52.833507838Z",
  "response": "Fluffy, quick, hop",
  "thinking": "We need to describe a rabbit in 3 words. Likely whimsical: \"Soft, swift, twitchy\". Or \"Fluffy, quick, hop\". We must produce 3 words only. No extra explanation. I'll choose \"Fluffy, quick, hop\".",
  "done": true,
  "total_duration": 425266816,
  "prompt_eval_count": 81,
  "eval_count": 70
}

```
