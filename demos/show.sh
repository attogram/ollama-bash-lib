#!/usr/bin/env bash

echo "# ollama_show, ollama_show_json"

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_installed; then echo "ERROR: Ollama Not Installed"; fi;
  if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi
  echo; echo "A demo of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

echo '```'

model=$(ollama_model_random)
echo
echo "model: $model"

echo
echo "ollama_show \"$model\""
echo
ollama_show "$model"

echo
echo "ollama_show_json \"$model\""
echo
ollama_show_json "$model" | jq "."
echo '```'