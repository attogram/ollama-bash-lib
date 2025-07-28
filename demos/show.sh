#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - ollama_show, ollama_show_json"
echo

load_ollama_bash_lib() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh"; echo "ollama_bash_lib: $ollama_bash_lib"
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  echo; echo -n "ollama_installed: "; if ! ollama_installed; then echo "ERROR: Ollama Not Found"; exit 1; fi; echo "YES"; echo
}

load_ollama_bash_lib

model=$(ollama_model_random)
echo "model: $model"

echo
echo "ollama_show \"$model\""
echo
ollama_show "$model"

echo
echo "ollama_show_json \"$model\""
echo
ollama_show_json "$model" | jq "."
