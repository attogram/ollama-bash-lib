#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - ollama_generate_stream"
echo

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh"; echo "ollama_bash_lib: $ollama_bash_lib"
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  echo -n "ollama_installed: "; if ! ollama_installed; then echo "ERROR: Ollama Not Found"; exit 1; fi; echo "YES";
}

startup

model="$(ollama_model_random)"
echo "model: $model"
echo

prompt="Describe a rabbit in 3 short sentences"
echo "prompt: $prompt"
echo

echo "ollama_generate_stream \"$model\" \"$prompt\""
echo
ollama_generate_stream "$model" "$prompt"
