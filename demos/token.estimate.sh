#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Token Estimate"

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi

# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"
if ! ollamaIsInstalled; then
  echo "Error: Ollama Not Installed"
  exit 1
fi

echo
echo "tokenEstimate:"
OLLAMA_BASH_LIB_DEBUG=0

echo
string="My hovercraft is full of eels"
echo "$string"
echo -n "tokens : "
tokenEstimate "$string"
echo -n "verbose: "
tokenEstimate "$string" 1

echo
string="我的气垫船上满是鳗鱼" # Simplified Chinese "My hovercraft is full of eels"
echo "$string"
echo -n "tokens : "
tokenEstimate "$string"
echo -n "verbose: "
tokenEstimate "$string" 1

echo
echo "(contents of ../README.md)"
echo -n "tokens : "
tokenEstimate ../README.md
echo -n "verbose: "
tokenEstimate ../README.md 1

echo
echo "(contents of ../ollama-bash-lib.sh)"
echo -n "tokens : "
tokenEstimate < ../ollama-bash-lib.sh
echo -n "verbose: "
tokenEstimate < ../ollama-bash-lib.sh 1
