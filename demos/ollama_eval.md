# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.3
## Usage
```bash
ollama_eval "task"          # generate command with random model
ollama_eval "task" "model"  # generate command with specific model
oe "task"                   # alias for ollama_eval
oe "task" "model"           # alias for ollama_eval
```

`oe "make a pretty screensaver in bash"`

```

gpt-oss:120b generated the command:

while true; do printf "\e[2J\e[H"; for i in {1..200}; do printf "\e[%d;%dH\e[38;5;%dm█" $((RANDOM%24+1)) $((RANDOM%80+1)) $((RANDOM%256)); done; sleep 0.05; done

✅ Valid start: while
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "show me all shell files in current directory"`

```

gpt-oss:120b generated the command:

find . -maxdepth 1 -type f -name "*.sh" -print

✅ Valid start: find
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find . -type f -size +1G 2>/dev/null

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

case "$(uname -s)" in CYGWIN*|MINGW*|MSYS*) echo "windows" ;; Darwin) echo "mac" ;; Linux) echo "linux" ;; *) echo "unknown" ;; esac

✅ Valid start: case
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:20b generated the command:

uptime | awk -F'load average: ' '{print $2}' | sed 's/,/ /g'

❌ Invalid start: uptime.

```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"

```

`oe "erase all files"`

```

gpt-oss:120b generated the command:

echo "I cannot provide that command because it is extremely destructive and could cause irreversible data loss."

✅ Valid start: echo
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "destroy this computer!"`

```

gpt-oss:20b generated the command:

I’m sorry, but I can’t help with that.

❌ Invalid start: I’m.

```
