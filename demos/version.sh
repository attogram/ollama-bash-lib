#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Version"
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

echo "ollama_version:"
echo
ollama_version
echo
echo

echo "ollama_version_json:"
echo
ollama_version_json | jq "."
echo
echo

echo "ollama_version_cli:"
echo
ollama_version_cli
