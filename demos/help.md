# help via -h and --help

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.0
## Testing -h for all functions (first argument)

`ollama_api_get -h`
```
ollama_api_get - GET request to the Ollama API
Usage: ollama_api_get "/api/path"
```

`oag -h`
```
ollama_api_get - GET request to the Ollama API
Usage: ollama_api_get "/api/path"
```

`ollama_api_post -h`
```
ollama_api_post - POST request to the Ollama API
Usage: ollama_api_post "/api/path" "{json}"
```

`oap -h`
```
ollama_api_post - POST request to the Ollama API
Usage: ollama_api_post "/api/path" "{json}"
```

`ollama_api_ping -h`
```
ollama_api_ping - Ping the Ollama API
Usage: ollama_api_ping
```

`oapi -h`
```
ollama_api_ping - Ping the Ollama API
Usage: ollama_api_ping
```

`ollama_generate_json -h`
```
ollama_generate_json - Generate a completion as json
Usage: ollama_generate_json "model" "prompt"
```

`ogj -h`
```
ollama_generate_json - Generate a completion as json
Usage: ollama_generate_json "model" "prompt"
```

`ollama_generate -h`
```
ollama_generate - Generate a completion as text
Usage: ollama_generate "model" "prompt"
```

`og -h`
```
ollama_generate - Generate a completion as text
Usage: ollama_generate "model" "prompt"
```

`ollama_generate_stream_json -h`
```
ollama_generate_stream_json - Generate a completion, as streaming json
Usage: ollama_generate_stream_json "model" "prompt"
```

`ogsj -h`
```
ollama_generate_stream_json - Generate a completion, as streaming json
Usage: ollama_generate_stream_json "model" "prompt"
```

`ollama_generate_stream -h`
```
ollama_generate_stream - Generate a completion as streaming text
Usage: ollama_generate_stream "model" "prompt"
```

`ogs -h`
```
ollama_generate_stream - Generate a completion as streaming text
Usage: ollama_generate_stream "model" "prompt"
```

`ollama_messages -h`
```
ollama_messages - Get all messages
Usage: ollama_messages
```

`om -h`
```
ollama_messages - Get all messages
Usage: ollama_messages
```

`ollama_messages_add -h`
```
ollama_messages_add - Add a message
Usage: ollama_messages_add "role" "message"
```

`oma -h`
```
ollama_messages_add - Add a message
Usage: ollama_messages_add "role" "message"
```

`ollama_messages_clear -h`
```
ollama_messages_clear - Clear all messages
Usage: ollama_messages_clear
```

`omc -h`
```
ollama_messages_clear - Clear all messages
Usage: ollama_messages_clear
```

`ollama_messages_count -h`
```
ollama_messages_count - Messages count
Usage: ollama_messages_count
```

`omco -h`
```
ollama_messages_count - Messages count
Usage: ollama_messages_count
```

`ollama_tools_add -h`
```
ollama_tools_add - Add a tool
Usage: ollama_tools_add "tool_name" "command" "json_definition"
```

`ota -h`
```
ollama_tools_add - Add a tool
Usage: ollama_tools_add "tool_name" "command" "json_definition"
```

`ollama_tools -h`
```
ollama_tools - View all tools
Usage: ollama_tools
```

`oto -h`
```
ollama_tools - View all tools
Usage: ollama_tools
```

`ollama_tools_count -h`
```
ollama_tools_count - Get count of tools
Usage: ollama_tools_count
```

`otco -h`
```
ollama_tools_count - Get count of tools
Usage: ollama_tools_count
```

`ollama_tools_clear -h`
```
ollama_tools_clear - Remove all tools
Usage: ollama_tools_clear
```

`otc -h`
```
ollama_tools_clear - Remove all tools
Usage: ollama_tools_clear
```

`ollama_tools_is_call -h`
```
ollama_tools_is_call - Does the response have a tool call?
Usage: ollama_tools_is_call "json_response"
```

`otic -h`
```
ollama_tools_is_call - Does the response have a tool call?
Usage: ollama_tools_is_call "json_response"
```

`ollama_tools_run -h`
```
ollama_tools_run - Run a tool
Usage: ollama_tools_run "tool_name" "arguments_json"
```

`otr -h`
```
ollama_tools_run - Run a tool
Usage: ollama_tools_run "tool_name" "arguments_json"
```

`ollama_chat_json -h`
```
ollama_chat_json - Chat completion request as json
Usage: ollama_chat_json "model"
```

`ocj -h`
```
ollama_chat_json - Chat completion request as json
Usage: ollama_chat_json "model"
```

`ollama_chat -h`
```
ollama_chat - Chat completion request as text
Usage: ollama_chat "model"
```

