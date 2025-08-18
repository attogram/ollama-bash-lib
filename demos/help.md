# help via -h and --help

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3
## Testing -h for all functions (first argument)

`ollama_api_get -h`
```
Usage: ollama_api_get "/api/path"

ollama_api_get

GET request to the Ollama API.

Sends a GET request to the specified path on the Ollama API server.
This is a fundamental function used by many other functions in this library to communicate with the Ollama API, such as 'ollama_list_json' and 'ollama_api_ping'.

It relies on the '_call_curl' function to perform the actual HTTP request.
```

`oag -h`
```
Usage: ollama_api_get "/api/path"

ollama_api_get

GET request to the Ollama API.

Sends a GET request to the specified path on the Ollama API server.
This is a fundamental function used by many other functions in this library to communicate with the Ollama API, such as 'ollama_list_json' and 'ollama_api_ping'.

It relies on the '_call_curl' function to perform the actual HTTP request.
```

`ollama_api_post -h`
```
Usage: ollama_api_post "/api/path" "{json}"

ollama_api_post

POST request to the Ollama API.

Sends a POST request with a JSON payload to the specified path on the Ollama API server.
This is a core function for sending data to the Ollama API, used by functions like 'ollama_generate_json', 'ollama_chat_json', and 'ollama_show_json'.

It relies on the '_call_curl' function to perform the actual HTTP request.
```

`oap -h`
```
Usage: ollama_api_post "/api/path" "{json}"

ollama_api_post

POST request to the Ollama API.

Sends a POST request with a JSON payload to the specified path on the Ollama API server.
This is a core function for sending data to the Ollama API, used by functions like 'ollama_generate_json', 'ollama_chat_json', and 'ollama_show_json'.

It relies on the '_call_curl' function to perform the actual HTTP request.
```

`ollama_api_ping -h`
```
Usage: ollama_api_ping

ollama_api_ping

Ping the Ollama API to check for availability.

This function sends a request to the root of the Ollama API to verify that it is running and accessible.
It is useful for health checks and ensuring connectivity before attempting to use other API functions.

This function relies on 'ollama_api_get' to make the request.
```

`oapi -h`
```
Usage: ollama_api_ping

ollama_api_ping

Ping the Ollama API to check for availability.

This function sends a request to the root of the Ollama API to verify that it is running and accessible.
It is useful for health checks and ensuring connectivity before attempting to use other API functions.

This function relies on 'ollama_api_get' to make the request.
```

`ollama_generate_json -h`
```
Usage: ollama_generate_json "model" "prompt"

ollama_generate_json

Generate a completion from a model as JSON.

This function sends a prompt to a specified model and returns the model's response as a raw JSON object. If streaming is enabled via the global 'OLLAMA_LIB_STREAM' variable, it will return a stream of JSON objects.

This is a foundational function for 'ollama_generate' and 'ollama_generate_stream', which process this JSON output into plain text.
```

`ogj -h`
```
Usage: ollama_generate_json "model" "prompt"

ollama_generate_json

Generate a completion from a model as JSON.

This function sends a prompt to a specified model and returns the model's response as a raw JSON object. If streaming is enabled via the global 'OLLAMA_LIB_STREAM' variable, it will return a stream of JSON objects.

This is a foundational function for 'ollama_generate' and 'ollama_generate_stream', which process this JSON output into plain text.
```

`ollama_generate -h`
```
Usage: ollama_generate "model" "prompt"

ollama_generate

Generate a completion from a model as plain text.

This function is a wrapper around 'ollama_generate_json'. It takes the raw JSON output and extracts the 'response' field, returning it as a single string.

This is useful for when you only need the generated text and don't want to parse the JSON yourself.
```

`og -h`
```
Usage: ollama_generate "model" "prompt"

ollama_generate

Generate a completion from a model as plain text.

This function is a wrapper around 'ollama_generate_json'. It takes the raw JSON output and extracts the 'response' field, returning it as a single string.

This is useful for when you only need the generated text and don't want to parse the JSON yourself.
```

`ollama_generate_stream_json -h`
```
Usage: ollama_generate_stream_json "model" "prompt"

ollama_generate_stream_json

Generate a completion from a model as a stream of JSON objects.

This function sets the global 'OLLAMA_LIB_STREAM' variable to 1 and then calls 'ollama_generate_json'.

It is the basis for 'ollama_generate_stream', which further processes the output into a continuous stream of text.
```

`ogsj -h`
```
Usage: ollama_generate_stream_json "model" "prompt"

ollama_generate_stream_json

Generate a completion from a model as a stream of JSON objects.

This function sets the global 'OLLAMA_LIB_STREAM' variable to 1 and then calls 'ollama_generate_json'.

It is the basis for 'ollama_generate_stream', which further processes the output into a continuous stream of text.
```

`ollama_generate_stream -h`
```
Usage: ollama_generate_stream "model" "prompt"

ollama_generate_stream

Generate a completion from a model as a stream of text.

This function calls 'ollama_generate_stream_json' and pipes the output to 'jq' to extract the 'response' field from each JSON object, providing a continuous stream of text.

It is ideal for displaying real-time generation in interactive scripts.
```

`ogs -h`
```
Usage: ollama_generate_stream "model" "prompt"

ollama_generate_stream

Generate a completion from a model as a stream of text.

This function calls 'ollama_generate_stream_json' and pipes the output to 'jq' to extract the 'response' field from each JSON object, providing a continuous stream of text.

It is ideal for displaying real-time generation in interactive scripts.
```

`ollama_messages -h`
```
Usage: ollama_messages

ollama_messages

Get all messages in the current session.

This function returns a JSON array of all messages that have been added to the current session via 'ollama_messages_add'.

The output of this function is suitable for use in the 'messages' field of a chat completion request.
```

`om -h`
```
Usage: ollama_messages

ollama_messages

Get all messages in the current session.

This function returns a JSON array of all messages that have been added to the current session via 'ollama_messages_add'.

The output of this function is suitable for use in the 'messages' field of a chat completion request.
```

`ollama_messages_add -h`
```
Usage: ollama_messages_add "role" "message"

ollama_messages_add

Add a message to the current session's message history.

This function appends a new message object to the 'OLLAMA_LIB_MESSAGES' array. Each message must have a 'role' (user, assistant, or system) and 'content'.

This history is then used by 'ollama_chat' and related functions to maintain a conversation with the model.
```

