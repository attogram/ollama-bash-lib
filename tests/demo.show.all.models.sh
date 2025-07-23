#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Models"
spacer="--------------------------------------------------------------------"
echo "$spacer"

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi
# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"

# shellcheck disable=SC2207
models=($(ollamaListArray))
if [[ -z "${models[*]}" ]]; then
  echo "Error: No models found in Ollama"
  exit 1
fi

echo "models  : ${models[*]}"
echo "# models: ${#models[@]}"

# Show model info for all models
for model in "${models[@]}"; do
  echo "$spacer"
  echo "model: $model"
  ollamaShow "$model"
done

echo "$spacer"
