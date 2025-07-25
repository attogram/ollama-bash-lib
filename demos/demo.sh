#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo"
spacer="--------------------------------------------------------------------"
echo "$spacer"

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi

# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"

echo "Ollama Bash Lib Location : $ollamaBashLib"
echo "OLLAMA_BASH_LIB_NAME     : $OLLAMA_BASH_LIB_NAME"
echo "OLLAMA_BASH_LIB_VERSION  : $OLLAMA_BASH_LIB_VERSION"
echo "OLLAMA_BASH_LIB_URL      : $OLLAMA_BASH_LIB_URL"
echo "OLLAMA_BASH_LIB_LICENSE  : $OLLAMA_BASH_LIB_LICENSE"
echo "OLLAMA_BASH_LIB_COPYRIGHT: $OLLAMA_BASH_LIB_COPYRIGHT"
echo "OLLAMA_BASH_LIB_DEBUG    : $OLLAMA_BASH_LIB_DEBUG"
echo "OLLAMA_BASH_LIB_API      : $OLLAMA_BASH_LIB_API"

echo -n "ollamaIsInstalled        : "
if ! ollamaIsInstalled; then
  echo "NO"
  exit 1
fi
echo "YES"

echo "$spacer"
echo "Ollama Bash Lib Functions:"
echo
compgen -A function

echo "$spacer"
