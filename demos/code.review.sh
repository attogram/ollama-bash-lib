#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Code Review - Non-streaming"
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

prompt="This is the Ollama Bash Lib.
Act as an expert Software Engineer.
Do a full code review of this script:"
echo "prompt: $prompt"
echo "file: $ollamaBashLib"

prompt+="

ollama-bash-lib.sh:

$(cat "$ollamaBashLib")
"

result="$(ollamaGenerate "$model" "$prompt")"

echo
echo "$result" | jq -r ".response"
