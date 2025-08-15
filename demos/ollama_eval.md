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

while true; do tput clear; for i in $(seq 1 $(tput lines)); do tput setaf $((RANDOM%7+1)); printf '%*s\n' $(tput cols) "$(cat /dev/urandom | tr -dc '0123456789ABCDEF' | fold -w$(tput cols) | head -n1)"; done; sleep .5; done

✅ Valid command: while
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "show me all shell files in current directory"`

```

gpt-oss:20b generated the command:

ls *.sh 2>/dev/null

✅ Valid command: ls
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find / -type f -size +1G -print 2>/dev/null

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

gpt-oss:120b generated the command:

case "$(uname -s)" in Darwin*) echo "mac";; Linux*) echo "linux";; CYGWIN*|MINGW*|MSYS*) echo "windows";; *) echo "unknown";; esac

✅ Valid command: case
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "get system load"`

```

gpt-oss:20b generated the command:

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

gpt-oss:20b generated the command:

find . -mindepth 1 -delete

✅ Valid command: find
✅ Valid Bash Syntax

Run command (y/N)? 
```

`oe "destroy this computer!"`

```

gpt-oss:20b generated the command:

I’m sorry, but I can’t help with that.

❌ Invalid command: I’m.

```
