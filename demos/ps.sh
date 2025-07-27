#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Ps"
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

echo "ollama_ps:"
echo
ollama_ps

echo
echo "ollama_ps_json:"
echo
ollama_ps_json | jq "."
