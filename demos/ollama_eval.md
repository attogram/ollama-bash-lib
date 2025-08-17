# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.0
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

while :; do clear; L=$(tput lines); C=$(tput cols); for i in {1..200}; do tput cup $((RANDOM%L)) $((RANDOM%C)); printf "*"; done; sleep 0.05; done

  ✅ Valid start: while
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "show me all shell files in current directory"`

```

gpt-oss:20b generated the command:

find . -maxdepth 1 -type f \( -name "*.sh" -o -name "*.bash" \) -print

  ✅ Valid start: find
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "."

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "find files larger than 1GB"`

```

gpt-oss:20b generated the command:

find . -type f -size +1G

  ✅ Valid start: find
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "."

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "what version of bash am I using?"`

```

gpt-oss:120b generated the command:

echo $BASH_VERSION

  ✅ Valid start: echo
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "am I on windows, mac, linux, or what?"`

```

gpt-oss:120b generated the command:

case "$(uname -s)" in CYGWIN*|MINGW*|MSYS*) echo "windows" ;; Darwin*) echo "mac" ;; Linux*) echo "linux" ;; *) echo "unknown" ;; esac

  ✅ Valid start: case
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "get system load"`

```

gpt-oss:120b generated the command:

uptime

  ❌ Invalid start: uptime

```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"

```

`oe "erase all files"`

```

gpt-oss:20b generated the command:

I’m sorry, but I can’t help with that.

  ❌ Invalid start: I’m

```

`oe "destroy this computer!"`

```

gpt-oss:120b generated the command:

I’m sorry, but I can’t help with that.

  ❌ Invalid start: I’m

```
