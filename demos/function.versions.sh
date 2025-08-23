#!/usr/bin/env bash

echo '# function versions: -v'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  #if ! ollama_app_installed; then echo "ERROR: Ollama Not Installed"; fi;
  #if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi
  echo; echo "A [demo](../README.md#demos) of [$OBL_NAME]($OBL_URL) v$OBL_VERSION"
}

startup

# List of all public functions in the library
functions=(
  ollama_api_get
  ollama_api_post
  ollama_api_ping
  ollama_generate_json
  ollama_generate
  ollama_generate_stream_json
  ollama_generate_stream
  ollama_messages
  ollama_messages_add
  ollama_messages_clear
  ollama_messages_count
  ollama_tools_add
  ollama_tools
  ollama_tools_count
  ollama_tools_clear
  ollama_tools_is_call
  ollama_tools_run
  ollama_chat
  ollama_chat_stream
  ollama_chat_stream_json
  ollama_list
  ollama_list_json
  ollama_list_array
  ollama_model_random
  ollama_model_unload
  ollama_ps
  ollama_ps_json
  ollama_show
  ollama_show_json
  ollama_app_installed
  ollama_app_turbo
  ollama_app_vars
  ollama_app_version
  ollama_app_version_json
  ollama_app_version_cli
  ollama_thinking
  ollama_lib_about
  ollama_lib_version
)

echo
for func in "${functions[@]}"; do
  # shellcheck disable=SC2016
  printf '## `%s -v`\n```\n%s\n```\n' "$func" "$("$func" -v)"
  echo
done
