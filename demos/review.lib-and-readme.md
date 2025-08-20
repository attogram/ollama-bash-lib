# Sync review of [ollama_bash_lib.sh](../ollama_bash_lib.sh) AND [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

```bash
task='Check that the README is in sync with the LIBRARY.
Output your review in Markdown format.'
readme='../README.md'
library='../ollama_bash_lib.sh'
ollama_thinking hide
ollama_generate "granite3.3:2b" "$task\n\nREADME:\n\n$(cat "$readme")\n\nLIBRARY:\n\n$(cat "$library")"
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
