# jq_sanitize
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1
```

good_json: {"value":"abc\ndef"}

jq_sanitize "{"value":"abc\ndef"}"

{"value":"abc\ndef"}


bad_json: {"value":"abc
def"}

jq_sanitize "{"value":"abc
def"}"

{"value":"abcdef"}

```
