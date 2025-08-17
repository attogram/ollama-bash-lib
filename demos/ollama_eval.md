# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4
## Usage
```bash
ollama_eval "task"          # generate command with random model
ollama_eval "task" "model"  # generate command with specific model
oe "task"                   # alias for ollama_eval
oe "task" "model"           # alias for ollama_eval
```

`oe "make a pretty screensaver in bash"`

```
[ERROR] ollama_model_random: ollama is not installed

[0;34mOllama Eval [0m - [0;33mmake a pretty screensaver in bash[0m
Using model: ollama-not-installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_eval: ollama_generate_json failed

```

`oe "show me all shell files in current directory"`

```
[ERROR] ollama_model_random: ollama is not installed

[0;34mOllama Eval [0m - [0;33mshow me all shell files in current directory[0m
Using model: ollama-not-installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_eval: ollama_generate_json failed

```

`oe "find files larger than 1GB"`

```
[ERROR] ollama_model_random: ollama is not installed

[0;34mOllama Eval [0m - [0;33mfind files larger than 1GB[0m
Using model: ollama-not-installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_eval: ollama_generate_json failed

```

`oe "what version of bash am I using?"`

```
[ERROR] ollama_model_random: ollama is not installed

[0;34mOllama Eval [0m - [0;33mwhat version of bash am I using?[0m
Using model: ollama-not-installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_eval: ollama_generate_json failed

```

`oe "am I on windows, mac, linux, or what?"`

```
[ERROR] ollama_model_random: ollama is not installed

[0;34mOllama Eval [0m - [0;33mam I on windows, mac, linux, or what?[0m
Using model: ollama-not-installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_eval: ollama_generate_json failed

```

`oe "get system load"`

```
[ERROR] ollama_model_random: ollama is not installed

[0;34mOllama Eval [0m - [0;33mget system load[0m
Using model: ollama-not-installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_eval: ollama_generate_json failed

```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"

```

`oe "erase all files"`

```
[ERROR] ollama_model_random: ollama is not installed

[0;34mOllama Eval [0m - [0;33merase all files[0m
Using model: ollama-not-installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_eval: ollama_generate_json failed

```

`oe "destroy this computer!"`

```
[ERROR] ollama_model_random: ollama is not installed

[0;34mOllama Eval [0m - [0;33mdestroy this computer![0m
Using model: ollama-not-installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_eval: ollama_generate_json failed

```
