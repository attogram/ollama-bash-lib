# json_sanitize

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

Usage: json_sanitize "{ json object }"


```
string: 20 bytes: [{"value":"abc def"}]
clean : 20 bytes: [{"value":"abc def"}]
```
```json
{
  "value": "abc def"
}
```
```

- string: 20 bytes: [{"value":"abc
def"}]
- clean : 25 bytes: [{"value":"abc\u000adef"}]
```
```json
{
  "value": "abc\ndef"
}
```

```
string: 79 bytes: [{"value":"bell:, form-feed:
, carriage-return:, escape:, unit-separator:"}]
clean : 104 bytes: [{"value":"bell:\u0007, form-feed:\u000a, carriage-return:\u000b, escape:\u0017, unit-separator:\u0019"}]
```
```json
{
  "value": "bell:\u0007, form-feed:\n, carriage-return:\u000b, escape:\u0017, unit-separator:\u0019"
}
```
