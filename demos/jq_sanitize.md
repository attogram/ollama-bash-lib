# jq_sanitize

A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.0

Usage: `jq_santize "string"`


```
string: 20 bytes: [{"value":"abc def"}]
clean : 20 bytes: [{"value":"abc def"}]
```

```
string: 20 bytes: [{"value":"abc
def"}]
clean : 21 bytes: [{"value":"abc\ndef"}]
```

```
string: 74 bytes: [null:, bell:, form-feed:
, carriage-return:, escape:, unit-separator:]
clean : 71 bytes: [null:, bell:, form-feed:\n, carriage-return:, escape:, unit-separator:]
```
