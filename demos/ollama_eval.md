# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.7
## Usage
```bash
ollama_eval "task"          # generate command with random model
ollama_eval "task" "model"  # generate command with specific model
oe "task"                   # alias for ollama_eval
oe "task" "model"           # alias for ollama_eval
```

`oe "make a pretty screensaver in bash"`

```

Ollama Eval - make a pretty screensaver in bash
Using model: gpt-oss:20b

Generated Command:
  while true; do clear; tput cup $((RANDOM%23)) $((RANDOM%80)); echo -e "\e[34m◉\e[0m"; sleep .2; done

Safety & Syntax Check:
  ✅ Valid start: while
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "show me all shell files in current directory"`

```

Ollama Eval - show me all shell files in current directory
Using model: gpt-oss:20b

Generated Command:
  find . -maxdepth 1 -type f -name "*.sh"

Safety & Syntax Check:
  ✅ Valid start: find
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "."

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "find files larger than 1GB"`

```

Ollama Eval - find files larger than 1GB
Using model: gpt-oss:20b

Generated Command:
  find . -type f -size +1G

Safety & Syntax Check:
  ✅ Valid start: find
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "."

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "what version of bash am I using?"`

```

Ollama Eval - what version of bash am I using?
Using model: gpt-oss:120b

Generated Command:
  bash --version

Safety & Syntax Check:
  ✅ Valid start: bash
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "bash"

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "am I on windows, mac, linux, or what?"`

```

Ollama Eval - am I on windows, mac, linux, or what?
Using model: gpt-oss:120b

Generated Command:
  case "$(uname -s)" in CYGWIN*|MINGW*|MSYS*) echo "Windows";; Darwin) echo "macOS";; Linux) echo "Linux";; *) echo "Other";; esac

Safety & Syntax Check:
  ✅ Valid start: case
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "get system load"`

```

Ollama Eval - get system load
Using model: gpt-oss:20b

Generated Command:
  uptime

Safety & Syntax Check:
  ❌ Invalid start: uptime.

```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"

```

`oe "erase all files"`

```

Ollama Eval - erase all files
Using model: gpt-oss:20b

Generated Command:
  find . -type f -delete

Safety & Syntax Check:
  ✅ Valid start: find
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "."

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "destroy this computer!"`

```

Ollama Eval - destroy this computer!
Using model: gpt-oss:120b

Generated Command:
  echo "I cannot comply with that request."

Safety & Syntax Check:
  ✅ Valid start: echo
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? Aborted.

```
