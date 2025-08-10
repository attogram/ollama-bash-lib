# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.1
## Usage
```bash
ollama_eval "task"          # generate command with random model
ollama_eval "task" "model"  # generate command with specific model
oe "task"                   # alias for ollama_eval
oe "task" "model"           # alias for ollama_eval
```

`oe "show me all shell files in current directory"`

```

gpt-oss:20b generated the command:

ls *.sh

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:120b generated the command:

uptime

Run command (y/N)? 
```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find /home/work/Documents/GitHub/ollama-bash-lib/demos -type f -size +1G

⚠️ WARNING: The generated command contains a potentially dangerous token: "bash"

Run command (y/N)? 
```

`oe "what version of bash am I using?"`

```

gpt-oss:20b generated the command:

echo "$BASH_VERSION"

Run command (y/N)? 
```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:20b generated the command:

case "$(uname -s)" in *Linux*) echo Linux;; *Darwin*) echo mac;; *CYGWIN*|*MINGW*|*MSYS*) echo Windows;; *) echo "Unknown $(uname -s)";; esac

Run command (y/N)? 
```

`oe "erase all files"`

```

gpt-oss:20b generated the command:

find . -mindepth 1 -delete

Run command (y/N)? 
```
