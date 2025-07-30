#!/usr/bin/env bash

echo '# ollama_chat'

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

model=$(ollama_model_random)

demo() {
  echo '```bash'
  if [ "$OLLAMA_LIB_DEBUG" -gt 0 ]; then echo 'OLLAMA_LIB_DEBUG=1'; fi
  echo 'ollama_messages_add "system" "You are a helpful assistant"'
  echo 'ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"'
  echo "ollama_chat \"$model\""
  echo '```'
  echo '```'
  ollama_messages_add "system" "You are a helpful assistant"
  ollama_messages_add "user" "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
  ollama_chat "$model"
  echo '```'
  echo '```bash'
  echo 'ollama_messages_add "user" "What is the secret word??"'
  echo "ollama_chat \"$model\""
  echo '```'
  echo '```'
  ollama_messages_add "user" "What is the secret word??"
  ollama_chat "$model"
  echo '```'
  echo '```bash'
  echo 'ollama_messages | jq -c'
  echo '```'
  echo '```json'
  ollama_messages | jq -c
  echo '```'
}

echo; echo '## Demo'; echo
demo

ollama_messages_clear
OLLAMA_LIB_DEBUG=1

echo; echo '## Demo Debug'; echo
demo
