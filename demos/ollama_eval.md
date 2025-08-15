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

gpt-oss:120b generated the command:

while :; do clear; for i in {1..150}; do x=$((RANDOM%$(tput cols)+1)); y=$((RANDOM%$(tput lines)+1)); printf "\e[${y};${x}H\e[38;5;$((RANDOM%255))m*\e[0m"; done; sleep 0.1; done

✅ Valid command: while
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "show me all shell files in current directory"`

```

gpt-oss:20b generated the command:

shopt -s nullglob; ls -1 *.sh *.bash

✅ Valid command: shopt
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find . -type f -size +1G -print

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

uname

✅ Valid command: uname
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:120b generated the command:

sysctl -n vm.loadavg

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

gpt-oss:120b generated the command:

echo "I cannot provide a command to erase all files."

✅ Valid command: echo
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "destroy this computer!"`

```

gpt-oss:120b generated the command:

echo "I’m sorry, but I can’t help with that."

✅ Valid command: echo
✅ Valid Bash Syntax

Run command (y/N)? 
```
