#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Show - 1 Model"
spacer="--------------------------------------------------------------------"
echo "$spacer"

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib Not Found: $ollamaBashLib"
  exit 1
fi

# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"

if ! ollamaIsInstalled; then
  echo "Error: Ollama is not installed"
  exit 1
fi

model=$(ollamaGetRandomModel)
echo "model: $model"
echo
echo "ollamaShow:"
echo
ollamaShow "$model"

echo "$spacer"
echo "ollamaShowJson:"
echo
ollamaShowJson "$model" | jq "."

echo "$spacer"
