#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - List"
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

echo "ollamaList:"
echo
ollamaList

echo "$spacer"
echo "ollamaListJson:"
echo
ollamaListJson | jq "."

echo "$spacer"
