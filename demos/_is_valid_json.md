# _is_valid_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

| test | result | return |
|------|--------|--------|
| _is_valid_json "{"foo":"bar"}" | ✅ PASS | 0 |
| _is_valid_json "{"foo":"bar\nbaz"}" | ✅ PASS | 0 |
| _is_valid_json "{"foo":""}" | ✅ PASS | 0 |
| _is_valid_json "" | ❌ FAIL | 1 |
| _is_valid_json "[]" | ✅ PASS | 0 |
| _is_valid_json "[foo]" | ❌ FAIL | 5 |
| _is_valid_json "{}" | ✅ PASS | 0 |
| _is_valid_json "{foo}" | ❌ FAIL | 5 |
| _is_valid_json "{'foo':'bar'}" | ❌ FAIL | 5 |
| _is_valid_json "{"foo":bar}" | ❌ FAIL | 5 |
| _is_valid_json "{"carriage-return":"<br />"}" | ❌ FAIL | 5 |
| _is_valid_json "{"escape":""}" | ❌ FAIL | 5 |
| _is_valid_json "{"bell":""}" | ❌ FAIL | 5 |
| _is_valid_json "{"unit-separator":""}" | ❌ FAIL | 5 |
| _is_valid_json "{"foo":<br />    "bar"}" | ✅ PASS | 0 |
| _is_valid_json "{"form-feed":"<br />"}" | ❌ FAIL | 5 |
| _is_valid_json "{"foo":"bar<br />    baz"}" | ❌ FAIL | 5 |
