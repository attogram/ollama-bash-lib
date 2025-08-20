# ollama_generate_stream
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7
[ERROR] ollama_model_random: ollama is not installed

## Demo

```bash
ollama_generate_stream "" "Describe a rabbit in 3 words"
```
```
[ERROR] ollama_model_random: ollama is not installed
Error: -m <model> is required

Usage: ollama_generate_stream -m <model> [-p <prompt>] [-h] [-v]

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 19:49:35:835386791: _is_valid_model: Model name empty: getting random model
[DEBUG] 19:49:35:848054802: ollama_app_installed
[ERROR] ollama_model_random: ollama is not installed
[DEBUG] 19:49:35:854420530: _is_valid_model: Model Not Found: ollama_model_random failed
Error: -m <model> is required

Usage: ollama_generate_stream -m <model> [-p <prompt>] [-h] [-v]

```
