#!/usr/bin/env bash

echo '# ollama_chat interactive'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_installed; then echo "ERROR: Ollama Not Installed"; fi;
  if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

shutdown() {
  echo
  echo '```'
  echo 'Control-C shutdown'
  echo
  echo "$(ollama_messages_count) Messages:"
  echo '```json'
  ollama_messages | jq -c
  echo '```'
  exit 0
}

startup

model="$(ollama_model_random)"

echo
echo '```'
echo "ollama_chat with model: $model"
echo; echo 'Press Control-C to view message history and exit'

trap 'shutdown' SIGINT

ollama_messages_clear
ollama_messages_add "system" "You are a helpful assistant"

while true; do
  echo
  echo -n '>>> '
  read -r prompt
  echo
  ollama_messages_add "user" "$prompt"
  response=$(ollama_chat "$model" "$prompt")
  echo "$response"
  ollama_messages_add "assistant" "$response"
done
