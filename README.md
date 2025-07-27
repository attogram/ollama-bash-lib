# Ollama Bash Lib

A Bash Library to interact with [Ollama](https://github.com/ollama/ollama)

Repo: https://github.com/attogram/ollama-bash-lib

## Usage

Include in your shell or script:
```bash
source ./ollama_bash_lib.sh
```

Include in your script, with error checking:
```bash
ollama_bash_lib="path/to/ollama_bash_lib.sh"
if [ ! -f "$ollama_bash_lib" ]; then
  echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"
  exit 1
fi
source "$ollama_bash_lib"
```

## Demos

See the **[demos](demos)** directory for demo scripts:

* [about.sh](demos/about.sh) - Ollama Bash Lib variables and functions ([example](demos/about.txt))
* [generate.sh](demos/generate.sh) - Generate a completion from a random model, non-streaming, TEXT output ([example](demos/generate.txt))
* [generate.json.sh](demos/generate.json.sh) - Generate a completion from a random model, non-streaming, JSON output ([example](demos/generate.json.txt))
* [generate.streaming.sh](demos/generate.streaming.sh) - Generate a completion from a random model, streaming, TEXT output ([example](demos/generate.streaming.txt))
* [generate.streaming.json.sh](demos/generate.streaming.json.sh) - Generate a completion from a random model, streaming, JSON output ([example](demos/generate.streaming.json.txt))
* [generate.interactive.sh](demos/generate.interactive.sh) - Chat via Generate with a random model ([example](demos/generate.interactive.txt))
* [version.sh](demos/version.sh) - Ollama version ([example](demos/version.txt))
* [list.sh](demos/list.sh) - Ollama model list ([example](demos/list.txt))
* [ps.sh](demos/ps.sh) - Ollama running processes ([example](demos/ps.txt))
* [show.sh](demos/show.sh) - Ollama show info for a random model ([example](demos/show.txt))
* [show.all.models.sh](demos/show.all.models.sh) - Show info for all models
* [token.estimate.sh](demos/token.estimate.sh) - Estimated token count ([example](demos/token.estimate.txt))
* [review.lib.sh](demos/review.lib.sh) - Prompt a random model to do a code review of Ollama Bash Lib ([example](demos/review.lib.txt))
* [review.readme.sh](demos/review.readme.sh) - Prompt a random model to do a review of Ollama Bash README ([example](demos/review.readme.txt))
* [ollama_get.sh](demos/ollama_get.sh) - `ollama_get` usage ([example](demos/ollama_get.txt))

## Functions

### Api Functions

| Function      | About                          | Usage                                        | Output                      | Return                                       |
|---------------|--------------------------------|----------------------------------------------|-----------------------------|----------------------------------------------|
| `ollama_get`  | GET request to the Ollama API  | `ollama_get "/api/path"`                     | API call result to `stdout` | `0` API call success<br />`1` API call error |
| `ollama_post` | POST request to the Ollama API | `ollama_post "/api/path" "{ json content }"` | API call result to `stdout` | `0` API call success<br />`1` API call error | 

### Ollama Functions

| Function           | About                | Usage                                                                       | Output | Return                               |
|--------------------|----------------------|-----------------------------------------------------------------------------|--------|--------------------------------------|
| `ollama_installed` | Is Ollama installed? | `if ollama_installed; then echo "Installed"; else echo "Not Installed"; fi` | none   | `0` installed<br />`1` not installed |

### Generate Functions

| Function                      | About                                 | Usage                                          | Output                     | Return  |
|-------------------------------|---------------------------------------|------------------------------------------------|----------------------------|---------|
| `ollama_generate`             | Generate a completion                 | `ollama_generate "model" "prompt"`             | text to `stdout`           | `0`/`1` | 
| `ollama_generate_json`        | Generate a completion, in json        | `ollama_generate_json "model" "prompt"`        | json to `stdout`           | `0`/`1` | 
| `ollama_generate_stream`      | Generate a completion stream          | `ollama_generate_stream "model" "prompt"`      | streaming text to `stdout` | `0`/`1` | 
| `ollama_generate_stream_json` | Generate a completion stream, in json | `ollama_generate_stream_json "model" "prompt"` | streaming json to `stdout` | `0`/`1` | 


### Model Functions
* ```ollama_random_model```
  * Get a random model
  * Returns: 1 model name
* ```ollama_unload_model```
  * Unload a model from memory (Clear context for a model)
  * Usage: ```ollama_unload_model "modelName"```

### List Functions
* ```ollama_list```
  * All available models, cli version
* ```ollama_list_json```
  * All available models, JSON version
* ```ollama_list_array```
  * All available models, Bash array version
  * Usage: ```models=($(ollama_list_array))```
  * Returns: space separated list of model names

### Process Functions
* ```ollama_ps```
  * Running model processes, cli version
* ```ollama_ps_json```
  * Running model processes, JSON version

### Show Functions
* ```ollama_show```
  * Show model information, cli version
  * Usage: ```ollama_show "modelName"```
* ```ollama_show_json```
  * Show model information, JSON version
  * Usage: ```ollama_show_json "modelName"```

### Version Functions
* ```ollama_version```
  * Ollama application version, TEXT version
* ```ollama_version_json```
  * Ollama application version, JSON version
* ```ollama_version_cli```
  * Ollama application version, CLI version

### Utility Functions


| Function           | About                                           | Usage                                                        | Output                                                          | Return  |
|--------------------|-------------------------------------------------|--------------------------------------------------------------|-----------------------------------------------------------------|---------|
| `ollama_about_lib` | About Ollama Bash Lib, lists vars and functions | `ollama_about_lib`                                           | text to `stdout`                                                | `0`/`1` |
| `estimate_tokens`  | Estimated number of tokens in a string          | `estimate_tokens "string"`<br />`estimate_tokens "string" 1` | estimate to `stdout`<br />estimate with error range to `stdout` | `0`/`1` |
| `json_safe`        | Escape a string for use as a JSON value         | `json_safe "string"`                                         | _"quoted json value"_ to `stdout`                               | `0`/`1` |
| `debug`            | Debug message (if `OLLAMA_BASH_LIB_DEBUG=1`)    | `debug "message"`                                            | message to `stderr`                                             | `0`/`1` |
| `error`            | Error message                                   | `error "message"`                                            | message to `stderr`                                             | `0`/`1` |

## Requirements

* ```bash``` - v3 or higher, or equivalent
* [```Ollama```](https://github.com/ollama/ollama)
* ```curl```
* ```jq```
* ```awk```
* ```command```

## License

Ollama Bash Lib is licensed under the terms of the [MIT License](LICENSE).

## More AI from the Attogram Project

| Project             | Github Repo                                  | Description                                                                                                                                                                                 |
|---------------------|----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Multirun**        | [ollama-multirun][ollama-multirun]           | Run a prompt against all, or some, of your models running on Ollama.<br />Creates web pages with the output, performance statistics and model info.<br />All in a single Bash shell script. |
| **Toolshed**        | [ollama-bash-toolshed][ollama-bash-toolshed] | Chat with tool calling models.<br />Sample tools included.<br />Add new tools to your shed with ease.<br />Runs on Ollama.<br />All via Bash shell scripts.                                 |
| **LLM Council**     | [llm-council][llm-council]                   | Start a chat room between all, or some, of your models running on Ollama.<br />All in a single Bash shell script.                                                                           |
| **Ollama Bash Lib** | [ollama-bash-lib][ollama-bash-lib]           | A Bash Library to interact with Ollama                                                                                                                                                      | 
| **Small Models**    | [small-models][small-models]                 | Comparison of small open source LLMs (8b parameters or less)                                                                                                                                |
| **AI Test Zone**    | [ai_test_zone][ai_test_zone]                 | Test results hosted on https://attogram.github.io/ai_test_zone/                                                                                                                             |

[ollama-multirun]: <https://github.com/attogram/ollama-multirun> "Ollama Multirun"
[ollama-bash-toolshed]: <https://github.com/attogram/ollama-bash-toolshed> "Ollama Bash Toolshed"
[llm-council]: <https://github.com/attogram/llm-council> "LLM Council"
[ollama-bash-lib]: <https://github.com/attogram/ollama-bash-lib> "Ollama Bash Lib"
[small-models]: <https://github.com/attogram/small-models> "Small Models"
[ai_test_zone]: <https://github.com/attogram/ai_test_zone> "AI Test Zone"
