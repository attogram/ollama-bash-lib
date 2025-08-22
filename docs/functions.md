# Function Reference

This file contains a full list of all functions available in the Ollama Bash Lib, along with their usage and descriptions.

## API Functions

| Function<br />Alias           | About                          | Usage                                            | Output                      | Return                                             |
|-------------------------------|--------------------------------|--------------------------------------------------|-----------------------------|----------------------------------------------------|
| `ollama_api_get`<br />`oag`    | GET request to the Ollama API  | `ollama_api_get -P "/api/path"`                     | API call result to `stdout` | `0` API call success<br />`1` API call error       |
| `ollama_api_post`<br />`oap`   | POST request to the Ollama API | `ollama_api_post -P "/api/path" -d "{...}"` | API call result to `stdout` | `0` API call success<br />`1` API call error       |
| `ollama_api_ping`<br />`oapi`  | Ping the Ollama API            | `ollama_api_ping`                                | none                        | `0` API is reachable<br />`1` API is not reachable |

## Generate Functions

| Function<br />Alias                      | About                               | Usage                                          | Output                     | Return  |
|------------------------------------------|-------------------------------------|------------------------------------------------|----------------------------|---------|
| `ollama_generate`<br />`og`               | Generate completion                 | `ollama_generate -m "model" -p "prompt"`             | text to `stdout`           | `0`/`1` |
| `ollama_generate_json`<br />`ogj`         | Generate completion, in json        | `ollama_generate_json -m "model" -p "prompt"`        | json to `stdout`           | `0`/`1` |
| `ollama_generate_stream`<br />`ogs`       | Generate completion stream          | `ollama_generate_stream -m "model" -p "prompt"`      | streaming text to `stdout` | `0`/`1` |
| `ollama_generate_stream_json`<br />`ogsj` | Generate completion stream, in json | `ollama_generate_stream_json -m "model" -p "prompt"` | streaming json to `stdout` | `0`/`1` |

## Chat Functions

| Function<br />Alias                  | About                              | Usage                                  | Output                                      | Return  |
|--------------------------------------|------------------------------------|----------------------------------------|---------------------------------------------|---------|
| `ollama_chat`<br />`oc`               | Chat completion                    | `ollama_chat -m "model"`                  | text to `stdout`                            | `0`/`1` |
| `ollama_chat_json`<br />`ocj`         | Chat completion, in json           | `ollama_chat_json -m "model"`             | json to `stdout`                            | `0`/`1` |
| `ollama_chat_stream`<br />`ocs`       | Chat completion stream             | `ollama_chat_stream -m "model"`           | streaming text to `stdout`                  | `0`/`1` |
| `ollama_chat_stream_json`<br />`ocsj` | Chat completion stream, in json    | `ollama_chat_stream_json -m "model"`      | streaming json to `stdout`                  | `0`/`1` |
| `ollama_messages`<br />`om`           | Get messages in chat context       | `ollama_messages`                      | json message list, 1 per line, to `stdout`  | `0`/`1` |
| `ollama_messages_add`<br />`oma`      | Add a message to chat context      | `ollama_messages_add -r "role" -c "message"` | none                                        | `0`/`1` |
| `ollama_messages_count`<br />`omco`   | Count of messages in chat context  | `ollama_messages_count`                | number of messages to `stdout`              | `0`/`1` |
| `ollama_messages_clear`<br />`omc`    | Clear all messages in chat context | `ollama_messages_clear`                | none                                        | `0`/`1` |


## Model Functions

