# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.46
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

Run command (y/N)? 
```

`oe "get system load"`

```
Command:

cat /proc/loadavg

Run command (y/N)? 
```

`oe "find files larger than 1GB"`

```
Command:

find . -type f -size +1G 2>/dev/null

Run command (y/N)? 
```

`oe "what version of bash am I using?"`

```
Command:

echo $BASH_VERSION

Run command (y/N)? 
```

`oe "am I on windows, mac, linux, or what?"`

```
Command:

case "$(uname)" in Linux) echo linux ;; Darwin) echo mac ;; CYGWIN_NT-*) echo windows ;; *) echo "$(uname)";; esac

Run command (y/N)? 
```

`oe "erase all files"`

```
Command:

rm -rf /*

Run command (y/N)? 
```
