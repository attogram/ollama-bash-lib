# help via -h and --help

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7
## Testing -h for all functions (first argument)

`ollama_api_get -h`
```
Usage: ollama_api_get [-P <path>] [-h] [-v]

GET request to the Ollama API.

  -P <path>   API path to send the GET request to (optional).
  -h          Show this help and exit.
  -v          Show version information and exit.

This is a fundamental function used by many other functions in this library to communicate with the Ollama API, such as 'ollama_list_json' and 'ollama_api_ping'.
It relies on the '_call_curl' function to perform the actual HTTP request.
```

`oag -h`
```
Usage: ollama_api_get [-P <path>] [-h] [-v]

GET request to the Ollama API.

  -P <path>   API path to send the GET request to (optional).
  -h          Show this help and exit.
  -v          Show version information and exit.

This is a fundamental function used by many other functions in this library to communicate with the Ollama API, such as 'ollama_list_json' and 'ollama_api_ping'.
It relies on the '_call_curl' function to perform the actual HTTP request.
```

`ollama_api_post -h`
```
Usage: ollama_api_post -P <path> -d <data> [-h] [-v]

POST request to the Ollama API.

  -P <path>   API path to send the POST request to.
  -d <data>   JSON content to send in the request body.
  -h          Show this help and exit.
  -v          Show version information and exit.

This is a core function for sending data to the Ollama API, used by functions like 'ollama_generate_json', 'ollama_chat_json', and 'ollama_show_json'.
It relies on the '_call_curl' function to perform the actual HTTP request.
```

`oap -h`
```
Usage: ollama_api_post -P <path> -d <data> [-h] [-v]

POST request to the Ollama API.

  -P <path>   API path to send the POST request to.
  -d <data>   JSON content to send in the request body.
  -h          Show this help and exit.
  -v          Show version information and exit.

This is a core function for sending data to the Ollama API, used by functions like 'ollama_generate_json', 'ollama_chat_json', and 'ollama_show_json'.
It relies on the '_call_curl' function to perform the actual HTTP request.
```

`ollama_api_ping -h`
```
Usage: ollama_api_ping [-h] [-v]

Ping the Ollama API to check for availability.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends a request to the root of the Ollama API to verify that it is running and accessible.
It is useful for health checks and ensuring connectivity before attempting to use other API functions.
This function relies on 'ollama_api_get' to make the request.
```

`oapi -h`
```
Usage: ollama_api_ping [-h] [-v]

Ping the Ollama API to check for availability.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends a request to the root of the Ollama API to verify that it is running and accessible.
It is useful for health checks and ensuring connectivity before attempting to use other API functions.
This function relies on 'ollama_api_get' to make the request.
```

`ollama_generate_json -h`
```
Usage: ollama_generate_json [-m <model>] [-p <prompt>] [<model>] [<prompt>]

Generate a completion from a model as JSON.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends a prompt to a specified model and returns the model's response as a raw JSON object.
If streaming is enabled via the global 'OLLAMA_LIB_STREAM' variable, it will return a stream of JSON objects.
This is a foundational function for 'ollama_generate' and 'ollama_generate_stream', which process this JSON output into plain text.
```

`ogj -h`
```
Usage: ollama_generate_json [-m <model>] [-p <prompt>] [<model>] [<prompt>]

Generate a completion from a model as JSON.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends a prompt to a specified model and returns the model's response as a raw JSON object.
If streaming is enabled via the global 'OLLAMA_LIB_STREAM' variable, it will return a stream of JSON objects.
This is a foundational function for 'ollama_generate' and 'ollama_generate_stream', which process this JSON output into plain text.
```

`ollama_generate -h`
```
Usage: ollama_generate [-m <model>] [-p <prompt>] [<model>] [<prompt>]

Generate a completion from a model as plain text.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function is a wrapper around 'ollama_generate_json'. It takes the raw JSON output and extracts the 'response' field, returning it as a single string.
This is useful for when you only need the generated text and don't want to parse the JSON yourself.
```

`og -h`
```
Usage: ollama_generate [-m <model>] [-p <prompt>] [<model>] [<prompt>]

Generate a completion from a model as plain text.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function is a wrapper around 'ollama_generate_json'. It takes the raw JSON output and extracts the 'response' field, returning it as a single string.
This is useful for when you only need the generated text and don't want to parse the JSON yourself.
```

