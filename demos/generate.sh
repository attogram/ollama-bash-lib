#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Generate a completion - Non-streaming"
spacer="--------------------------------------------------------------------"
echo "$spacer"

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1
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

stats() {
  local result="$1"
  total_duration="$(echo "$result" | jq -r ".total_duration")"
  load_duration="$(echo "$result" | jq -r ".load_duration")"
  prompt_eval_count="$(echo "$result" | jq -r ".prompt_eval_count")"
  prompt_eval_duration="$(echo "$result" | jq -r ".prompt_eval_duration")"
  eval_count="$(echo "$result" | jq -r ".eval_count")"
  eval_duration="$(echo "$result" | jq -r ".eval_duration")"
  echo -n "duration: $(echo "scale=2 ; $total_duration / 1000000000" | bc | sed 's/^\./0./') seconds"
  echo -n " (load: $(echo "scale=2 ; $load_duration / 1000000000" | bc | sed 's/^\./0./'))"
  echo -n " (prompt eval: $(echo "scale=2 ; $prompt_eval_duration / 1000000000" | bc | sed 's/^\./0./'))"
  echo " (eval: $(echo "scale=2 ; $eval_duration / 1000000000" | bc | sed 's/^\./0./'))"
  local count=$((prompt_eval_count + eval_count))
  echo "count   : $count tokens (prompt eval: $prompt_eval_count) (eval: $eval_count)"
  context=$((context + count))
  echo "context : $context tokens"
}

echo
echo "ollamaGenerate:"
echo
result="$(ollamaGenerate "$model" "$prompt")"
response="$(echo "$result" | jq -r ".response")"
echo
echo -e "$response"
echo
stats "$result"

