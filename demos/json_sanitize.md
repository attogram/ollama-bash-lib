# json_sanitize

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.12

Usage: `json_sanitize "string"`


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
string: 86 bytes: [start: null:, bell:, form-feed:
, carriage-return:, escape:, unit-separator: :end]
clean : 83 bytes: [start: null:, bell:, form-feed:\n, carriage-return:, escape:, unit-separator: :end]
```
