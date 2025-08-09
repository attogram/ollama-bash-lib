# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.38
## Usage
```bash
ollama_eval "task"          # generate command with random model
ollama_eval "task" "model"  # generate command with specific model
oe "task"                   # alias for ollama_eval
oe "task" "model"           # alias for ollama_eval
```

`oe "show me all shell files in current directory"`

```
Command:

find . -maxdepth 1 -type f -exec file {} + | grep 'shell script' | cut -d: -f1 | sed 's|./||'

Run command (y/n)? 

about.sh
escape_control_characters.sh
interactive.chat.sh
interactive.generate.sh
list.sh
messages.sh
ollama_api_get.sh
ollama_app_vars.sh
ollama_chat.sh
ollama_eval.sh
ollama_generate.sh
ollama_generate_json.sh
ollama_generate_stream.sh
ollama_generate_stream_json.sh
ollama_model_random.sh
prompt.all.models.sh
prompts.model.sh
ps.sh
review.funny.sh
review.lib-security.sh
review.lib.sh
review.readme.sh
run.demos.sh
show.sh
token.estimate.sh
version.sh
_is_valid_json.sh

```

`oe "get system load"`

```
Command:

cat /proc/loadavg

Run command (y/n)? 

3.47 3.47 3.47 2/7

```
