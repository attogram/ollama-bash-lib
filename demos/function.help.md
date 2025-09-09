# function help: -h

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0

## `ollama_api_get -h`
```
Usage: ollama_api_get [-P <path>] [-h] [-v]

GET request to the Ollama API.

  -P <path>   API path to send the GET request to (optional).
  -h          Show this help and exit.
  -v          Show version information and exit.

This is a fundamental function used by many other functions in this library to communicate with the Ollama API, such as 'ollama_list_json' and 'ollama_api_ping'.
It relies on the '_call_curl' function to perform the actual HTTP request.
```

## `ollama_api_post -h`
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

## `ollama_api_ping -h`
```
Usage: ollama_api_ping [-h] [-v]

Ping the Ollama API to check for availability.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends a request to the root of the Ollama API to verify that it is running and accessible.
It is useful for health checks and ensuring connectivity before attempting to use other API functions.
This function relies on 'ollama_api_get' to make the request.
```

## `ollama_generate_json -h`
```
Usage: ollama_generate_json -m <model> [-p <prompt>] [-h] [-v]

Generate a completion from a model as JSON.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends a prompt to a specified model and returns the model's response as a raw JSON object.
If streaming is enabled via the global 'OBL_STREAM' variable, it will return a stream of JSON objects.
This is a foundational function for 'ollama_generate' and 'ollama_generate_stream', which process this JSON output into plain text.
```

## `ollama_generate -h`
```
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]

Generate a completion from a model as plain text.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function is a wrapper around 'ollama_generate_json'. It takes the raw JSON output and extracts the 'response' field, returning it as a single string.
This is useful for when you only need the generated text and don't want to parse the JSON yourself.
```

## `ollama_generate_stream_json -h`
```
Usage: ollama_generate_stream_json -m <model> [-p <prompt>] [-h] [-v]

Generate a completion from a model as a stream of JSON objects.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sets the global 'OBL_STREAM' variable to 1 and then calls 'ollama_generate_json'.
It is the basis for 'ollama_generate_stream', which further processes the output into a continuous stream of text.
```

## `ollama_generate_stream -h`
```
Usage: ollama_generate_stream -m <model> [-p <prompt>] [-h] [-v]

Generate a completion from a model as a stream of text.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.
  
    This function calls ollama_generate_stream_json and pipes the output to jq to extract the response field from each JSON object, providing a continuous stream of text.
    It is ideal for displaying real-time generation in interactive scripts.
```

## `ollama_messages -h`
```
Usage: ollama_messages [-h] [-v]

Get all messages in the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns a JSON array of all messages that have been added to the current session via 'ollama_messages_add'.
The output of this function is suitable for use in the 'messages' field of a chat completion request.
```

## `ollama_messages_add -h`
```
Usage: ollama_messages_add -r <role> -c <content> [-h] [-v]

Add a message to the current session's message history.

  -r <role>   The role of the message sender (user, assistant, system).
  -c <content> The content of the message.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function appends a new message object to the \'OBL_MESSAGES\' array.
This history is then used by \'ollama_chat\' and related functions to maintain a conversation with the model.
```

## `ollama_messages_clear -h`
```
Usage: ollama_messages_clear [-h] [-v]

Clear all messages from the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function resets the \'OBL_MESSAGES\' array, effectively deleting the entire conversation history for the current session.
This is useful for starting a new conversation without restarting the script.
```

## `ollama_messages_count -h`
```
Usage: ollama_messages_count [-h] [-v]

Get the number of messages in the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current number of messages stored in the 'OBL_MESSAGES' array.
It can be used to check if a conversation has started or to monitor the length of the conversation history.
```

## `ollama_messages_last -h`
```
Usage: ollama_messages_last [-h] [-v]

Get the content of the last message from the session history as a string.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function retrieves the last message using 'ollama_messages_last_json' and extracts the 'content' field, returning it as a plain string.
```

## `ollama_messages_last_json -h`
```
Usage: ollama_messages_last_json [-h] [-v]

Get the last message from the session history in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function retrieves the most recent message from the 'OBL_MESSAGES' array and outputs it as a JSON string.
```

## `ollama_chat -h`
```
Usage: ollama_chat -m <model> [-h] [-v]

Request a chat completion from a model, receiving a plain text response.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function is a user-friendly wrapper around \'ollama_chat_json\'.
It handles the JSON parsing and returns only the content of the model\'s message as a single string.
It is ideal for simple, non-streaming chat interactions.
```

## `ollama_chat_json -h`
```
Usage: ollama_chat_json -m <model> [-h] [-v]

Request a chat completion from a model, receiving JSON output.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends the entire message history ('OBL_MESSAGES') to the specified model and returns the model's response as a raw JSON object.
It serves as the foundation for 'ollama_chat_stream', which provides more user-friendly text-based outputs.
If 'OBL_STREAM' is 0, it adds the assistant's response to the message history.
```

## `ollama_chat_stream -h`
```
Usage: ollama_chat_stream -m <model> [-h] [-v]

Request a chat completion from a model, receiving a stream of text.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls \'ollama_chat\' with streaming enabled and processes the output to provide a continuous stream of text from the model\'s response.
It is perfect for interactive chat applications where you want to display the response as it is being generated.
The assistant\'s response is NOT added to the message history.
```