`ollama_generate_stream_json -h`
```
Usage: ollama_generate_stream_json [-m <model>] [-p <prompt>] [<model>] [<prompt>]

Generate a completion from a model as a stream of JSON objects.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sets the global 'OLLAMA_LIB_STREAM' variable to 1 and then calls 'ollama_generate_json'.
It is the basis for 'ollama_generate_stream', which further processes the output into a continuous stream of text.
```

`ogsj -h`
```
Usage: ollama_generate_stream_json [-m <model>] [-p <prompt>] [<model>] [<prompt>]

Generate a completion from a model as a stream of JSON objects.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sets the global 'OLLAMA_LIB_STREAM' variable to 1 and then calls 'ollama_generate_json'.
It is the basis for 'ollama_generate_stream', which further processes the output into a continuous stream of text.
```

`ollama_generate_stream -h`
```
Usage: ollama_generate_stream [-m <model>] [-p <prompt>] [<model>] [<prompt>]

Generate a completion from a model as a stream of text.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls 'ollama_generate_stream_json' and pipes the output to 'jq' to extract the 'response' field from each JSON object, providing a continuous stream of text.
It is ideal for displaying real-time generation in interactive scripts.
```

`ogs -h`
```
Usage: ollama_generate_stream [-m <model>] [-p <prompt>] [<model>] [<prompt>]

Generate a completion from a model as a stream of text.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls 'ollama_generate_stream_json' and pipes the output to 'jq' to extract the 'response' field from each JSON object, providing a continuous stream of text.
It is ideal for displaying real-time generation in interactive scripts.
```

`ollama_messages -h`
```
Usage: ollama_messages [-h] [-v]

Get all messages in the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns a JSON array of all messages that have been added to the current session via 'ollama_messages_add'.
The output of this function is suitable for use in the 'messages' field of a chat completion request.
```

`om -h`
```
Usage: ollama_messages [-h] [-v]

Get all messages in the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns a JSON array of all messages that have been added to the current session via 'ollama_messages_add'.
The output of this function is suitable for use in the 'messages' field of a chat completion request.
```

`ollama_messages_add -h`
```
Usage: ollama_messages_add -r <role> -c <content> [-h] [-v]

Add a message to the current session's message history.

  -r <role>   The role of the message sender (user, assistant, system, tool).
  -c <content> The content of the message.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function appends a new message object to the 'OLLAMA_LIB_MESSAGES' array.
This history is then used by 'ollama_chat' and related functions to maintain a conversation with the model.
```

`oma -h`
```
Usage: ollama_messages_add -r <role> -c <content> [-h] [-v]

Add a message to the current session's message history.

  -r <role>   The role of the message sender (user, assistant, system, tool).
  -c <content> The content of the message.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function appends a new message object to the 'OLLAMA_LIB_MESSAGES' array.
This history is then used by 'ollama_chat' and related functions to maintain a conversation with the model.
```

`ollama_messages_clear -h`
```
Usage: ollama_messages_clear [-h] [-v]

Clear all messages from the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function resets the 'OLLAMA_LIB_MESSAGES' array, effectively deleting the entire conversation history for the current session.
This is useful for starting a new conversation without restarting the script.
```

`omclear -h`
```
Usage: ollama_messages_clear [-h] [-v]

Clear all messages from the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function resets the 'OLLAMA_LIB_MESSAGES' array, effectively deleting the entire conversation history for the current session.
This is useful for starting a new conversation without restarting the script.
```

`ollama_messages_count -h`
```
Usage: ollama_messages_count [-h] [-v]

Get the number of messages in the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current number of messages stored in the 'OLLAMA_LIB_MESSAGES' array.
It can be used to check if a conversation has started or to monitor the length of the conversation history.
```

`omco -h`
```
Usage: ollama_messages_count [-h] [-v]

Get the number of messages in the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current number of messages stored in the 'OLLAMA_LIB_MESSAGES' array.
It can be used to check if a conversation has started or to monitor the length of the conversation history.
```

