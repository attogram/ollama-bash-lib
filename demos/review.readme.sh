#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Review README.md - Non-streaming"
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
Do a full review of this README:"

echo "prompt: $prompt"
echo "../README.md"

prompt+="

README.md

$(cat "../README.md")
"

echo
ollamaGenerateStreaming "$model" "$prompt"
