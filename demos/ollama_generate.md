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
[DEBUG] 08:53:21:458450835: ollama_generate: [-m] [] [-p] [Describe a rabbit in 3 words]
[DEBUG] 08:53:21:465461517: ollama_generate: init: model: [] prompt: []
[DEBUG] 08:53:21:469486327: ollama_generate: while getopts: OPTARG: [] opt: [m]
[DEBUG] 08:53:21:473562145: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 08:53:21:477703574: ollama_generate: final: model: [] prompt: [Describe a rabbit in 3 words]
[DEBUG] 08:53:21:481928516: ollama_generate: checking: model: []
[ERROR] ollama_model_random: ollama is not installed
Error: -m <model> is required

Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```
