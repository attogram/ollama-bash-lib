#!/usr/bin/env bash

echo '# ollama_chat'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_app_installed; then echo "ERROR: Ollama Not Installed"; fi;
  if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

# enter model as 1st arg, or use random model by default
model="$1"
if [ -z "$model" ]; then
  model="$(ollama_model_random)"
fi

demo() {

  echo '```bash'
  if [ "$OLLAMA_LIB_DEBUG" -gt 0 ]; then echo 'OLLAMA_LIB_DEBUG=1'; fi
  echo 'ollama_messages_add "system" "You are a helpful assistant"'
  echo 'ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"'
  echo "response=\"\$(ollama_chat \"$model\")\""
  printf '%s\n' "printf '%s\n' \"\$response\""
  echo "ollama_messages_add 'assistant' \"\$response\""
  echo '```'
  if [ "$OLLAMA_LIB_DEBUG" -gt 0 ]; then echo '```'; fi
  ollama_messages_add "system" "You are a helpful assistant"
  ollama_messages_add "user" "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
  response="$(ollama_chat "$model")"
  printf '%s\n' "$response"
  ollama_messages_add 'assistant' "$response"
  if [ "$OLLAMA_LIB_DEBUG" -gt 0 ]; then echo '```'; fi
  echo

  echo '```bash'
  echo 'ollama_messages_add "user" "What is the secret word??"'
  echo "response=\"\$(ollama_chat \"$model\")\""
  printf '%s\n' "printf '%s\n' \"\$response\""
  echo "ollama_messages_add 'assistant' \"\$response\""
  echo '```'
  if [ "$OLLAMA_LIB_DEBUG" -gt 0 ]; then echo '```'; fi
  ollama_messages_add "user" "What is the secret word??"
  response="$(ollama_chat "$model")"
  printf '%s\n' "$response"
  ollama_messages_add 'assistant' "$response"
  if [ "$OLLAMA_LIB_DEBUG" -gt 0 ]; then echo '```'; fi
  echo

  echo '```bash'
  echo 'ollama_messages | jq'
  echo '```'
  echo '```json'
  ollama_messages | jq
  echo '```'
}

echo; echo '## Demo'; echo
demo

ollama_messages_clear

OLLAMA_LIB_DEBUG=1
echo; echo '## Demo Debug'; echo
demo
OLLAMA_LIB_DEBUG=0
