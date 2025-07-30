# json_safe_value

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.6

Usage: `json_safe_value "string"`


```
string: 20 bytes: [{"value":"abc def"}]
clean : 26 bytes: ["{\"value\":\"abc def\"}"]
```

```
string: 20 bytes: [{"value":"abc
def"}]
clean : 27 bytes: ["{\"value\":\"abc\ndef\"}"]
```

```
string: 86 bytes: [start: null:, bell:, form-feed:
, carriage-return:, escape:, unit-separator: :end]
clean : 109 bytes: ["start: null:, bell:\u0007, form-feed:\n, carriage-return:\u000b, escape:\u0017, unit-separator:\u0019 :end"]
```
