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
echo "Ollama Bash Lib Location: $ollamaBashLib"
echo "OLLAMA_BASH_LIB_NAME    : $OLLAMA_BASH_LIB_NAME"
echo "OLLAMA_BASH_LIB_VERSION : $OLLAMA_BASH_LIB_VERSION"
echo "OLLAMA_BASH_LIB_URL     : $OLLAMA_BASH_LIB_URL"
echo "OLLAMA_BASH_LIB_LICENSE : $OLLAMA_BASH_LIB_LICENSE"
# shellcheck disable=SC2154
echo "apiUrl                  : $apiUrl"

if [ "$(isOllamaInstalled)" -eq 0 ]; then
  echo "isOllamaInstalled       : OK: Ollama installed locally"
else
  echo "isOllamaInstalled       : ERROR: Ollama not installed locally"
  exit 1
fi

echo -n "ollamaVersion           : "
ollamaVersion

echo "$spacer"
echo "ollamaList:"
ollamaList

echo "$spacer"
echo "ollamaPs:"
ollamaPs

echo "$spacer"
