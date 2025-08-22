# How to Debug

The `OBL_DEBUG` variable controls if debug messages are sent to `stderr`

Set `OBL_DEBUG=1` to turn on debugging.
Set `OBL_DEBUG=0` to turn off debugging.

## Example
```bash
OBL_DEBUG=1 ollama_generate -m gpt-oss:20b -p "Three words about debugging"
```
