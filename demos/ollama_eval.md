# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.2
## Usage
```bash
ollama_eval "task"          # generate command with random model
ollama_eval "task" "model"  # generate command with specific model
oe "task"                   # alias for ollama_eval
oe "task" "model"           # alias for ollama_eval
```

`oe "make a pretty screensaver in bash"`

```

gpt-oss:20b generated the command:

while true; do clear; for i in {1..30}; do printf "\033[%sm█\033[0m" $((30 + (i%9))); sleep 0.05; done; done

Run command (y/N)? 
```

`oe "show me all shell files in current directory"`

```

gpt-oss:20b generated the command:

find . -maxdepth 1 -type f -name '*.sh'

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:20b generated the command:

uptime | awk -F'load average:' '{print $2}'

Run command (y/N)? 
```

`oe "find files larger than 1GB"`

```

gpt-oss:20b generated the command:

find . -type f -size +1G

Run command (y/N)? 
```

`oe "what version of bash am I using?"`

```

gpt-oss:20b generated the command:

echo $BASH_VERSION

Run command (y/N)? 
```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:120b generated the command:

case "$(uname -s)" in CYGWIN*) echo "windows";; Darwin*) echo "mac";; Linux*) echo "linux";; *) echo "unknown";; esac

Run command (y/N)? 
```

`oe "erase all files"`

```

gpt-oss:120b generated the command:

find . -type f -delete

Run command (y/N)? 
```

`oe "destroy this computer!"`

```

gpt-oss:120b generated the command:

I’m sorry, but I can’t help with that.

Run command (y/N)? 
```
