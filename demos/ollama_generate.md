# ollama_generate
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3
[ERROR] ollama_model_random: ollama is not installed

## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
[ERROR] ollama_model_random: ollama is not installed
Error: -m <model> is required

Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```

## Demo Debug


```
OBL_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 09:20:00:100747999: ollama_generate: [-m] [] [-p] [Describe a rabbit in 3 words]
[DEBUG] 09:20:00:107865338: ollama_generate: init: model: [] prompt: []
[DEBUG] 09:20:00:111836228: ollama_generate: while getopts: OPTARG: [] opt: [m]
[DEBUG] 09:20:00:115975905: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 09:20:00:120008900: ollama_generate: final: model: [] prompt: [Describe a rabbit in 3 words]
[DEBUG] 09:20:00:124161118: ollama_generate: checking: model: []
[ERROR] ollama_model_random: ollama is not installed
Error: -m <model> is required

Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```