| Function<br />Alias              | About                                                             | Usage                           | Output                                          | Return                                         |
|----------------------------------|-------------------------------------------------------------------|---------------------------------|-------------------------------------------------|------------------------------------------------|
| `ollama_model_random`<br />`omr` | Get a random model                                                | `ollama_model_random`           | 1 model name to `stdout`                        | `0`/`1`                                        |
| `ollama_model_unload`<br />`omu` | Unload a model from memory<br />(Clear context for a model)       | `ollama_model_unload -m "model"`           | none                                            | `0`/`1`                                        |
| `ollama_show`<br />`os`           | Show model information                                            | `ollama_show -m "model"`           | text to `stdout`                                | `0`/`1`                                        |
| `ollama_show_json`<br />`osj`     | Show model information, in json                                   | `ollama_show_json -m "model"`      | json to `stdout`                                | `0`/`1`                                        |
| `ollama_list`<br />`ol`           | List all available models                                         | `ollama_list`                   | text to `stdout`                                | `0`/`1`                                        |
| `ollama_list_json`<br />`olj`     | List all available models, in json                                | `ollama_list_json`              | json to `stdout`                                | `0`/`1`                                        |
| `ollama_list_array`<br />`ola`    | List all available models, for bash array                         | `models=($(ollama_list_array))` | space separated list of model names to `stdout` | `0`/`1`                                        |
| `_is_valid_model`                | Validate a model name<br />(or get random model if name is empty) | `_is_valid_model "model"`       | valid model name, or empty string, to `stdout`  | `0` if model name is valid<br />`1` if invalid |

## Ollama Functions

| Function<br />Alias                  | About                            | Usage                                                                           | Output              | Return                               |
|--------------------------------------|----------------------------------|---------------------------------------------------------------------------------|---------------------|--------------------------------------|
| `ollama_app_installed`<br />`oai`    | Is Ollama installed?             | `if ollama_app_installed; then ...; fi` | none                | `0` installed<br />`1` not installed |
| `ollama_app_turbo`<br />`oat`        | Turn Turbo Mode on/off           | `ollama_app_turbo -m on` or `ollama_app_turbo -m off`                                 | Prompts for api key | `0`/`1`                              |
| `ollama_app_version`<br />`oave`      | Ollama version                   | `ollama_app_version`                                                            | text to `stdout`    | `0`/`1`                              |
| `ollama_app_version_json`<br />`oavj` | Ollama version, in json          | `ollama_app_version_json`                                                       | json to `stdout`    | `0`/`1`                              |
| `ollama_app_version_cli`<br />`oavc`  | Ollama version, from cli         | `ollama_app_version_cli`                                                        | text to `stdout`    | `0`/`1`                              |
| `ollama_ps`<br />`op`                 | Running model processes          | `ollama_ps`                                                                     | text to `stdout`    | `0`/`1`                              |
| `ollama_ps_json`<br />`opj`           | Running model processes, in json | `ollama_ps_json`                                                                | json to `stdout`    | `0`/`1`                              |

## Lib Functions

| Function<br />Alias              | About                                           | Usage                                                        | Output                                                          | Return  |
|----------------------------------|-------------------------------------------------|--------------------------------------------------------------|-----------------------------------------------------------------|---------|
| `ollama_lib_about`<br />`olab`    | About Ollama Bash Lib, lists vars and functions | `ollama_lib_about`                                           | text to `stdout`                                                | `0`/`1` |
| `ollama_lib_version`<br />`olv`   | Ollama Bash Lib version                         | `ollama_lib_version`                                         | text to `stdout`                                                | `0`/`1` |
| `ollama_thinking`<br />`ot`       | Configure thinking mode                         | `ollama_thinking [on|off|hide]`                              | current setting to `stdout`                                     | `0`/`1` |

## Utility Functions

| Function                     | About                                   | Usage                                 | Output                     | Return                                          |
|------------------------------|-----------------------------------------|---------------------------------------|----------------------------|-------------------------------------------------|
| `_is_valid_json`             | Is a string valid JSON?                 | `_is_valid_json "string"`             | none                       | `0` if valid json<br />`1` or higher if invalid |
| `_debug`                     | Debug message (if `OBL_DEBUG=1`) | `_debug "message"`                    | message to `stderr`        | `0`/`1`                                         |
| `_error`                     | Error message                           | `_error "message"`                    | message to `stderr`        | `0`/`1`                                         |
