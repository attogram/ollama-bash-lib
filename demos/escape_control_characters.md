# _escape_control_characters

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.39

Usage: _escape_control_characters "string"


```
./escape_control_characters.sh: line 24: _escape_control_characters: command not found
string: 20 bytes: [{"value":"abc def"}]
clean : 1 bytes: []
```
```json
```
```

./escape_control_characters.sh: line 37: _escape_control_characters: command not found
- string: 20 bytes: [{"value":"abc
def"}]
- clean : 1 bytes: []
```
```json
```

```
./escape_control_characters.sh: line 55: _escape_control_characters: command not found
string: 79 bytes: [{"value":"bell:, form-feed:
, carriage-return:, escape:, unit-separator:"}]
clean : 1 bytes: []
```
```json
```
