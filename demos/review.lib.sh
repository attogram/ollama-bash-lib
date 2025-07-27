#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Review ollama_bash_lib.sh - Non-streaming"
echo

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama_bash_lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib Not Found: $ollamaBashLib"
  exit 1
fi

# shellcheck source=../ollama_bash_lib.sh
source "$ollamaBashLib"
if ! ollama_installed; then
  echo "Error: Ollama Not Installed"
  exit 1
fi

model=$(ollama_random_model)

ollama_unload_model "$model"

echo "model: $model"
echo

prompt="Act as an expert Software Engineer.
Do a full code review of this script:"

echo "prompt: $prompt"
echo "file: $ollamaBashLib"

prompt+="

ollama_bash_lib.sh:

$(cat "$ollamaBashLib")
"

echo
ollama_generate_stream "$model" "$prompt"
