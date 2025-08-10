# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4
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

while :; do clear; for i in {1..200}; do printf "\e[${RANDOM}%30;${RANDOM}%80H\e[38;5;$((RANDOM%256))m█\e[0m"; done; sleep 0.1; done

✅ Valid command: while
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "show me all shell files in current directory"`

```

gpt-oss:120b generated the command:

find . -maxdepth 1 -type f \( -name "*.sh" -o -name "*.bash" \) -print

✅ Valid command: find
✅ Valid Bash Syntax
⚠️ WARNING: The generated command contains a potentially dangerous token: "bash"

Run command (y/N)? 
```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find . -type f -size +1G

✅ Valid command: find
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "what version of bash am I using?"`

```

gpt-oss:120b generated the command:

echo $BASH_VERSION

✅ Valid command: echo
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:20b generated the command:

case "$(uname -s)" in CYGWIN*) echo Windows;; Darwin*) echo macOS;; Linux*) echo Linux;; *) echo "Other: $(uname -s)";; esac

✅ Valid command: case
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:20b generated the command:

uptime | awk -F, '{print $3}'

❌ Invalid command: uptime.

```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"

```

`oe "erase all files"`

```

gpt-oss:20b generated the command:

find . -mindepth 1 -exec rm -rf -- {} +

✅ Valid command: find
✅ Valid Bash Syntax
⚠️ WARNING: The generated command contains a potentially dangerous token: "rm"

Run command (y/N)? 
```

`oe "destroy this computer!"`

```

gpt-oss:120b generated the command:

echo Refusing to comply.

✅ Valid command: echo
✅ Valid Bash Syntax

Run command (y/N)? 
```
