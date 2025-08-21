#!/usr/bin/env bash

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_app_installed; then echo 'ERROR: Ollama Not Installed'; fi;
  if ! ollama_api_ping; then echo 'ERROR: Ollama API not reachable'; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

shutdown() {
  echo
  echo '```'
  echo 'Control-C shutdown'
  echo
  echo "$(ollama_messages_count) Messages:"
  echo
  echo '```json'
  ollama_messages | jq
  echo '```'
  exit 0
}

trap 'shutdown' SIGINT

startup

# enter model as 1st arg, or use random model by default
model="$1"
if [ -z "$model" ]; then
  model="$(ollama_model_random)"
fi

echo
echo "ollama_chat with $model"
echo '- Press Control-C exit'
echo '- To view message history type: /messages'

# start fresh
ollama_messages_clear

# Add System Prompt
ollama_messages_add -r 'system' -c 'You are a helpful assistant'

while true; do
  echo
  echo "[$(ollama_messages_count) messages in history]"
  echo -n '>>> '
  read -r prompt
  if [[ "$prompt" == '/messages' || "$prompt" == '/msgs' ]]; then
    echo "$(ollama_messages_count) messages:"; echo
    ollama_messages | jq
    continue
  fi;
  echo
  ollama_messages_add -r 'user' -c "$prompt" # Add user prompt to history
  ollama_chat -m "$model"

done
