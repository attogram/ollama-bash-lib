#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Generate a completion - Streaming"
echo

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi

# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"

if ! ollamaIsInstalled; then
  echo "Error: Ollama is not installed"
  exit 1
fi

model="$(ollamaGetRandomModel)"
echo "model: $model"

ollamaClearModel "$model"

prompt="Describe a rabbit in 3 words"
echo "prompt: $prompt"
echo
echo "ollamaGenerateStreaming:"
echo
ollamaGenerateStreaming "$model" "$prompt" | jq "."
