#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Show - 1 Model"
echo

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama_bash_lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib Not Found: $ollamaBashLib"
  exit 1
fi

# shellcheck source=../ollama_bash_lib.sh
source "$ollamaBashLib"

if ! ollama_installed; then
  echo "Error: Ollama is not installed"
  exit 1
fi

model=$(ollama_random_model)
echo "model: $model"
echo
echo "ollama_show:"
echo
ollama_show "$model"

echo
echo "ollama_show_json:"
echo
ollama_show_json "$model" | jq "."
