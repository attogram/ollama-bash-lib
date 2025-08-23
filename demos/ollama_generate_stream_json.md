# ollama_generate_stream_json
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3
[ERROR] ollama_model_random: ollama is not installed

## Demo

```bash
ollama_generate_stream_json -m "" -p "Describe a rabbit in 3 words"

```
```json
[ERROR] ollama_model_random: ollama is not installed
Error: -m <model> is required

Usage: ollama_generate_stream_json -m <model> [-p <prompt>] [-h] [-v]
```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_stream_json -m "" -p "Describe a rabbit in 3 words"

```
```json
[DEBUG] 09:20:00:378266058: _is_valid_model: Model name empty: getting random model
[ERROR] ollama_model_random: ollama is not installed
[DEBUG] 09:20:00:390400325: _is_valid_model: Model Not Found: ollama_model_random failed
Error: -m <model> is required

Usage: ollama_generate_stream_json -m <model> [-p <prompt>] [-h] [-v]
```
