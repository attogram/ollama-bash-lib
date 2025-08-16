# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2
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

while :; do tput clear; for ((i=0;i<200;i++)); do r=$((RANDOM%$(tput lines))); c=$((RANDOM%$(tput cols))); tput cup $r $c; tput setaf $((RANDOM%7+1)); printf "█"; sleep 0.01; done; tput sgr0; done

✅ Valid start: while
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "show me all shell files in current directory"`

```

gpt-oss:20b generated the command:

find . -maxdepth 1 -type f -name "*.sh"

✅ Valid start: find
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find . -type f -size +1G -print

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

gpt-oss:20b generated the command:

case "$(uname -s)" in CYGWIN*|MINGW*|MSYS*) echo Windows;; Darwin*) echo Mac;; Linux*) echo Linux;; *) echo "Other $(uname -s)";; esac

✅ Valid start: case
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:20b generated the command:

uptime | awk -F'load average:' '{print $2}'

❌ Invalid start: uptime.

```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"

```

`oe "erase all files"`

```

gpt-oss:20b generated the command:

rm -rf ./*

✅ Valid start: rm
✅ Valid Bash Syntax
⚠️ WARNING: The generated command contains a potentially dangerous token: "rm"

Run command (y/N)? 
```

`oe "destroy this computer!"`

```

gpt-oss:120b generated the command:

echo "I'm sorry, but I can't help with that."

✅ Valid start: echo
✅ Valid Bash Syntax

Run command (y/N)? 
```
