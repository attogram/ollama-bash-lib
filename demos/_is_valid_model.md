# _is_valid_model

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.7

| test | output | return | result |
|------|--------|--------|--------|
| `mistral:7b` | mistral:7b | 0 | ✅ PASS |
| `` | gpt-oss:120b | 0 | ✅ PASS |
| `hf.co/user/Model-name:QUANT` | hf.co/user/Model-name:QUANT | 0 | ✅ PASS |
| `abcdefghijklmnopqrstuvwxyz` | abcdefghijklmnopqrstuvwxyz | 0 | ✅ PASS |
| `1234567890` | 1234567890 | 0 | ✅ PASS |
| `mistral:7b` | mistral:7b | 0 | ✅ PASS |
| `my:model:name` | my:model:name | 0 | ✅ PASS |
| `:leadingcolon` | :leadingcolon | 0 | ✅ PASS |
| `trailingcolon:` | trailingcolon: | 0 | ✅ PASS |
| `llama2` | llama2 | 0 | ✅ PASS |
| `llama2-13b` | llama2-13b | 0 | ✅ PASS |
| `gemma_2.0` | gemma_2.0 | 0 | ✅ PASS |
| `phi-3-mini` | phi-3-mini | 0 | ✅ PASS |
| `mixtral.1.2` | mixtral.1.2 | 0 | ✅ PASS |
| `model-001_v2` | model-001_v2 | 0 | ✅ PASS |
| `A` | A | 0 | ✅ PASS |
| `z` | z | 0 | ✅ PASS |
| `0` | 0 | 0 | ✅ PASS |
| `_.-:%-.0s` |  | 1 | ❌ FAIL |
| `mistral 7b` |  | 1 | ❌ FAIL |
| `mistral/7b` | mistral/7b | 0 | ✅ PASS |
| `mistral\7b` |  | 1 | ❌ FAIL |
| `mistral@7b` |  | 1 | ❌ FAIL |
| `mistral#7b` |  | 1 | ❌ FAIL |
| `mistral$7b` |  | 1 | ❌ FAIL |
| `mistral%7b` |  | 1 | ❌ FAIL |
| `mistral^7b` |  | 1 | ❌ FAIL |
| `mistral&7b` |  | 1 | ❌ FAIL |
| `mistral*7b` |  | 1 | ❌ FAIL |
| `mistral(7b)` |  | 1 | ❌ FAIL |
| `mistral+7b` |  | 1 | ❌ FAIL |
| `mistral=7b` |  | 1 | ❌ FAIL |
| `mistral{7b}` |  | 1 | ❌ FAIL |
| `mistral[7b]` |  | 1 | ❌ FAIL |
| `mistral<7b>` |  | 1 | ❌ FAIL |
| `mistral?7b` |  | 1 | ❌ FAIL |
| `mistral,7b` |  | 1 | ❌ FAIL |
| `mistral;7b` |  | 1 | ❌ FAIL |
| `mistral:"7b` |  | 1 | ❌ FAIL |
| ` leadingSpace` |  | 1 | ❌ FAIL |
| `trailingSpace ` |  | 1 | ❌ FAIL |
| ` both ` |  | 1 | ❌ FAIL |
| ` ` |  | 1 | ❌ FAIL |
| `模型` |  | 1 | ❌ FAIL |
| `модель` |  | 1 | ❌ FAIL |
| `modelé` |  | 1 | ❌ FAIL |
| `model😀` |  | 1 | ❌ FAIL |
