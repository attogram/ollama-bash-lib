#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Review README.md - Non-streaming"
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
Do a full review of this README:"

echo "prompt: $prompt"
echo "../README.md"

prompt+="

README.md

$(cat "../README.md")
"

echo
ollama_generate_stream "$model" "$prompt"
