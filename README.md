# Ollama Bash Lib

A Bash Library to interact with [Ollama](https://github.com/ollama/ollama)

Run LLM prompts straight from your shell. Command line access to the ghost in the machine.

[▶️ Get Started in 30 seconds](#quickstart) • [💬 Join Discord][discord-invite]

![License](https://img.shields.io/github/license/attogram/ollama-bash-lib?style=flat)
![Bash ≥3.2](https://img.shields.io/badge/bash-%3E=3.2-blue?logo=gnu-bash)
![GitHub stars](https://img.shields.io/github/stars/attogram/ollama-bash-lib?style=flat)

[Quickstart](#quickstart) -
[Usage](#usage) -
[Demos](#demos) - 
[Requirements](#requirements) - 
[License](#license) - 
[More](#more-from-the-attogram-project) -
[Discord][discord-invite] -
[Repo](https://github.com/attogram/ollama-bash-lib) -
[Download](https://raw.githubusercontent.com/attogram/ollama-bash-lib/refs/heads/main/ollama_bash_lib.sh)

[Howto](#howto) : 
[Get Tech Support](#howto-get-technical-support) -
[Chat](#howto-chat) -
[Use Tools](#howto-use-tools) -
[Use Turbo Mode](#howto-use-ollama-turbo-mode) -
[Debug](#howto-debug)

[Functions](#functions) : 
[Api](#api-functions) -
[Helper](#helper-functions) -
[Generate](#generate-functions) -
[Chat](#chat-functions) -
[Tools](#tool-functions) -
[Model](#model-functions) -
[Ollama](#ollama-functions) -
[Lib](#lib-functions) -
[Utility](#utility-functions)

### Quickstart

```bash
git clone https://github.com/attogram/ollama-bash-lib.git
cd ollama-bash-lib
source ollama_bash_lib.sh

# One line generation
ollama_generate "mistral:7b" "Describe Bash in 3 words"
# Powerful, Flexible, Scripting.

# Tab completion to view available library functions
ollama_<TAB><TAB>
# ollama_api_get               ollama_generate              ollama_messages_last_json
# ollama_api_ping              ollama_generate_json         ollama_model_random
# ollama_api_post              ollama_generate_stream       ollama_model_unload
# ollama_app_installed         ollama_generate_stream_json  ollama_ps
# ollama_app_turbo             ollama_lib_about             ollama_ps_json
# ollama_app_vars              ollama_lib_version           ollama_show
# ollama_app_version           ollama_list                  ollama_show_json
# ollama_app_version_cli       ollama_list_array            ollama_thinking
# ollama_app_version_json      ollama_list_json             ollama_tools
# ollama_chat                  ollama_messages              ollama_tools_add
# ollama_chat_json             ollama_messages_add          ollama_tools_clear
# ollama_chat_stream           ollama_messages_clear        ollama_tools_count
# ollama_chat_stream_json      ollama_messages_count        ollama_tools_is_call
# ollama_eval                  ollama_messages_last         ollama_tools_run
```

## Usage

Include in your shell or script:
```bash
source ./ollama_bash_lib.sh
```

Include in your script, with error checking:
```bash
ollama_bash_lib="path/to/ollama_bash_lib.sh"
if [[ ! -f "$ollama_bash_lib" ]]; then
  echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"
  exit 1
fi
source "$ollama_bash_lib"
```

## Howto

### Howto get Technical Support

Free technical support is available on the [Attogram Discord Server][discord-invite]

You are welcome to join us in the [`#ollama-bash-lib` channel][discord-invite]

### Howto chat

See [`./demos/interactive.chat.sh`](./demos/interactive.chat.sh)
for an example of an interactive chat session.

Chat is based on a list of messages that is sent to the model on every request.


Add a message:
```
ollama_messages_add user "Hello"
```

Send the message list to the model:
```
ollama_chat gpt-oss:20b
```

This will do a Chat Completion, based on the message list, and send it to `stdout`.

You are responsible for adding the response into the message list:
```
response="$(ollama_chat gpt-oss:20b)"
ollama_messages_add assistant "$response"
echo "$response"
```

View the current message list (in JSON format) with `ollama_messages`

Clear the message list with `ollama_messages_clear`

Get the message count with `ollama_messages_count`

### Howto use Ollama Turbo Mode

Signup and purchase a Turbo Mode subscription from https://ollama.com

Create an API key via https://ollama.com/settings/keys

Copy the key and keep it in a safe place! 
You will only be shown the full key once.

Use command `ollama_app_turbo` to turn Turbo Mode on/off.
You will be prompted to enter your API key.
```
$ ollama_app_turbo on
Enter Ollama API Key (input hidden):
```

This will set and export `OLLAMA_LIB_API` and `OLLAMA_HOST` to `https://ollama.com`,
and set `OLLAMA_LIB_TURBO_KEY` to your key.

Note: `OLLAMA_LIB_TURBO_KEY` is never exported.
You must decide yourself if you want to export it into your environment.
```
export OLLAMA_LIB_KEY=my.super.secret.key
```

If the key is set, then `ollama_app_turbo on` will not prompt you again for the key.

To turn **off** Turbo Mode, simply use `ollama_app_turbo off`.
This will unset `OLLAMA_LIB_TURBO_KEY`
and reset `OLLAMA_LIB_API` and `OLLAMA_HOST` to `http://localhost:11434`

Use `ollama_lib_about` to view your current settings.

### Howto debug

The `OLLAMA_LIB_DEBUG` variable controls if debug messages are sent to `stderr`

Set `OLLAMA_LIB_DEBUG=1` to turn on debugging. 
Set `OLLAMA_LIB_DEBUG=0` to turn off debugging.

Examples:
```
OLLAMA_LIB_DEBUG=1 ollama_generate gpt-oss:20b "Three words about debugging"
```

### Howto Use Tools

The Tool System allows you to define custom tools that a model can use to perform actions.

**Step 1: Add a Tool**

First, you need to define a tool. A tool consists of a name, a command to execute, and a JSON definition that describes the tool to the model.

For example, let's create a tool that gets the current weather:

```bash
# The command for our tool will be a function that takes a JSON object as input
weather_tool() {
  local location
  location="$(printf '%s' "$1" | jq -r '.location')"
  # In a real scenario, you would call a weather API here
  printf '{"temperature": "72F", "conditions": "Sunny"}'
}

# The JSON definition for the model
weather_definition='{
  "name": "get_weather",
  "description": "Get the current weather in a given location",
  "parameters": {
    "type": "object",
    "properties": {
      "location": {
        "type": "string",
        "description": "The city and state, e.g. San Francisco, CA"
      }
    },
    "required": ["location"]
  }
}'

# Add the tool
ollama_tools_add "get_weather" "weather_tool" "$weather_definition"
```

**Step 2: View Tools**

You can see all registered tools with `ollama_tools`:

```bash
ollama_tools
# get_weather   weather_tool
```

**Step 3: Send a Tool Request**

You can send a request to a model that supports tool calling. You can use either `ollama_generate` or `ollama_chat`.

Using `ollama_chat`:
```bash
ollama_messages_add "user" "What is the weather in San Francisco?"
response="$(ollama_chat "gpt-4-turbo")"
```

**Step 4: Consume the Tool Response**

If the model decides to use a tool, the response will contain a `tool_calls` section. You can check for this with `ollama_tools_is_call`.

```bash
if ollama_tools_is_call "$response"; then
  echo "Tool call detected!"
fi
```

The response will look something like this:
```json
{
  "model": "gpt-4-turbo",
  "created_at": "...",
  "message": {
    "role": "assistant",
    "content": "",
    "tool_calls": [
      {
        "id": "call_1234",
        "type": "function",
        "function": {
          "name": "get_weather",
          "arguments": "{\n  \"location\": \"San Francisco, CA\"\n}"
        }
      }
    ]
  }
}
```

**Step 5: Run the Tool**

Now you need to extract the tool call information and run the tool.

```bash
tool_name="$(printf '%s' "$response" | jq -r '.message.tool_calls[0].function.name')"
tool_args="$(printf '%s' "$response" | jq -r '.message.tool_calls[0].function.arguments')"
tool_call_id="$(printf '%s' "$response" | jq -r '.message.tool_calls[0].id')"

tool_result="$(ollama_tools_run "$tool_name" "$tool_args")"
```

**Step 6: Add Tool Response to Message List (for chat)**

Finally, if you are in a chat session, you need to add the tool's output back into the message list so the model can use it to generate a user-facing response.

```bash
# Create a JSON object with the tool_call_id and the result
tool_response_json="$(jq -c -n --arg tool_call_id "$tool_call_id" --arg result "$tool_result" '{tool_call_id: $tool_call_id, result: $result}')"

# Add the tool response to the messages
ollama_messages_add "tool" "$tool_response_json"

# Now, call the chat again to get the final response
final_response="$(ollama_chat "gpt-4-turbo")"
echo "$final_response"
```

## Demos

See the **[demos](demos)** directory for all demo scripts

| Demo                                                                   | About                                                                                                                          | Script                                                                 |
|------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| [review.lib.md](demos/review.lib.md)                                   | Code Review of [`ollama_bash_lib.sh`](ollama_bash_lib.sh)                                                                      | [review.lib.sh](demos/review.lib.sh)                                   |
| [review.lib-security.md](demos/review.lib-security.md)                 | Security Review of [`ollama_bash_lib.sh`](ollama_bash_lib.sh)                                                                  | [review.lib.sh](demos/review.lib-security.sh)                          |
| [review.readme.md](demos/review.readme.md)                             | Marketing Review of this [`README.md`](README.md)                                                                              | [review.readme.sh](demos/review.readme.sh)                             |
| [review.funny.md](demos/review.funny.md)                               | Humorous project descriptions based on [`README.md`](README.md)                                                                | [review.funny.sh](demos/review.funny.sh)                               |
| [prompt.all.models.md](demos/prompt.all.models.md)                     | Send a prompt to all models                                                                                                    | [prompt.all.models.sh](demos/prompt.all.models.sh)                     |
| [prompts.model.md](demos/prompts.model.md)                             | Send many prompts to a model                                                                                                   | [prompts.model.sh](demos/prompts.model.sh)                             |
| [ollama_chat.md](demos/ollama_chat.md)                                 | Chat completion with [`ollama_messages_add`](#chat-functions) and [`ollama_chat`](#chat-functions)                             | [ollama_chat.sh](demos/ollama_chat.sh)                                 |
| [ollama_generate.md](demos/ollama_generate.md)                         | Generate completion with [`ollama_generate`](#generate-functions)                                                              | [ollama_generate.sh](demos/ollama_generate.sh)                         |
| [ollama_generate_json.md](demos/ollama_generate_json.md)               | Generate completion, json output with [`ollama_generate_json`](#generate-functions)                                            | [ollama_generate_json.sh](demos/ollama_generate_json.sh)               |
| [ollama_generate_stream.md](demos/ollama_generate_stream.md)           | Generate completion, streaming with [`ollama_generate_stream`](#generate-functions)                                            | [ollama_generate_stream.sh](demos/ollama_generate_stream.sh)           |
| [ollama_generate_stream_json.md](demos/ollama_generate_stream_json.md) | Generate completion, streaming and json output with [`ollama_generate_stream_json`](#generate-functions)                       | [ollama_generate_stream_json.sh](demos/ollama_generate_stream_json.sh) |
| [ollama_model_random.md](demos/ollama_model_random.md)                 | Random model name with [`ollama_model_random`](#model-functions)                                                               | [ollama_model_random.sh](demos/ollama_model_random.sh)                 |
| [list.md](demos/list.md)                                               | Ollama model list with [`ollama_list`](#model-functions), `ollama_list_array` and `ollama_list_json`                           | [list.sh](demos/list.sh)                                               |
| [ps.md](demos/ps.md)                                                   | Ollama running processes with [`ollama_ps`](#ollama-functions) and [`ollama_ps_json`](#ollama-functions)                       | [ps.sh](demos/ps.sh)                                                   |
| [show.md](demos/show.md)                                               | Model info with [`ollama_show`](#model-functions) and [`ollama_show_json`](#model-functions)                                   | [show.sh](demos/show.sh)                                               |
| [messages.md](demos/messages.md)                                       | Messages with [`ollama_messages`](#chat-functions), `ollama_messages_add`, `ollama_messages_count` and `ollama_messages_clear` | [messages.sh](demos/messages.sh)                                       |
| [version.md](demos/version.md)                                         | Ollama version with [`ollama_app_version`](#ollama-functions), `ollama_app_version_json` and `ollama_app_version_cli`          | [version.sh](demos/version.sh)                                         |
| [about.md](demos/about.md)                                             | Ollama Bash Lib info with [`ollama_lib_about`](#lib-functions) and [`ollama_lib_version`](#lib-functions)                      | [about.sh](demos/about.sh)                                             |
| [ollama_api_get.md](demos/ollama_api_get.md)                           | [`ollama_api_get`](#api-functions) tests                                                                                       | [ollama_api_get.sh](demos/ollama_api_get.sh)                           |
| [_is_valid_json.md](demos/_is_valid_json.md)                           | Is a string valid json? with `_is_valid_json`                                                                                  | [_is_valid_json.sh](demos/_is_valid_json.sh)                           |
| [_is_valid_model.md](demos/_is_valid_model.md)                         | Is a string a valid model name? with `_is_valid_model`                                                                         | [_is_valid_model.sh](demos/_is_valid_model.sh)                         |
| [ollama_app_vars.md](demos/ollama_app_vars.md)                         | Ollama environmental variables with [`ollama_app_vars`](#ollama-functions)                                                     | [ollama_app_vars.sh](demos/ollama_app_vars.sh)                         |
| <!-- [interactive.chat.md](demos/interactive.chat.md) -->              | Interactive Chat completion (with message history)                                                                             | [interactive.chat.sh](demos/interactive.chat.sh)                       |
| <!-- [interactive.generate.md](demos/interactive.generate.md) -->      | Interactive Generate completion (no message history)                                                                           | [interactive.generate.sh](demos/interactive.generate.sh)               |

To run all demos and save output to Markdown files: [demos/run.demos.sh](demos/run.demos.sh)

## Functions

### Api Functions

| Function<br />Alias           | About                          | Usage                                            | Output                      | Return                                             |
|-------------------------------|--------------------------------|--------------------------------------------------|-----------------------------|----------------------------------------------------|
| `ollama_api_get`<br />`oag`    | GET request to the Ollama API  | `ollama_api_get "/api/path"`                     | API call result to `stdout` | `0` API call success<br />`1` API call error       |
| `ollama_api_post`<br />`oap`   | POST request to the Ollama API | `ollama_api_post "/api/path" "{ json content }"` | API call result to `stdout` | `0` API call success<br />`1` API call error       |
| `ollama_api_ping`<br />`oapi`  | Ping the Ollama API            | `ollama_api_ping`                                | none                        | `0` API is reachable<br />`1` API is not reachable |

### Generate Functions

| Function<br />Alias                      | About                               | Usage                                          | Output                     | Return  |
|------------------------------------------|-------------------------------------|------------------------------------------------|----------------------------|---------|
| `ollama_generate`<br />`og`               | Generate completion                 | `ollama_generate "model" "prompt"`             | text to `stdout`           | `0`/`1` |
| `ollama_generate_json`<br />`ogj`         | Generate completion, in json        | `ollama_generate_json "model" "prompt"`        | json to `stdout`           | `0`/`1` |
| `ollama_generate_stream`<br />`ogs`       | Generate completion stream          | `ollama_generate_stream "model" "prompt"`      | streaming text to `stdout` | `0`/`1` |
| `ollama_generate_stream_json`<br />`ogsj` | Generate completion stream, in json | `ollama_generate_stream_json "model" "prompt"` | streaming json to `stdout` | `0`/`1` |

### Chat Functions

| Function<br />Alias                  | About                              | Usage                                  | Output                                      | Return  |
|--------------------------------------|------------------------------------|----------------------------------------|---------------------------------------------|---------|
| `ollama_chat`<br />`oc`               | Chat completion                    | `ollama_chat "model"`                  | text to `stdout`                            | `0`/`1` |
| `ollama_chat_json`<br />`ocj`         | Chat completion, in json           | `ollama_chat_json "model"`             | json to `stdout`                            | `0`/`1` |
| `ollama_chat_stream`<br />`ocs`       | Chat completion stream             | `ollama_chat_stream "model"`           | streaming text to `stdout`                  | `0`/`1` |
| `ollama_chat_stream_json`<br />`ocsj` | Chat completion stream, in json    | `ollama_chat_stream_json "model"`      | streaming json to `stdout`                  | `0`/`1` |
| `ollama_messages`<br />`om`           | Get messages in chat context       | `ollama_messages`                      | json message list, 1 per line, to `stdout`  | `0`/`1` |
| `ollama_messages_add`<br />`oma`      | Add a message to chat context      | `ollama_messages_add "role" "message"` | none                                        | `0`/`1` |
| `ollama_messages_count`<br />`omco`   | Count of messages in chat context  | `ollama_messages_count`                | number of messages to `stdout`              | `0`/`1` |
| `ollama_messages_clear`<br />`omc`    | Clear all messages in chat context | `ollama_messages_clear`                | none                                        | `0`/`1` |

### Tool Functions

| Function<br />Alias              | About                               | Usage                                                              | Output                     | Return                                      |
|----------------------------------|-------------------------------------|--------------------------------------------------------------------|----------------------------|---------------------------------------------|
| `ollama_tools_add`<br />`ota`     | Add a tool                          | `ollama_tools_add "name" "command" "json_definition"`              | none                       | `0`/`1`                                     |
| `ollama_tools`<br />`oto`         | View all tools                      | `ollama_tools`                                                     | list of tools to `stdout`  | `0`/`1`                                     |
| `ollama_tools_count`<br />`otco`  | Get count of tools                  | `ollama_tools_count`                                               | number of tools to `stdout`| `0`/`1`                                     |
| `ollama_tools_clear`<br />`otc`   | Remove all tools                    | `ollama_tools_clear`                                               | none                       | `0`/`1`                                     |
| `ollama_tools_is_call`<br />`otic`| Does the response have a tool call? | `ollama_tools_is_call "json_response"`                             | none                       | `0` if it has a tool call, `1` otherwise    |
| `ollama_tools_run`<br />`otr`     | Run a tool                          | `ollama_tools_run "tool_name" "arguments_json"`                    | result of tool to `stdout` | `0`/`1`                                     |

### Model Functions

| Function<br />Alias              | About                                                             | Usage                           | Output                                          | Return                                         |
|----------------------------------|-------------------------------------------------------------------|---------------------------------|-------------------------------------------------|------------------------------------------------|
| `ollama_model_random`<br />`omr` | Get a random model                                                | `ollama_model_random`           | 1 model name to `stdout`                        | `0`/`1`                                        |
| `ollama_model_unload`<br />`omu` | Unload a model from memory<br />(Clear context for a model)       | `ollama_model_unload`           | none                                            | `0`/`1`                                        |
| `ollama_show`<br />`os`           | Show model information                                            | `ollama_show "model"`           | text to `stdout`                                | `0`/`1`                                        |
| `ollama_show_json`<br />`osj`     | Show model information, in json                                   | `ollama_show_json "model"`      | json to `stdout`                                | `0`/`1`                                        |
| `ollama_list`<br />`ol`           | List all available models                                         | `ollama_list`                   | text to `stdout`                                | `0`/`1`                                        |
| `ollama_list_json`<br />`olj`     | List all available models, in json                                | `ollama_list_json`              | json to `stdout`                                | `0`/`1`                                        |
| `ollama_list_array`<br />`ola`    | List all available models, for bash array                         | `models=($(ollama_list_array))` | space separated list of model names to `stdout` | `0`/`1`                                        |
| `_is_valid_model`                | Validate a model name<br />(or get random model if name is empty) | `_is_valid_model "model"`       | valid model name, or empty string, to `stdout`  | `0` if model name is valid<br />`1` if invalid |

### Ollama Functions

| Function<br />Alias                  | About                            | Usage                                                                           | Output              | Return                               |
|--------------------------------------|----------------------------------|---------------------------------------------------------------------------------|---------------------|--------------------------------------|
| `ollama_app_installed`<br />`oai`    | Is Ollama installed?             | `if ollama_app_installed; then echo "Installed"; else echo "Not Installed"; fi` | none                | `0` installed<br />`1` not installed |
| `ollama_app_turbo`<br />`oat`        | Turn Turbo Mode on/off           | `ollama_app_turbo on` or `ollama_app_turbo off`                                 | Prompts for api key | `0`/`1`                              |
| `ollama_app_version`<br />`oave`      | Ollama version                   | `ollama_app_version`                                                            | text to `stdout`    | `0`/`1`                              |
| `ollama_app_version_json`<br />`oavj` | Ollama version, in json          | `ollama_app_version_json`                                                       | json to `stdout`    | `0`/`1`                              |
| `ollama_app_version_cli`<br />`oavc`  | Ollama version, from cli         | `ollama_app_version_cli`                                                        | text to `stdout`    | `0`/`1`                              |
| `ollama_ps`<br />`op`                 | Running model processes          | `ollama_ps`                                                                     | text to `stdout`    | `0`/`1`                              |
| `ollama_ps_json`<br />`opj`           | Running model processes, in json | `ollama_ps_json`                                                                | json to `stdout`    | `0`/`1`                              |

### Lib Functions

| Function<br />Alias              | About                                           | Usage                                                        | Output                                                          | Return  |
|----------------------------------|-------------------------------------------------|--------------------------------------------------------------|-----------------------------------------------------------------|---------|
| `ollama_lib_about`<br />`olab`    | About Ollama Bash Lib, lists vars and functions | `ollama_lib_about`                                           | text to `stdout`                                                | `0`/`1` |
| `ollama_lib_version`<br />`olv`   | Ollama Bash Lib version                         | `ollama_lib_version`                                         | text to `stdout`                                                | `0`/`1` |

### Utility Functions

| Function                     | About                                   | Usage                                 | Output                     | Return                                          |
|------------------------------|-----------------------------------------|---------------------------------------|----------------------------|-------------------------------------------------|
| `_is_valid_json`             | Is a string valid JSON?                 | `_is_valid_json "string"`             | none                       | `0` if valid json<br />`1` or higher if invalid |
| `_debug`                     | Debug message (if `OLLAMA_LIB_DEBUG=1`) | `_debug "message"`                    | message to `stderr`        | `0`/`1`                                         |
| `_error`                     | Error message                           | `_error "message"`                    | message to `stderr`        | `0`/`1`                                         |

## Requirements

* ```bash``` - v3.2 or higher, or equivalent
* Standard tools: `awk`, `sed`, `tr`, `grep`, `wc`, `od`, `command`

### Optional Requirements

* [`Ollama`](https://github.com/ollama/ollama) - for LLM interaction
* [`curl`](https://curl.se/) - for API requests
* [`jq`](https://jqlang.org) - for JSON handling
* `shuf` - for `ollama_model_random`
* `sort` - for sorting lists
* `column` - for `ollama_lib_about` output formatting

If you don't have any of the optional requirements, the function `ollama_app_installed` is always available.

## License

Ollama Bash Lib is licensed under the terms of the [MIT License](LICENSE).

## More from the Attogram Project

| Project                                                     | About                                                                                                                                                                                           |
|-------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [**Attogram Project<br />Discord Channel**][discord-invite] | Join the **Attogram Project Discord Channel** for:<br />- Announcements<br />- Technical Support<br />- General Chat about Attogram Projects                                                    |
| [**Ollama Multirun**][ollama-multirun]                      | Run a prompt against all, or some, of your models running on Ollama.<br />- Creates web pages with the output, performance statistics and model info.<br />- All in a single Bash shell script. |
| [**Ollama Bash Lib**][ollama-bash-lib]                      | A Bash Library to interact with Ollama                                                                                                                                                          | 
| [**Ollama Bash Toolshed**][ollama-bash-toolshed]            | Chat with tool calling models.<br />- Sample tools included.<br />- Add new tools to your shed with ease.<br />- Runs on Ollama.<br />- All via Bash shell scripts.                             |
| [**LLM Council**][llm-council]                              | Start a chat room between all, or some, of your models running on Ollama.<br />- All in a single Bash shell script.                                                                             |
| [**Small Models**][small-models]                            | Comparison of small open source LLMs<br />- 8b parameters or less                                                                                                                               |
| [**AI Test Zone**][ai_test_zone]                            | AI Testing reports<br />- hosted on https://attogram.github.io/ai_test_zone/                                                                                                                    |

[discord-invite]: <https://discord.gg/BGQJCbYVBa> "Attogram Project Discord Channel"
[ollama-multirun]: <https://github.com/attogram/ollama-multirun> "Ollama Multirun"
[ollama-bash-toolshed]: <https://github.com/attogram/ollama-bash-toolshed> "Ollama Bash Toolshed"
[llm-council]: <https://github.com/attogram/llm-council> "LLM Council"
[ollama-bash-lib]: <https://github.com/attogram/ollama-bash-lib> "Ollama Bash Lib"
[small-models]: <https://github.com/attogram/small-models> "Small Models"
[ai_test_zone]: <https://github.com/attogram/ai_test_zone> "AI Test Zone"
