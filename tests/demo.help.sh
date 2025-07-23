#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Help"
spacer="--------------------------------------------------------------------"
echo "$spacer"

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi
# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"

echo "ollamaHelp:"
ollamaHelp

echo "$spacer"
echo "ollamaHelpRun:"
ollamaHelpRun

echo "$spacer"
echo "ollamaHelpShow:"
ollamaHelpShow

echo "$spacer"