`ollama_tools_add -h`
```
Usage: ollama_tools_add -n <name> -c <command> -j <json> [-h] [-v]

Register a new tool for the model to use.

  -n <name>    The name of the tool.
  -c <command> The command to run for the tool.
  -j <json>    The JSON definition of the tool.
  -h           Show this help and exit.
  -v           Show version information and exit.

The model can then request to call this tool during a chat. The JSON definition should follow the Ollama tool definition format.
```

`ota -h`
```
Usage: ollama_tools_add -n <name> -c <command> -j <json> [-h] [-v]

Register a new tool for the model to use.

  -n <name>    The name of the tool.
  -c <command> The command to run for the tool.
  -j <json>    The JSON definition of the tool.
  -h           Show this help and exit.
  -v           Show version information and exit.

The model can then request to call this tool during a chat. The JSON definition should follow the Ollama tool definition format.
```

`ollama_tools -h`
```
Usage: ollama_tools [-h] [-v]

View all registered tools.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function lists all the tools that have been added to the current session using 'ollama_tools_add'.
It displays a tab-separated list of tool names and their corresponding commands.
```

`oto -h`
```
Usage: ollama_tools [-h] [-v]

View all registered tools.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function lists all the tools that have been added to the current session using 'ollama_tools_add'.
It displays a tab-separated list of tool names and their corresponding commands.
```

`ollama_tools_count -h`
```
Usage: ollama_tools_count [-h] [-v]

Get the number of registered tools.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current number of tools that have been registered in the session.
It provides a simple way to check if any tools are available for the model to use.
```

`otco -h`
```
Usage: ollama_tools_count [-h] [-v]

Get the number of registered tools.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current number of tools that have been registered in the session.
It provides a simple way to check if any tools are available for the model to use.
```

`ollama_tools_clear -h`
```
Usage: ollama_tools_clear [-h] [-v]

Remove all registered tools from the session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function clears the tool registry, removing all tool names, commands, and definitions.
This is useful for ensuring that a new chat session starts with a clean slate of tools.
```

`otc -h`
```
Usage: ollama_tools_clear [-h] [-v]

Remove all registered tools from the session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function clears the tool registry, removing all tool names, commands, and definitions.
This is useful for ensuring that a new chat session starts with a clean slate of tools.
```

`ollama_tools_is_call -h`
```
Usage: ollama_tools_is_call -j <json> [-h] [-v]

Check if the model's response contains a tool call.

  -j <json>   The JSON response from the model.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function inspects the JSON response from the model to see if it includes a 'tool_calls' field, which indicates the model wants to use a tool.
It is essential for building agentic systems that can decide whether to execute a tool or respond with text.
```

`otic -h`
```
Usage: ollama_tools_is_call -j <json> [-h] [-v]

Check if the model's response contains a tool call.

  -j <json>   The JSON response from the model.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function inspects the JSON response from the model to see if it includes a 'tool_calls' field, which indicates the model wants to use a tool.
It is essential for building agentic systems that can decide whether to execute a tool or respond with text.
```

`ollama_tools_run -h`
```
Usage: ollama_tools_run -n <name> -a <args> [-h] [-v]

Execute a registered tool with the given arguments.

  -n <name>   The name of the tool to run.
  -a <args>   The JSON string of arguments for the tool.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function looks up the command for the specified tool name and executes it, passing the arguments as a JSON string.
It is the core component for making the model's tool calls functional, bridging the gap between the model's request and the actual execution of the tool.
```

`otr -h`
```
Usage: ollama_tools_run -n <name> -a <args> [-h] [-v]

Execute a registered tool with the given arguments.

  -n <name>   The name of the tool to run.
  -a <args>   The JSON string of arguments for the tool.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function looks up the command for the specified tool name and executes it, passing the arguments as a JSON string.
It is the core component for making the model's tool calls functional, bridging the gap between the model's request and the actual execution of the tool.
```

`ollama_chat -h`
```
Usage: ollama_chat [-m <model>] [<model>]

Request a chat completion from a model, receiving a plain text response.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function is a user-friendly wrapper around 'ollama_chat_json'. It handles the JSON parsing and returns only the content of the model's message as a single string.
It is ideal for simple, non-streaming chat interactions.
```

`oc -h`
```
Usage: ollama_chat [-m <model>] [<model>]

Request a chat completion from a model, receiving a plain text response.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function is a user-friendly wrapper around 'ollama_chat_json'. It handles the JSON parsing and returns only the content of the model's message as a single string.
It is ideal for simple, non-streaming chat interactions.
```

