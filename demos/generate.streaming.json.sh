#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Generate a completion, streaming, JSON version"
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
echo

prompt="Describe a rabbit in 3 short sentences"
echo "prompt: $prompt"
echo

echo "ollamaGenerateStreamingJson:"
echo
ollamaGenerateStreamingJson "$model" "$prompt" | jq "."

echo