`oc -h`
```
ollama_chat - Chat completion request as text
Usage: ollama_chat "model"
```

`ollama_chat_stream -h`
```
ollama_chat_stream - Chat completion request as streaming text
Usage: ollama_chat_stream "model"
```

`ocs -h`
```
ollama_chat_stream - Chat completion request as streaming text
Usage: ollama_chat_stream "model"
```

`ollama_chat_stream_json -h`
```
ollama_chat_stream_json - Chat completion request as streaming json
Usage: ollama_chat_stream_json "model"
```

`ocsj -h`
```
ollama_chat_stream_json - Chat completion request as streaming json
Usage: ollama_chat_stream_json "model"
```

`ollama_list -h`
```
ollama_list - All available models, CLI version
Usage: ollama_list
```

`ol -h`
```
ollama_list - All available models, CLI version
Usage: ollama_list
```

`ollama_list_json -h`
```
ollama_list_json - All available models, JSON version
Usage: ollama_list_json
```

`olj -h`
```
ollama_list_json - All available models, JSON version
Usage: ollama_list_json
```

`ollama_list_array -h`
```
ollama_list_array - All available models, Bash array version
Usage: ollama_list_array
```

`ola -h`
```
ollama_list_array - All available models, Bash array version
Usage: ollama_list_array
```

`ollama_model_random -h`
```
ollama_model_random - Get a random model
Usage: ollama_model_random
```

`omr -h`
```
ollama_model_random - Get a random model
Usage: ollama_model_random
```

`ollama_model_unload -h`
```
ollama_model_unload - Unload a model from memory
Usage: ollama_model_unload "model"
```

`omu -h`
```
ollama_model_unload - Unload a model from memory
Usage: ollama_model_unload "model"
```

`ollama_ps -h`
```
ollama_ps - Running model processes, CLI version
Usage: ollama_ps
```

`op -h`
```
ollama_ps - Running model processes, CLI version
Usage: ollama_ps
```

`ollama_ps_json -h`
```
ollama_ps_json - Running model processes, JSON version
Usage: ollama_ps_json
```

`opj -h`
```
ollama_ps_json - Running model processes, JSON version
Usage: ollama_ps_json
```

`ollama_show -h`
```
ollama_show - Show model information, CLI version
Usage: ollama_show "model"
```

`os -h`
```
ollama_show - Show model information, CLI version
Usage: ollama_show "model"
```

`ollama_show_json -h`
```
ollama_show_json - Show model information, JSON version
Usage: ollama_show_json "model"
```

`osj -h`
```
ollama_show_json - Show model information, JSON version
Usage: ollama_show_json "model"
```

`ollama_app_installed -h`
```
ollama_app_installed - Is Ollama App installed on the local system?
Usage: ollama_app_installed
```

`oai -h`
```
ollama_app_installed - Is Ollama App installed on the local system?
Usage: ollama_app_installed
```

`ollama_app_turbo -h`
```
ollama_app_turbo - Turbo Mode on/off
Usage: ollama_app_turbo [-e] {on|off}
```

`oat -h`
```
ollama_app_turbo - Turbo Mode on/off
Usage: ollama_app_turbo [-e] {on|off}
```

`ollama_app_vars -h`
```
ollama_app_vars - Ollama App environment variables
Usage: ollama_app_vars
```

`oav -h`
```
ollama_app_vars - Ollama App environment variables
Usage: ollama_app_vars
```

`ollama_app_version -h`
```
ollama_app_version - Ollama App version, TEXT version
Usage: ollama_app_version
```

`oave -h`
```
ollama_app_version - Ollama App version, TEXT version
Usage: ollama_app_version
```

`ollama_app_version_json -h`
```
ollama_app_version_json - Ollama App version, JSON version
Usage: ollama_app_version_json
```

`oavj -h`
```
ollama_app_version_json - Ollama App version, JSON version
Usage: ollama_app_version_json
```

`ollama_app_version_cli -h`
```
Usage: ollama_app_version_cli
```

`oavc -h`
```
Usage: ollama_app_version_cli
```

`ollama_thinking -h`
```
Usage: ollama_thinking [on|off|hide]
```

`ot -h`
```
Usage: ollama_thinking [on|off|hide]
```

`ollama_lib_about -h`
```
Usage: ollama_lib_about
```

`olab -h`
```
Usage: ollama_lib_about
```

`ollama_lib_version -h`
```
Usage: ollama_lib_version
```

`olv -h`
```
Usage: ollama_lib_version
```

`ollama_eval -h`
```
Usage: ollama_eval "task" "[model]"
```

`oe -h`
```
Usage: ollama_eval "task" "[model]"
```

