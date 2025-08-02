#!/usr/bin/env bash

echo '# Send a list of prompts to a model'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_installed; then echo "ERROR: Ollama Not Installed"; fi;
  if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

model="$(ollama_model_random)"

prompts=(
  "My hovercraft is full of eels"
  "Explain the theory of relativity in very simple terms."
  "Invent a new holiday and describe how people celebrate it."
  "If a train travels at 60 miles per hour for 3 hours, how far does it go?"
  "Translate to French: 'The weather is nice today.'"
  "Is the following review positive or negative? 'I loved the movie, it was fantastic!'"
  "If all cats are animals and some animals are playful, can we say some cats are playful?"
  "Write a Bash function that returns the sum of a list of numbers."
  "If you drop a glass on the floor, what is most likely to happen?"
  "A rectangle has a length of 10 meters and a width of 4 meters. What is its area?"
  "What is the largest ocean on Earth?"
)

echo
echo "model: $model"
echo
echo "prompts:"
for prompt in "${prompts[@]}"; do
  tag=$(echo "$prompt" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr ' ' '-')
  printf '* [%s](#%s)\n' "$prompt" "$tag"
done

for prompt in "${prompts[@]}"; do
  echo
  echo "## $prompt"
  echo
  #echo '```'
  ollama_generate "$model" "$prompt"
  #ollama_generate_stream "$model" "$prompt"
  #echo '```'
done
