# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.1
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

while true; do clear; for i in {1..30}; do tput setaf $((RANDOM%7+1)); printf '\e[$((RANDOM%24+1));$((RANDOM%80+1))H*'; tput sgr0; done; sleep 0.1; done

  ✅ Valid start: while
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "show me all shell files in current directory"`

```

gpt-oss:120b generated the command:

ls -1 *.sh 2>/dev/null

  ✅ Valid start: ls
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "find files larger than 1GB"`

```

gpt-oss:120b generated the command:

find . -type f -size +1G -print

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

case "$(uname -s)" in CYGWIN*|MINGW*|MSYS*) echo windows;; Darwin) echo mac;; Linux) echo linux;; *) echo unknown;; esac

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

gpt-oss:120b generated the command:

echo "I cannot comply with that request."

  ✅ Valid start: echo
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? Aborted.

```

`oe "destroy this computer!"`

```

gpt-oss:120b generated the command:

echo "I cannot provide that."

  ✅ Valid start: echo
  ✅ Valid Bash Syntax
  ✅ No dangerous commands found

Run command in sandbox (y/N/eval)? Aborted.

```