## Testing --help for all functions (first argument)

`ollama_api_get --help`
```
ollama_api_get - GET request to the Ollama API
Usage: ollama_api_get "/api/path"
```

`oag --help`
```
ollama_api_get - GET request to the Ollama API
Usage: ollama_api_get "/api/path"
```

`ollama_api_post --help`
```
ollama_api_post - POST request to the Ollama API
Usage: ollama_api_post "/api/path" "{json}"
```

`oap --help`
```
ollama_api_post - POST request to the Ollama API
Usage: ollama_api_post "/api/path" "{json}"
```

`ollama_api_ping --help`
```
ollama_api_ping - Ping the Ollama API
Usage: ollama_api_ping
```

`oapi --help`
```
ollama_api_ping - Ping the Ollama API
Usage: ollama_api_ping
```

`ollama_generate_json --help`
```
ollama_generate_json - Generate a completion as json
Usage: ollama_generate_json "model" "prompt"
```

`ogj --help`
```
ollama_generate_json - Generate a completion as json
Usage: ollama_generate_json "model" "prompt"
```

`ollama_generate --help`
```
ollama_generate - Generate a completion as text
Usage: ollama_generate "model" "prompt"
```

`og --help`
```
ollama_generate - Generate a completion as text
Usage: ollama_generate "model" "prompt"
```

`ollama_generate_stream_json --help`
```
ollama_generate_stream_json - Generate a completion, as streaming json
Usage: ollama_generate_stream_json "model" "prompt"
```

`ogsj --help`
```
ollama_generate_stream_json - Generate a completion, as streaming json
Usage: ollama_generate_stream_json "model" "prompt"
```

`ollama_generate_stream --help`
```
ollama_generate_stream - Generate a completion as streaming text
Usage: ollama_generate_stream "model" "prompt"
```

`ogs --help`
```
ollama_generate_stream - Generate a completion as streaming text
Usage: ollama_generate_stream "model" "prompt"
```

`ollama_messages --help`
```
ollama_messages - Get all messages
Usage: ollama_messages
```

`om --help`
```
ollama_messages - Get all messages
Usage: ollama_messages
```

`ollama_messages_add --help`
```
ollama_messages_add - Add a message
Usage: ollama_messages_add "role" "message"
```

`oma --help`
```
ollama_messages_add - Add a message
Usage: ollama_messages_add "role" "message"
```

`ollama_messages_clear --help`
```
ollama_messages_clear - Clear all messages
Usage: ollama_messages_clear
```

`omc --help`
```
ollama_messages_clear - Clear all messages
Usage: ollama_messages_clear
```

`ollama_messages_count --help`
```
ollama_messages_count - Messages count
Usage: ollama_messages_count
```

`omco --help`
```
ollama_messages_count - Messages count
Usage: ollama_messages_count
```

`ollama_tools_add --help`
```
ollama_tools_add - Add a tool
Usage: ollama_tools_add "tool_name" "command" "json_definition"
```

`ota --help`
```
ollama_tools_add - Add a tool
Usage: ollama_tools_add "tool_name" "command" "json_definition"
```

`ollama_tools --help`
```
ollama_tools - View all tools
Usage: ollama_tools
```

`oto --help`
```
ollama_tools - View all tools
Usage: ollama_tools
```

`ollama_tools_count --help`
```
ollama_tools_count - Get count of tools
Usage: ollama_tools_count
```

`otco --help`
```
ollama_tools_count - Get count of tools
Usage: ollama_tools_count
```

`ollama_tools_clear --help`
```
ollama_tools_clear - Remove all tools
Usage: ollama_tools_clear
```

`otc --help`
```
ollama_tools_clear - Remove all tools
Usage: ollama_tools_clear
```

`ollama_tools_is_call --help`
```
ollama_tools_is_call - Does the response have a tool call?
Usage: ollama_tools_is_call "json_response"
```

`otic --help`
```
ollama_tools_is_call - Does the response have a tool call?
Usage: ollama_tools_is_call "json_response"
```

`ollama_tools_run --help`
```
ollama_tools_run - Run a tool
Usage: ollama_tools_run "tool_name" "arguments_json"
```

`otr --help`
```
ollama_tools_run - Run a tool
Usage: ollama_tools_run "tool_name" "arguments_json"
```

`ollama_chat_json --help`
```
ollama_chat_json - Chat completion request as json
Usage: ollama_chat_json "model"
```

`ocj --help`
```
ollama_chat_json - Chat completion request as json
Usage: ollama_chat_json "model"
```

`ollama_chat --help`
```
ollama_chat - Chat completion request as text
Usage: ollama_chat "model"
```

