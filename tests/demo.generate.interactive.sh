#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Generate a completion - Interactive"
spacer="--------------------------------------------------------------------"
echo "$spacer"
echo
echo "Press Control-C to exit"

ollamaBashLib="$(realpath "$(dirname "$0")/..")/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib not found: $ollamaBashLib"
  exit 1;
fi
# shellcheck source=../ollama-bash-lib.sh
source "$ollamaBashLib"

model="$(getRandomModel)"
echo
echo "getRandomModel: $model"

getDateTime() {
  echo
}

while true; do
  echo
  echo -n "Prompt: "
  read -r prompt # Read prompt from user input
  result="$(ollamaGenerate "$model" "$prompt")"
  response="$(echo "$result" | jq -r ".response")"
  echo
  echo -e "$response"
  echo
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
  echo "count   : $((prompt_eval_count + eval_count)) tokens (prompt eval: $prompt_eval_count) (eval: $eval_count)"
done
