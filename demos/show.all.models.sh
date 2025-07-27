#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Show - All Models"
echo

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi

# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"

if ! ollama_installed; then
  echo "Error: Ollama is not installed"
  exit 1
fi

models=($(ollama_list_array))
if [[ -z "${models[*]}" ]]; then
  echo "Error: No models found in Ollama"
  exit 1
fi

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
