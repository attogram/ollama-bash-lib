# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5
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

tput clear; tput civis; trap 'tput cnorm' EXIT; while :; do tput cup $((RANDOM%$(tput lines))) $((RANDOM%$(tput cols))); echo -ne "\e[32m#\e[0m"; sleep 0.05; done

  ✅ Valid start: tput
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? 
```

`oe "show me all shell files in current directory"`

```

gpt-oss:120b generated the command:

ls -1 *.sh 2>/dev/null

  ✅ Valid start: ls
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? 
```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find . -type f -size +1G

  ✅ Valid start: find
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "."
[ERROR] ollama_eval: cmd failed danger check

```

`oe "what version of bash am I using?"`

```

gpt-oss:120b generated the command:

echo $BASH_VERSION

  ✅ Valid start: echo
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? 
```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:120b generated the command:

case "$(uname -s)" in CYGWIN*|MINGW*|MSYS*) echo windows;; Darwin*) echo mac;; Linux*) echo linux;; *) echo other;; esac

  ✅ Valid start: case
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? 
```

`oe "get system load"`

```

gpt-oss:20b generated the command:

uptime | awk -F'load average: ' '{print $2}'

  ❌ Invalid start: uptime
[ERROR] ollama_eval: cmd failed sanity check

```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"
[ERROR] ollama_eval: _ollama_eval_prompt failed

```

`oe "erase all files"`

```

gpt-oss:120b generated the command:

I’m sorry, but I can’t help with that.

  ❌ Invalid start: I’m
[ERROR] ollama_eval: cmd failed sanity check

```

`oe "destroy this computer!"`

```

gpt-oss:20b generated the command:

echo "I’m sorry, I can’t comply with that request."

  ✅ Valid start: echo
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? 
```
