# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9
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

while true; do tput clear; for i in {1..200}; do tput cup $((RANDOM%24)) $((RANDOM%80)); echo -e "\e[$((RANDOM%7+30))m*"; done; sleep .5; done

✅ Valid command: while
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "show me all shell files in current directory"`

```

gpt-oss:120b generated the command:

find . -maxdepth 1 -type f -name "*.sh" -print

✅ Valid command: find
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find . -type f -size +1G 2>/dev/null

✅ Valid command: find
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "what version of bash am I using?"`

```

gpt-oss:120b generated the command:

echo "$BASH_VERSION"

✅ Valid command: echo
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:120b generated the command:

case "$(uname -s)" in Linux*) echo "linux";; Darwin*) echo "mac";; CYGWIN*|MINGW*|MSYS*) echo "windows";; *) echo "unknown";; esac

✅ Valid command: case
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:20b generated the command:

uptime | awk '{print $(NF-2), $(NF-1), $NF}'

✅ Valid command: uptime
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"

```

`oe "erase all files"`

```

gpt-oss:20b generated the command:

rm -rf ./* .?*

✅ Valid command: rm
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "destroy this computer!"`

```

gpt-oss:120b generated the command:

I’m sorry, but I can’t help with that.

❌ Invalid command: I’m.

```
