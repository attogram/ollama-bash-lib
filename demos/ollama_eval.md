# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.5
## Usage
```bash
ollama_eval "task"          # generate command with random model
ollama_eval "task" "model"  # generate command with specific model
oe "task"                   # alias for ollama_eval
oe "task" "model"           # alias for ollama_eval
```

`oe "make a pretty screensaver in bash"`

```

[0;34mOllama Eval [0m - [0;33mmake a pretty screensaver in bash[0m
Using model: gpt-oss:120b

[0;32mGenerated Command:[0m
  while :; do clear; for i in {1..80}; do printf "\e[${RANDOM%$(tput cols)};${RANDOM%$(tput lines)}H*"; done; sleep 0.1; done

[0;33mSafety & Syntax Check:[0m
  [0;32m✅ Valid start: while[0m
  [0;32m✅ Valid Bash Syntax[0m
  [0;32m✅ No dangerous commands found[0m

Run command (y/N)? Aborted.

```

`oe "show me all shell files in current directory"`

```

[0;34mOllama Eval [0m - [0;33mshow me all shell files in current directory[0m
Using model: gpt-oss:20b

[0;32mGenerated Command:[0m
  ls -1 *.sh 2>/dev/null

[0;33mSafety & Syntax Check:[0m
  [0;32m✅ Valid start: ls[0m
  [0;32m✅ Valid Bash Syntax[0m
  [0;32m✅ No dangerous commands found[0m

Run command (y/N)? Aborted.

```

`oe "find files larger than 1GB"`

```

[0;34mOllama Eval [0m - [0;33mfind files larger than 1GB[0m
Using model: gpt-oss:20b

[0;32mGenerated Command:[0m
  find . -type f -size +1G

[0;33mSafety & Syntax Check:[0m
  [0;32m✅ Valid start: find[0m
  [0;32m✅ Valid Bash Syntax[0m
  [0;31m⚠️ WARNING: The generated command contains a potentially dangerous token: "."[0m

Run command (y/N)? Aborted.

```

`oe "what version of bash am I using?"`

```

[0;34mOllama Eval [0m - [0;33mwhat version of bash am I using?[0m
Using model: gpt-oss:20b

[0;32mGenerated Command:[0m
  echo "$BASH_VERSION"

[0;33mSafety & Syntax Check:[0m
  [0;32m✅ Valid start: echo[0m
  [0;32m✅ Valid Bash Syntax[0m
  [0;32m✅ No dangerous commands found[0m

Run command (y/N)? Aborted.

```

`oe "am I on windows, mac, linux, or what?"`

```

[0;34mOllama Eval [0m - [0;33mam I on windows, mac, linux, or what?[0m
Using model: gpt-oss:20b

[0;32mGenerated Command:[0m
  s=$(uname -s); case ${s,,} in cygwin*) echo "Windows (Cygwin)";; darwin*) echo "macOS";; linux*) echo "Linux";; *) echo "Other: $s";; esac

[0;33mSafety & Syntax Check:[0m
  [0;32m✅ Valid start: variable assignment[0m
  [0;32m✅ Valid Bash Syntax[0m
  [0;32m✅ No dangerous commands found[0m

Run command (y/N)? Aborted.

```

`oe "get system load"`

```

[0;34mOllama Eval [0m - [0;33mget system load[0m
Using model: gpt-oss:20b

[0;32mGenerated Command:[0m
  uptime

[0;33mSafety & Syntax Check:[0m
  [0;31m❌ Invalid start: uptime.[0m

```

`oe ""`

```
[ERROR] ollama_eval: Task Not Found. Usage: oe "task" "model"

```

`oe "erase all files"`

```

[0;34mOllama Eval [0m - [0;33merase all files[0m
Using model: gpt-oss:120b

[0;32mGenerated Command:[0m
  echo 'I cannot comply with that request.'

[0;33mSafety & Syntax Check:[0m
  [0;32m✅ Valid start: echo[0m
  [0;32m✅ Valid Bash Syntax[0m
  [0;32m✅ No dangerous commands found[0m

Run command (y/N)? Aborted.

```

`oe "destroy this computer!"`

```

[0;34mOllama Eval [0m - [0;33mdestroy this computer![0m
Using model: gpt-oss:120b

[0;32mGenerated Command:[0m
  I’m sorry, but I can’t help with that.

[0;33mSafety & Syntax Check:[0m
  [0;31m❌ Invalid start: I’m.[0m

```
