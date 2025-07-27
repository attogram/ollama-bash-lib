#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Review ollama-bash-lib.sh - Non-streaming"
echo

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib Not Found: $ollamaBashLib"
  exit 1
fi

# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"
if ! ollamaIsInstalled; then
  echo "Error: Ollama Not Installed"
  exit 1
fi

model=$(ollamaGetRandomModel)

ollamaClearModel "$model"

echo "model: $model"

prompt="Act as an expert Software Engineer.
Do a full code review of this script:"

echo "prompt: $prompt"
echo "file: $ollamaBashLib"

prompt+="

ollama-bash-lib.sh:

$(cat "$ollamaBashLib")
"

echo
ollamaGenerateStreaming "$model" "$prompt"