`oma -h`
```
Usage: ollama_messages_add "role" "message"

ollama_messages_add

Add a message to the current session's message history.

This function appends a new message object to the 'OLLAMA_LIB_MESSAGES' array. Each message must have a 'role' (user, assistant, or system) and 'content'.

This history is then used by 'ollama_chat' and related functions to maintain a conversation with the model.
```

`ollama_messages_clear -h`
```
Usage: ollama_messages_clear

ollama_messages_clear

Clear all messages from the current session.

This function resets the 'OLLAMA_LIB_MESSAGES' array, effectively deleting the entire conversation history for the current session.

This is useful for starting a new conversation without restarting the script.
```

`omc -h`
```
Usage: ollama_messages_clear

ollama_messages_clear

Clear all messages from the current session.

This function resets the 'OLLAMA_LIB_MESSAGES' array, effectively deleting the entire conversation history for the current session.

This is useful for starting a new conversation without restarting the script.
```

`ollama_messages_count -h`
```
Usage: ollama_messages_count

ollama_messages_count

Get the number of messages in the current session.

This function returns the current number of messages stored in the 'OLLAMA_LIB_MESSAGES' array.

It can be used to check if a conversation has started or to monitor the length of the conversation history.
```

`omco -h`
```
Usage: ollama_messages_count

ollama_messages_count

Get the number of messages in the current session.

This function returns the current number of messages stored in the 'OLLAMA_LIB_MESSAGES' array.

It can be used to check if a conversation has started or to monitor the length of the conversation history.
```

`ollama_tools_add -h`
```
Usage: ollama_tools_add "tool_name" "command" "json_definition"

ollama_tools_add

Register a new tool for the model to use.

This function adds a tool's name, its corresponding shell command, and its JSON definition to the session's tool registry.

The model can then request to call this tool during a chat. The JSON definition should follow the Ollama tool definition format.
```

`ota -h`
```
Usage: ollama_tools_add "tool_name" "command" "json_definition"

ollama_tools_add

Register a new tool for the model to use.

This function adds a tool's name, its corresponding shell command, and its JSON definition to the session's tool registry.

The model can then request to call this tool during a chat. The JSON definition should follow the Ollama tool definition format.
```

`ollama_tools -h`
```
Usage: ollama_tools

ollama_tools

View all registered tools.

This function lists all the tools that have been added to the current session using 'ollama_tools_add'.

It displays a tab-separated list of tool names and their corresponding commands.
```

`oto -h`
```
Usage: ollama_tools

ollama_tools

View all registered tools.

This function lists all the tools that have been added to the current session using 'ollama_tools_add'.

It displays a tab-separated list of tool names and their corresponding commands.
```

`ollama_tools_count -h`
```
Usage: ollama_tools_count

ollama_tools_count

Get the number of registered tools.

This function returns the current number of tools that have been registered in the session.

It provides a simple way to check if any tools are available for the model to use.
```

`otco -h`
```
Usage: ollama_tools_count

ollama_tools_count

Get the number of registered tools.

This function returns the current number of tools that have been registered in the session.

It provides a simple way to check if any tools are available for the model to use.
```

`ollama_tools_clear -h`
```
Usage: ollama_tools_clear

ollama_tools_clear

Remove all registered tools from the session.

This function clears the tool registry, removing all tool names, commands, and definitions.

This is useful for ensuring that a new chat session starts with a clean slate of tools.
```

`otc -h`
```
Usage: ollama_tools_clear

ollama_tools_clear

Remove all registered tools from the session.

This function clears the tool registry, removing all tool names, commands, and definitions.

This is useful for ensuring that a new chat session starts with a clean slate of tools.
```

`ollama_tools_is_call -h`
```
Usage: ollama_tools_is_call "json_response"

ollama_tools_is_call

Check if the model's response contains a tool call.

This function inspects the JSON response from the model to see if it includes a 'tool_calls' field, which indicates the model wants to use a tool.

It is essential for building agentic systems that can decide whether to execute a tool or respond with text.
```

`otic -h`
```
Usage: ollama_tools_is_call "json_response"

ollama_tools_is_call

Check if the model's response contains a tool call.

This function inspects the JSON response from the model to see if it includes a 'tool_calls' field, which indicates the model wants to use a tool.

It is essential for building agentic systems that can decide whether to execute a tool or respond with text.
```

`ollama_tools_run -h`
```
Usage: ollama_tools_run "tool_name" "arguments_json"

ollama_tools_run

Execute a registered tool with the given arguments.

This function looks up the command for the specified tool name and executes it, passing the arguments as a JSON string.

It is the core component for making the model's tool calls functional, bridging the gap between the model's request and the actual execution of the tool.
```

`otr -h`
```
Usage: ollama_tools_run "tool_name" "arguments_json"

ollama_tools_run

Execute a registered tool with the given arguments.

This function looks up the command for the specified tool name and executes it, passing the arguments as a JSON string.

It is the core component for making the model's tool calls functional, bridging the gap between the model's request and the actual execution of the tool.
```

`ollama_chat_json -h`
```
Usage: ollama_chat_json "model"

ollama_chat_json

Request a chat completion from a model, receiving JSON output.

This function sends the entire message history ('OLLAMA_LIB_MESSAGES') to the specified model and returns the model's response as a raw JSON object.

It serves as the foundation for 'ollama_chat' and 'ollama_chat_stream', which provide more user-friendly text-based outputs.
```

`ocj -h`
```
Usage: ollama_chat_json "model"

ollama_chat_json

Request a chat completion from a model, receiving JSON output.

This function sends the entire message history ('OLLAMA_LIB_MESSAGES') to the specified model and returns the model's response as a raw JSON object.

It serves as the foundation for 'ollama_chat' and 'ollama_chat_stream', which provide more user-friendly text-based outputs.
```

`ollama_chat -h`
```
Usage: ollama_chat "model"

ollama_chat

Request a chat completion from a model, receiving a plain text response.

This function is a user-friendly wrapper around 'ollama_chat_json'. It handles the JSON parsing and returns only the content of the model's message as a single string.

It is ideal for simple, non-streaming chat interactions.
```

