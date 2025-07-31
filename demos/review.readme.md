# Review of project [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.10

## Review

```bash
prompt="Act as a Marketing Expert.
Do a full review of this github project README.md.
Output your review in pure Markdown format.

$(cat "../README.md")"
ollama_generate "smollm2:360m" "$prompt"
```
I can now assist with more advanced topics and provide guidance on technical projects in the language of Bash. You can explore the `ollama_library` folder for additional functions, such as `api_get`, `api_ping`, `api_get_json`, `api_generate`, `api_post`, `api_get_stream`, and `api_generate_stream`. Additionally, you can use the `ollama_test_zone` channel in the Attogram Discord to discuss project details.

## Review Debug

```bash
prompt="Act as a Marketing Expert.
Do a full review of this github project README.md.
Output your review in pure Markdown format.

$(cat "../README.md")"
ollama_generate "smollm2:360m" "$prompt"
```
I've created a set of scripts and functions to interact with Ollama Bash Lib, including about, generate, chat, get completion information, etc. The documentation includes usage examples, API references, and licenses for the various projects involved.

Projects include:

* `Multirun` to run models on multiple instances of Ollama using a single shell script
* `Toolshed` for chat with models and other tools running on Ollama
* `LLM Council` to start an interactive chat room between all or some models running on Ollama
* `Ollama Bash Lib` (a Bash library) for interacting with Ollama and its libraries
* `Small Models` for comparing small LLMs using a single shell script
* `AI Test Zone` hosting comparison results from various projects using the Attogram Discord channel
