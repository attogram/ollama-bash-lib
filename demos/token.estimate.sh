#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Token Estimate"

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama_bash_lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi

# shellcheck source=../ollama_bash_lib.sh
source "$ollamaBashLib"
if ! ollama_installed; then
  echo "Error: Ollama Not Installed"
  exit 1
fi

echo
echo "estimate_tokens:"
OLLAMA_BASH_LIB_DEBUG=0

echo
string="My hovercraft is full of eels"
echo "$string"
echo -n "tokens : "
estimate_tokens "$string"
echo -n "verbose: "
estimate_tokens "$string" 1

echo
string="我的气垫船上满是鳗鱼" # Simplified Chinese "My hovercraft is full of eels"
echo "$string"
echo -n "tokens : "
estimate_tokens "$string"
echo -n "verbose: "
estimate_tokens "$string" 1

echo
echo "(contents of ../README.md)"
echo -n "tokens : "
estimate_tokens ../README.md
echo -n "verbose: "
estimate_tokens ../README.md 1

echo
echo "(contents of ../estimate_tokens.sh)"
echo -n "tokens : "
estimate_tokens < ../ollama_bash_lib.sh
echo -n "verbose: "
estimate_tokens < ../ollama_bash_lib.sh 1