`oc -h`
```
Usage: ollama_chat "model"

ollama_chat

Request a chat completion from a model, receiving a plain text response.

This function is a user-friendly wrapper around 'ollama_chat_json'. It handles the JSON parsing and returns only the content of the model's message as a single string.

It is ideal for simple, non-streaming chat interactions.
```

`ollama_chat_stream -h`
```
Usage: ollama_chat_stream "model"

ollama_chat_stream

Request a chat completion from a model, receiving a stream of text.

This function calls 'ollama_chat_json' with streaming enabled and processes the output to provide a continuous stream of text from the model's response.

It is perfect for interactive chat applications where you want to display the response as it is being generated.
```

`ocs -h`
```
Usage: ollama_chat_stream "model"

ollama_chat_stream

Request a chat completion from a model, receiving a stream of text.

This function calls 'ollama_chat_json' with streaming enabled and processes the output to provide a continuous stream of text from the model's response.

It is perfect for interactive chat applications where you want to display the response as it is being generated.
```

`ollama_chat_stream_json -h`
```
Usage: ollama_chat_stream_json "model"

ollama_chat_stream_json

Request a chat completion from a model, receiving a stream of JSON objects.

This function enables streaming and calls 'ollama_chat_json' to get a raw stream of JSON objects from the model.

It is the basis for the 'ollama_chat_stream' function, which turns the JSON stream into a more human-readable text stream.
```

`ocsj -h`
```
Usage: ollama_chat_stream_json "model"

ollama_chat_stream_json

Request a chat completion from a model, receiving a stream of JSON objects.

This function enables streaming and calls 'ollama_chat_json' to get a raw stream of JSON objects from the model.

It is the basis for the 'ollama_chat_stream' function, which turns the JSON stream into a more human-readable text stream.
```

`ollama_list -h`
```
Usage: ollama_list

ollama_list

List all available models in a human-readable format.

This function uses the 'ollama list' command-line tool to display a formatted table of all locally available models.

It is a convenient way to quickly see the models you have installed.
```

`ol -h`
```
Usage: ollama_list

ollama_list

List all available models in a human-readable format.

This function uses the 'ollama list' command-line tool to display a formatted table of all locally available models.

It is a convenient way to quickly see the models you have installed.
```

`ollama_list_json -h`
```
Usage: ollama_list_json

ollama_list_json

List all available models in JSON format.

This function queries the Ollama API for the list of available models and returns the raw JSON response.

This is useful for programmatic access to model information, allowing for easy parsing and manipulation with tools like 'jq'.
```

`olj -h`
```
Usage: ollama_list_json

ollama_list_json

List all available models in JSON format.

This function queries the Ollama API for the list of available models and returns the raw JSON response.

This is useful for programmatic access to model information, allowing for easy parsing and manipulation with tools like 'jq'.
```

`ollama_list_array -h`
```
Usage: ollama_list_array

ollama_list_array

List all available models as a Bash array.

This function retrieves the list of models and formats them as a space-separated string, suitable for loading directly into a Bash array.

Example:
models=($(ollama_list_array))
```

`ola -h`
```
Usage: ollama_list_array

ollama_list_array

List all available models as a Bash array.

This function retrieves the list of models and formats them as a space-separated string, suitable for loading directly into a Bash array.

Example:
models=($(ollama_list_array))
```

`ollama_model_random -h`
```
Usage: ollama_model_random

ollama_model_random

Get the name of a randomly selected model.

This function selects a model at random from the list of locally available models.

It is useful when you want to use any available model without specifying one, for example, in testing or for creative applications.
```

`omr -h`
```
Usage: ollama_model_random

ollama_model_random

Get the name of a randomly selected model.

This function selects a model at random from the list of locally available models.

It is useful when you want to use any available model without specifying one, for example, in testing or for creative applications.
```

`ollama_model_unload -h`
```
Usage: ollama_model_unload "model"

ollama_model_unload

Unload a model from memory.

This function frees up system resources by unloading a specified model from memory.

This is useful for managing memory usage, especially on systems with limited resources.
```

`omu -h`
```
Usage: ollama_model_unload "model"

ollama_model_unload

Unload a model from memory.

This function frees up system resources by unloading a specified model from memory.

This is useful for managing memory usage, especially on systems with limited resources.
```

`ollama_ps -h`
```
Usage: ollama_ps

ollama_ps

List running model processes in a human-readable format.

This function uses the 'ollama ps' command-line tool to display a table of all models currently running in memory.

It is a quick way to check which models are active and consuming resources.
```

`op -h`
```
Usage: ollama_ps

ollama_ps

List running model processes in a human-readable format.

This function uses the 'ollama ps' command-line tool to display a table of all models currently running in memory.

It is a quick way to check which models are active and consuming resources.
```

`ollama_ps_json -h`
```
Usage: ollama_ps_json

ollama_ps_json

List running model processes in JSON format.

This function queries the Ollama API to get a list of running models and returns the raw JSON response.

This is useful for programmatic monitoring and management of running models.
```

`opj -h`
```
Usage: ollama_ps_json

ollama_ps_json

List running model processes in JSON format.

This function queries the Ollama API to get a list of running models and returns the raw JSON response.

This is useful for programmatic monitoring and management of running models.
```

`ollama_show -h`
```
Usage: ollama_show "model"

ollama_show

Show detailed information about a model in a human-readable format.

This function uses the 'ollama show' command-line tool to display details about a specified model, including its parameters, template, and more.

It is useful for inspecting the configuration of a model.
```

`os -h`
```
Usage: ollama_show "model"

ollama_show

Show detailed information about a model in a human-readable format.

This function uses the 'ollama show' command-line tool to display details about a specified model, including its parameters, template, and more.

It is useful for inspecting the configuration of a model.
```

`ollama_show_json -h`
```
Usage: ollama_show_json "model"

ollama_show_json

Show detailed information about a model in JSON format.

This function queries the Ollama API to get detailed information about a specific model and returns the raw JSON response.

This is ideal for programmatic access to model details, allowing for automated configuration checks or modifications.
```

