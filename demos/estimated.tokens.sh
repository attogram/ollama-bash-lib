#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Estimated Tokens"

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
echo "ollamaEstimatedTokens:"
OLLAMA_BASH_LIB_DEBUG=0

echo
string="My hovercraft is full of eels"
echo "$string"
echo -n "tokens : "
ollamaEstimatedTokens "$string"
echo -n "verbose: "
ollamaEstimatedTokens "$string" 1

echo
string="我的气垫船上满是鳗鱼" # Simplified Chinese "My hovercraft is full of eels"
echo "$string"
echo -n "tokens : "
ollamaEstimatedTokens "$string"
echo -n "verbose: "
ollamaEstimatedTokens "$string" 1

echo
echo "(contents of ../README.md)"
echo -n "tokens : "
ollamaEstimatedTokens "../README.md"
echo -n "verbose: "
ollamaEstimatedTokens "../README.md" 1

echo
echo "(contents of ../ollama-bash-lib.sh)"
echo -n "tokens : "
ollamaEstimatedTokens "../ollama-bash-lib.sh"
echo -n "verbose: "
ollamaEstimatedTokens "../ollama-bash-lib.sh" 1

echo
echo "ollamaEstimatedTokens: (OLLAMA_BASH_LIB_DEBUG=1)"
OLLAMA_BASH_LIB_DEBUG=1

echo
string="My hovercraft is full of eels"
echo "$string"
ollamaEstimatedTokens "$string" 1

echo
string="我的气垫船上满是鳗鱼" # Simplified Chinese "My hovercraft is full of eels"
echo "$string"
ollamaEstimatedTokens "$string" 1

echo
echo "(contents of ../README.md)"
ollamaEstimatedTokens "../README.md" 1

echo
echo "(contents of ../ollama-bash-lib.sh)"
ollamaEstimatedTokens "../ollama-bash-lib.sh" 1
