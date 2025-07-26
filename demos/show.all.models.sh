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

if ! ollamaIsInstalled; then
  echo "Error: Ollama is not installed"
  exit 1
fi

models=($(ollamaListArray))
if [[ -z "${models[*]}" ]]; then
  echo "Error: No models found in Ollama"
  exit 1
fi

echo "models: ${models[*]}"
echo "# models: ${#models[@]}"

# Show model info for all models
for model in "${models[@]}"; do
  echo
  echo "ollamaShow: $model"
  echo
  ollamaShow "$model"
  echo
  echo "ollamaShowJson: $model"
  echo
  ollamaShowJson "$model" | jq "."
done
