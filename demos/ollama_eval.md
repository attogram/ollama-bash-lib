# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.39
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

ls -1 ./*.sh ./*.bash 2>/dev/null

Run command (y/n)? 

```

`oe "get system load"`

```
Command:

cat /proc/loadavg | awk '{print $1,$2,$3}'

Run command (y/n)? 

```

`oe "find files larger than 1GB"`

```
Command:

find . -type f -size +1G -print

Run command (y/n)? 

```

`oe "what version of bash am I using?"`

```
Command:

echo "$BASH_VERSION"

Run command (y/n)? 

```

`oe "am I on windows, mac, linux, or what?"`

```
Command:

case "$(uname -o 2>/dev/null || uname -s 2>/dev/null)" in CYGWIN*|MINGW*|MSYS*) echo "Windows" ;; Darwin*) echo "Mac" ;; Linux*) echo "Linux" ;; *) echo "Other: $(uname -s)" ;; esac

Run command (y/n)? 

```

`oe "erase all files"`

```
Command:

find /home/work/Documents/GitHub/ollama-bash-lib/demos -type f -delete

Run command (y/n)? 

```
