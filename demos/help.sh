#!/usr/bin/env bash

echo '# help via -h and --help'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  #if ! ollama_app_installed; then echo "ERROR: Ollama Not Installed"; fi;
  #if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

# List of all public functions in the library
functions=(
  ollama_api_get oag
  ollama_api_post oap
  ollama_api_ping oapi
  ollama_generate_json ogj
  ollama_generate og
  ollama_generate_stream_json ogsj
  ollama_generate_stream ogs
  ollama_messages om
  ollama_messages_add oma
  ollama_messages_clear omc
  ollama_messages_count omco
  ollama_tools_add ota
  ollama_tools oto
  ollama_tools_count otco
  ollama_tools_clear otc
  ollama_tools_is_call otic
  ollama_tools_run otr
  ollama_chat_json ocj
  ollama_chat oc
  ollama_chat_stream ocs
  ollama_chat_stream_json ocsj
  ollama_list ol
  ollama_list_json olj
  ollama_list_array ola
  ollama_model_random omr
  ollama_model_unload omu
  ollama_ps op
  ollama_ps_json opj
  ollama_show os
  ollama_show_json osj
  ollama_app_installed oai
  ollama_app_turbo oat
  ollama_app_vars oav
  ollama_app_version oave
  ollama_app_version_json oavj
  ollama_app_version_cli oavc
  ollama_thinking ot
  ollama_lib_about olab
  ollama_lib_version olv
  ollama_eval oe
)

echo '## Testing -h for all functions (first argument)'
echo
for func in "${functions[@]}"; do
  # shellcheck disable=SC2016
  printf '`%s -h`\n```\n%s\n```\n' "$func" "$("$func" -h)"
  echo
done

#echo '## Testing --help for all functions (first argument)'
#echo
#for func in "${functions[@]}"; do
#  # shellcheck disable=SC2016
#  printf '`%s --help`\n```\n%s\n```\n' "$func" "$("$func" --help)"
#  echo
#done
