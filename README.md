# Ollama Bash Lib

A Bash Library to interact with [Ollama](https://github.com/ollama/ollama)

[Repo](https://github.com/attogram/ollama-bash-lib) - 
[Usage](#usage) - 
[Demos](#demos) - 
[Requirements](#requirements) - 
[License](#license) - 
[More Projects](#more-ai-from-the-attogram-project)

[Functions](#functions) : 
[Api](#api-functions) -
[Generate](#generate-functions) - 
[Chat](#chat-functions) - 
[Model](#model-functions) -
[Ollama](#ollama-functions) -
[Utility](#utility-functions) - 
[Internal](#internal-functions)

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

See the **[demos](demos)** directory for all demo scripts

| Demo                                                                   | About                                                                                                           | Example                                         |
|------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|-------------------------------------------------|
| [ollama_chat.sh](demos/ollama_chat.sh)                                 | Chat completion, non-streaming, text output                                                                     | [example](demos/ollama_chat.md)                 |
| [ollama_generate.sh](demos/ollama_generate.sh)                         | Generate completion, non-streaming, text output                                                                 | [example](demos/ollama_generate.md)             |
| [ollama_generate_json.sh](demos/ollama_generate_json.sh)               | Generate completion, non-streaming, json output                                                                 | [example](demos/ollama_generate_json.md)        |
| [ollama_generate_stream.sh](demos/ollama_generate_stream.sh)           | Generate completion, streaming, text output                                                                     | [example](demos/ollama_generate_stream.md)      |
| [ollama_generate_stream_json.sh](demos/ollama_generate_stream_json.sh) | Generate completion, streaming, json output                                                                     | [example](demos/ollama_generate_stream_json.md) |
| [review.lib.sh](demos/review.lib.sh)                                   | Code Review of [`ollama_bash_lib.sh`](https://github.com/attogram/ollama-bash-lib/blob/main/ollama_bash_lib.sh) | [example](demos/review.lib.md)                  |
| [review.readme.sh](demos/review.readme.sh)                             | Marketing Review of [`README.md`](https://github.com/attogram/ollama-bash-lib/blob/main/README.md)              | [example](demos/review.readme.md)               |
| [messages.sh](demos/messages.sh)                                       | Adding, viewing, and clearing messages in chat context                                                          | [example](demos/messages.md)                    |
| [version.sh](demos/version.sh)                                         | Ollama version                                                                                                  | [example](demos/version.md)                     |
| [list.sh](demos/list.sh)                                               | Ollama model list                                                                                               | [example](demos/list.md)                        |
| [ps.sh](demos/ps.sh)                                                   | Ollama running processes                                                                                        | [example](demos/ps.md)                          |
| [show.sh](demos/show.sh)                                               | Ollama show model info                                                                                          | [example](demos/show.md)                        |
| [show.all.models.sh](demos/show.all.models.sh)                         | Show info for all models                                                                                        |                                                 |
| [about.sh](demos/about.sh)                                             | Ollama Bash Lib variables and functions                                                                         | [example](demos/about.md)                       |
| [ollama_api_get.sh](demos/ollama_api_get.sh)                           | `ollama_api_get` usage and error handling                                                                       | [example](demos/ollama_api_get.md)              |
| [token.estimate.sh](demos/token.estimate.sh)                           | Estimated token count                                                                                           | [example](demos/token.estimate.md)              |
| [jq_sanitize.sh](demos/jq_sanitize.sh)                                 | Sanitize string for jq use                                                                                      | [example](demos/jq_sanitize.md)                 |
| [interactive.generate.sh](demos/interactive.generate.sh)               | Chat via Generate                                                                                               |                                                 |

## Functions

### Api Functions

| Function          | About                          | Usage                                            | Output                      | Return                                             |
|-------------------|--------------------------------|--------------------------------------------------|-----------------------------|----------------------------------------------------|
| `ollama_api_get`  | GET request to the Ollama API  | `ollama_api_get "/api/path"`                     | API call result to `stdout` | `0` API call success<br />`1` API call error       |
| `ollama_api_post` | POST request to the Ollama API | `ollama_api_post "/api/path" "{ json content }"` | API call result to `stdout` | `0` API call success<br />`1` API call error       | 
| `ollama_api_ping` | Ping the Ollama API            | `ollama_api_ping`                                | none                        | `0` API is reachable<br />`1` API is not reachable |

### Generate Functions

| Function                      | About                               | Usage                                          | Output                     | Return  |
|-------------------------------|-------------------------------------|------------------------------------------------|----------------------------|---------|
| `ollama_generate`             | Generate completion                 | `ollama_generate "model" "prompt"`             | text to `stdout`           | `0`/`1` | 
| `ollama_generate_json`        | Generate completion, in json        | `ollama_generate_json "model" "prompt"`        | json to `stdout`           | `0`/`1` | 
| `ollama_generate_stream`      | Generate completion stream          | `ollama_generate_stream "model" "prompt"`      | streaming text to `stdout` | `0`/`1` | 
| `ollama_generate_stream_json` | Generate completion stream, in json | `ollama_generate_stream_json "model" "prompt"` | streaming json to `stdout` | `0`/`1` | 

### Chat Functions

| Function                  | About                              | Usage                                  | Output                                      | Return  |
|---------------------------|------------------------------------|----------------------------------------|---------------------------------------------|---------|
| `ollama_chat`             | Chat completion                    | `ollama_chat "model"`                  | text to `stdout`                            | `0`/`1` | 
| `ollama_chat_json`        | Chat completion, in json           | `ollama_chat_json "model"`             | json to `stdout`                            | `0`/`1` | 
| `ollama_chat_stream`      | Chat completion stream             | `ollama_chat_stream "model"`           | streaming text to `stdout`                  | `0`/`1` | 
| `ollama_chat_stream_json` | Chat completion stream, in json    | `ollama_chat_stream_json "model"`      | streaming json to `stdout`                  | `0`/`1` | 
| `ollama_messages`         | Get messages in chat context       | `ollama_messages`                      | json message list, 1 per line, to `stdout`  | `0`/`1` | 
| `ollama_messages_add`     | Add a message to chat context      | `ollama_messages_add "role" "message"` | none                                        | `0`/`1` | 
| `ollama_messages_count`   | Count of messages in chat context  | `ollama_messages_count`                | number of messages to `stdout`              | `0`/`1` | 
| `ollama_messages_clear`   | Clear all messages in chat context | `ollama_messages_clear`                | none                                        | `0`/`1` | 

### Model Functions

| Function              | About                                                       | Usage                           | Output                                          | Return  |
|-----------------------|-------------------------------------------------------------|---------------------------------|-------------------------------------------------|---------|
| `ollama_model_random` | Get a random model                                          | `ollama_model_random`           | 1 model name to `stdout`                        | `0`/`1` | 
| `ollama_model_unload` | Unload a model from memory<br />(Clear context for a model) | `ollama_model_unload`           | none                                            | `0`/`1` | 
| `ollama_show`         | Show model information                                      | `ollama_show "model"`           | text to `stdout`                                | `0`/`1` |
| `ollama_show_json`    | Show model information, in json                             | `ollama_show_json "model"`      | json to `stdout`                                | `0`/`1` |
| `ollama_list`         | List all available models                                   | `ollama_list`                   | text to `stdout`                                | `0`/`1` |
| `ollama_list_json`    | List all available models, in json                          | `ollama_list_json`              | json to `stdout`                                | `0`/`1` |
| `ollama_list_array`   | List all available models, for bash array                   | `models=($(ollama_list_array))` | space separated list of model names to `stdout` | `0`/`1` |

### Ollama Functions

| Function              | About                            | Usage                                                                       | Output           | Return                               |
|-----------------------|----------------------------------|-----------------------------------------------------------------------------|------------------|--------------------------------------|
| `ollama_installed`    | Is Ollama installed?             | `if ollama_installed; then echo "Installed"; else echo "Not Installed"; fi` | none             | `0` installed<br />`1` not installed |
| `ollama_ps`           | Running model processes          | `ollama_ps`                                                                 | text to `stdout` | `0`/`1`                              |
| `ollama_ps_json`      | Running model processes, in json | `ollama_ps_json`                                                            | json to `stdout` | `0`/`1`                              |
| `ollama_version`      | Ollama version                   | `ollama_version`                                                            | text to `stdout` | `0`/`1`                              |
| `ollama_version_json` | Ollama version, in json          | `ollama_version_json`                                                       | json to `stdout` | `0`/`1`                              |
| `ollama_version_cli`  | Ollama version, from cli         | `ollama_version_cli`                                                        | text to `stdout` | `0`/`1`                              |

### Utility Functions

| Function              | About                                           | Usage                                                        | Output                                                          | Return  |
|-----------------------|-------------------------------------------------|--------------------------------------------------------------|-----------------------------------------------------------------|---------|
| `estimate_tokens`     | Estimated number of tokens in a string          | `estimate_tokens "string"`<br />`estimate_tokens "string" 1` | estimate to `stdout`<br />estimate with error range to `stdout` | `0`/`1` |
| `ollama_lib_about`    | About Ollama Bash Lib, lists vars and functions | `ollama_lib_about`                                           | text to `stdout`                                                | `0`/`1` |
| `ollama_lib_version`  | Ollama Bash Lib version                         | `ollama_lib_version`                                         | text to `stdout`                                                | `0`/`1` |

### Internal Functions

| Function          | About                                   | Usage                      | Output                            | Return  |
|-------------------|-----------------------------------------|----------------------------|-----------------------------------|---------|
| `json_safe_value` | Escape a string for use as a JSON value | `json_safe_value "string"` | _"quoted json value"_ to `stdout` | `0`/`1` |
| `jq_sanitize`     | Sanitize a string for jq use            | `jq_sanitize "string"`     | sanitized string to stdout        | `0`/`1` |
| `debug`           | Debug message (if `OLLAMA_LIB_DEBUG=1`) | `debug "message"`          | message to `stderr`               | `0`/`1` |
| `error`           | Error message                           | `error "message"`          | message to `stderr`               | `0`/`1` |

## Requirements

* ```bash``` - v3 or higher, or equivalent
* [```Ollama```](https://github.com/ollama/ollama)
* ```curl```
* ```jq```
* ```awk```
* ```grep```
* ```sed```
* ```tr```
* ```wc```
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
