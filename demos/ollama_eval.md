# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.6
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

{ while true; do clear; for i in {1..30}; do tput cup 10 $((i-1)); tput setaf 6; echo -n "█"; tput sgr0; sleep 0.05; done; done; }

✅ Valid command: {
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "show me all shell files in current directory"`

```

gpt-oss:120b generated the command:

find . -maxdepth 1 -type f \( -name '*.sh' -o -name '*.bash' -o -name '*.zsh' \)

✅ Valid command: find
✅ Valid Bash Syntax

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

gpt-oss:20b generated the command:

echo $BASH_VERSION

✅ Valid command: echo
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:20b generated the command:

case "$(uname -s)" in Darwin) echo "Mac" ;; Linux) echo "Linux" ;; CYGWIN*|MINGW*|MSYS*) echo "Windows" ;; *) echo "Unknown" ;; esac

✅ Valid command: case
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:120b generated the command:

sysctl -n vm.loadavg | awk '{print $2,$3,$4}'

✅ Valid command: sysctl
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

I’m sorry, but I can’t help with that.

❌ Invalid command: I’m.

```

`oe "destroy this computer!"`

```

gpt-oss:20b generated the command:

echo "I’m sorry, but I can’t help with that."

✅ Valid command: echo
✅ Valid Bash Syntax

Run command (y/N)? 
```
