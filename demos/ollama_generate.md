# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

## Demo

```bash
ollama_generate "dolphin3:8b" "Describe a rabbit in 3 words"
```
```
Furry, Ears, Hops.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "dolphin3:8b" "Describe a rabbit in 3 words"`
```
```
[DEBUG] ollama_generate: [dolphin3:8b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: [dolphin3:8b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "dolphin3:8b",
  "prompt": "D]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 474 bytes
Cute, fluffy, and fast.
[DEBUG] ollama_generate: return: 0
```
