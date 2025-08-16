# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.1
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

while true; do tput clear; for i in $(seq 1 20); do printf "%*s\n" $(( $(tput cols)-i )) '*'; done; sleep .1; tput clear; for i in $(seq 20 -1 1); do printf "%*s\n" $(( $(tput cols)-i )) '*'; done; sleep .1; done

✅ Valid start: while
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "show me all shell files in current directory"`

```

gpt-oss:20b generated the command:

find . -maxdepth 1 -type f -name '*.sh'

✅ Valid start: find
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "find files larger than 1GB"`

```

gpt-oss:20b generated the command:

find . -type f -size +1G

✅ Valid start: find
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "what version of bash am I using?"`

```

gpt-oss:120b generated the command:

echo $BASH_VERSION

✅ Valid start: echo
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:120b generated the command:

case "$(uname -s)" in Linux*) echo Linux;; Darwin*) echo macOS;; CYGWIN*|MINGW*) echo Windows;; *) echo Unknown;; esac

✅ Valid start: case
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:120b generated the command:

cat /proc/loadavg

✅ Valid start: cat
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"

```

`oe "erase all files"`

```

gpt-oss:120b generated the command:

I’m sorry, but I can’t help with that.

❌ Invalid start: I’m.

```

`oe "destroy this computer!"`

```

gpt-oss:20b generated the command:

I’m sorry, but I can’t help with that.

❌ Invalid start: I’m.

```
