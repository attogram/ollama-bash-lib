# Ollama Bash Lib - Documentation

This directory contains the full documentation for the Ollama Bash Lib.

## How To

* [How to Chat](howto-chat.md) - a simple chat example
* [How to Generate Content](howto-generate.md) - generate a completion
* [How to Stream Content](howto-stream.md) - stream a completion
* [How to use Turbo Mode](howto-turbo-mode.md) - use the Ollama.com API
* [How to Debug](howto-debug.md) - enable debug messages
* [How to get Technical Support](howto-support.md) - join our Discord

## Dependencies

* [Ollama](dependency-ollama.md) - for LLM interaction
* [jq](dependency-jq.md) - for JSON handling
* [curl](dependency-curl.md) - for API requests
* [Miscellaneous Tools](dependency-misc.md) - other optional tools

## Functions

* [Function Reference](functions.md) (full list of all functions)

### API Functions - for direct interaction with the Ollama API
* [ollama_api_get](ollama_api_get.md)
* [ollama_api_post](ollama_api_post.md)
* [ollama_api_ping](ollama_api_ping.md)

### Generate Functions - for generating content
* [ollama_generate](ollama_generate.md)
* [ollama_generate_json](ollama_generate_json.md)
* [ollama_generate_stream](ollama_generate_stream.md)
* [ollama_generate_stream_json](ollama_generate_stream_json.md)

### Chat Functions - for conversational interactions
* [ollama_chat](ollama_chat.md)
* [ollama_messages](ollama_messages.md)
* [ollama_messages_add](ollama_messages_add.md)
* [ollama_messages_count](ollama_messages_count.md)
* [ollama_messages_clear](ollama_messages_clear.md)

### Model Functions - for managing models
* [ollama_model_random](ollama_model_random.md)
* [ollama_model_unload](ollama_model_unload.md)
* [ollama_show](ollama_show.md)
* [ollama_show_json](ollama_show_json.md)
* [ollama_list](ollama_list.md)
* [ollama_list_json](ollama_list_json.md)
* [ollama_list_array](ollama_list_array.md)
* [_is_valid_model](_is_valid_model.md)

### Application Functions - for interacting with the Ollama application
* [ollama_app_installed](ollama_app_installed.md)
* [ollama_app_turbo](ollama_app_turbo.md)
* [ollama_app_vars](ollama_app_vars.md)
* [ollama_app_version](ollama_app_version.md)
* [ollama_app_version_json](ollama_app_version_json.md)
* [ollama_app_version_cli](ollama_app_version_cli.md)
* [ollama_ps](ollama_ps.md)
* [ollama_ps_json](ollama_ps_json.md)

### Library Functions - for library-specific operations
* [ollama_lib_about](ollama_lib_about.md)
* [ollama_lib_version](ollama_lib_version.md)
* [ollama_thinking](ollama_thinking.md)

### Other
* [Function Aliases](aliases.md) - a list of all function aliases
