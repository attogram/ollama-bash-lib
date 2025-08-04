# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

## Demo

```bash
ollama_generate_stream "smollm2:1.7b" "Describe a rabbit in 3 words"
```
```
Rabbit is small, fast and playful.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "smollm2:1.7b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] ollama_generate_stream: [smollm2:1.7b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: [smollm2:1.7b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "smollm2:1.7b",
  "prompt": "]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
Rabbit: fluffy, furry, hopping[DEBUG] ollama_generate_stream: return: 0

```
