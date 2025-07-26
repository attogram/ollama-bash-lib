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

result="$(ollamaGenerate "$model" "$prompt")"

echo
echo "$result" | jq -r ".response"

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
}

echo
stats "$result"
