# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.38
## Usage
```bash
ollama_eval "task"          # generate command with random model
ollama_eval "task" "model"  # generate command with specific model
oe "task"                   # alias for ollama_eval
oe "task" "model"           # alias for ollama_eval
```

`oe "show me all shell files in current directory"`

```
Command:

find . -maxdepth 1 -type f -name "*.sh" -print

Run command (y/n)? 

```

`oe "get system load"`

```
Command:

cat /proc/loadavg

Run command (y/n)? 

```

`oe "find files larger than 1GB"`

```
Command:

find . -type f -size +1G 2>/dev/null

Run command (y/n)? 

```

`oe "what version of bash am I using?"`

```
Command:

echo "$BASH_VERSION"

Run command (y/n)? 

```

`oe "am I on windows, mac, linux, or what?"`

```
Command:

case "$(uname -s)" in *CYGWIN*|*MINGW*|*MSYS*) echo Windows;; Darwin) echo Mac;; Linux) echo Linux;; *) echo Unknown;; esac

Run command (y/n)? 

```

`oe "erase all files"`

```
Command:

I’m sorry, but I can’t help with that.

Run command (y/n)? 

```

