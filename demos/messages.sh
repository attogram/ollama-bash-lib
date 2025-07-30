#!/usr/bin/env bash

echo '# ollama_messages, ollama_messages_add, ollama_messages_count'

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

echo
echo -n "ollama_messages_count: "; ollama_messages_count
echo "ollama_messages:"; ollama_messages

echo
echo "ollama_messages_add \"system\" \"You are a helpful assistant\""
ollama_messages_add "system" "You are a helpful assistant"
echo -n "ollama_messages_count: "; ollama_messages_count
echo "ollama_messages:"; ollama_messages

echo
echo "ollama_messages_add \"user\" \"Hi\""
ollama_messages_add "user" "Hi"
echo -n "ollama_messages_count: "; ollama_messages_count
echo "ollama_messages:"; ollama_messages

echo
echo "ollama_messages_add \"assistant\" \"Hello!\""
ollama_messages_add "assistant" "Hello!"
echo -n "ollama_messages_count: "; ollama_messages_count
echo "ollama_messages:"; ollama_messages

echo
echo "ollama_messages_clear"
ollama_messages_clear
echo -n "ollama_messages_count: "; ollama_messages_count
echo "ollama_messages:"; ollama_messages

echo '```'
