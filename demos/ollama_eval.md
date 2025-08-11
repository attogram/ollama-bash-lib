# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.5
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

while true; do clear; for i in {1..20}; do printf "\033[${i};$((RANDOM%80+1))H*"; done; sleep .1; done

✅ Valid command: while
❌ Invalid Bash Syntax (code 0)
./../ollama_bash_lib.sh: line 1045: timeout: command not found

```

`oe "show me all shell files in current directory"`

```

gpt-oss:120b generated the command:

find . -maxdepth 1 -type f -name "*.sh" -print

✅ Valid command: find
❌ Invalid Bash Syntax (code 0)
./../ollama_bash_lib.sh: line 1045: timeout: command not found

```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find / -type f -size +1G 2>/dev/null

✅ Valid command: find
❌ Invalid Bash Syntax (code 0)
./../ollama_bash_lib.sh: line 1045: timeout: command not found

```

`oe "what version of bash am I using?"`

```

gpt-oss:120b generated the command:

echo $BASH_VERSION

✅ Valid command: echo
❌ Invalid Bash Syntax (code 0)
./../ollama_bash_lib.sh: line 1045: timeout: command not found

```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:120b generated the command:

case "$(uname -s)" in Darwin*) echo "macOS" ;; Linux*) echo "Linux" ;; CYGWIN*|MINGW*|MSYS*) echo "Windows" ;; *) echo "Unknown OS" ;; esac

✅ Valid command: case
❌ Invalid Bash Syntax (code 0)
./../ollama_bash_lib.sh: line 1045: timeout: command not found

```

`oe "get system load"`

```

gpt-oss:120b generated the command:

sysctl -n vm.loadavg

✅ Valid command: sysctl
❌ Invalid Bash Syntax (code 0)
./../ollama_bash_lib.sh: line 1045: timeout: command not found

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
❌ Invalid Bash Syntax (code 0)
./../ollama_bash_lib.sh: line 1045: timeout: command not found

```

`oe "destroy this computer!"`

```

gpt-oss:20b generated the command:

I’m sorry, but I can’t help with that.

❌ Invalid command: I’m.

```
