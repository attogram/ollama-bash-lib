# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Demo

```bash
ollama_generate_stream_json "gemma3n:e2b" "Describe a rabbit in 3 words"

```
```json
[ERROR] ollama_generate_stream_json: Not Found: prompt.
Usage: ollama_generate_stream_json -m <model> [-p <prompt>] [-h] [-v]
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "gemma3n:e2b" "Describe a rabbit in 3 words"

```
```json
[DEBUG] 22:21:34:951073900: _is_valid_model: Model name empty: getting random model
[DEBUG] 22:21:35:020231900: ollama_app_installed
[ERROR] ollama_generate_stream_json: Not Found: prompt.
Usage: ollama_generate_stream_json -m <model> [-p <prompt>] [-h] [-v]
```
