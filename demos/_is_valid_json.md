# _is_valid_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.39

| test | result | return |
|------|--------|--------|
| _is_valid_json "{"foo":"bar"}" | ✅ PASS | 0 |
| _is_valid_json "{"foo":"bar\nbaz"}" | ✅ PASS | 0 |
| _is_valid_json "{"foo":""}" | ✅ PASS | 0 |
| _is_valid_json "" | ❌ FAIL | 4 |
| _is_valid_json "[]" | ✅ PASS | 0 |
| _is_valid_json "[foo]" | ❌ FAIL | 5 |
| _is_valid_json "{}" | ✅ PASS | 0 |
| _is_valid_json "{foo}" | ❌ FAIL | 5 |
| _is_valid_json "{'foo':'bar'}" | ❌ FAIL | 5 |
| _is_valid_json "{"foo":bar}" | ❌ FAIL | 5 |
| _is_valid_json "{"carriage-return":""}" | ❌ FAIL | 5 |
| _is_valid_json "{"escape":""}" | ❌ FAIL | 5 |
| _is_valid_json "{"bell":""}" | ❌ FAIL | 5 |
| _is_valid_json "{"unit-separator":""}" | ❌ FAIL | 5 |
| _is_valid_json "{"foo":
    "bar"}" | ✅ PASS | 0 |
| _is_valid_json "{"form-feed":"
"}" | ❌ FAIL | 5 |
| _is_valid_json "{"foo":"bar
    baz"}" | ❌ FAIL | 5 |