`osj -h`
```
Usage: ollama_show_json "model"

ollama_show_json

Show detailed information about a model in JSON format.

This function queries the Ollama API to get detailed information about a specific model and returns the raw JSON response.

This is ideal for programmatic access to model details, allowing for automated configuration checks or modifications.
```

`ollama_app_installed -h`
```
Usage: ollama_app_installed

ollama_app_installed

Check if the Ollama application is installed on the local system.

This function uses the 'command -v' utility to determine if the 'ollama' executable is in the system's PATH.

It is useful for pre-flight checks in scripts to ensure that required dependencies are available.
```

`oai -h`
```
Usage: ollama_app_installed

ollama_app_installed

Check if the Ollama application is installed on the local system.

This function uses the 'command -v' utility to determine if the 'ollama' executable is in the system's PATH.

It is useful for pre-flight checks in scripts to ensure that required dependencies are available.
```

`ollama_app_turbo -h`
```
Usage: ollama_app_turbo [-e] {on|off}\n\nollama_app_turbo\n\nEnable or disable Turbo Mode.\n\nTurbo Mode configures the library to use the Ollama.com API, which may provide faster responses. This requires an API key, which the function will prompt for if not already set.\n\nThe '-e' flag can be used to export the API key to the environment. Use 'off' to revert to using the local Ollama instance.
```

`oat -h`
```
Usage: ollama_app_turbo [-e] {on|off}\n\nollama_app_turbo\n\nEnable or disable Turbo Mode.\n\nTurbo Mode configures the library to use the Ollama.com API, which may provide faster responses. This requires an API key, which the function will prompt for if not already set.\n\nThe '-e' flag can be used to export the API key to the environment. Use 'off' to revert to using the local Ollama instance.
```

`ollama_app_vars -h`
```
Usage: ollama_app_vars

ollama_app_vars

Display Ollama-related environment variables.

This function prints a list of environment variables that can be used to configure the behavior of the Ollama application.

It is a helpful reference for understanding the available settings and their current values.
```

`oav -h`
```
Usage: ollama_app_vars

ollama_app_vars

Display Ollama-related environment variables.

This function prints a list of environment variables that can be used to configure the behavior of the Ollama application.

It is a helpful reference for understanding the available settings and their current values.
```

`ollama_app_version -h`
```
Usage: ollama_app_version

ollama_app_version

Get the version of the Ollama application as plain text.

This function queries the Ollama API for its version and returns just the version string.

It provides a simple way to check the installed Ollama version.
```

`oave -h`
```
Usage: ollama_app_version

ollama_app_version

Get the version of the Ollama application as plain text.

This function queries the Ollama API for its version and returns just the version string.

It provides a simple way to check the installed Ollama version.
```

`ollama_app_version_json -h`
```
Usage: ollama_app_version_json

ollama_app_version_json

Get the version of the Ollama application in JSON format.

This function queries the Ollama API and returns the raw JSON response containing the version information.

This is useful for programmatic version checking and comparison.
```

`oavj -h`
```
Usage: ollama_app_version_json

ollama_app_version_json

Get the version of the Ollama application in JSON format.

This function queries the Ollama API and returns the raw JSON response containing the version information.

This is useful for programmatic version checking and comparison.
```

`ollama_app_version_cli -h`
```
Usage: ollama_app_version_cli

ollama_app_version_cli

Get the version of the Ollama application using the command-line tool.

This function calls 'ollama --version' to get the version information directly from the command-line application.

This can be useful for verifying the CLI tool is installed and working correctly.
```

`oavc -h`
```
Usage: ollama_app_version_cli

ollama_app_version_cli

Get the version of the Ollama application using the command-line tool.

This function calls 'ollama --version' to get the version information directly from the command-line application.

This can be useful for verifying the CLI tool is installed and working correctly.
```

`ollama_thinking -h`
```
Usage: ollama_thinking [on|off|hide]

ollama_thinking

Configure the 'thinking' mode for model responses.

This function sets the 'OLLAMA_LIB_THINKING' environment variable, which controls whether the model's 'thinking' process is displayed.

Modes:
- on: Show thinking output.
- off: Hide thinking output.
- hide: Do not show thinking output, but it is still available in the JSON.
```

`ot -h`
```
Usage: ollama_thinking [on|off|hide]

ollama_thinking

Configure the 'thinking' mode for model responses.

This function sets the 'OLLAMA_LIB_THINKING' environment variable, which controls whether the model's 'thinking' process is displayed.

Modes:
- on: Show thinking output.
- off: Hide thinking output.
- hide: Do not show thinking output, but it is still available in the JSON.
```

`ollama_lib_about -h`
```
Usage: ollama_lib_about

ollama_lib_about

Display information about the Ollama Bash Lib.

This function shows details about the library, including its name, version, URL, and other relevant information.

It also lists all the available 'ollama_*' functions for easy reference.
```

`olab -h`
```
Usage: ollama_lib_about

ollama_lib_about

Display information about the Ollama Bash Lib.

This function shows details about the library, including its name, version, URL, and other relevant information.

It also lists all the available 'ollama_*' functions for easy reference.
```

`ollama_lib_version -h`
```
Usage: ollama_lib_version

ollama_lib_version

Get the version of the Ollama Bash Lib.

This function returns the current version number of the library as defined in the 'OLLAMA_LIB_VERSION' variable.

It is useful for checking the library version for compatibility or debugging purposes.
```

`olv -h`
```
Usage: ollama_lib_version

ollama_lib_version

Get the version of the Ollama Bash Lib.

This function returns the current version number of the library as defined in the 'OLLAMA_LIB_VERSION' variable.

It is useful for checking the library version for compatibility or debugging purposes.
```

`ollama_eval -h`
```
Usage: ollama_eval "task" "[model]"

ollama_eval

Generate and evaluate a command-line task.

This function takes a description of a task, sends it to a model to generate a shell command, and then prompts the user for permission to execute it.

It includes safety features like syntax checking and a sandbox mode for execution. This is a powerful tool for converting natural language into shell commands.
```

`oe -h`
```
Usage: ollama_eval "task" "[model]"

ollama_eval

Generate and evaluate a command-line task.

This function takes a description of a task, sends it to a model to generate a shell command, and then prompts the user for permission to execute it.

It includes safety features like syntax checking and a sandbox mode for execution. This is a powerful tool for converting natural language into shell commands.
```

