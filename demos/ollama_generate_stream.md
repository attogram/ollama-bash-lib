# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.21

## Demo

```bash
ollama_generate_stream "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, furry mammal with long ears and legs. It is known for its agility and ability to reproduce quickly.```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "hf.co/bartowski/Ministral-8B]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] json_sanitize: 138 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 138 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
A[DEBUG] json_sanitize: 144 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 144 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 rabbit[DEBUG] json_sanitize: 141 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 141 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 is[DEBUG] json_sanitize: 140 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 140 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 a[DEBUG] json_sanitize: 143 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 143 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 small[DEBUG] json_sanitize: 139 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 139 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
,[DEBUG] json_sanitize: 141 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 141 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 ag[DEBUG] json_sanitize: 141 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 141 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
ile[DEBUG] json_sanitize: 142 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 142 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 mamm[DEBUG] json_sanitize: 140 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 140 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
al[DEBUG] json_sanitize: 143 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 143 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 with[DEBUG] json_sanitize: 143 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 143 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 soft[DEBUG] json_sanitize: 142 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 142 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 fur[DEBUG] json_sanitize: 141 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 141 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 and[DEBUG] json_sanitize: 143 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 143 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 long[DEBUG] json_sanitize: 143 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 143 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 ears[DEBUG] json_sanitize: 139 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 139 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
.[DEBUG] json_sanitize: 141 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 141 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 It[DEBUG] json_sanitize: 141 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 141 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 is[DEBUG] json_sanitize: 144 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 144 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 known[DEBUG] json_sanitize: 142 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 142 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 for[DEBUG] json_sanitize: 141 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 141 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 its[DEBUG] json_sanitize: 144 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 144 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 rapid[DEBUG] json_sanitize: 148 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 148 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 movements[DEBUG] json_sanitize: 142 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 142 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 and[DEBUG] json_sanitize: 145 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 145 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 digging[DEBUG] json_sanitize: 145 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 145 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
 habits[DEBUG] json_sanitize: 139 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 139 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
.[DEBUG] json_sanitize: 519 bytes [{"model":"hf.co/bartowski/Ministral-8B-Ins]
[DEBUG] json_sanitize: sanitized: 519 bytes [[{"model":"hf.co/bartowski/Ministral-8B-Ins]]
[DEBUG] ollama_generate_stream: return: 0
```
