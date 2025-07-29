# jq_sanitize
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.2

Usage: `jq_santize "string"`


```
jq_sanitize "{"value":"abc\ndef"}"

{"value":"abc\ndef"}

```
```
jq_sanitize "{"value":"abc
def"}"

{"value":"abc
def"}

```
```
jq_sanitize "Control Characters: null: bell: form feed:
 carriage return: escape: unite separator: "

Control Characters: null: bell: form feed:
 carriage return: escape: unite separator: 

```
