# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.21

## Demo

```bash
ollama_generate_stream "cogito:3b" "Describe a rabbit in 2 short sentences"
```
```
The rabbit is a medium-sized mammal with long, fluffy ears and a soft, velvety fur coat that comes in various colors. It has powerful hind legs for running quickly through grasslands and woodlands.```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "cogito:3b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [cogito:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [cogito:3b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_clean: 10 bytes [cogito:3b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"cogito:3b","prompt":"Describe a ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] json_sanitize: 93 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 93 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
A[DEBUG] json_sanitize: 99 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 rabbit[DEBUG] json_sanitize: 95 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 is[DEBUG] json_sanitize: 94 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 94 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 a[DEBUG] json_sanitize: 99 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 fluffy[DEBUG] json_sanitize: 93 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 93 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
,[DEBUG] json_sanitize: 98 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 brown[DEBUG] json_sanitize: 101 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 101 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 creature[DEBUG] json_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 with[DEBUG] json_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 long[DEBUG] json_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 ears[DEBUG] json_sanitize: 96 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 96 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 and[DEBUG] json_sanitize: 94 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 94 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 a[DEBUG] json_sanitize: 98 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 white[DEBUG] json_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 tail[DEBUG] json_sanitize: 93 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 93 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
.[DEBUG] json_sanitize: 95 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 It[DEBUG] json_sanitize: 94 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 94 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
's[DEBUG] json_sanitize: 94 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 94 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 a[DEBUG] json_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 herb[DEBUG] json_sanitize: 94 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 94 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
iv[DEBUG] json_sanitize: 95 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
ore[DEBUG] json_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 that[DEBUG] json_sanitize: 99 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 spends[DEBUG] json_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 much[DEBUG] json_sanitize: 95 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 of[DEBUG] json_sanitize: 95 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 its[DEBUG] json_sanitize: 97 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 97 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 time[DEBUG] json_sanitize: 98 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 eating[DEBUG] json_sanitize: 98 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 grass[DEBUG] json_sanitize: 95 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 95 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 and[DEBUG] json_sanitize: 98 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 98 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 other[DEBUG] json_sanitize: 99 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 99 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
 plants[DEBUG] json_sanitize: 92 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 92 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
.[DEBUG] json_sanitize: 523 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 523 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
[DEBUG] ollama_generate_stream: return: 0
```