## Testing --help for all functions (first argument)

`ollama_api_get --help`
```
Usage: ollama_api_get "/api/path"

ollama_api_get

GET request to the Ollama API.

Sends a GET request to the specified path on the Ollama API server.
This is a fundamental function used by many other functions in this library to communicate with the Ollama API, such as 'ollama_list_json' and 'ollama_api_ping'.

It relies on the '_call_curl' function to perform the actual HTTP request.
```

`oag --help`
```
Usage: ollama_api_get "/api/path"

ollama_api_get

GET request to the Ollama API.

Sends a GET request to the specified path on the Ollama API server.
This is a fundamental function used by many other functions in this library to communicate with the Ollama API, such as 'ollama_list_json' and 'ollama_api_ping'.

It relies on the '_call_curl' function to perform the actual HTTP request.
```

`ollama_api_post --help`
```
Usage: ollama_api_post "/api/path" "{json}"

ollama_api_post

POST request to the Ollama API.

Sends a POST request with a JSON payload to the specified path on the Ollama API server.
This is a core function for sending data to the Ollama API, used by functions like 'ollama_generate_json', 'ollama_chat_json', and 'ollama_show_json'.

It relies on the '_call_curl' function to perform the actual HTTP request.
```

`oap --help`
```
Usage: ollama_api_post "/api/path" "{json}"

ollama_api_post

POST request to the Ollama API.

Sends a POST request with a JSON payload to the specified path on the Ollama API server.
This is a core function for sending data to the Ollama API, used by functions like 'ollama_generate_json', 'ollama_chat_json', and 'ollama_show_json'.

It relies on the '_call_curl' function to perform the actual HTTP request.
```

`ollama_api_ping --help`
```
Usage: ollama_api_ping

ollama_api_ping

Ping the Ollama API to check for availability.

This function sends a request to the root of the Ollama API to verify that it is running and accessible.
It is useful for health checks and ensuring connectivity before attempting to use other API functions.

This function relies on 'ollama_api_get' to make the request.
```

`oapi --help`
```
Usage: ollama_api_ping

ollama_api_ping

Ping the Ollama API to check for availability.

This function sends a request to the root of the Ollama API to verify that it is running and accessible.
It is useful for health checks and ensuring connectivity before attempting to use other API functions.

This function relies on 'ollama_api_get' to make the request.
```

`ollama_generate_json --help`
```
Usage: ollama_generate_json "model" "prompt"

ollama_generate_json

Generate a completion from a model as JSON.

This function sends a prompt to a specified model and returns the model's response as a raw JSON object. If streaming is enabled via the global 'OLLAMA_LIB_STREAM' variable, it will return a stream of JSON objects.

This is a foundational function for 'ollama_generate' and 'ollama_generate_stream', which process this JSON output into plain text.
```

`ogj --help`
```
Usage: ollama_generate_json "model" "prompt"

ollama_generate_json

Generate a completion from a model as JSON.

This function sends a prompt to a specified model and returns the model's response as a raw JSON object. If streaming is enabled via the global 'OLLAMA_LIB_STREAM' variable, it will return a stream of JSON objects.

This is a foundational function for 'ollama_generate' and 'ollama_generate_stream', which process this JSON output into plain text.
```

`ollama_generate --help`
```
Usage: ollama_generate "model" "prompt"

ollama_generate

Generate a completion from a model as plain text.

This function is a wrapper around 'ollama_generate_json'. It takes the raw JSON output and extracts the 'response' field, returning it as a single string.

This is useful for when you only need the generated text and don't want to parse the JSON yourself.
```

`og --help`
```
Usage: ollama_generate "model" "prompt"

ollama_generate

Generate a completion from a model as plain text.

This function is a wrapper around 'ollama_generate_json'. It takes the raw JSON output and extracts the 'response' field, returning it as a single string.

This is useful for when you only need the generated text and don't want to parse the JSON yourself.
```

`ollama_generate_stream_json --help`
```
Usage: ollama_generate_stream_json "model" "prompt"

ollama_generate_stream_json

Generate a completion from a model as a stream of JSON objects.

This function sets the global 'OLLAMA_LIB_STREAM' variable to 1 and then calls 'ollama_generate_json'.

It is the basis for 'ollama_generate_stream', which further processes the output into a continuous stream of text.
```

`ogsj --help`
```
Usage: ollama_generate_stream_json "model" "prompt"

ollama_generate_stream_json

Generate a completion from a model as a stream of JSON objects.

This function sets the global 'OLLAMA_LIB_STREAM' variable to 1 and then calls 'ollama_generate_json'.

It is the basis for 'ollama_generate_stream', which further processes the output into a continuous stream of text.
```

`ollama_generate_stream --help`
```
Usage: ollama_generate_stream "model" "prompt"

ollama_generate_stream

Generate a completion from a model as a stream of text.

This function calls 'ollama_generate_stream_json' and pipes the output to 'jq' to extract the 'response' field from each JSON object, providing a continuous stream of text.

It is ideal for displaying real-time generation in interactive scripts.
```

`ogs --help`
```
Usage: ollama_generate_stream "model" "prompt"

ollama_generate_stream

Generate a completion from a model as a stream of text.

This function calls 'ollama_generate_stream_json' and pipes the output to 'jq' to extract the 'response' field from each JSON object, providing a continuous stream of text.

It is ideal for displaying real-time generation in interactive scripts.
```

`ollama_messages --help`
```
Usage: ollama_messages

ollama_messages

Get all messages in the current session.

This function returns a JSON array of all messages that have been added to the current session via 'ollama_messages_add'.

The output of this function is suitable for use in the 'messages' field of a chat completion request.
```

`om --help`
```
Usage: ollama_messages

ollama_messages

Get all messages in the current session.

This function returns a JSON array of all messages that have been added to the current session via 'ollama_messages_add'.

The output of this function is suitable for use in the 'messages' field of a chat completion request.
```

`ollama_messages_add --help`
```
Usage: ollama_messages_add "role" "message"

ollama_messages_add

Add a message to the current session's message history.

This function appends a new message object to the 'OLLAMA_LIB_MESSAGES' array. Each message must have a 'role' (user, assistant, or system) and 'content'.

This history is then used by 'ollama_chat' and related functions to maintain a conversation with the model.
```

