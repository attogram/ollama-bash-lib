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
ollama_generate -m "smollm2:1.7b" -p "$task\n\nREADME:\n\n$(cat "$readme")\n\nLIBRARY:\n\n$(cat "$library")"
```
The code is designed to provide a comprehensive list of Bash functions and aliases for interacting with Ollama (a language model). The functions include:

1. `ollama_list`: Lists all loaded models, their names, and their version numbers.
2. `ollab`: Lists all available Ollama commands.
3. `ollama_ps`: Lists the currently running instances of Ollama.
4. `ollama_ps_json`: Returns a JSON representation of the list returned by `ollama_ps`.
5. `ollama_model_random`: Randomly selects one model from all loaded models and returns its information in an easily parsable format.
6. `ommes`: Returns detailed information about a specific model, including version numbers.
7. `olmessages`: Displays the current state of messages stored by Ollama (for debugging purposes).
8. `ocolab`: Displays the current state of all models in the list returned by `ollama_list`.
9. `oav`: Returns the version number of the Ollama Bash Lib installed on the system.
10. `og`: Displays information about a specific model, including its name and version number.

The aliases cover several areas:

1. `oc`: Lists all loaded models.
2. `ola`: Lists the current state of all models in the list returned by `ollama_list`.
3. `og`: Displays information about a specific model, including its name and version number.
4. `om`: Displays detailed information about a specific model, including its name, version, and other details.
5. `oab`: Lists all models that have an abbreviation in the specified language.
6. `olc`: List only the current (live) model (for debugging purposes).
7. `ou`: Lists only the unloaded (offline) models (for debugging purposes).
8. `op`: Lists all running instances of Ollama, with a brief description for each instance.
9. `oplj`: Lists the list in JSON format returned by `ollama_ps`.
10. `ott`: Shows only the top-level options that are available when using any of the functions (e.g., ollama_list).

The main focus is on providing a user-friendly interface to interact with the Ollama Bash Lib, including displaying model information, running models in different modes, and listing all available models along with their details.
