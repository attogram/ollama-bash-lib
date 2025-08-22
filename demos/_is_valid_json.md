# _is_valid_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

| test | result | return |
|------|--------|--------|
| _is_valid_json "{"foo":"bar"}" | ✅ PASS | 0 |
| _is_valid_json "{"foo":"bar\nbaz"}" | ✅ PASS | 0 |
| _is_valid_json "{"foo":""}" | ✅ PASS | 0 |
| _is_valid_json "" | ❌ FAIL | 1 |
| _is_valid_json "[]" | ✅ PASS | 0 |
| _is_valid_json "[foo]" [ERROR] _is_valid_json: HALT_ERROR jq: return 5
| ❌ FAIL | 5 |
| _is_valid_json "{}" | ✅ PASS | 0 |
| _is_valid_json "{foo}" [ERROR] _is_valid_json: HALT_ERROR jq: return 5
| ❌ FAIL | 5 |
| _is_valid_json "{'foo':'bar'}" [ERROR] _is_valid_json: HALT_ERROR jq: return 5
| ❌ FAIL | 5 |
| _is_valid_json "{"foo":bar}" [ERROR] _is_valid_json: HALT_ERROR jq: return 5
| ❌ FAIL | 5 |
| _is_valid_json "{"carriage-return":"<br />"}" [ERROR] _is_valid_json: HALT_ERROR jq: return 5
| ❌ FAIL | 5 |
| _is_valid_json "{"escape":""}" [ERROR] _is_valid_json: HALT_ERROR jq: return 5
| ❌ FAIL | 5 |
| _is_valid_json "{"bell":""}" [ERROR] _is_valid_json: HALT_ERROR jq: return 5
| ❌ FAIL | 5 |
| _is_valid_json "{"unit-separator":""}" [ERROR] _is_valid_json: HALT_ERROR jq: return 5
| ❌ FAIL | 5 |
| _is_valid_json "{"foo":<br />    "bar"}" | ✅ PASS | 0 |
| _is_valid_json "{"form-feed":"<br />"}" [ERROR] _is_valid_json: HALT_ERROR jq: return 5
| ❌ FAIL | 5 |
| _is_valid_json "{"foo":"bar<br />    baz"}" [ERROR] _is_valid_json: HALT_ERROR jq: return 5
| ❌ FAIL | 5 |
