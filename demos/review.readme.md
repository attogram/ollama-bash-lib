# Review of project [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.2

## Review


```bash
prompt="Act as an expert Technical Marketer.
Do a full review of this project README:

$(cat "../README.md")"
ollama_generate "mistral:7b" "$prompt"
```
```
 # Ollama Bash Library (OLLAMA_LIB)

The OLLAMA_LIB is a Bash library for interacting with the Ollama AI platform. This library provides functions to manage models, run prompts, and perform other tasks related to working with Ollama.

## Requirements

* `bash` version 3 or higher (or equivalent)
* [Ollama](https://github.com/ollama/ollama)
* `curl`
* `jq`
* `awk`
* `grep`
* `sed`
* `tr`
* `wc`
* `command`

## Functions

### Model Functions

#### ollama_model_random

Retrieves a random model name from Ollama.

```bash
ollama_model_random
```

#### ollama_show

Displays information about the specified model, including its name, size, and other details.

```bash
ollama_show [MODEL_NAME]
```

#### ollama_list

Lists all available models on Ollama.

```bash
ollama_list
```

### Prompt Functions

#### run_prompt

Runs a prompt against the specified model or a random model if no model is provided.

```bash
run_prompt [PROMPT] [MODEL_NAME]
```

### Utilities

#### ollama_lib_about

Displays information about the OLLAMA_LIB, including the installed version and a list of available functions.

```bash
ollama_lib_about
```

## Installation

To install the OLLAMA_LIB, follow these steps:

1. Clone this repository to your local machine.
2. Copy the `ollama_lib.sh` script to a location in your PATH.
3. Make sure you have the required dependencies installed on your system.
4. Include the library in your scripts by sourcing the `ollama_lib.sh` file at the beginning:

```bash
. /path/to/your/ollama_lib.sh
```

## Usage Examples

### Running a prompt against a random model

```bash
. /path/to/your/ollama_lib.sh

run_prompt "Tell me a joke"
```

### Listing available models on Ollama

```bash
. /path/to/your/ollama_lib.sh

ollama_list
```

## License

The OLLAMA_LIB is licensed under the terms of the [MIT License](LICENSE).

For more AI projects from Attogram, check out:

* [Ollama Multirun](https://github.com/attogram/ollama-multirun)
* [Ollama Bash Toolshed](https://github.com/attogram/ollama-bash-toolshed)
* [LLM Council](https://github.com/attogram/llm-council)
* [Small Models](https://github.com/attogram/small-models)
* [AI Test Zone](https://github.com/attogram/ai_test_zone)
```

## Review Debug


```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "mistral:7b" "$prompt"
```
```
[DEBUG] ollama_generate: [mistral:7b] [Act as an expert Technical Marketer.
Do a full review of this project README:

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

| Demo                                                                   | About                                                                                                                          | Example                                         |
|------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------|
| [about.sh](demos/about.sh)                                             | Ollama Bash Lib variables and functions                                                                                        | [example](demos/about.md)                       |
| [ollama_api_get.sh](demos/ollama_api_get.sh)                           | `ollama_api_get` usage and error handling                                                                                      | [example](demos/ollama_api_get.md)              |
| [ollama_generate.sh](demos/ollama_generate.sh)                         | Generate completion from a random model, non-streaming, text output                                                            | [example](demos/ollama_generate.md)             |
| [ollama_generate_json.sh](demos/ollama_generate_json.sh)               | Generate completion from a random model, non-streaming, json output                                                            | [example](demos/ollama_generate_json.md)        |
| [ollama_generate_stream.sh](demos/ollama_generate_stream.sh)           | Generate completion from a random model, streaming, text output                                                                | [example](demos/ollama_generate_stream.md)      |
| [ollama_generate_stream_json.sh](demos/ollama_generate_stream_json.sh) | Generate completion from a random model, streaming, json output                                                                | [example](demos/ollama_generate_stream_json.md) |
| [interactive.generate.sh](demos/interactive.generate.sh)               | Chat via Generate with a random model                                                                                          |                                                 |
| [messages.sh](demos/messages.sh)                                       | Adding, viewing, and clearing messages in chat context                                                                         | [example](demos/messages.md)                    |
| [ollama_chat.sh](demos/ollama_chat.sh)                                 | Chat completion from a random model, non-streaming, text output                                                                | [example](demos/ollama_chat.md)                 |
| [version.sh](demos/version.sh)                                         | Ollama version                                                                                                                 | [example](demos/version.md)                     |
| [list.sh](demos/list.sh)                                               | Ollama model list                                                                                                              | [example](demos/list.md)                        |
| [ps.sh](demos/ps.sh)                                                   | Ollama running processes                                                                                                       | [example](demos/ps.md)                          |
| [show.sh](demos/show.sh)                                               | Ollama show info for a random model                                                                                            | [example](demos/show.md)                        |
| [show.all.models.sh](demos/show.all.models.sh)                         | Show info for all models                                                                                                       |                                                 |
| [token.estimate.sh](demos/token.estimate.sh)                           | Estimated token count                                                                                                          | [example](demos/token.estimate.md)              |
| [jq_sanitize.sh](demos/jq_sanitize.sh)                                 | Sanitize string for jq use                                                                                                     | [example](demos/jq_sanitize.md)                 |
| [review.lib.sh](demos/review.lib.sh)                                   | Review of [`ollama_bash_lib.sh`](https://github.com/attogram/ollama-bash-lib/blob/main/ollama_bash_lib.sh) from a random model | [example](demos/review.lib.md)                  |
| [review.readme.sh](demos/review.readme.sh)                             | Review of [`README.md`](https://github.com/attogram/ollama-bash-lib/blob/main/README.md) from a random model                   | [example](demos/review.readme.md)               |

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
[ai_test_zone]: <https://github.com/attogram/ai_test_zone> "AI Test Zone"]
[DEBUG] ollama_generate_json: [mistral:7b] [Act as an expert Technical Marketer.
Do a full review of this project README:

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

| Demo                                                                   | About                                                                                                                          | Example                                         |
|------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------|
| [about.sh](demos/about.sh)                                             | Ollama Bash Lib variables and functions                                                                                        | [example](demos/about.md)                       |
| [ollama_api_get.sh](demos/ollama_api_get.sh)                           | `ollama_api_get` usage and error handling                                                                                      | [example](demos/ollama_api_get.md)              |
| [ollama_generate.sh](demos/ollama_generate.sh)                         | Generate completion from a random model, non-streaming, text output                                                            | [example](demos/ollama_generate.md)             |
| [ollama_generate_json.sh](demos/ollama_generate_json.sh)               | Generate completion from a random model, non-streaming, json output                                                            | [example](demos/ollama_generate_json.md)        |
| [ollama_generate_stream.sh](demos/ollama_generate_stream.sh)           | Generate completion from a random model, streaming, text output                                                                | [example](demos/ollama_generate_stream.md)      |
| [ollama_generate_stream_json.sh](demos/ollama_generate_stream_json.sh) | Generate completion from a random model, streaming, json output                                                                | [example](demos/ollama_generate_stream_json.md) |
| [interactive.generate.sh](demos/interactive.generate.sh)               | Chat via Generate with a random model                                                                                          |                                                 |
| [messages.sh](demos/messages.sh)                                       | Adding, viewing, and clearing messages in chat context                                                                         | [example](demos/messages.md)                    |
| [ollama_chat.sh](demos/ollama_chat.sh)                                 | Chat completion from a random model, non-streaming, text output                                                                | [example](demos/ollama_chat.md)                 |
| [version.sh](demos/version.sh)                                         | Ollama version                                                                                                                 | [example](demos/version.md)                     |
| [list.sh](demos/list.sh)                                               | Ollama model list                                                                                                              | [example](demos/list.md)                        |
| [ps.sh](demos/ps.sh)                                                   | Ollama running processes                                                                                                       | [example](demos/ps.md)                          |
| [show.sh](demos/show.sh)                                               | Ollama show info for a random model                                                                                            | [example](demos/show.md)                        |
| [show.all.models.sh](demos/show.all.models.sh)                         | Show info for all models                                                                                                       |                                                 |
| [token.estimate.sh](demos/token.estimate.sh)                           | Estimated token count                                                                                                          | [example](demos/token.estimate.md)              |
| [jq_sanitize.sh](demos/jq_sanitize.sh)                                 | Sanitize string for jq use                                                                                                     | [example](demos/jq_sanitize.md)                 |
| [review.lib.sh](demos/review.lib.sh)                                   | Review of [`ollama_bash_lib.sh`](https://github.com/attogram/ollama-bash-lib/blob/main/ollama_bash_lib.sh) from a random model | [example](demos/review.lib.md)                  |
| [review.readme.sh](demos/review.readme.sh)                             | Review of [`README.md`](https://github.com/attogram/ollama-bash-lib/blob/main/README.md) from a random model                   | [example](demos/review.readme.md)               |

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
[ai_test_zone]: <https://github.com/attogram/ai_test_zone> "AI Test Zone"]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 11 bytes [mistral:7b]
[DEBUG] json_safe_value: 17852 bytes [Act as an expert Technical Marketer.
Do a full review of this project README:

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

| Demo                                                                   | About                                                                                                                          | Example                                         |
|------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------|
| [about.sh](demos/about.sh)                                             | Ollama Bash Lib variables and functions                                                                                        | [example](demos/about.md)                       |
| [ollama_api_get.sh](demos/ollama_api_get.sh)                           | `ollama_api_get` usage and error handling                                                                                      | [example](demos/ollama_api_get.md)              |
| [ollama_generate.sh](demos/ollama_generate.sh)                         | Generate completion from a random model, non-streaming, text output                                                            | [example](demos/ollama_generate.md)             |
| [ollama_generate_json.sh](demos/ollama_generate_json.sh)               | Generate completion from a random model, non-streaming, json output                                                            | [example](demos/ollama_generate_json.md)        |
| [ollama_generate_stream.sh](demos/ollama_generate_stream.sh)           | Generate completion from a random model, streaming, text output                                                                | [example](demos/ollama_generate_stream.md)      |
| [ollama_generate_stream_json.sh](demos/ollama_generate_stream_json.sh) | Generate completion from a random model, streaming, json output                                                                | [example](demos/ollama_generate_stream_json.md) |
| [interactive.generate.sh](demos/interactive.generate.sh)               | Chat via Generate with a random model                                                                                          |                                                 |
| [messages.sh](demos/messages.sh)                                       | Adding, viewing, and clearing messages in chat context                                                                         | [example](demos/messages.md)                    |
| [ollama_chat.sh](demos/ollama_chat.sh)                                 | Chat completion from a random model, non-streaming, text output                                                                | [example](demos/ollama_chat.md)                 |
| [version.sh](demos/version.sh)                                         | Ollama version                                                                                                                 | [example](demos/version.md)                     |
| [list.sh](demos/list.sh)                                               | Ollama model list                                                                                                              | [example](demos/list.md)                        |
| [ps.sh](demos/ps.sh)                                                   | Ollama running processes                                                                                                       | [example](demos/ps.md)                          |
| [show.sh](demos/show.sh)                                               | Ollama show info for a random model                                                                                            | [example](demos/show.md)                        |
| [show.all.models.sh](demos/show.all.models.sh)                         | Show info for all models                                                                                                       |                                                 |
| [token.estimate.sh](demos/token.estimate.sh)                           | Estimated token count                                                                                                          | [example](demos/token.estimate.md)              |
| [jq_sanitize.sh](demos/jq_sanitize.sh)                                 | Sanitize string for jq use                                                                                                     | [example](demos/jq_sanitize.md)                 |
| [review.lib.sh](demos/review.lib.sh)                                   | Review of [`ollama_bash_lib.sh`](https://github.com/attogram/ollama-bash-lib/blob/main/ollama_bash_lib.sh) from a random model | [example](demos/review.lib.md)                  |
| [review.readme.sh](demos/review.readme.sh)                             | Review of [`README.md`](https://github.com/attogram/ollama-bash-lib/blob/main/README.md) from a random model                   | [example](demos/review.readme.md)               |

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
[ai_test_zone]: <https://github.com/attogram/ai_test_zone> "AI Test Zone"]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"mistral:7b","prompt":"Act as an expert Technical Marketer.
Do a full review of this project README:

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
ollama_bash_lib=\"path/to/ollama_bash_lib.sh\"
if [ ! -f \"$ollama_bash_lib\" ]; then
  echo \"ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib\"
  exit 1
fi
source \"$ollama_bash_lib\"
```

