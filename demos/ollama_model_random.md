# ollama_model_random
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
gpt-oss:120b
gpt-oss:20b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 23:35:27:584322500: ollama_model_random
gpt-oss:20b
[DEBUG] 23:35:28:005094900: ollama_model_random
gpt-oss:20b
```
