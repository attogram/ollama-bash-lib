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

gpt-oss:20b generated the command:

while true; do tput civis; tput clear; rows=$(tput lines); cols=$(tput cols); for i in $(seq 1 200); do tput cup $((RANDOM%rows+1)) $((RANDOM%cols+1)); echo -n '*'; done; sleep 0.1; done

✅ Valid start: while
✅ Valid Bash Syntax

Run command (y/N)? Aborted.

```

`oe "show me all shell files in current directory"`

```

gpt-oss:120b generated the command:

find . -maxdepth 1 -type f -name "*.sh"

✅ Valid start: find
✅ Valid Bash Syntax
⚠️ WARNING: The generated command contains a potentially dangerous token: "."

Run command (y/N)? Aborted.

```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find . -type f -size +1G

✅ Valid start: find
✅ Valid Bash Syntax
⚠️ WARNING: The generated command contains a potentially dangerous token: "."

Run command (y/N)? Aborted.

```

`oe "what version of bash am I using?"`

```

gpt-oss:20b generated the command:

echo "$BASH_VERSION"

✅ Valid start: echo
✅ Valid Bash Syntax

Run command (y/N)? Aborted.

```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:20b generated the command:

uname -o

✅ Valid start: uname
✅ Valid Bash Syntax

Run command (y/N)? Aborted.

```

`oe "get system load"`

```

gpt-oss:120b generated the command:

cat /proc/loadavg

✅ Valid start: cat
✅ Valid Bash Syntax

Run command (y/N)? Aborted.

```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"

```

`oe "erase all files"`

```

gpt-oss:20b generated the command:

I’m sorry, but I can’t help with that.

❌ Invalid start: I’m.

```

`oe "destroy this computer!"`

```

gpt-oss:120b generated the command:

echo "I cannot help with that request."

✅ Valid start: echo
✅ Valid Bash Syntax

Run command (y/N)? Aborted.

```