`oma --help`
```
Usage: ollama_messages_add "role" "message"

ollama_messages_add

Add a message to the current session's message history.

This function appends a new message object to the 'OLLAMA_LIB_MESSAGES' array. Each message must have a 'role' (user, assistant, or system) and 'content'.

This history is then used by 'ollama_chat' and related functions to maintain a conversation with the model.
```

`ollama_messages_clear --help`
```
Usage: ollama_messages_clear

ollama_messages_clear

Clear all messages from the current session.

This function resets the 'OLLAMA_LIB_MESSAGES' array, effectively deleting the entire conversation history for the current session.

This is useful for starting a new conversation without restarting the script.
```

`omc --help`
```
Usage: ollama_messages_clear

ollama_messages_clear

Clear all messages from the current session.

This function resets the 'OLLAMA_LIB_MESSAGES' array, effectively deleting the entire conversation history for the current session.

This is useful for starting a new conversation without restarting the script.
```

`ollama_messages_count --help`
```
Usage: ollama_messages_count

ollama_messages_count

Get the number of messages in the current session.

This function returns the current number of messages stored in the 'OLLAMA_LIB_MESSAGES' array.

It can be used to check if a conversation has started or to monitor the length of the conversation history.
```

`omco --help`
```
Usage: ollama_messages_count

ollama_messages_count

Get the number of messages in the current session.

This function returns the current number of messages stored in the 'OLLAMA_LIB_MESSAGES' array.

It can be used to check if a conversation has started or to monitor the length of the conversation history.
```

`ollama_tools_add --help`
```
Usage: ollama_tools_add "tool_name" "command" "json_definition"

ollama_tools_add

Register a new tool for the model to use.

This function adds a tool's name, its corresponding shell command, and its JSON definition to the session's tool registry.

The model can then request to call this tool during a chat. The JSON definition should follow the Ollama tool definition format.
```

`ota --help`
```
Usage: ollama_tools_add "tool_name" "command" "json_definition"

ollama_tools_add

Register a new tool for the model to use.

This function adds a tool's name, its corresponding shell command, and its JSON definition to the session's tool registry.

The model can then request to call this tool during a chat. The JSON definition should follow the Ollama tool definition format.
```

`ollama_tools --help`
```
Usage: ollama_tools

ollama_tools

View all registered tools.

This function lists all the tools that have been added to the current session using 'ollama_tools_add'.

It displays a tab-separated list of tool names and their corresponding commands.
```

`oto --help`
```
Usage: ollama_tools

ollama_tools

View all registered tools.

This function lists all the tools that have been added to the current session using 'ollama_tools_add'.

It displays a tab-separated list of tool names and their corresponding commands.
```

`ollama_tools_count --help`
```
Usage: ollama_tools_count

ollama_tools_count

Get the number of registered tools.

This function returns the current number of tools that have been registered in the session.

It provides a simple way to check if any tools are available for the model to use.
```

`otco --help`
```
Usage: ollama_tools_count

ollama_tools_count

Get the number of registered tools.

This function returns the current number of tools that have been registered in the session.

It provides a simple way to check if any tools are available for the model to use.
```

`ollama_tools_clear --help`
```
Usage: ollama_tools_clear

ollama_tools_clear

Remove all registered tools from the session.

This function clears the tool registry, removing all tool names, commands, and definitions.

This is useful for ensuring that a new chat session starts with a clean slate of tools.
```

`otc --help`
```
Usage: ollama_tools_clear

ollama_tools_clear

Remove all registered tools from the session.

This function clears the tool registry, removing all tool names, commands, and definitions.

This is useful for ensuring that a new chat session starts with a clean slate of tools.
```

`ollama_tools_is_call --help`
```
Usage: ollama_tools_is_call "json_response"

ollama_tools_is_call

Check if the model's response contains a tool call.

This function inspects the JSON response from the model to see if it includes a 'tool_calls' field, which indicates the model wants to use a tool.

It is essential for building agentic systems that can decide whether to execute a tool or respond with text.
```

`otic --help`
```
Usage: ollama_tools_is_call "json_response"

ollama_tools_is_call

Check if the model's response contains a tool call.

This function inspects the JSON response from the model to see if it includes a 'tool_calls' field, which indicates the model wants to use a tool.

It is essential for building agentic systems that can decide whether to execute a tool or respond with text.
```

`ollama_tools_run --help`
```
Usage: ollama_tools_run "tool_name" "arguments_json"

ollama_tools_run

Execute a registered tool with the given arguments.

This function looks up the command for the specified tool name and executes it, passing the arguments as a JSON string.

It is the core component for making the model's tool calls functional, bridging the gap between the model's request and the actual execution of the tool.
```

`otr --help`
```
Usage: ollama_tools_run "tool_name" "arguments_json"

ollama_tools_run

Execute a registered tool with the given arguments.

This function looks up the command for the specified tool name and executes it, passing the arguments as a JSON string.

It is the core component for making the model's tool calls functional, bridging the gap between the model's request and the actual execution of the tool.
```

`ollama_chat_json --help`
```
Usage: ollama_chat_json "model"

ollama_chat_json

Request a chat completion from a model, receiving JSON output.

This function sends the entire message history ('OLLAMA_LIB_MESSAGES') to the specified model and returns the model's response as a raw JSON object.

It serves as the foundation for 'ollama_chat' and 'ollama_chat_stream', which provide more user-friendly text-based outputs.
```

`ocj --help`
```
Usage: ollama_chat_json "model"

ollama_chat_json

Request a chat completion from a model, receiving JSON output.

This function sends the entire message history ('OLLAMA_LIB_MESSAGES') to the specified model and returns the model's response as a raw JSON object.

It serves as the foundation for 'ollama_chat' and 'ollama_chat_stream', which provide more user-friendly text-based outputs.
```

`ollama_chat --help`
```
Usage: ollama_chat "model"

ollama_chat

Request a chat completion from a model, receiving a plain text response.

This function is a user-friendly wrapper around 'ollama_chat_json'. It handles the JSON parsing and returns only the content of the model's message as a single string.

It is ideal for simple, non-streaming chat interactions.
```

