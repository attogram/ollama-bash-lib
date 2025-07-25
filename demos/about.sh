#!/usr/bin/env bash

echo "Ollama Bash Lib - About"
spacer="--------------------------------------------------------------------"
echo "$spacer"

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi

# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"

echo "Ollama Bash Lib: $ollamaBashLib"

echo -n "ollamaIsInstalled: "
if ! ollamaIsInstalled; then
  echo "NO"
  exit 1
fi
echo "YES"

echo "$spacer"
echo "ollamaBashLibAbout:"
echo
ollamaBashLibAbout
echo
echo "$spacer"
