# _escape_control_characters

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.24

Usage: _escape_control_characters "string"


```
string: 20 bytes: [{"value":"abc def"}]
clean : 20 bytes: [{"value":"abc def"}]
```
```json
{"value":"abc def"}
```
```

- string: 20 bytes: [{"value":"abc
def"}]
- clean : 20 bytes: [{"value":"abc
def"}]
```
```json
jq: parse error: Invalid string: control characters from U+0000 through U+001F must be escaped at line 2, column 4
```

```
string: 79 bytes: [{"value":"bell:, form-feed:
, carriage-return:, escape:, unit-separator:"}]
clean : 79 bytes: [{"value":"bell:, form-feed:
, carriage-return:, escape:, unit-separator:"}]
```
```json
jq: parse error: Invalid string: control characters from U+0000 through U+001F must be escaped at line 2, column 48
```
