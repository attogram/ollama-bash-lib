#!/usr/bin/env bash

echo '# ollama_chat'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_installed; then echo "ERROR: Ollama Not Found: $ollama_bash_lib"; exit 1; fi;
  if ! ollama_api_ping; then echo "ERROR: API not reachable"; exit 1; fi
  echo "A demo of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

model=$(ollama_model_random)

echo
echo '## Demo'
echo

echo '```'
echo 'ollama_messages_add "system" "You are a helpful assistant"'
ollama_messages_add "system" "You are a helpful assistant"
echo 'ollama_messages_add "user" "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"'
ollama_messages_add "user" "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
echo
echo "$(ollama_messages_count) messages:"
ollama_messages
echo '```'

echo
echo '```'
echo "response=\"\$(ollama_chat \"$model\")\""
echo '```'

echo
echo '```'
response="$(ollama_chat "$model")"
echo "$response"
echo '```'

echo
echo '```'
echo 'ollama_messages_add "assistant" "$response"'
ollama_messages_add "assistant" "$response"
echo '```'

echo
echo '```'
echo "ollama_messages_add \"user\" \"What's the secret word??\""
ollama_messages_add "user" "What's the secret word??"
echo
echo "$(ollama_messages_count) messages:"
ollama_messages
echo '```'

echo
echo '```'
echo "ollama_chat \"$model\""
echo '```'

echo
echo '```'
response="$(ollama_chat "$model")"
echo "$response"
echo '```'
