#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - ollama_generate - Interactive"
echo

load_ollama_bash_lib() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh"; echo "ollama_bash_lib: $ollama_bash_lib"
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  echo; echo -n "ollama_installed: "; if ! ollama_installed; then echo "ERROR: Ollama Not Found"; exit 1; fi; echo "YES"; echo
}

load_ollama_bash_lib

echo "ollama_generate (No memory of previous messages)"

model="$(ollama_random_model)"
echo; echo "model: $model"

echo; echo "Press Control-C to exit"

while true; do
  echo; echo -n "prompt: "
  read -r prompt # Read prompt from user input
  result="$(ollama_generate "$model" "$prompt")"
  echo
  echo "$result"
done
