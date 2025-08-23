# ollama_generate_stream
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3
[ERROR] ollama_model_random: ollama is not installed

## Demo

```bash
ollama_generate_stream -m "" -p "Describe a rabbit in 3 words"
```
```
[ERROR] ollama_model_random: ollama is not installed

```

## Demo Debug

```bash
`OBL_DEBUG=1 ollama_generate_stream -m "" -p "Describe a rabbit in 3 words"`
```
```json
[ERROR] ollama_model_random: ollama is not installed

```
