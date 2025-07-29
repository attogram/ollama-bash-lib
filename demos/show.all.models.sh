#!/usr/bin/env bash

echo "# ollama_show - All Models"
echo

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_installed; then echo "ERROR: Ollama Not Found: $ollama_bash_lib"; exit 1; fi;
  if ! ollama_api_ping; then echo "ERROR: API not reachable"; exit 1; fi
  echo "A demo of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

models=($(ollama_list_array))
if [[ -z "${models[*]}" ]]; then
  echo "Error: No models found in Ollama"
  exit 1
fi

echo '```'

echo "models: ${models[*]}"
echo "# models: ${#models[@]}"

# Show model info for all models
for model in "${models[@]}"; do
  echo
  echo "ollama_show: $model"
  echo
  ollama_show "$model"
  echo
  echo "ollama_show_json: $model"
  echo
  ollama_show_json "$model" | jq "."
done

echo '```'