`ollama_chat_stream -h`
```
Usage: ollama_chat_stream [-m <model>] [<model>]

Request a chat completion from a model, receiving a stream of text.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls 'ollama_chat' with streaming enabled and processes the output to provide a continuous stream of text from the model's response.
It is perfect for interactive chat applications where you want to display the response as it is being generated.
The assistant's response is NOT added to the message history.
```

`ocs -h`
```
Usage: ollama_chat_stream [-m <model>] [<model>]

Request a chat completion from a model, receiving a stream of text.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls 'ollama_chat' with streaming enabled and processes the output to provide a continuous stream of text from the model's response.
It is perfect for interactive chat applications where you want to display the response as it is being generated.
The assistant's response is NOT added to the message history.
```

`ollama_chat_stream_json -h`
```
Usage: ollama_chat_stream_json [-m <model>] [<model>]

Request a chat completion from a model, receiving a stream of JSON objects.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function enables streaming and calls 'ollama_chat' to get a raw stream of JSON objects from the model.
It is the basis for the 'ollama_chat_stream' function, which turns the JSON stream into a more human-readable text stream.
The assistant's response is NOT added to the message history.
```

`ocsj -h`
```
Usage: ollama_chat_stream_json [-m <model>] [<model>]

Request a chat completion from a model, receiving a stream of JSON objects.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function enables streaming and calls 'ollama_chat' to get a raw stream of JSON objects from the model.
It is the basis for the 'ollama_chat_stream' function, which turns the JSON stream into a more human-readable text stream.
The assistant's response is NOT added to the message history.
```

`ollama_list -h`
```
Usage: ollama_list [-h] [-v]

List all available models in a human-readable format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the 'ollama list' command-line tool to display a formatted table of all locally available models.
It is a convenient way to quickly see the models you have installed.
```

`ol -h`
```
Usage: ollama_list [-h] [-v]

List all available models in a human-readable format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the 'ollama list' command-line tool to display a formatted table of all locally available models.
It is a convenient way to quickly see the models you have installed.
```

`ollama_list_json -h`
```
Usage: ollama_list_json [-h] [-v]

List all available models in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API for the list of available models and returns the raw JSON response.
This is useful for programmatic access to model information, allowing for easy parsing and manipulation with tools like 'jq'.
```

`olj -h`
```
Usage: ollama_list_json [-h] [-v]

List all available models in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API for the list of available models and returns the raw JSON response.
This is useful for programmatic access to model information, allowing for easy parsing and manipulation with tools like 'jq'.
```

`ollama_list_array -h`
```
Usage: ollama_list_array [-h] [-v]

List all available models as a Bash array.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function retrieves the list of models and formats them as a space-separated string, suitable for loading directly into a Bash array.
Example:
  models=($(ollama_list_array))
```

`ola -h`
```
Usage: ollama_list_array [-h] [-v]

List all available models as a Bash array.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function retrieves the list of models and formats them as a space-separated string, suitable for loading directly into a Bash array.
Example:
  models=($(ollama_list_array))
```

`ollama_model_random -h`
```
Usage: ollama_model_random [-h] [-v]

Get the name of a randomly selected model.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function selects a model at random from the list of locally available models.
It is useful when you want to use any available model without specifying one, for example, in testing or for creative applications.
```

`omr -h`
```
Usage: ollama_model_random [-h] [-v]

Get the name of a randomly selected model.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function selects a model at random from the list of locally available models.
It is useful when you want to use any available model without specifying one, for example, in testing or for creative applications.
```

`ollama_model_unload -h`
```
Usage: ollama_model_unload [-m <model>] [<model>]

Unload a model from memory.

  -m <model>  Name of the model to unload (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function frees up system resources by unloading a specified model from memory.
This is useful for managing memory usage, especially on systems with limited resources.
```

`omu -h`
```
Usage: ollama_model_unload [-m <model>] [<model>]

Unload a model from memory.

  -m <model>  Name of the model to unload (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function frees up system resources by unloading a specified model from memory.
This is useful for managing memory usage, especially on systems with limited resources.
```

