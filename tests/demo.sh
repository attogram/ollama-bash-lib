#!/usr/bin/env bash

echo "Ollama Bash Lib Demo"
spacer="--------------------------------------------------------------------"
echo "$spacer"

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: ollamaBashLib not found: $ollamaBashLib"
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

echo "$spacer"
if [ "$(isOllamaInstalled)" -eq 0 ]; then
  echo "OK: Ollama installed locally"
else
  echo "ERROR: Ollama not installed locally"
  exit 1
fi


echo "$spacer"; echo "ollama ps:"; ollamaPs
echo "$spacer"; echo "ollama list:"; ollamaList
echo "$spacer"; echo "ollama show gemma3n:e4b:"; ollama show "gemma3n:e4b"

echo "$spacer"; echo -n "ollama version: "; ollamaVersion
echo "$spacer"; echo "ollama help:"; ollamaHelp
echo "$spacer"; echo "ollama help run:"; ollamaHelpRun
echo "$spacer"; echo "ollama help show:"; ollamaHelpShow

echo "$spacer"
