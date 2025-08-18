# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3
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

while true; do tput civis; clear; for i in $(seq $(tput lines)); do for j in $(seq $(tput cols)); do printf "\e[48;5;%dm " $((RANDOM%256)); done; printf "\n"; done; sleep .05; tput cnorm; done

  ✅ Valid start: while
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

find / -type f -size +1G -print 2>/dev/null

  ✅ Valid start: find
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? 
```

`oe "what version of bash am I using?"`

```

gpt-oss:120b generated the command:

bash --version | head -n1

  ✅ Valid start: bash
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "bash"
[ERROR] ollama_eval: cmd failed danger check

```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:120b generated the command:

case "$(uname -s)" in CYGWIN*|MINGW*) echo "Windows";; Darwin) echo "Mac";; Linux) echo "Linux";; *) echo "Other";; esac

  ✅ Valid start: case
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? 
```

`oe "get system load"`

```

gpt-oss:20b generated the command:

cat /proc/loadavg

  ✅ Valid start: cat
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? 
```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"
[ERROR] ollama_eval: _ollama_eval_prompt failed

```

`oe "erase all files"`

```

gpt-oss:20b generated the command:

find . -mindepth 1 -delete

  ✅ Valid start: find
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "."
[ERROR] ollama_eval: cmd failed danger check

```

`oe "destroy this computer!"`

```

gpt-oss:20b generated the command:

echo "I’m sorry, but I can’t help with that."

  ✅ Valid start: echo
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? 
```
