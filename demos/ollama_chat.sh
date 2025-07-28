#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - ollama_chat"
echo

load_ollama_bash_lib() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh"; echo "ollama_bash_lib: $ollama_bash_lib"
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  echo; echo -n "ollama_installed: "; if ! ollama_installed; then echo "ERROR: Ollama Not Found"; exit 1; fi; echo "YES"; echo
}

load_ollama_bash_lib

model=$(ollama_random_model)
echo "model: $model"

echo
echo "$(ollama_messages_count) messages:"; ollama_messages

echo
echo 'ollama_messages_add "system" "You are a helpful assistant"'
ollama_messages_add "system" "You are a helpful assistant"
echo 'ollama_messages_add "user" "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"'
ollama_messages_add "user" "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
echo; echo "$(ollama_messages_count) messages:"; ollama_messages; echo

echo "ollama_chat \"$model\""; echo
response="$(ollama_chat "$model")"
echo "$response"

echo
echo 'ollama_messages_add "assistant" "RESPONSE"'
ollama_messages_add "assistant" "$response"
echo "ollama_messages_add \"user\" \"What's the secret word??\""
ollama_messages_add "user" "What's the secret word??"
echo; echo "$(ollama_messages_count) messages:"; ollama_messages; echo

echo "ollama_chat \"$model\""; echo
response="$(ollama_chat "$model")"
echo "$response"