`oc --help`
```
Usage: ollama_chat "model"

ollama_chat

Request a chat completion from a model, receiving a plain text response.

This function is a user-friendly wrapper around 'ollama_chat_json'. It handles the JSON parsing and returns only the content of the model's message as a single string.

It is ideal for simple, non-streaming chat interactions.
```

`ollama_chat_stream --help`
```
Usage: ollama_chat_stream "model"

ollama_chat_stream

Request a chat completion from a model, receiving a stream of text.

This function calls 'ollama_chat_json' with streaming enabled and processes the output to provide a continuous stream of text from the model's response.

It is perfect for interactive chat applications where you want to display the response as it is being generated.
```

`ocs --help`
```
Usage: ollama_chat_stream "model"

ollama_chat_stream

Request a chat completion from a model, receiving a stream of text.

This function calls 'ollama_chat_json' with streaming enabled and processes the output to provide a continuous stream of text from the model's response.

It is perfect for interactive chat applications where you want to display the response as it is being generated.
```

`ollama_chat_stream_json --help`
```
Usage: ollama_chat_stream_json "model"

ollama_chat_stream_json

Request a chat completion from a model, receiving a stream of JSON objects.

This function enables streaming and calls 'ollama_chat_json' to get a raw stream of JSON objects from the model.

It is the basis for the 'ollama_chat_stream' function, which turns the JSON stream into a more human-readable text stream.
```

`ocsj --help`
```
Usage: ollama_chat_stream_json "model"

ollama_chat_stream_json

Request a chat completion from a model, receiving a stream of JSON objects.

This function enables streaming and calls 'ollama_chat_json' to get a raw stream of JSON objects from the model.

It is the basis for the 'ollama_chat_stream' function, which turns the JSON stream into a more human-readable text stream.
```

`ollama_list --help`
```
Usage: ollama_list

ollama_list

List all available models in a human-readable format.

This function uses the 'ollama list' command-line tool to display a formatted table of all locally available models.

It is a convenient way to quickly see the models you have installed.
```

`ol --help`
```
Usage: ollama_list

ollama_list

List all available models in a human-readable format.

This function uses the 'ollama list' command-line tool to display a formatted table of all locally available models.

It is a convenient way to quickly see the models you have installed.
```

`ollama_list_json --help`
```
Usage: ollama_list_json

ollama_list_json

List all available models in JSON format.

This function queries the Ollama API for the list of available models and returns the raw JSON response.

This is useful for programmatic access to model information, allowing for easy parsing and manipulation with tools like 'jq'.
```

`olj --help`
```
Usage: ollama_list_json

ollama_list_json

List all available models in JSON format.

This function queries the Ollama API for the list of available models and returns the raw JSON response.

This is useful for programmatic access to model information, allowing for easy parsing and manipulation with tools like 'jq'.
```

`ollama_list_array --help`
```
Usage: ollama_list_array

ollama_list_array

List all available models as a Bash array.

This function retrieves the list of models and formats them as a space-separated string, suitable for loading directly into a Bash array.

Example:
models=($(ollama_list_array))
```

`ola --help`
```
Usage: ollama_list_array

ollama_list_array

List all available models as a Bash array.

This function retrieves the list of models and formats them as a space-separated string, suitable for loading directly into a Bash array.

Example:
models=($(ollama_list_array))
```

`ollama_model_random --help`
```
Usage: ollama_model_random

ollama_model_random

Get the name of a randomly selected model.

This function selects a model at random from the list of locally available models.

It is useful when you want to use any available model without specifying one, for example, in testing or for creative applications.
```

`omr --help`
```
Usage: ollama_model_random

ollama_model_random

Get the name of a randomly selected model.

This function selects a model at random from the list of locally available models.

It is useful when you want to use any available model without specifying one, for example, in testing or for creative applications.
```

`ollama_model_unload --help`
```
Usage: ollama_model_unload "model"

ollama_model_unload

Unload a model from memory.

This function frees up system resources by unloading a specified model from memory.

This is useful for managing memory usage, especially on systems with limited resources.
```

`omu --help`
```
Usage: ollama_model_unload "model"

ollama_model_unload

Unload a model from memory.

This function frees up system resources by unloading a specified model from memory.

This is useful for managing memory usage, especially on systems with limited resources.
```

`ollama_ps --help`
```
Usage: ollama_ps

ollama_ps

List running model processes in a human-readable format.

This function uses the 'ollama ps' command-line tool to display a table of all models currently running in memory.

It is a quick way to check which models are active and consuming resources.
```

`op --help`
```
Usage: ollama_ps

ollama_ps

List running model processes in a human-readable format.

This function uses the 'ollama ps' command-line tool to display a table of all models currently running in memory.

It is a quick way to check which models are active and consuming resources.
```

`ollama_ps_json --help`
```
Usage: ollama_ps_json

ollama_ps_json

List running model processes in JSON format.

This function queries the Ollama API to get a list of running models and returns the raw JSON response.

This is useful for programmatic monitoring and management of running models.
```

`opj --help`
```
Usage: ollama_ps_json

ollama_ps_json

List running model processes in JSON format.

This function queries the Ollama API to get a list of running models and returns the raw JSON response.

This is useful for programmatic monitoring and management of running models.
```

`ollama_show --help`
```
Usage: ollama_show "model"

ollama_show

Show detailed information about a model in a human-readable format.

This function uses the 'ollama show' command-line tool to display details about a specified model, including its parameters, template, and more.

It is useful for inspecting the configuration of a model.
```

`os --help`
```
Usage: ollama_show "model"

ollama_show

Show detailed information about a model in a human-readable format.

This function uses the 'ollama show' command-line tool to display details about a specified model, including its parameters, template, and more.

It is useful for inspecting the configuration of a model.
```

`ollama_show_json --help`
```
Usage: ollama_show_json "model"

ollama_show_json

Show detailed information about a model in JSON format.

This function queries the Ollama API to get detailed information about a specific model and returns the raw JSON response.

This is ideal for programmatic access to model details, allowing for automated configuration checks or modifications.
```

`osj --help`
```
Usage: ollama_show_json "model"

ollama_show_json

Show detailed information about a model in JSON format.

This function queries the Ollama API to get detailed information about a specific model and returns the raw JSON response.

This is ideal for programmatic access to model details, allowing for automated configuration checks or modifications.
```