`oc --help`
```
ollama_chat - Chat completion request as text
Usage: ollama_chat "model"
```

`ollama_chat_stream --help`
```
ollama_chat_stream - Chat completion request as streaming text
Usage: ollama_chat_stream "model"
```

`ocs --help`
```
ollama_chat_stream - Chat completion request as streaming text
Usage: ollama_chat_stream "model"
```

`ollama_chat_stream_json --help`
```
ollama_chat_stream_json - Chat completion request as streaming json
Usage: ollama_chat_stream_json "model"
```

`ocsj --help`
```
ollama_chat_stream_json - Chat completion request as streaming json
Usage: ollama_chat_stream_json "model"
```

`ollama_list --help`
```
ollama_list - All available models, CLI version
Usage: ollama_list
```

`ol --help`
```
ollama_list - All available models, CLI version
Usage: ollama_list
```

`ollama_list_json --help`
```
ollama_list_json - All available models, JSON version
Usage: ollama_list_json
```

`olj --help`
```
ollama_list_json - All available models, JSON version
Usage: ollama_list_json
```

`ollama_list_array --help`
```
ollama_list_array - All available models, Bash array version
Usage: ollama_list_array
```

`ola --help`
```
ollama_list_array - All available models, Bash array version
Usage: ollama_list_array
```

`ollama_model_random --help`
```
ollama_model_random - Get a random model
Usage: ollama_model_random
```

`omr --help`
```
ollama_model_random - Get a random model
Usage: ollama_model_random
```

`ollama_model_unload --help`
```
ollama_model_unload - Unload a model from memory
Usage: ollama_model_unload "model"
```

`omu --help`
```
ollama_model_unload - Unload a model from memory
Usage: ollama_model_unload "model"
```

`ollama_ps --help`
```
ollama_ps - Running model processes, CLI version
Usage: ollama_ps
```

`op --help`
```
ollama_ps - Running model processes, CLI version
Usage: ollama_ps
```

`ollama_ps_json --help`
```
ollama_ps_json - Running model processes, JSON version
Usage: ollama_ps_json
```

`opj --help`
```
ollama_ps_json - Running model processes, JSON version
Usage: ollama_ps_json
```

`ollama_show --help`
```
ollama_show - Show model information, CLI version
Usage: ollama_show "model"
```

`os --help`
```
ollama_show - Show model information, CLI version
Usage: ollama_show "model"
```

`ollama_show_json --help`
```
ollama_show_json - Show model information, JSON version
Usage: ollama_show_json "model"
```

`osj --help`
```
ollama_show_json - Show model information, JSON version
Usage: ollama_show_json "model"
```

`ollama_app_installed --help`
```
ollama_app_installed - Is Ollama App installed on the local system?
Usage: ollama_app_installed
```

`oai --help`
```
ollama_app_installed - Is Ollama App installed on the local system?
Usage: ollama_app_installed
```

`ollama_app_turbo --help`
```
ollama_app_turbo - Turbo Mode on/off
Usage: ollama_app_turbo [-e] {on|off}
```

`oat --help`
```
ollama_app_turbo - Turbo Mode on/off
Usage: ollama_app_turbo [-e] {on|off}
```

`ollama_app_vars --help`
```
ollama_app_vars - Ollama App environment variables
Usage: ollama_app_vars
```

`oav --help`
```
ollama_app_vars - Ollama App environment variables
Usage: ollama_app_vars
```

`ollama_app_version --help`
```
ollama_app_version - Ollama App version, TEXT version
Usage: ollama_app_version
```

`oave --help`
```
ollama_app_version - Ollama App version, TEXT version
Usage: ollama_app_version
```

`ollama_app_version_json --help`
```
ollama_app_version_json - Ollama App version, JSON version
Usage: ollama_app_version_json
```

`oavj --help`
```
ollama_app_version_json - Ollama App version, JSON version
Usage: ollama_app_version_json
```

`ollama_app_version_cli --help`
```
Usage: ollama_app_version_cli
```

`oavc --help`
```
Usage: ollama_app_version_cli
```

`ollama_thinking --help`
```
Usage: ollama_thinking [on|off|hide]
```

`ot --help`
```
Usage: ollama_thinking [on|off|hide]
```

`ollama_lib_about --help`
```
Usage: ollama_lib_about
```

`olab --help`
```
Usage: ollama_lib_about
```

`ollama_lib_version --help`
```
Usage: ollama_lib_version
```

`olv --help`
```
Usage: ollama_lib_version
```

`ollama_eval --help`
```
Usage: ollama_eval "task" "[model]"
```

`oe --help`
```
Usage: ollama_eval "task" "[model]"
```

