#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - Messages"
echo

load_ollama_bash_lib() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh"; echo "ollama_bash_lib: $ollama_bash_lib"
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  echo; echo -n "ollama_installed: "; if ! ollama_installed; then echo "ERROR: Ollama Not Found"; exit 1; fi; echo "YES"; echo
}

load_ollama_bash_lib

OLLAMA_LIB_DEBUG=0

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