## Demos

See the **[demos](demos)** directory for all demo scripts

| Demo                                                                   | About                                                                                                                          | Example                                         |
|------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------|
| [about.sh](demos/about.sh)                                             | Ollama Bash Lib variables and functions                                                                                        | [example](demos/about.md)                       |
| [ollama_api_get.sh](demos/ollama_api_get.sh)                           | `ollama_api_get` usage and error handling                                                                                      | [example](demos/ollama_api_get.md)              |
| [ollama_generate.sh](demos/ollama_generate.sh)                         | Generate completion from a random model, non-streaming, text output                                                            | [example](demos/ollama_generate.md)             |
| [ollama_generate_json.sh](demos/ollama_generate_json.sh)               | Generate completion from a random model, non-streaming, json output                                                            | [example](demos/ollama_generate_json.md)        |
| [ollama_generate_stream.sh](demos/ollama_generate_stream.sh)           | Generate completion from a random model, streaming, text output                                                                | [example](demos/ollama_generate_stream.md)      |
| [ollama_generate_stream_json.sh](demos/ollama_generate_stream_json.sh) | Generate completion from a random model, streaming, json output                                                                | [example](demos/ollama_generate_stream_json.md) |
| [interactive.generate.sh](demos/interactive.generate.sh)               | Chat via Generate with a random model                                                                                          |                                                 |
| [messages.sh](demos/messages.sh)                                       | Adding, viewing, and clearing messages in chat context                                                                         | [example](demos/messages.md)                    |
| [ollama_chat.sh](demos/ollama_chat.sh)                                 | Chat completion from a random model, non-streaming, text output                                                                | [example](demos/ollama_chat.md)                 |
| [version.sh](demos/version.sh)                                         | Ollama version                                                                                                                 | [example](demos/version.md)                     |
| [list.sh](demos/list.sh)                                               | Ollama model list                                                                                                              | [example](demos/list.md)                        |
| [ps.sh](demos/ps.sh)                                                   | Ollama running processes                                                                                                       | [example](demos/ps.md)                          |
| [show.sh](demos/show.sh)                                               | Ollama show info for a random model                                                                                            | [example](demos/show.md)                        |
| [show.all.models.sh](demos/show.all.models.sh)                         | Show info for all models                                                                                                       |                                                 |
| [token.estimate.sh](demos/token.estimate.sh)                           | Estimated token count                                                                                                          | [example](demos/token.estimate.md)              |
| [jq_sanitize.sh](demos/jq_sanitize.sh)                                 | Sanitize string for jq use                                                                                                     | [example](demos/jq_sanitize.md)                 |
| [review.lib.sh](demos/review.lib.sh)                                   | Review of [`ollama_bash_lib.sh`](https://github.com/attogram/ollama-bash-lib/blob/main/ollama_bash_lib.sh) from a random model | [example](demos/review.lib.md)                  |
| [review.readme.sh](demos/review.readme.sh)                             | Review of [`README.md`](https://github.com/attogram/ollama-bash-lib/blob/main/README.md) from a random model                   | [example](demos/review.readme.md)               |

## Functions

### Api Functions

| Function          | About                          | Usage                                            | Output                      | Return                                             |
|-------------------|--------------------------------|--------------------------------------------------|-----------------------------|----------------------------------------------------|
| `ollama_api_get`  | GET request to the Ollama API  | `ollama_api_get \"/api/path\"`                     | API call result to `stdout` | `0` API call success<br />`1` API call error       |
| `ollama_api_post` | POST request to the Ollama API | `ollama_api_post \"/api/path\" \"{ json content }\"` | API call result to `stdout` | `0` API call success<br />`1` API call error       | 
| `ollama_api_ping` | Ping the Ollama API            | `ollama_api_ping`                                | none                        | `0` API is reachable<br />`1` API is not reachable |

### Generate Functions

| Function                      | About                               | Usage                                          | Output                     | Return  |
|-------------------------------|-------------------------------------|------------------------------------------------|----------------------------|---------|
| `ollama_generate`             | Generate completion                 | `ollama_generate \"model\" \"prompt\"`             | text to `stdout`           | `0`/`1` | 
| `ollama_generate_json`        | Generate completion, in json        | `ollama_generate_json \"model\" \"prompt\"`        | json to `stdout`           | `0`/`1` | 
| `ollama_generate_stream`      | Generate completion stream          | `ollama_generate_stream \"model\" \"prompt\"`      | streaming text to `stdout` | `0`/`1` | 
| `ollama_generate_stream_json` | Generate completion stream, in json | `ollama_generate_stream_json \"model\" \"prompt\"` | streaming json to `stdout` | `0`/`1` | 

### Chat Functions

| Function                  | About                              | Usage                                  | Output                                      | Return  |
|---------------------------|------------------------------------|----------------------------------------|---------------------------------------------|---------|
| `ollama_chat`             | Chat completion                    | `ollama_chat \"model\"`                  | text to `stdout`                            | `0`/`1` | 
| `ollama_chat_json`        | Chat completion, in json           | `ollama_chat_json \"model\"`             | json to `stdout`                            | `0`/`1` | 
| `ollama_chat_stream`      | Chat completion stream             | `ollama_chat_stream \"model\"`           | streaming text to `stdout`                  | `0`/`1` | 
| `ollama_chat_stream_json` | Chat completion stream, in json    | `ollama_chat_stream_json \"model\"`      | streaming json to `stdout`                  | `0`/`1` | 
| `ollama_messages`         | Get messages in chat context       | `ollama_messages`                      | json message list, 1 per line, to `stdout`  | `0`/`1` | 
| `ollama_messages_add`     | Add a message to chat context      | `ollama_messages_add \"role\" \"message\"` | none                                        | `0`/`1` | 
| `ollama_messages_count`   | Count of messages in chat context  | `ollama_messages_count`                | number of messages to `stdout`              | `0`/`1` | 
| `ollama_messages_clear`   | Clear all messages in chat context | `ollama_messages_clear`                | none                                        | `0`/`1` | 

### Model Functions

| Function              | About                                                       | Usage                           | Output                                          | Return  |
|-----------------------|-------------------------------------------------------------|---------------------------------|-------------------------------------------------|---------|
| `ollama_model_random` | Get a random model                                          | `ollama_model_random`           | 1 model name to `stdout`                        | `0`/`1` | 
| `ollama_model_unload` | Unload a model from memory<br />(Clear context for a model) | `ollama_model_unload`           | none                                            | `0`/`1` | 
| `ollama_show`         | Show model information                                      | `ollama_show \"model\"`           | text to `stdout`                                | `0`/`1` |
| `ollama_show_json`    | Show model information, in json                             | `ollama_show_json \"model\"`      | json to `stdout`                                | `0`/`1` |
| `ollama_list`         | List all available models                                   | `ollama_list`                   | text to `stdout`                                | `0`/`1` |
| `ollama_list_json`    | List all available models, in json                          | `ollama_list_json`              | json to `stdout`                                | `0`/`1` |
| `ollama_list_array`   | List all available models, for bash array                   | `models=($(ollama_list_array))` | space separated list of model names to `stdout` | `0`/`1` |

### Ollama Functions

| Function              | About                            | Usage                                                                       | Output           | Return                               |
|-----------------------|----------------------------------|-----------------------------------------------------------------------------|------------------|--------------------------------------|
| `ollama_installed`    | Is Ollama installed?             | `if ollama_installed; then echo \"Installed\"; else echo \"Not Installed\"; fi` | none             | `0` installed<br />`1` not installed |
| `ollama_ps`           | Running model processes          | `ollama_ps`                                                                 | text to `stdout` | `0`/`1`                              |
| `ollama_ps_json`      | Running model processes, in json | `ollama_ps_json`                                                            | json to `stdout` | `0`/`1`                              |
| `ollama_version`      | Ollama version                   | `ollama_version`                                                            | text to `stdout` | `0`/`1`                              |
| `ollama_version_json` | Ollama version, in json          | `ollama_version_json`                                                       | json to `stdout` | `0`/`1`                              |
| `ollama_version_cli`  | Ollama version, from cli         | `ollama_version_cli`                                                        | text to `stdout` | `0`/`1`                              |

### Utility Functions

| Function              | About                                           | Usage                                                        | Output                                                          | Return  |
|-----------------------|-------------------------------------------------|--------------------------------------------------------------|-----------------------------------------------------------------|---------|
| `estimate_tokens`     | Estimated number of tokens in a string          | `estimate_tokens \"string\"`<br />`estimate_tokens \"string\" 1` | estimate to `stdout`<br />estimate with error range to `stdout` | `0`/`1` |
| `ollama_lib_about`    | About Ollama Bash Lib, lists vars and functions | `ollama_lib_about`                                           | text to `stdout`                                                | `0`/`1` |
| `ollama_lib_version`  | Ollama Bash Lib version                         | `ollama_lib_version`                                         | text to `stdout`                                                | `0`/`1` |

### Internal Functions

| Function          | About                                   | Usage                      | Output                            | Return  |
|-------------------|-----------------------------------------|----------------------------|-----------------------------------|---------|
| `json_safe_value` | Escape a string for use as a JSON value | `json_safe_value \"string\"` | _\"quoted json value\"_ to `stdout` | `0`/`1` |
| `jq_sanitize`     | Sanitize a string for jq use            | `jq_sanitize \"string\"`     | sanitized string to stdout        | `0`/`1` |
| `debug`           | Debug message (if `OLLAMA_LIB_DEBUG=1`) | `debug \"message\"`          | message to `stderr`               | `0`/`1` |
| `error`           | Error message                           | `error \"message\"`          | message to `stderr`               | `0`/`1` |

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

[ollama-multirun]: <https://github.com/attogram/ollama-multirun> \"Ollama Multirun\"
[ollama-bash-toolshed]: <https://github.com/attogram/ollama-bash-toolshed> \"Ollama Bash Toolshed\"
[llm-council]: <https://github.com/attogram/llm-council> \"LLM Council\"
[ollama-bash-lib]: <https://github.com/attogram/ollama-bash-lib> \"Ollama Bash Lib\"
[small-models]: <https://github.com/attogram/small-models> \"Small Models\"
[ai_test_zone]: <https://github.com/attogram/ai_test_zone> \"AI Test Zone\"","stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 24819 bytes
[DEBUG] jq_sanitize: 24819 bytes [{"model":"mistral:7b","created_at":"2025-07-30T17:53:49.412119Z","response":" Here is a brief description of each section in the provided text:

1. **Act as Ollama Bash Lib**: This part explains that the text acts as the documentation for the Ollama Bash Library, which is a Bash library to interact with the open-source language model platform called Ollama.

2. **Requirements**: This section lists the required tools and software needed to use the Ollama Bash Library.

3. **License**: This section states that the Ollama Bash Lib is licensed under the terms of the MIT License.

4. **More AI from the Attogram Project**: This final section provides links to other projects related to AI developed by the Attogram project, such as Multirun, Toolshed, LLM Council, Ollama Bash Lib, Small Models, and AI Test Zone. Each project has a brief description of its purpose.","done":true,"done_reason":"stop","context":[3,29473,4550,1158,1164,8351,26698,4423,2391,29491,781,5725,1032,2941,4826,1070,1224,3256,25573,2342,29515,781,781,29539,1219,1352,3554,1133,1797,12329,781,781,29509,1133,1797,11580,1066,14881,1163,1501,29530,1352,3554,5889,4655,2276,6990,29491,1443,29516,1561,3554,29516,1561,3554,29499,781,781,29560,27048,5889,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,29494,1797,29501,5240,29499,1155,29473,781,29560,16968,5889,29539,16820,29499,1155,29473,781,29560,17757,1153,5889,29539,9111,1153,29499,1155,29473,781,29560,23743,2107,5889,29539,7119,2107,29499,1155,29473,781,29560,10196,5889,29539,17344,29499,1155,29473,781,29560,16047,8527,29481,5889,29539,5220,29501,2353,29501,3979,29501,2005,29501,1829,12545,29501,6999,29499,781,781,29560,23840,5889,29539,20427,29499,1482,29473,781,29560,7887,5889,29539,3784,29501,20427,29499,1155,781,29560,24110,5889,29539,15769,29501,20427,29499,1155,29473,781,29560,18933,5889,29539,13700,29501,20427,29499,1155,29473,781,29560,3802,5889,29539,4317,29501,20427,29499,1155,781,29560,29530,1352,3554,5889,29539,1561,3554,29501,20427,29499,1155,781,29560,27249,5889,29539,1097,2000,29501,20427,29499,1155,29473,781,29560,9661,5889,29539,7815,29501,20427,29499,781,781,1832,5315,1233,781,781,27206,1065,1342,10811,1210,7535,29515,781,14708,29600,29494,1797,781,2162,18217,1561,3554,29498,29494,1797,29498,5240,29491,1579,781,14708,29600,781,781,27206,1065,1342,7535,29493,1163,2886,13547,29515,781,14708,29600,29494,1797,781,1561,3554,29498,29494,1797,29498,5240,1503,2508,29516,1300,29516,1561,3554,29498,29494,1797,29498,5240,29491,1579,29507,781,1103,1501,1686,1155,29490,8453,1561,3554,29498,29494,1797,29498,5240,29507,12658,1636,781,29473,4662,1113,5500,29515,1219,1352,3554,1133,1797,12329,3048,5964,29515,1197,1561,3554,29498,29494,1797,29498,5240,29507,781,29473,8558,29473,29508,781,8739,781,2162,8453,1561,3554,29498,29494,1797,29498,5240,29507,781,14708,29600,781,781,1832,5035,1153,781,781,8760,1040,1387,29560,9111,1153,5889,9111,1153,10863,9886,1122,1312,24737,27072,781,781,29534,5035,29477,1127,1127,1127,1127,1027,1110,8402,1127,1127,1127,1127,1127,1127,1127,3368,1110,17461,1127,1127,1041,1110,781,29534,1945,1945,1945,1945,1477,29534,1945,1945,1945,1945,1945,1945,1945,1945,29534,1945,1945,1945,29501,29534,781,29534,1501,14914,29491,1579,5889,9111,1153,29516,14914,29491,1579,29499,1127,1127,1326,1110,1219,1352,3554,1133,1797,12329,9693,1072,6340,1127,1127,1127,1127,1127,6158,1110,1501,8244,5889,9111,1153,29516,14914,29491,2805,29499,1127,1196,1110,781,29534,1501,1561,3554,29498,3784,29498,1295,29491,1579,5889,9111,1153,29516,1561,3554,29498,3784,29498,1295,29491,1579,29499,1127,1524,1110,2320,1561,3554,29498,3784,29498,1295,29600,12521,1072,2886,13620,1127,1127,1127,1127,1127,1123,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,3784,29498,1295,29491,2805,29499,1337,1110,781,29534,1501,1561,3554,29498,15769,29491,1579,5889,9111,1153,29516,1561,3554,29498,15769,29491,1579,29499,1127,1041,1110,26843,15919,1245,1032,6277,2997,29493,2611,29501,4656,1056,29493,3013,4593,1127,1127,1127,18190,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,15769,29491,2805,29499,1326,1110,781,29534,1501,1561,3554,29498,15769,29498,4139,29491,1579,5889,9111,1153,29516,1561,3554,29498,15769,29498,4139,29491,1579,29499,2185,1110,26843,15919,1245,1032,6277,2997,29493,2611,29501,4656,1056,29493,8379,4593,1127,1127,1127,18190,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,15769,29498,4139,29491,2805,29499,6158,1110,781,29534,1501,1561,3554,29498,15769,29498,4656,29491,1579,5889,9111,1153,29516,1561,3554,29498,15769,29498,4656,29491,1579,29499,1524,1110,26843,15919,1245,1032,6277,2997,29493,18768,29493,3013,4593,1127,1127,1127,2185,29473,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,15769,29498,4656,29491,2805,29499,1123,1110,781,29534,1501,1561,3554,29498,15769,29498,4656,29498,4139,29491,1579,5889,9111,1153,29516,1561,3554,29498,15769,29498,4656,29498,4139,29491,1579,29499,1110,26843,15919,1245,1032,6277,2997,29493,18768,29493,8379,4593,1127,1127,1127,2185,29473,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,15769,29498,4656,29498,4139,29491,2805,29499,1110,781,29534,1501,2414,4908,29491,15769,29491,1579,5889,9111,1153,29516,2414,4908,29491,15769,29491,1579,29499,2185,1110,24549,4981,26843,1163,1032,6277,2997,1127,1127,1127,1127,1127,3368,1110,1127,1127,1127,1110,781,29534,1501,16935,29491,1579,5889,9111,1153,29516,16935,29491,1579,29499,1127,1127,1196,1110,4069,1056,29493,23372,29493,1072,23407,9338,1065,11474,3526,1127,1127,1127,1127,1041,1110,1501,8244,5889,9111,1153,29516,16935,29491,2805,29499,1127,3055,1110,781,29534,1501,1561,3554,29498,13700,29491,1579,5889,9111,1153,29516,1561,3554,29498,13700,29491,1579,29499,1127,1127,1110,24549,15919,1245,1032,6277,2997,29493,2611,29501,4656,1056,29493,3013,4593,1127,1127,1127,2185,29473,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,13700,29491,2805,29499,1127,1110,781,29534,1501,2558,29491,1579,5889,9111,1153,29516,2558,29491,1579,29499,1127,1127,1041,1110,1219,1352,3554,3519,1127,1127,1127,1127,1127,1127,1127,1110,1501,8244,5889,9111,1153,29516,2558,29491,2805,29499,1127,1028,1110,781,29534,1501,2471,29491,1579,5889,9111,1153,29516,2471,29491,1579,29499,1127,1127,2185,1110,1219,1352,3554,2997,2042,1127,1127,1127,1127,1127,1127,1337,1110,1501,8244,5889,9111,1153,29516,2471,29491,2805,29499,1127,6158,1110,781,29534,1501,1550,29491,1579,5889,9111,1153,29516,1550,29491,1579,29499,1127,1127,1127,1027,1110,1219,1352,3554,4590,10305,1127,1127,1127,1127,1127,1127,1196,1110,1501,8244,5889,9111,1153,29516,1550,29491,2805,29499,1127,3368,1110,781,29534,1501,5656,29491,1579,5889,9111,1153,29516,5656,29491,1579,29499,1127,1127,2185,1110,1219,1352,3554,2115,5699,1122,1032,6277,2997,1127,1127,1127,1127,1127,18190,1110,1501,8244,5889,9111,1153,29516,5656,29491,2805,29499,1127,6158,1110,781,29534,1501,5656,29491,1223,29491,9444,29491,1579,5889,9111,1153,29516,5656,29491,1223,29491,9444,29491,1579,29499,1127,1041,1110,9378,5699,1122,1312,5762,1127,1127,1127,1127,1127,1127,1196,1110,1127,1127,1127,1110,781,29534,1501,6031,29491,1142,4082,29491,1579,5889,9111,1153,29516,6031,29491,1142,4082,29491,1579,29499,1127,1524,1110,4746,23762,6797,2881,1127,1127,1127,1127,1127,1127,3368,1110,1501,8244,5889,9111,1153,29516,6031,29491,1142,4082,29491,2805,29499,1337,1110,781,29534,1501,29536,29543,29498,21065,23943,29491,1579,5889,9111,1153,29516,29536,29543,29498,21065,23943,29491,1579,29499,1127,1127,1110,4420,23943,2191,1122,1229,29543,1706,1127,1127,1127,1127,1127,1127,1028,1110,1501,8244,5889,9111,1153,29516,29536,29543,29498,21065,23943,29491,2805,29499,1127,1110,781,29534,1501,23501,29491,5240,29491,1579,5889,9111,1153,29516,23501,29491,5240,29491,1579,29499,1127,1127,1027,1110,9117,1070,28643,1561,3554,29498,29494,1797,29498,5240,29491,1579,29600,5889,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,29494,1797,29501,5240,29516,18446,29516,6157,29516,1561,3554,29498,29494,1797,29498,5240,29491,1579,29499,1245,1032,6277,2997,1110,1501,8244,5889,9111,1153,29516,23501,29491,5240,29491,2805,29499,1127,29473,1110,781,29534,1501,23501,29491,1691,1895,29491,1579,5889,9111,1153,29516,23501,29491,1691,1895,29491,1579,29499,1127,1326,1110,9117,1070,28643,8940,2342,29491,2805,29600,5889,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,29494,1797,29501,5240,29516,18446,29516,6157,29516,8940,2342,29491,2805,29499,1245,1032,6277,2997,1127,1027,1110,1501,8244,5889,9111,1153,29516,23501,29491,1691,1895,29491,2805,29499,2185,1110,781,781,1832,7553,2076,781,781,28100,24008,7553,2076,781,781,29534,12115,3368,1110,8402,1127,3368,1110,5315,1233,1127,1127,18190,1110,16753,1127,1123,1110,5339,1127,1127,1326,1110,781,29534,1945,8163,29534,1945,1945,29534,1945,1945,1945,1144,29534,1945,23611,29534,1945,1945,1945,1270,29534,781,29534,2320,1561,3554,29498,3784,29498,1295,29600,29473,1110,16207,2927,1066,1040,1219,1352,3554,7854,29473,1110,2320,1561,3554,29498,3784,29498,1295,7706,3784,29516,2508,9080,1127,1028,1110,7854,1802,1972,1066,2320,25848,29600,1110,2320,29502,29600,7854,1802,3056,29557,2241,5652,29600,29508,29600,7854,1802,2886,1196,1110,781,29534,2320,1561,3554,29498,3784,29498,3960,29600,1110,10624,1688,2927,1066,1040,1219,1352,3554,7854,1110,2320,1561,3554,29498,3784,29498,3960,7706,3784,29516,2508,29507,25770,8379,3804,1211,9080,1110,7854,1802,1972,1066,2320,25848,29600,1110,2320,29502,29600,7854,1802,3056,29557,2241,5652,29600,29508,29600,7854,1802,2886,1196,1110,29473,781,29534,2320,1561,3554,29498,3784,29498,3685,29600,1110,1135,1056,1040,1219,1352,3554,7854,18190,1110,2320,1561,3554,29498,3784,29498,3685,29600,1127,2185,29473,1110,7315,1127,6158,1110,2320,29502,29600,7854,1117,5331,1290,29557,2241,5652,29600,29508,29600,7854,1117,1227,5331,1290,1110,781,781,28100,26843,7553,2076,781,781,29534,12115,1127,1123,1110,8402,1127,2185,1110,5315,1233,1127,1127,3368,1110,16753,1127,1028,1110,5339,29473,1110,781,29534,1945,10530,8163,29534,1945,1945,14686,29534,1945,1945,1945,29534,1945,10530,29534,26403,29534,781,29534,2320,1561,3554,29498,15769,29600,1326,1110,26843,15919,1127,1110,2320,1561,3554,29498,15769,1113,4317,29507,1113,15118,1215,9080,1326,1110,3013,1066,2320,25848,29600,1524,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,15769,29498,4139,29600,6158,1110,26843,15919,29493,1065,8379,6158,1110,2320,1561,3554,29498,15769,29498,4139,1113,4317,29507,1113,15118,1215,9080,6158,1110,8379,1066,2320,25848,29600,1524,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,15769,29498,4656,29600,1123,1110,26843,15919,5222,3368,1110,2320,1561,3554,29498,15769,29498,4656,1113,4317,29507,1113,15118,1215,9080,1123,1110,18768,3013,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,15769,29498,4656,29498,4139,29600,1110,26843,15919,5222,29493,1065,8379,1110,2320,1561,3554,29498,15769,29498,4656,29498,4139,1113,4317,29507,1113,15118,1215,9080,1110,18768,8379,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,781,28100,24549,7553,2076,781,781,29534,12115,1127,29473,1110,8402,1127,1337,1110,5315,1233,1127,1127,29473,1110,16753,1127,1127,1123,1110,5339,29473,1110,781,29534,1945,27452,29534,1945,1945,1270,29534,1945,1945,1477,29534,1945,1945,23611,29534,26403,29534,781,29534,2320,1561,3554,29498,13700,29600,1326,1110,24549,15919,1127,3055,1110,2320,1561,3554,29498,13700,1113,4317,9080,1127,29473,1110,3013,1066,2320,25848,29600,1127,18190,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,13700,29498,4139,29600,6158,1110,24549,15919,29493,1065,8379,1524,1110,2320,1561,3554,29498,13700,29498,4139,1113,4317,9080,1326,1110,8379,1066,2320,25848,29600,1127,18190,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,13700,29498,4656,29600,1123,1110,24549,15919,5222,1326,1110,2320,1561,3554,29498,13700,29498,4656,1113,4317,9080,1524,1110,18768,3013,1066,2320,25848,29600,1127,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,13700,29498,4656,29498,4139,29600,1110,24549,15919,5222,29493,1065,8379,3055,1110,2320,1561,3554,29498,13700,29498,4656,29498,4139,1113,4317,9080,1123,1110,18768,8379,1066,2320,25848,29600,1127,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,16935,29600,1041,1110,3251,9338,1065,11474,3526,1196,1110,2320,1561,3554,29498,16935,29600,1127,1123,1110,8379,3696,2042,29493,29473,29508,1428,2175,29493,1066,2320,25848,29600,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,16935,29498,1756,29600,1028,1110,4069,1032,3696,1066,11474,3526,1123,1110,2320,1561,3554,29498,16935,29498,1756,1113,10374,29507,1113,2092,9080,1110,7315,1127,1127,6158,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,16935,29498,2882,29600,1027,1110,4933,1070,9338,1065,11474,3526,29473,1110,2320,1561,3554,29498,16935,29498,2882,29600,2185,29473,1110,2242,1070,9338,1066,2320,25848,29600,1337,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,16935,29498,6974,29600,1027,1110,17444,1312,9338,1065,11474,3526,1110,2320,1561,3554,29498,16935,29498,6974,29600,2185,29473,1110,7315,1127,1127,6158,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,781,28100,9639,7553,2076,781,781,29534,12115,1337,1110,8402,1127,1127,1127,1196,1110,5315,1233,1127,1524,1110,16753,1127,1127,3368,1110,5339,29473,1110,781,29534,1945,26470,29534,1945,1945,1945,23611,29534,1945,1945,29501,29534,1945,1945,1945,29501,29534,26403,29534,781,29534,2320,1561,3554,29498,4317,29498,9889,29600,1110,3251,1032,6277,2997,1127,1127,3368,1110,2320,1561,3554,29498,4317,29498,9889,29600,1524,1110,29473,29508,2997,1909,1066,2320,25848,29600,1127,6158,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,4317,29498,1138,2536,29600,1110,1703,2536,1032,2997,1245,5501,29557,2241,1500,4091,13780,3526,1122,1032,2997,29499,1110,2320,1561,3554,29498,4317,29498,1138,2536,29600,1524,1110,7315,1127,1127,18190,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,5656,29600,1041,1110,9378,2997,2639,1127,1127,1123,1110,2320,1561,3554,29498,5656,1113,4317,9080,1524,1110,3013,1066,2320,25848,29600,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,5656,29498,4139,29600,3055,1110,9378,2997,2639,29493,1065,8379,1127,1326,1110,2320,1561,3554,29498,5656,29498,4139,1113,4317,9080,1123,1110,8379,1066,2320,25848,29600,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,2471,29600,1041,1110,3999,1312,3400,5762,1127,1127,1027,1110,2320,1561,3554,29498,2471,29600,1127,1027,1110,3013,1066,2320,25848,29600,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,2471,29498,4139,29600,3055,1110,3999,1312,3400,5762,29493,1065,8379,1127,3368,1110,2320,1561,3554,29498,2471,29498,4139,29600,1337,1110,8379,1066,2320,25848,29600,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,2471,29498,2933,29600,1027,1110,3999,1312,3400,5762,29493,1122,1055,1797,3061,1127,1027,1110,2320,9444,29514,2269,29500,1561,3554,29498,2471,29498,2933,1511,29600,1110,3532,15468,2042,1070,2997,3723,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,781,28100,1219,1352,3554,7553,2076,781,781,29534,12115,1337,1110,8402,1127,18190,1110,5315,1233,1127,1127,1127,1127,1196,1110,16753,1524,1110,5339,1127,2185,1110,781,29534,1945,26470,29534,1945,1945,1144,29534,1945,1945,1945,1945,23611,29534,1945,1144,29534,1945,1945,19465,29534,781,29534,2320,1561,3554,29498,11200,1054,29600,3055,1110,2459,1219,1352,3554,12308,29572,1326,1110,2320,1103,1057,1352,3554,29498,11200,1054,29513,1636,4662,1113,6828,18755,2367,1880,4662,1113,3369,3901,18755,2367,7175,29600,1110,7315,1326,1110,2320,29502,29600,12308,29557,2241,5652,29600,29508,29600,1227,12308,1110,781,29534,2320,1561,3554,29498,1550,29600,1524,1110,29356,2997,10305,3368,1110,2320,1561,3554,29498,1550,29600,1127,1127,1127,1127,1110,3013,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1127,1337,1110,781,29534,2320,1561,3554,29498,1550,29498,4139,29600,1123,1110,29356,2997,10305,29493,1065,8379,1110,2320,1561,3554,29498,1550,29498,4139,29600,1127,1127,1127,18190,1110,8379,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1127,1337,1110,781,29534,2320,1561,3554,29498,2558,29600,1123,1110,1219,1352,3554,3519,1127,1027,1110,2320,1561,3554,29498,2558,29600,1127,1127,1127,18190,1110,3013,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1127,1337,1110,781,29534,2320,1561,3554,29498,2558,29498,4139,29600,1110,1219,1352,3554,3519,29493,1065,8379,3368,1110,2320,1561,3554,29498,2558,29498,4139,29600,1127,1127,1127,1196,1110,8379,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1127,1337,1110,781,29534,2320,1561,3554,29498,2558,29498,18776,29600,29473,1110,1219,1352,3554,3519,29493,1245,1301,29478,1041,1110,2320,1561,3554,29498,2558,29498,18776,29600,1127,1127,1127,6158,1110,3013,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1127,1337,1110,781,781,28100,14598,2000,7553,2076,781,781,29534,12115,1337,1110,8402,1127,1127,1524,1110,5315,1233,1127,1127,1127,6158,1110,16753,1127,1127,1127,3368,1110,5339,29473,1110,781,29534,1945,26470,29534,1945,1945,1945,29501,29534,1945,1945,1945,24401,29534,1945,1945,1945,1945,29501,29534,26403,29534,781,29534,2320,1142,4082,29498,20996,29600,1028,1110,4746,23762,2242,1070,17014,1065,1032,2191,3368,1110,2320,1142,4082,29498,20996,1113,2195,9080,29557,2241,5652,29600,1142,4082,29498,20996,1113,2195,29507,29473,29508,29600,1110,12447,1066,2320,25848,29600,29557,2241,5652,1142,4082,1163,2886,3587,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,5240,29498,14914,29600,3055,1110,8402,1219,1352,3554,1133,1797,12329,29493,14519,28749,1072,6340,1110,2320,1561,3554,29498,5240,29498,14914,29600,1127,1127,1524,1110,3013,1066,2320,25848,29600,1127,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,5240,29498,2558,29600,29473,1110,1219,1352,3554,1133,1797,12329,3519,1127,1041,1110,2320,1561,3554,29498,5240,29498,2558,29600,1127,1127,1041,1110,3013,1066,2320,25848,29600,1127,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,781,28100,19707,7553,2076,781,781,29534,12115,3368,1110,8402,1127,1127,1027,1110,5315,1233,1127,1123,1110,16753,1127,18190,1110,5339,29473,1110,781,29534,1945,8163,29534,1945,1945,26403,29534,1945,10530,29534,1945,1945,8163,29534,26403,29534,781,29534,2320,4139,29498,8016,29498,2199,29600,1110,1181,9719,1032,2191,1122,1706,1158,1032,10060,1960,1110,2320,4139,29498,8016,29498,2199,1113,2195,9080,1110,15548,1132,5386,8379,1960,29507,29498,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,29536,29543,29498,21065,23943,29600,1028,1110,4420,23943,1032,2191,1122,1229,29543,1706,18190,1110,2320,29536,29543,29498,21065,23943,1113,2195,9080,1028,1110,9185,1047,2100,2191,1066,3597,1174,6158,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,5969,29600,1524,1110,19304,3696,1093,1103,2320,3832,9191,2660,29498,27372,29498,9065,29514,29508,26688,1110,2320,5969,1113,2092,9080,3368,1110,3696,1066,2320,18038,29600,2185,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,2726,29600,1524,1110,8187,3696,1127,1524,1110,2320,2726,1113,2092,9080,3368,1110,3696,1066,2320,18038,29600,2185,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,781,1832,8019,1304,2107,781,781,29504,9557,29494,1797,14708,29600,1155,1131,29538,1210,5105,29493,1210,10612,781,29504,1501,14708,29600,29530,1352,3554,14708,29600,5889,4655,2276,6990,29491,1443,29516,1561,3554,29516,1561,3554,29499,781,29504,9557,2120,29482,14708,29600,781,29504,9557,29536,29543,14708,29600,781,29504,9557,23295,14708,29600,781,29504,9557,29489,9925,14708,29600,781,29504,9557,10960,14708,29600,781,29504,9557,1202,14708,29600,781,29504,9557,21662,14708,29600,781,29504,9557,6891,14708,29600,781,781,1832,3087,781,781,29530,1352,3554,1133,1797,12329,1117,17813,1684,1040,4239,1070,1040,1501,25559,3087,5889,11727,1377,781,781,1832,4532,16875,1245,1040,6056,12545,8527,781,781,29534,8527,1326,1110,1188,6579,4125,29477,1127,1127,29473,1110,10988,1127,1127,1127,1127,1127,1127,1127,1127,1127,1127,1127,1110,781,29534,1945,14686,29534,1945,1945,24401,29534,1945,1945,1945,1945,1945,1945,1945,1945,1945,1945,1945,23611,29534,781,29534,1387,7948,1129,1138,1116,6158,1110,1501,1561,3554,29501,6177,1129,1138,4096,1561,3554,29501,6177,1129,1138,29561,1524,1110,7088,1032,12278,2603,1312,29493,1210,1509,29493,1070,1342,5762,4590,1124,1219,1352,3554,27132,2241,5652,14769,1042,5454,7486,1163,1040,4593,29493,5165,13878,1072,2997,5699,27132,2241,5652,3363,1065,1032,3460,1133,1797,10811,7535,29491,1110,781,29534,1387,23191,1655,1116,6158,1110,1501,1561,3554,29501,29494,1797,29501,14859,1655,4096,1561,3554,29501,29494,1797,29501,14859,1655,29561,1110,24549,1163,4689,7620,5762,27132,2241,5652,16485,7808,5426,27132,2241,5652,2759,1401,7808,1066,1342,20619,1163,13569,27132,2241,5652,4645,29481,1124,1219,1352,3554,27132,2241,5652,3363,4981,1133,1797,10811,27072,29491,1127,1127,1110,781,29534,1387,6060,29523,8225,1116,1028,1110,1501,1352,29487,29501,29485,1836,5640,4096,1352,29487,29501,29485,1836,5640,29561,1127,1027,1110,7811,1032,11474,2771,2212,1312,29493,1210,1509,29493,1070,1342,5762,4590,1124,1219,1352,3554,27132,2241,5652,3363,1065,1032,3460,1133,1797,10811,7535,29491,1127,1127,1127,1127,1524,1110,781,29534,1387,29530,1352,3554,1133,1797,12329,1116,1110,1501,1561,3554,29501,29494,1797,29501,5240,4096,1561,3554,29501,29494,1797,29501,5240,29561,1524,1110,1098,1133,1797,11580,1066,14881,1163,1219,1352,3554,1127,1127,1127,1127,1127,1127,1127,1127,1127,1123,1110,29473,781,29534,1387,23117,4581,1958,1116,3055,1110,1501,10078,29501,9444,4096,10078,29501,9444,29561,1127,1110,22731,3118,1070,2509,2333,3600,17472,16791,1093,29551,29494,6055,1210,2876,29499,1127,1127,1127,1127,1127,1127,1127,2185,29473,1110,781,29534,1387,12509,4503,21080,1116,3055,1110,1501,2353,29498,2381,29498,8563,4096,2353,29498,2381,29498,8563,29561,1127,1110,4503,3671,19590,1124,5217,2276,1829,12545,29491,6990,29491,1459,29516,2353,29498,2381,29498,8563,29516,1127,1127,1127,1127,1127,1127,1127,1326,1110,781,781,29560,1561,3554,29501,6177,1129,1138,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,6177,1129,1138,29535,1113,29530,1352,3554,10481,1129,1138,29507,781,29560,1561,3554,29501,29494,1797,29501,14859,1655,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,29494,1797,29501,14859,1655,29535,1113,29530,1352,3554,1133,1797,27026,1655,29507,781,29560,1352,29487,29501,29485,1836,5640,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,1352,29487,29501,29485,1836,5640,29535,1113,6060,29523,8225,29507,781,29560,1561,3554,29501,29494,1797,29501,5240,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,29494,1797,29501,5240,29535,1113,29530,1352,3554,1133,1797,12329,29507,781,29560,10078,29501,9444,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,10078,29501,9444,29535,1113,23117,4581,1958,29507,781,29560,2353,29498,2381,29498,8563,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,2353,29498,2381,29498,8563,29535,1113,12509,4503,21080,29507,4,1027,4771,1117,1032,7585,6204,1070,2198,4979,1065,1040,4625,3013,29515,781,781,29508,29491,1387,4651,1158,1219,1352,3554,1133,1797,12329,9957,1619,1512,15925,1137,1040,3013,12668,1158,1040,13673,1122,1040,1219,1352,3554,1133,1797,11580,29493,1458,1117,1032,1133,1797,8375,1066,14881,1163,1040,2333,29501,2162,4610,2997,5949,2755,1219,1352,3554,29491,781,781,29518,29491,1387,23743,2107,9957,1619,4979,14519,1040,3798,7808,1072,4698,4004,1066,1706,1040,1219,1352,3554,1133,1797,11580,29491,781,781,29538,29491,1387,10196,9957,1619,4979,5373,1137,1040,1219,1352,3554,1133,1797,12329,1117,17813,1684,1040,4239,1070,1040,17924,3087,29491,781,781,29549,29491,1387,16047,16875,1245,1040,6056,12545,8527,9957,1619,2248,4979,6080,9904,1066,1567,7796,5970,1066,16875,6970,1254,1040,6056,12545,3256,29493,2027,1158,10481,1129,1138,29493,27026,1655,29493,17472,29523,8225,29493,1219,1352,3554,1133,1797,12329,29493,13595,4581,1958,29493,1072,16875,4503,21080,29491,7834,3256,1427,1032,7585,6204,1070,1639,6800,29491],"total_duration":40546149250,"load_duration":36248000,"prompt_eval_count":4096,"prompt_eval_duration":25815653291,"eval_count":193,"eval_duration":14692408834}]
[DEBUG] jq_sanitized: sanitized: [{"model":"mistral:7b","created_at":"2025-07-30T17:53:49.412119Z","response":" Here is a brief description of each section in the provided text:

1. **Act as Ollama Bash Lib**: This part explains that the text acts as the documentation for the Ollama Bash Library, which is a Bash library to interact with the open-source language model platform called Ollama.

2. **Requirements**: This section lists the required tools and software needed to use the Ollama Bash Library.

3. **License**: This section states that the Ollama Bash Lib is licensed under the terms of the MIT License.

4. **More AI from the Attogram Project**: This final section provides links to other projects related to AI developed by the Attogram project, such as Multirun, Toolshed, LLM Council, Ollama Bash Lib, Small Models, and AI Test Zone. Each project has a brief description of its purpose.","done":true,"done_reason":"stop","context":[3,29473,4550,1158,1164,8351,26698,4423,2391,29491,781,5725,1032,2941,4826,1070,1224,3256,25573,2342,29515,781,781,29539,1219,1352,3554,1133,1797,12329,781,781,29509,1133,1797,11580,1066,14881,1163,1501,29530,1352,3554,5889,4655,2276,6990,29491,1443,29516,1561,3554,29516,1561,3554,29499,781,781,29560,27048,5889,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,29494,1797,29501,5240,29499,1155,29473,781,29560,16968,5889,29539,16820,29499,1155,29473,781,29560,17757,1153,5889,29539,9111,1153,29499,1155,29473,781,29560,23743,2107,5889,29539,7119,2107,29499,1155,29473,781,29560,10196,5889,29539,17344,29499,1155,29473,781,29560,16047,8527,29481,5889,29539,5220,29501,2353,29501,3979,29501,2005,29501,1829,12545,29501,6999,29499,781,781,29560,23840,5889,29539,20427,29499,1482,29473,781,29560,7887,5889,29539,3784,29501,20427,29499,1155,781,29560,24110,5889,29539,15769,29501,20427,29499,1155,29473,781,29560,18933,5889,29539,13700,29501,20427,29499,1155,29473,781,29560,3802,5889,29539,4317,29501,20427,29499,1155,781,29560,29530,1352,3554,5889,29539,1561,3554,29501,20427,29499,1155,781,29560,27249,5889,29539,1097,2000,29501,20427,29499,1155,29473,781,29560,9661,5889,29539,7815,29501,20427,29499,781,781,1832,5315,1233,781,781,27206,1065,1342,10811,1210,7535,29515,781,14708,29600,29494,1797,781,2162,18217,1561,3554,29498,29494,1797,29498,5240,29491,1579,781,14708,29600,781,781,27206,1065,1342,7535,29493,1163,2886,13547,29515,781,14708,29600,29494,1797,781,1561,3554,29498,29494,1797,29498,5240,1503,2508,29516,1300,29516,1561,3554,29498,29494,1797,29498,5240,29491,1579,29507,781,1103,1501,1686,1155,29490,8453,1561,3554,29498,29494,1797,29498,5240,29507,12658,1636,781,29473,4662,1113,5500,29515,1219,1352,3554,1133,1797,12329,3048,5964,29515,1197,1561,3554,29498,29494,1797,29498,5240,29507,781,29473,8558,29473,29508,781,8739,781,2162,8453,1561,3554,29498,29494,1797,29498,5240,29507,781,14708,29600,781,781,1832,5035,1153,781,781,8760,1040,1387,29560,9111,1153,5889,9111,1153,10863,9886,1122,1312,24737,27072,781,781,29534,5035,29477,1127,1127,1127,1127,1027,1110,8402,1127,1127,1127,1127,1127,1127,1127,3368,1110,17461,1127,1127,1041,1110,781,29534,1945,1945,1945,1945,1477,29534,1945,1945,1945,1945,1945,1945,1945,1945,29534,1945,1945,1945,29501,29534,781,29534,1501,14914,29491,1579,5889,9111,1153,29516,14914,29491,1579,29499,1127,1127,1326,1110,1219,1352,3554,1133,1797,12329,9693,1072,6340,1127,1127,1127,1127,1127,6158,1110,1501,8244,5889,9111,1153,29516,14914,29491,2805,29499,1127,1196,1110,781,29534,1501,1561,3554,29498,3784,29498,1295,29491,1579,5889,9111,1153,29516,1561,3554,29498,3784,29498,1295,29491,1579,29499,1127,1524,1110,2320,1561,3554,29498,3784,29498,1295,29600,12521,1072,2886,13620,1127,1127,1127,1127,1127,1123,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,3784,29498,1295,29491,2805,29499,1337,1110,781,29534,1501,1561,3554,29498,15769,29491,1579,5889,9111,1153,29516,1561,3554,29498,15769,29491,1579,29499,1127,1041,1110,26843,15919,1245,1032,6277,2997,29493,2611,29501,4656,1056,29493,3013,4593,1127,1127,1127,18190,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,15769,29491,2805,29499,1326,1110,781,29534,1501,1561,3554,29498,15769,29498,4139,29491,1579,5889,9111,1153,29516,1561,3554,29498,15769,29498,4139,29491,1579,29499,2185,1110,26843,15919,1245,1032,6277,2997,29493,2611,29501,4656,1056,29493,8379,4593,1127,1127,1127,18190,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,15769,29498,4139,29491,2805,29499,6158,1110,781,29534,1501,1561,3554,29498,15769,29498,4656,29491,1579,5889,9111,1153,29516,1561,3554,29498,15769,29498,4656,29491,1579,29499,1524,1110,26843,15919,1245,1032,6277,2997,29493,18768,29493,3013,4593,1127,1127,1127,2185,29473,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,15769,29498,4656,29491,2805,29499,1123,1110,781,29534,1501,1561,3554,29498,15769,29498,4656,29498,4139,29491,1579,5889,9111,1153,29516,1561,3554,29498,15769,29498,4656,29498,4139,29491,1579,29499,1110,26843,15919,1245,1032,6277,2997,29493,18768,29493,8379,4593,1127,1127,1127,2185,29473,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,15769,29498,4656,29498,4139,29491,2805,29499,1110,781,29534,1501,2414,4908,29491,15769,29491,1579,5889,9111,1153,29516,2414,4908,29491,15769,29491,1579,29499,2185,1110,24549,4981,26843,1163,1032,6277,2997,1127,1127,1127,1127,1127,3368,1110,1127,1127,1127,1110,781,29534,1501,16935,29491,1579,5889,9111,1153,29516,16935,29491,1579,29499,1127,1127,1196,1110,4069,1056,29493,23372,29493,1072,23407,9338,1065,11474,3526,1127,1127,1127,1127,1041,1110,1501,8244,5889,9111,1153,29516,16935,29491,2805,29499,1127,3055,1110,781,29534,1501,1561,3554,29498,13700,29491,1579,5889,9111,1153,29516,1561,3554,29498,13700,29491,1579,29499,1127,1127,1110,24549,15919,1245,1032,6277,2997,29493,2611,29501,4656,1056,29493,3013,4593,1127,1127,1127,2185,29473,1110,1501,8244,5889,9111,1153,29516,1561,3554,29498,13700,29491,2805,29499,1127,1110,781,29534,1501,2558,29491,1579,5889,9111,1153,29516,2558,29491,1579,29499,1127,1127,1041,1110,1219,1352,3554,3519,1127,1127,1127,1127,1127,1127,1127,1110,1501,8244,5889,9111,1153,29516,2558,29491,2805,29499,1127,1028,1110,781,29534,1501,2471,29491,1579,5889,9111,1153,29516,2471,29491,1579,29499,1127,1127,2185,1110,1219,1352,3554,2997,2042,1127,1127,1127,1127,1127,1127,1337,1110,1501,8244,5889,9111,1153,29516,2471,29491,2805,29499,1127,6158,1110,781,29534,1501,1550,29491,1579,5889,9111,1153,29516,1550,29491,1579,29499,1127,1127,1127,1027,1110,1219,1352,3554,4590,10305,1127,1127,1127,1127,1127,1127,1196,1110,1501,8244,5889,9111,1153,29516,1550,29491,2805,29499,1127,3368,1110,781,29534,1501,5656,29491,1579,5889,9111,1153,29516,5656,29491,1579,29499,1127,1127,2185,1110,1219,1352,3554,2115,5699,1122,1032,6277,2997,1127,1127,1127,1127,1127,18190,1110,1501,8244,5889,9111,1153,29516,5656,29491,2805,29499,1127,6158,1110,781,29534,1501,5656,29491,1223,29491,9444,29491,1579,5889,9111,1153,29516,5656,29491,1223,29491,9444,29491,1579,29499,1127,1041,1110,9378,5699,1122,1312,5762,1127,1127,1127,1127,1127,1127,1196,1110,1127,1127,1127,1110,781,29534,1501,6031,29491,1142,4082,29491,1579,5889,9111,1153,29516,6031,29491,1142,4082,29491,1579,29499,1127,1524,1110,4746,23762,6797,2881,1127,1127,1127,1127,1127,1127,3368,1110,1501,8244,5889,9111,1153,29516,6031,29491,1142,4082,29491,2805,29499,1337,1110,781,29534,1501,29536,29543,29498,21065,23943,29491,1579,5889,9111,1153,29516,29536,29543,29498,21065,23943,29491,1579,29499,1127,1127,1110,4420,23943,2191,1122,1229,29543,1706,1127,1127,1127,1127,1127,1127,1028,1110,1501,8244,5889,9111,1153,29516,29536,29543,29498,21065,23943,29491,2805,29499,1127,1110,781,29534,1501,23501,29491,5240,29491,1579,5889,9111,1153,29516,23501,29491,5240,29491,1579,29499,1127,1127,1027,1110,9117,1070,28643,1561,3554,29498,29494,1797,29498,5240,29491,1579,29600,5889,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,29494,1797,29501,5240,29516,18446,29516,6157,29516,1561,3554,29498,29494,1797,29498,5240,29491,1579,29499,1245,1032,6277,2997,1110,1501,8244,5889,9111,1153,29516,23501,29491,5240,29491,2805,29499,1127,29473,1110,781,29534,1501,23501,29491,1691,1895,29491,1579,5889,9111,1153,29516,23501,29491,1691,1895,29491,1579,29499,1127,1326,1110,9117,1070,28643,8940,2342,29491,2805,29600,5889,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,29494,1797,29501,5240,29516,18446,29516,6157,29516,8940,2342,29491,2805,29499,1245,1032,6277,2997,1127,1027,1110,1501,8244,5889,9111,1153,29516,23501,29491,1691,1895,29491,2805,29499,2185,1110,781,781,1832,7553,2076,781,781,28100,24008,7553,2076,781,781,29534,12115,3368,1110,8402,1127,3368,1110,5315,1233,1127,1127,18190,1110,16753,1127,1123,1110,5339,1127,1127,1326,1110,781,29534,1945,8163,29534,1945,1945,29534,1945,1945,1945,1144,29534,1945,23611,29534,1945,1945,1945,1270,29534,781,29534,2320,1561,3554,29498,3784,29498,1295,29600,29473,1110,16207,2927,1066,1040,1219,1352,3554,7854,29473,1110,2320,1561,3554,29498,3784,29498,1295,7706,3784,29516,2508,9080,1127,1028,1110,7854,1802,1972,1066,2320,25848,29600,1110,2320,29502,29600,7854,1802,3056,29557,2241,5652,29600,29508,29600,7854,1802,2886,1196,1110,781,29534,2320,1561,3554,29498,3784,29498,3960,29600,1110,10624,1688,2927,1066,1040,1219,1352,3554,7854,1110,2320,1561,3554,29498,3784,29498,3960,7706,3784,29516,2508,29507,25770,8379,3804,1211,9080,1110,7854,1802,1972,1066,2320,25848,29600,1110,2320,29502,29600,7854,1802,3056,29557,2241,5652,29600,29508,29600,7854,1802,2886,1196,1110,29473,781,29534,2320,1561,3554,29498,3784,29498,3685,29600,1110,1135,1056,1040,1219,1352,3554,7854,18190,1110,2320,1561,3554,29498,3784,29498,3685,29600,1127,2185,29473,1110,7315,1127,6158,1110,2320,29502,29600,7854,1117,5331,1290,29557,2241,5652,29600,29508,29600,7854,1117,1227,5331,1290,1110,781,781,28100,26843,7553,2076,781,781,29534,12115,1127,1123,1110,8402,1127,2185,1110,5315,1233,1127,1127,3368,1110,16753,1127,1028,1110,5339,29473,1110,781,29534,1945,10530,8163,29534,1945,1945,14686,29534,1945,1945,1945,29534,1945,10530,29534,26403,29534,781,29534,2320,1561,3554,29498,15769,29600,1326,1110,26843,15919,1127,1110,2320,1561,3554,29498,15769,1113,4317,29507,1113,15118,1215,9080,1326,1110,3013,1066,2320,25848,29600,1524,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,15769,29498,4139,29600,6158,1110,26843,15919,29493,1065,8379,6158,1110,2320,1561,3554,29498,15769,29498,4139,1113,4317,29507,1113,15118,1215,9080,6158,1110,8379,1066,2320,25848,29600,1524,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,15769,29498,4656,29600,1123,1110,26843,15919,5222,3368,1110,2320,1561,3554,29498,15769,29498,4656,1113,4317,29507,1113,15118,1215,9080,1123,1110,18768,3013,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,15769,29498,4656,29498,4139,29600,1110,26843,15919,5222,29493,1065,8379,1110,2320,1561,3554,29498,15769,29498,4656,29498,4139,1113,4317,29507,1113,15118,1215,9080,1110,18768,8379,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,781,28100,24549,7553,2076,781,781,29534,12115,1127,29473,1110,8402,1127,1337,1110,5315,1233,1127,1127,29473,1110,16753,1127,1127,1123,1110,5339,29473,1110,781,29534,1945,27452,29534,1945,1945,1270,29534,1945,1945,1477,29534,1945,1945,23611,29534,26403,29534,781,29534,2320,1561,3554,29498,13700,29600,1326,1110,24549,15919,1127,3055,1110,2320,1561,3554,29498,13700,1113,4317,9080,1127,29473,1110,3013,1066,2320,25848,29600,1127,18190,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,13700,29498,4139,29600,6158,1110,24549,15919,29493,1065,8379,1524,1110,2320,1561,3554,29498,13700,29498,4139,1113,4317,9080,1326,1110,8379,1066,2320,25848,29600,1127,18190,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,13700,29498,4656,29600,1123,1110,24549,15919,5222,1326,1110,2320,1561,3554,29498,13700,29498,4656,1113,4317,9080,1524,1110,18768,3013,1066,2320,25848,29600,1127,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,13700,29498,4656,29498,4139,29600,1110,24549,15919,5222,29493,1065,8379,3055,1110,2320,1561,3554,29498,13700,29498,4656,29498,4139,1113,4317,9080,1123,1110,18768,8379,1066,2320,25848,29600,1127,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,16935,29600,1041,1110,3251,9338,1065,11474,3526,1196,1110,2320,1561,3554,29498,16935,29600,1127,1123,1110,8379,3696,2042,29493,29473,29508,1428,2175,29493,1066,2320,25848,29600,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,16935,29498,1756,29600,1028,1110,4069,1032,3696,1066,11474,3526,1123,1110,2320,1561,3554,29498,16935,29498,1756,1113,10374,29507,1113,2092,9080,1110,7315,1127,1127,6158,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,16935,29498,2882,29600,1027,1110,4933,1070,9338,1065,11474,3526,29473,1110,2320,1561,3554,29498,16935,29498,2882,29600,2185,29473,1110,2242,1070,9338,1066,2320,25848,29600,1337,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,16935,29498,6974,29600,1027,1110,17444,1312,9338,1065,11474,3526,1110,2320,1561,3554,29498,16935,29498,6974,29600,2185,29473,1110,7315,1127,1127,6158,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,781,28100,9639,7553,2076,781,781,29534,12115,1337,1110,8402,1127,1127,1127,1196,1110,5315,1233,1127,1524,1110,16753,1127,1127,3368,1110,5339,29473,1110,781,29534,1945,26470,29534,1945,1945,1945,23611,29534,1945,1945,29501,29534,1945,1945,1945,29501,29534,26403,29534,781,29534,2320,1561,3554,29498,4317,29498,9889,29600,1110,3251,1032,6277,2997,1127,1127,3368,1110,2320,1561,3554,29498,4317,29498,9889,29600,1524,1110,29473,29508,2997,1909,1066,2320,25848,29600,1127,6158,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,4317,29498,1138,2536,29600,1110,1703,2536,1032,2997,1245,5501,29557,2241,1500,4091,13780,3526,1122,1032,2997,29499,1110,2320,1561,3554,29498,4317,29498,1138,2536,29600,1524,1110,7315,1127,1127,18190,1110,2320,29502,29600,29516,29600,29508,29600,1110,29473,781,29534,2320,1561,3554,29498,5656,29600,1041,1110,9378,2997,2639,1127,1127,1123,1110,2320,1561,3554,29498,5656,1113,4317,9080,1524,1110,3013,1066,2320,25848,29600,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,5656,29498,4139,29600,3055,1110,9378,2997,2639,29493,1065,8379,1127,1326,1110,2320,1561,3554,29498,5656,29498,4139,1113,4317,9080,1123,1110,8379,1066,2320,25848,29600,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,2471,29600,1041,1110,3999,1312,3400,5762,1127,1127,1027,1110,2320,1561,3554,29498,2471,29600,1127,1027,1110,3013,1066,2320,25848,29600,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,2471,29498,4139,29600,3055,1110,3999,1312,3400,5762,29493,1065,8379,1127,3368,1110,2320,1561,3554,29498,2471,29498,4139,29600,1337,1110,8379,1066,2320,25848,29600,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,2471,29498,2933,29600,1027,1110,3999,1312,3400,5762,29493,1122,1055,1797,3061,1127,1027,1110,2320,9444,29514,2269,29500,1561,3554,29498,2471,29498,2933,1511,29600,1110,3532,15468,2042,1070,2997,3723,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,781,28100,1219,1352,3554,7553,2076,781,781,29534,12115,1337,1110,8402,1127,18190,1110,5315,1233,1127,1127,1127,1127,1196,1110,16753,1524,1110,5339,1127,2185,1110,781,29534,1945,26470,29534,1945,1945,1144,29534,1945,1945,1945,1945,23611,29534,1945,1144,29534,1945,1945,19465,29534,781,29534,2320,1561,3554,29498,11200,1054,29600,3055,1110,2459,1219,1352,3554,12308,29572,1326,1110,2320,1103,1057,1352,3554,29498,11200,1054,29513,1636,4662,1113,6828,18755,2367,1880,4662,1113,3369,3901,18755,2367,7175,29600,1110,7315,1326,1110,2320,29502,29600,12308,29557,2241,5652,29600,29508,29600,1227,12308,1110,781,29534,2320,1561,3554,29498,1550,29600,1524,1110,29356,2997,10305,3368,1110,2320,1561,3554,29498,1550,29600,1127,1127,1127,1127,1110,3013,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1127,1337,1110,781,29534,2320,1561,3554,29498,1550,29498,4139,29600,1123,1110,29356,2997,10305,29493,1065,8379,1110,2320,1561,3554,29498,1550,29498,4139,29600,1127,1127,1127,18190,1110,8379,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1127,1337,1110,781,29534,2320,1561,3554,29498,2558,29600,1123,1110,1219,1352,3554,3519,1127,1027,1110,2320,1561,3554,29498,2558,29600,1127,1127,1127,18190,1110,3013,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1127,1337,1110,781,29534,2320,1561,3554,29498,2558,29498,4139,29600,1110,1219,1352,3554,3519,29493,1065,8379,3368,1110,2320,1561,3554,29498,2558,29498,4139,29600,1127,1127,1127,1196,1110,8379,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1127,1337,1110,781,29534,2320,1561,3554,29498,2558,29498,18776,29600,29473,1110,1219,1352,3554,3519,29493,1245,1301,29478,1041,1110,2320,1561,3554,29498,2558,29498,18776,29600,1127,1127,1127,6158,1110,3013,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1127,1337,1110,781,781,28100,14598,2000,7553,2076,781,781,29534,12115,1337,1110,8402,1127,1127,1524,1110,5315,1233,1127,1127,1127,6158,1110,16753,1127,1127,1127,3368,1110,5339,29473,1110,781,29534,1945,26470,29534,1945,1945,1945,29501,29534,1945,1945,1945,24401,29534,1945,1945,1945,1945,29501,29534,26403,29534,781,29534,2320,1142,4082,29498,20996,29600,1028,1110,4746,23762,2242,1070,17014,1065,1032,2191,3368,1110,2320,1142,4082,29498,20996,1113,2195,9080,29557,2241,5652,29600,1142,4082,29498,20996,1113,2195,29507,29473,29508,29600,1110,12447,1066,2320,25848,29600,29557,2241,5652,1142,4082,1163,2886,3587,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,5240,29498,14914,29600,3055,1110,8402,1219,1352,3554,1133,1797,12329,29493,14519,28749,1072,6340,1110,2320,1561,3554,29498,5240,29498,14914,29600,1127,1127,1524,1110,3013,1066,2320,25848,29600,1127,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,1561,3554,29498,5240,29498,2558,29600,29473,1110,1219,1352,3554,1133,1797,12329,3519,1127,1041,1110,2320,1561,3554,29498,5240,29498,2558,29600,1127,1127,1041,1110,3013,1066,2320,25848,29600,1127,1127,2185,29473,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,781,28100,19707,7553,2076,781,781,29534,12115,3368,1110,8402,1127,1127,1027,1110,5315,1233,1127,1123,1110,16753,1127,18190,1110,5339,29473,1110,781,29534,1945,8163,29534,1945,1945,26403,29534,1945,10530,29534,1945,1945,8163,29534,26403,29534,781,29534,2320,4139,29498,8016,29498,2199,29600,1110,1181,9719,1032,2191,1122,1706,1158,1032,10060,1960,1110,2320,4139,29498,8016,29498,2199,1113,2195,9080,1110,15548,1132,5386,8379,1960,29507,29498,1066,2320,25848,29600,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,29536,29543,29498,21065,23943,29600,1028,1110,4420,23943,1032,2191,1122,1229,29543,1706,18190,1110,2320,29536,29543,29498,21065,23943,1113,2195,9080,1028,1110,9185,1047,2100,2191,1066,3597,1174,6158,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,5969,29600,1524,1110,19304,3696,1093,1103,2320,3832,9191,2660,29498,27372,29498,9065,29514,29508,26688,1110,2320,5969,1113,2092,9080,3368,1110,3696,1066,2320,18038,29600,2185,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,29534,2320,2726,29600,1524,1110,8187,3696,1127,1524,1110,2320,2726,1113,2092,9080,3368,1110,3696,1066,2320,18038,29600,2185,1110,2320,29502,29600,29516,29600,29508,29600,1110,781,781,1832,8019,1304,2107,781,781,29504,9557,29494,1797,14708,29600,1155,1131,29538,1210,5105,29493,1210,10612,781,29504,1501,14708,29600,29530,1352,3554,14708,29600,5889,4655,2276,6990,29491,1443,29516,1561,3554,29516,1561,3554,29499,781,29504,9557,2120,29482,14708,29600,781,29504,9557,29536,29543,14708,29600,781,29504,9557,23295,14708,29600,781,29504,9557,29489,9925,14708,29600,781,29504,9557,10960,14708,29600,781,29504,9557,1202,14708,29600,781,29504,9557,21662,14708,29600,781,29504,9557,6891,14708,29600,781,781,1832,3087,781,781,29530,1352,3554,1133,1797,12329,1117,17813,1684,1040,4239,1070,1040,1501,25559,3087,5889,11727,1377,781,781,1832,4532,16875,1245,1040,6056,12545,8527,781,781,29534,8527,1326,1110,1188,6579,4125,29477,1127,1127,29473,1110,10988,1127,1127,1127,1127,1127,1127,1127,1127,1127,1127,1127,1110,781,29534,1945,14686,29534,1945,1945,24401,29534,1945,1945,1945,1945,1945,1945,1945,1945,1945,1945,1945,23611,29534,781,29534,1387,7948,1129,1138,1116,6158,1110,1501,1561,3554,29501,6177,1129,1138,4096,1561,3554,29501,6177,1129,1138,29561,1524,1110,7088,1032,12278,2603,1312,29493,1210,1509,29493,1070,1342,5762,4590,1124,1219,1352,3554,27132,2241,5652,14769,1042,5454,7486,1163,1040,4593,29493,5165,13878,1072,2997,5699,27132,2241,5652,3363,1065,1032,3460,1133,1797,10811,7535,29491,1110,781,29534,1387,23191,1655,1116,6158,1110,1501,1561,3554,29501,29494,1797,29501,14859,1655,4096,1561,3554,29501,29494,1797,29501,14859,1655,29561,1110,24549,1163,4689,7620,5762,27132,2241,5652,16485,7808,5426,27132,2241,5652,2759,1401,7808,1066,1342,20619,1163,13569,27132,2241,5652,4645,29481,1124,1219,1352,3554,27132,2241,5652,3363,4981,1133,1797,10811,27072,29491,1127,1127,1110,781,29534,1387,6060,29523,8225,1116,1028,1110,1501,1352,29487,29501,29485,1836,5640,4096,1352,29487,29501,29485,1836,5640,29561,1127,1027,1110,7811,1032,11474,2771,2212,1312,29493,1210,1509,29493,1070,1342,5762,4590,1124,1219,1352,3554,27132,2241,5652,3363,1065,1032,3460,1133,1797,10811,7535,29491,1127,1127,1127,1127,1524,1110,781,29534,1387,29530,1352,3554,1133,1797,12329,1116,1110,1501,1561,3554,29501,29494,1797,29501,5240,4096,1561,3554,29501,29494,1797,29501,5240,29561,1524,1110,1098,1133,1797,11580,1066,14881,1163,1219,1352,3554,1127,1127,1127,1127,1127,1127,1127,1127,1127,1123,1110,29473,781,29534,1387,23117,4581,1958,1116,3055,1110,1501,10078,29501,9444,4096,10078,29501,9444,29561,1127,1110,22731,3118,1070,2509,2333,3600,17472,16791,1093,29551,29494,6055,1210,2876,29499,1127,1127,1127,1127,1127,1127,1127,2185,29473,1110,781,29534,1387,12509,4503,21080,1116,3055,1110,1501,2353,29498,2381,29498,8563,4096,2353,29498,2381,29498,8563,29561,1127,1110,4503,3671,19590,1124,5217,2276,1829,12545,29491,6990,29491,1459,29516,2353,29498,2381,29498,8563,29516,1127,1127,1127,1127,1127,1127,1127,1326,1110,781,781,29560,1561,3554,29501,6177,1129,1138,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,6177,1129,1138,29535,1113,29530,1352,3554,10481,1129,1138,29507,781,29560,1561,3554,29501,29494,1797,29501,14859,1655,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,29494,1797,29501,14859,1655,29535,1113,29530,1352,3554,1133,1797,27026,1655,29507,781,29560,1352,29487,29501,29485,1836,5640,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,1352,29487,29501,29485,1836,5640,29535,1113,6060,29523,8225,29507,781,29560,1561,3554,29501,29494,1797,29501,5240,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,1561,3554,29501,29494,1797,29501,5240,29535,1113,29530,1352,3554,1133,1797,12329,29507,781,29560,10078,29501,9444,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,10078,29501,9444,29535,1113,23117,4581,1958,29507,781,29560,2353,29498,2381,29498,8563,10350,1291,4655,2276,6990,29491,1443,29516,1829,12545,29516,2353,29498,2381,29498,8563,29535,1113,12509,4503,21080,29507,4,1027,4771,1117,1032,7585,6204,1070,2198,4979,1065,1040,4625,3013,29515,781,781,29508,29491,1387,4651,1158,1219,1352,3554,1133,1797,12329,9957,1619,1512,15925,1137,1040,3013,12668,1158,1040,13673,1122,1040,1219,1352,3554,1133,1797,11580,29493,1458,1117,1032,1133,1797,8375,1066,14881,1163,1040,2333,29501,2162,4610,2997,5949,2755,1219,1352,3554,29491,781,781,29518,29491,1387,23743,2107,9957,1619,4979,14519,1040,3798,7808,1072,4698,4004,1066,1706,1040,1219,1352,3554,1133,1797,11580,29491,781,781,29538,29491,1387,10196,9957,1619,4979,5373,1137,1040,1219,1352,3554,1133,1797,12329,1117,17813,1684,1040,4239,1070,1040,17924,3087,29491,781,781,29549,29491,1387,16047,16875,1245,1040,6056,12545,8527,9957,1619,2248,4979,6080,9904,1066,1567,7796,5970,1066,16875,6970,1254,1040,6056,12545,3256,29493,2027,1158,10481,1129,1138,29493,27026,1655,29493,17472,29523,8225,29493,1219,1352,3554,1133,1797,12329,29493,13595,4581,1958,29493,1072,16875,4503,21080,29491,7834,3256,1427,1032,7585,6204,1070,1639,6800,29491],"total_duration":40546149250,"load_duration":36248000,"prompt_eval_count":4096,"prompt_eval_duration":25815653291,"eval_count":193,"eval_duration":14692408834}]
 Here is a brief description of each section in the provided text:

1. **Act as Ollama Bash Lib**: This part explains that the text acts as the documentation for the Ollama Bash Library, which is a Bash library to interact with the open-source language model platform called Ollama.

2. **Requirements**: This section lists the required tools and software needed to use the Ollama Bash Library.

3. **License**: This section states that the Ollama Bash Lib is licensed under the terms of the MIT License.

4. **More AI from the Attogram Project**: This final section provides links to other projects related to AI developed by the Attogram project, such as Multirun, Toolshed, LLM Council, Ollama Bash Lib, Small Models, and AI Test Zone. Each project has a brief description of its purpose.
[DEBUG] ollama_generate_stream_json: return: 0
```
