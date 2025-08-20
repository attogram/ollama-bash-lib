#!/usr/bin/env bash

echo '# Prompt all models'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_app_installed; then echo 'ERROR: Ollama Not Installed'; fi;
  if ! ollama_api_ping; then echo 'ERROR: Ollama API not reachable'; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup


echo
echo '```bash'
echo 'prompt="What is your knowledge cutoff date? Respond with only the date."'
echo
# shellcheck disable=SC2016
echo 'IFS=" " read -r -a models <<< "$(ollama_list_array)"'
echo
# shellcheck disable=SC2016
echo 'for model in "${models[@]}"; do'
# shellcheck disable=SC2016
echo '  ollama_generate "$model" "$prompt"'
echo 'done'
echo '```'

prompt="What is your knowledge cutoff date? Respond with only the date."
IFS=" " read -r -a models <<< "$(ollama_list_array)"

echo "${#models[@]} models: ${models[*]}"
echo
echo "prompt: $prompt"

for model in "${models[@]}"; do
  echo
  echo "## $model"
  echo '```'
  ollama_generate "$model" "$prompt"
  #ollama_generate_stream "$model" "$prompt"
  echo '```'
done