`ollama_app_installed --help`
```
Usage: ollama_app_installed

ollama_app_installed

Check if the Ollama application is installed on the local system.

This function uses the 'command -v' utility to determine if the 'ollama' executable is in the system's PATH.

It is useful for pre-flight checks in scripts to ensure that required dependencies are available.
```

`oai --help`
```
Usage: ollama_app_installed

ollama_app_installed

Check if the Ollama application is installed on the local system.

This function uses the 'command -v' utility to determine if the 'ollama' executable is in the system's PATH.

It is useful for pre-flight checks in scripts to ensure that required dependencies are available.
```

`ollama_app_turbo --help`
```
Usage: ollama_app_turbo [-e] {on|off}\n\nollama_app_turbo\n\nEnable or disable Turbo Mode.\n\nTurbo Mode configures the library to use the Ollama.com API, which may provide faster responses. This requires an API key, which the function will prompt for if not already set.\n\nThe '-e' flag can be used to export the API key to the environment. Use 'off' to revert to using the local Ollama instance.
```

`oat --help`
```
Usage: ollama_app_turbo [-e] {on|off}\n\nollama_app_turbo\n\nEnable or disable Turbo Mode.\n\nTurbo Mode configures the library to use the Ollama.com API, which may provide faster responses. This requires an API key, which the function will prompt for if not already set.\n\nThe '-e' flag can be used to export the API key to the environment. Use 'off' to revert to using the local Ollama instance.
```

`ollama_app_vars --help`
```
Usage: ollama_app_vars

ollama_app_vars

Display Ollama-related environment variables.

This function prints a list of environment variables that can be used to configure the behavior of the Ollama application.

It is a helpful reference for understanding the available settings and their current values.
```

`oav --help`
```
Usage: ollama_app_vars

ollama_app_vars

Display Ollama-related environment variables.

This function prints a list of environment variables that can be used to configure the behavior of the Ollama application.

It is a helpful reference for understanding the available settings and their current values.
```

`ollama_app_version --help`
```
Usage: ollama_app_version

ollama_app_version

Get the version of the Ollama application as plain text.

This function queries the Ollama API for its version and returns just the version string.

It provides a simple way to check the installed Ollama version.
```

`oave --help`
```
Usage: ollama_app_version

ollama_app_version

Get the version of the Ollama application as plain text.

This function queries the Ollama API for its version and returns just the version string.

It provides a simple way to check the installed Ollama version.
```

`ollama_app_version_json --help`
```
Usage: ollama_app_version_json

ollama_app_version_json

Get the version of the Ollama application in JSON format.

This function queries the Ollama API and returns the raw JSON response containing the version information.

This is useful for programmatic version checking and comparison.
```

`oavj --help`
```
Usage: ollama_app_version_json

ollama_app_version_json

Get the version of the Ollama application in JSON format.

This function queries the Ollama API and returns the raw JSON response containing the version information.

This is useful for programmatic version checking and comparison.
```

`ollama_app_version_cli --help`
```
Usage: ollama_app_version_cli

ollama_app_version_cli

Get the version of the Ollama application using the command-line tool.

This function calls 'ollama --version' to get the version information directly from the command-line application.

This can be useful for verifying the CLI tool is installed and working correctly.
```

`oavc --help`
```
Usage: ollama_app_version_cli

ollama_app_version_cli

Get the version of the Ollama application using the command-line tool.

This function calls 'ollama --version' to get the version information directly from the command-line application.

This can be useful for verifying the CLI tool is installed and working correctly.
```

`ollama_thinking --help`
```
Usage: ollama_thinking [on|off|hide]

ollama_thinking

Configure the 'thinking' mode for model responses.

This function sets the 'OLLAMA_LIB_THINKING' environment variable, which controls whether the model's 'thinking' process is displayed.

Modes:
- on: Show thinking output.
- off: Hide thinking output.
- hide: Do not show thinking output, but it is still available in the JSON.
```

`ot --help`
```
Usage: ollama_thinking [on|off|hide]

ollama_thinking

Configure the 'thinking' mode for model responses.

This function sets the 'OLLAMA_LIB_THINKING' environment variable, which controls whether the model's 'thinking' process is displayed.

Modes:
- on: Show thinking output.
- off: Hide thinking output.
- hide: Do not show thinking output, but it is still available in the JSON.
```

`ollama_lib_about --help`
```
Usage: ollama_lib_about

ollama_lib_about

Display information about the Ollama Bash Lib.

This function shows details about the library, including its name, version, URL, and other relevant information.

It also lists all the available 'ollama_*' functions for easy reference.
```

`olab --help`
```
Usage: ollama_lib_about

ollama_lib_about

Display information about the Ollama Bash Lib.

This function shows details about the library, including its name, version, URL, and other relevant information.

It also lists all the available 'ollama_*' functions for easy reference.
```

`ollama_lib_version --help`
```
Usage: ollama_lib_version

ollama_lib_version

Get the version of the Ollama Bash Lib.

This function returns the current version number of the library as defined in the 'OLLAMA_LIB_VERSION' variable.

It is useful for checking the library version for compatibility or debugging purposes.
```

`olv --help`
```
Usage: ollama_lib_version

ollama_lib_version

Get the version of the Ollama Bash Lib.

This function returns the current version number of the library as defined in the 'OLLAMA_LIB_VERSION' variable.

It is useful for checking the library version for compatibility or debugging purposes.
```

`ollama_eval --help`
```
Usage: ollama_eval "task" "[model]"

ollama_eval

Generate and evaluate a command-line task.

This function takes a description of a task, sends it to a model to generate a shell command, and then prompts the user for permission to execute it.

It includes safety features like syntax checking and a sandbox mode for execution. This is a powerful tool for converting natural language into shell commands.
```

`oe --help`
```
Usage: ollama_eval "task" "[model]"

ollama_eval

Generate and evaluate a command-line task.

This function takes a description of a task, sends it to a model to generate a shell command, and then prompts the user for permission to execute it.

It includes safety features like syntax checking and a sandbox mode for execution. This is a powerful tool for converting natural language into shell commands.
```
