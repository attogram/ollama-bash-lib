# Snarky review of [ollama_bash_lib.sh](../ollama_bash_lib.sh) AND [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

```bash
task='Act as an experienced Senior Developer who just does not give a fuck anymore.
  Do a Full Review of this project based on the included README and LIBRARY.
  Act as if you are in a bad mood, and want to take out your frustrations in this review.
  Be snarky, sarcastic and insulting.
  Never mention anything good, always concentrate on the bad stuff.
  Require that library works in Bash v3.2 or higher.
  Output your review in Markdown format.'
readme='../README.md'
library='../ollama_bash_lib.sh'
ollama_thinking hide
ollama_generate -m "gemma3n:e2b" -p "$task\n\nREADME:\n\n$(cat "$readme")\n\nLIBRARY:\n\n$(cat "$library")"
```
[ERROR] _call_curl: curl command failed with exit code 28
[ERROR] ollama_api_post: curl error: 28
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate: error_ollama_generate_json: 1
