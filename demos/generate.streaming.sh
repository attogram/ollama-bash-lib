#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Generate a completion"
spacer="--------------------------------------------------------------------"
echo "$spacer"

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
echo "ollamaGetRandomModel: $model"

prompt="Answer with 3 words or less to this prompt: Hi"
echo "prompt: $prompt"

echo "$spacer"
echo "ollamaGenerateStreaming:"
ollamaGenerateStreaming "$model" "$prompt" | jq "."
