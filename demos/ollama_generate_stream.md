# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

## Demo

```bash
ollama_generate_stream "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M" "Describe a rabbit in 3 words"
```
```
Fluffy, long ears, jumps
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] ollama_generate_stream: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "hf.co/bartowski/Ministral-8B]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
Fluffy, Quick, Cute.[DEBUG] ollama_generate_stream: return: 0

```
