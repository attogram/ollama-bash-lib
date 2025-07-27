#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Generate a completion, streaming, TEXT version"
echo

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi

# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"

if ! ollama_installed; then
  echo "Error: Ollama is not installed"
  exit 1
fi

model="$(ollama_random_model)"
echo "model: $model"
echo

prompt="Describe a rabbit in 3 short sentences"
echo "prompt: $prompt"
echo

echo "ollama_generate_stream:"
echo
ollama_generate_stream "$model" "$prompt"
