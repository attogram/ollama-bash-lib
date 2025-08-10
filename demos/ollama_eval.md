# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.0
## Usage
```bash
ollama_eval "task"          # generate command with random model
ollama_eval "task" "model"  # generate command with specific model
oe "task"                   # alias for ollama_eval
oe "task" "model"           # alias for ollama_eval
```

`oe "show me all shell files in current directory"`

```

gpt-oss:120b generated the command:

ls -1 *.sh 2>/dev/null

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:120b generated the command:

cat /proc/loadavg

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

gpt-oss:120b generated the command:

echo $BASH_VERSION

Run command (y/N)? 
```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:120b generated the command:

case "$(uname -s)" in CYGWIN*|MINGW*|MSYS*) echo windows;; Darwin*) echo mac;; Linux*) echo linux;; *) echo "unknown: $(uname -s)";; esac

Run command (y/N)? 
```

`oe "erase all files"`

```

gpt-oss:120b generated the command:

find . -type f -delete

Run command (y/N)? 
```