`ollama_ps -h`
```
Usage: ollama_ps [-h] [-v]

List running model processes in a human-readable format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the 'ollama ps' command-line tool to display a table of all models currently running in memory.
It is a quick way to check which models are active and consuming resources.
```

`op -h`
```
Usage: ollama_ps [-h] [-v]

List running model processes in a human-readable format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the 'ollama ps' command-line tool to display a table of all models currently running in memory.
It is a quick way to check which models are active and consuming resources.
```

`ollama_ps_json -h`
```
Usage: ollama_ps_json [-h] [-v]

List running model processes in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API to get a list of running models and returns the raw JSON response.
This is useful for programmatic monitoring and management of running models.
```

`opj -h`
```
Usage: ollama_ps_json [-h] [-v]

List running model processes in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API to get a list of running models and returns the raw JSON response.
This is useful for programmatic monitoring and management of running models.
```

`ollama_show -h`
```
Usage: ollama_show [-m <model>] [<model>]

Show detailed information about a model in a human-readable format.

  -m <model>  Name of the model to show (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the 'ollama show' command-line tool to display details about a specified model, including its parameters, template, and more.
It is useful for inspecting the configuration of a model.
```

`os -h`
```
Usage: ollama_show [-m <model>] [<model>]

Show detailed information about a model in a human-readable format.

  -m <model>  Name of the model to show (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the 'ollama show' command-line tool to display details about a specified model, including its parameters, template, and more.
It is useful for inspecting the configuration of a model.
```

`ollama_show_json -h`
```
Usage: ollama_show_json [-m <model>] [<model>]

Show detailed information about a model in JSON format.

  -m <model>  Name of the model to show (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API to get detailed information about a specific model and returns the raw JSON response.
This is ideal for programmatic access to model details, allowing for automated configuration checks or modifications.
```

`osj -h`
```
Usage: ollama_show_json [-m <model>] [<model>]

Show detailed information about a model in JSON format.

  -m <model>  Name of the model to show (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API to get detailed information about a specific model and returns the raw JSON response.
This is ideal for programmatic access to model details, allowing for automated configuration checks or modifications.
```

`ollama_app_installed -h`
```
Usage: ollama_app_installed [-h] [-v]

Check if the Ollama application is installed on the local system.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the 'command -v' utility to determine if the 'ollama' executable is in the system's PATH.
It is useful for pre-flight checks in scripts to ensure that required dependencies are available.
```

`oai -h`
```
Usage: ollama_app_installed [-h] [-v]

Check if the Ollama application is installed on the local system.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the 'command -v' utility to determine if the 'ollama' executable is in the system's PATH.
It is useful for pre-flight checks in scripts to ensure that required dependencies are available.
```

`ollama_app_turbo -h`
```
Usage: ollama_app_turbo -m <on|off> [-e] [-h] [-v]

Enable or disable Turbo Mode.

  -m <on|off> Enable or disable Turbo Mode.
  -e          Export the API key to the environment.
  -h          Show this help and exit.
  -v          Show version information and exit.

Turbo Mode configures the library to use the Ollama.com API, which may provide faster responses.
This requires an API key, which the function will prompt for if not already set.
Use 'off' to revert to using the local Ollama instance.
```

`oat -h`
```
Usage: ollama_app_turbo -m <on|off> [-e] [-h] [-v]

Enable or disable Turbo Mode.

  -m <on|off> Enable or disable Turbo Mode.
  -e          Export the API key to the environment.
  -h          Show this help and exit.
  -v          Show version information and exit.

Turbo Mode configures the library to use the Ollama.com API, which may provide faster responses.
This requires an API key, which the function will prompt for if not already set.
Use 'off' to revert to using the local Ollama instance.
```

`ollama_app_vars -h`
```
Usage: ollama_app_vars [-h] [-v]

Display Ollama-related environment variables.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function prints a list of environment variables that can be used to configure the behavior of the Ollama application.
It is a helpful reference for understanding the available settings and their current values.
```

`oav -h`
```
Usage: ollama_app_vars [-h] [-v]

Display Ollama-related environment variables.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function prints a list of environment variables that can be used to configure the behavior of the Ollama application.
It is a helpful reference for understanding the available settings and their current values.
```

