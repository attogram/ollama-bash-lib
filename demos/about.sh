#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - About"
echo

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi

# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"


echo "Ollama Bash Lib: $ollamaBashLib"
echo

echo -n "ollama_installed: "
if ! ollama_installed; then
  echo "NO"
  exit 1
fi
echo "YES"

echo
echo "ollama_about_lib:"
echo
ollama_about_lib
