#!/usr/bin/env bash
#
# Test script for -h/--help option on all functions in ollama_bash_lib.sh
#

# Source the library
# shellcheck source=../ollama_bash_lib.sh
source "$(dirname "$0")/../ollama_bash_lib.sh"

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
  ollama_chat_json
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
  ollama_eval
)

echo "--- Testing -h for all functions (first argument) ---"
for func in "${functions[@]}"; do
  printf "\n--- Testing %s -h ---\n" "$func"
  "$func" -h
done

echo -e "\n\n--- Testing --help for all functions (first argument) ---"
for func in "${functions[@]}"; do
  printf "\n--- Testing %s --help ---\n" "$func"
  "$func" --help
done

echo -e "\n\n--- Testing help flag in various positions for functions with arguments ---"
printf "\n--- Testing ollama_generate \"model\" -h ---\n"
ollama_generate "model" -h
printf "\n--- Testing ollama_generate \"model\" \"prompt\" --help ---\n"
ollama_generate "model" "prompt" --help
printf "\n--- Testing ollama_eval \"task\" -h \"model\" ---\n"
ollama_eval "task" -h "model"

echo -e "\n\n--- Testing error handling for no-argument functions ---"
printf "\n--- Testing ollama_api_ping foo ---\n"
ollama_api_ping foo
printf "\n--- Testing ollama_list bar baz ---\n"
ollama_list bar baz

echo -e "\n\n--- Test complete ---"