`ollama_app_version -h`
```
Usage: ollama_app_version [-h] [-v]

Get the version of the Ollama application as plain text.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API for its version and returns just the version string.
It provides a simple way to check the installed Ollama version.
```

`oave -h`
```
Usage: ollama_app_version [-h] [-v]

Get the version of the Ollama application as plain text.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API for its version and returns just the version string.
It provides a simple way to check the installed Ollama version.
```

`ollama_app_version_json -h`
```
Usage: ollama_app_version_json [-h] [-v]

Get the version of the Ollama application in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API and returns the raw JSON response containing the version information.
This is useful for programmatic version checking and comparison.
```

`oavj -h`
```
Usage: ollama_app_version_json [-h] [-v]

Get the version of the Ollama application in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API and returns the raw JSON response containing the version information.
This is useful for programmatic version checking and comparison.
```

`ollama_app_version_cli -h`
```
Usage: ollama_app_version_cli [-h] [-v]

Get the version of the Ollama application using the command-line tool.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls 'ollama --version' to get the version information directly from the command-line application.
This can be useful for verifying the CLI tool is installed and working correctly.
```

`oavc -h`
```
Usage: ollama_app_version_cli [-h] [-v]

Get the version of the Ollama application using the command-line tool.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls 'ollama --version' to get the version information directly from the command-line application.
This can be useful for verifying the CLI tool is installed and working correctly.
```

`ollama_thinking -h`
```
Usage: ollama_thinking [on|off|hide] [-h] [-v]

Configure the 'thinking' mode for model responses.

  on|off|hide Set the thinking mode.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sets the 'OLLAMA_LIB_THINKING' environment variable, which controls whether the model's 'thinking' process is displayed.
Modes:
- on: Show thinking output.
- off: Hide thinking output.
- hide: Do not show thinking output, but it is still available in the JSON.
```

`ot -h`
```
Usage: ollama_thinking [on|off|hide] [-h] [-v]

Configure the 'thinking' mode for model responses.

  on|off|hide Set the thinking mode.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sets the 'OLLAMA_LIB_THINKING' environment variable, which controls whether the model's 'thinking' process is displayed.
Modes:
- on: Show thinking output.
- off: Hide thinking output.
- hide: Do not show thinking output, but it is still available in the JSON.
```

`ollama_lib_about -h`
```
Usage: ollama_lib_about [-h] [-v]

Display information about the Ollama Bash Lib.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function shows details about the library, including its name, version, URL, and other relevant information.
It also lists all the available 'ollama_*' functions for easy reference.
```

`olab -h`
```
Usage: ollama_lib_about [-h] [-v]

Display information about the Ollama Bash Lib.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function shows details about the library, including its name, version, URL, and other relevant information.
It also lists all the available 'ollama_*' functions for easy reference.
```

`ollama_lib_version -h`
```
Usage: ollama_lib_version [-h] [-v]

Get the version of the Ollama Bash Lib.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current version number of the library as defined in the 'OLLAMA_LIB_VERSION' variable.
It is useful for checking the library version for compatibility or debugging purposes.
```

`olv -h`
```
Usage: ollama_lib_version [-h] [-v]

Get the version of the Ollama Bash Lib.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current version number of the library as defined in the 'OLLAMA_LIB_VERSION' variable.
It is useful for checking the library version for compatibility or debugging purposes.
```

`ollama_eval -h`
```
Usage: ollama_eval [-t <task>] [-m <model>] [<task>] [<model>]

Generate and evaluate a command-line task.

  -t <task>   The task to be run on the command line.
  -m <model>  Model to use to generate command (Optional) If empty, uses random model.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function takes a description of a task, sends it to a model to generate a shell command, and then prompts the user for permission to execute it.
It includes safety features like syntax checking and a sandbox mode for execution. This is a powerful tool for converting natural language into shell commands.
```

`oe -h`
```
Usage: ollama_eval [-t <task>] [-m <model>] [<task>] [<model>]

Generate and evaluate a command-line task.

  -t <task>   The task to be run on the command line.
  -m <model>  Model to use to generate command (Optional) If empty, uses random model.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function takes a description of a task, sends it to a model to generate a shell command, and then prompts the user for permission to execute it.
It includes safety features like syntax checking and a sandbox mode for execution. This is a powerful tool for converting natural language into shell commands.
```
