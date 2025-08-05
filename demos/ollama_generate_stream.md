# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.4

## Demo

```bash
ollama_generate_stream "hermes3:8b" "Describe a rabbit in 3 words"
```
```
Floppy, cotton-tail, cuddly.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "hermes3:8b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 13:22:44:367075000: ollama_generate_stream: [hermes3:8b] [Describe a rabbit in 3 words]
[DEBUG] 13:22:44:373806000: ollama_generate_json: [hermes3:8b] [Describe a rabbit in 3 words]
[DEBUG] 13:22:44:379505000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 13:22:44:392488000: ollama_api_post: [/api/generate] [{
  "model": "hermes3:8b",
  "prompt": "De]
[DEBUG] 13:22:45:068297000: ollama_api_post: return 0
[DEBUG] 13:22:45:077923000: ollama_generate_json: return: 0
Cute, fluffy, hoppy.[DEBUG] 13:22:52:229199000: ollama_generate_stream: return: 0

```
