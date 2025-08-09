# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.43
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

find . -maxdepth 1 -type f -name "*.sh"

Run command (y/n)? 

```

`oe "get system load"`

```
Command:

uptime | awk -F'load average:' '{print $2}'

Run command (y/n)? 

```

`oe "find files larger than 1GB"`

```
Command:

find /home/work/Documents/GitHub/ollama-bash-lib/demos -type f -size +1G

Run command (y/n)? 

```

`oe "what version of bash am I using?"`

```
Command:

printf '%s\n' "$BASH_VERSION"

Run command (y/n)? 

```

`oe "am I on windows, mac, linux, or what?"`

```
Command:

case "$(uname -s)" in CYGWIN*) echo "Windows (Cygwin)";; Linux*) echo "Linux";; Darwin*) echo "Mac";; *) echo "Other";; esac

Run command (y/n)? 

```

`oe "erase all files"`

```
Command:

find . -type f -delete

Run command (y/n)? 

```