## `ollama_chat_stream_json -h`
```
Usage: ollama_chat_stream_json -m <model> [-h] [-v]

Request a chat completion from a model, receiving a stream of JSON objects.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function enables streaming and calls \'ollama_chat\' to get a raw stream of JSON objects from the model.
It is the basis for the \'ollama_chat_stream\' function, which turns the JSON stream into a more human-readable text stream.
The assistant\'s response is NOT added to the message history.
```

## `ollama_list -h`
```
Usage: ollama_list [-h] [-v]

List all available models in a human-readable format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses 'ollama list' to display a formatted table of all locally available models.
It is a convenient way to quickly see the models you have installed.
```

## `ollama_list_json -h`
```
Usage: ollama_list_json [-h] [-v]

List all available models in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API for the list of available models and returns the raw JSON response.
This is useful for programmatic access to model information, allowing for easy parsing and manipulation with 'jq'.
```

## `ollama_list_array -h`
```
Usage: ollama_list_array [-h] [-v]

List all available models as a Bash array.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function retrieves the list of models and formats them as a space-separated string, suitable for loading directly into a Bash array.
Example:
  models=($(ollama_list_array))
```

## `ollama_model_random -h`
```
Usage: ollama_model_random [-h] [-v]

Get the name of a randomly selected model.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function selects a model at random from the list of locally available models.
It is useful when you want to use any available model without specifying one, for example, in testing or for creative applications.
```

## `ollama_model_unload -h`
```
Usage: ollama_model_unload -m <model> [-h] [-v]

Unload a model from memory.

  -m <model>  Name of the model to unload (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function frees up system resources by unloading a specified model from memory.
This is useful for managing memory usage, especially on systems with limited resources.
```

## `ollama_ps -h`
```
Usage: ollama_ps [-h] [-v]

List running model processes in a human-readable format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses 'ollama ps' to display a table of all models currently running in memory.
It is a quick way to check which models are active and consuming resources.
```

## `ollama_ps_json -h`
```
Usage: ollama_ps_json [-h] [-v]

List running model processes in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API to get a list of running models and returns the raw JSON response.
This is useful for programmatic monitoring and management of running models.
```

## `ollama_show -h`
```
Usage: ollama_show -m <model> [-h] [-v]

Show detailed information about a model in a human-readable format.

  -m <model>  Name of the model to show (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses 'ollama show' to display details about a specified model, including its parameters, template, and more.
It is useful for inspecting the configuration of a model.
```

## `ollama_show_json -h`
```
Usage: ollama_show_json -m <model> [-h] [-v]

Show detailed information about a model in JSON format.

  -m <model>  Name of the model to show (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API to get detailed information about a specific model and returns the raw JSON response.
This is ideal for programmatic access to model details, allowing for automated configuration checks or modifications.
```

## `ollama_app_installed -h`
```
Usage: ollama_app_installed [-h] [-v]

Check if the Ollama application is installed on the local system.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the \'command -v\' utility to determine if the \'ollama\' executable is in the system\'s PATH.
It is useful for pre-flight checks in scripts to ensure that required dependencies are available.
```

## `ollama_app_turbo -h`
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

## `ollama_app_vars -h`
```
Usage: ollama_app_vars [-h] [-v]

Display Ollama-related environment variables.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function prints a list of environment variables that can be used to configure the behavior of the Ollama application.
It is a helpful reference for understanding the available settings and their current values.
```

## `ollama_app_version -h`
```
Usage: ollama_app_version [-h] [-v]

Get the version of the Ollama application as plain text.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API for its version and returns just the version string.
It provides a simple way to check the installed Ollama version.
```

## `ollama_app_version_json -h`
```
Usage: ollama_app_version_json [-h] [-v]

Get the version of the Ollama application in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API and returns the raw JSON response containing the version information.
This is useful for programmatic version checking and comparison.
```

## `ollama_app_version_cli -h`
```
Usage: ollama_app_version_cli [-h] [-v]

Get the version of the installed Ollama application

  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls 'ollama --version' to get the version information directly from the command-line application.
This can be useful for verifying the ollama core cli is installed and working correctly.
```

## `ollama_thinking -h`
```
Usage: ollama_thinking [on|off|hide] [-h] [-v]

Configure the 'thinking' mode for model responses.

  on|off|hide Set the thinking mode.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sets the \'OBL_THINKING\' environment variable, which controls whether the model\'s \'thinking\' process is displayed.
Modes:
- on: Show thinking output.
- off: Hide thinking output.
- hide: Do not show thinking output, but it is still available in the JSON.
```

## `ollama_lib_about -h`
```
Usage: ollama_lib_about [-h] [-v]

Display information about the Ollama Bash Lib.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function shows details about the library, including its name, version, URL, and other relevant information.
It also lists all the available 'ollama_*' functions for easy reference.
```

## `ollama_lib_version -h`
```
Usage: ollama_lib_version [-h] [-v]

Get the version of the Ollama Bash Lib.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current version number of the library as defined in the 'OBL_VERSION' variable.
It is useful for checking the library version for compatibility or debugging purposes.
```
