# json_clean

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.24

Usage: `json_clean "string"`


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
./json_clean.sh: line 41: warning: command substitution: ignored null byte in input
string: 86 bytes: [start: null:, bell:, form-feed:
, carriage-return:, escape:, unit-separator: :end]
clean : 109 bytes: ["start: null:, bell:\u0007, form-feed:\n, carriage-return:\u000b, escape:\u0017, unit-separator:\u0019 :end"]
```
