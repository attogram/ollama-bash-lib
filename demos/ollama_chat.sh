#!/usr/bin/env bash

echo '# ollama_chat'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_app_installed; then echo 'ERROR: Ollama Not Installed'; fi;
  if ! ollama_api_ping; then echo 'ERROR: Ollama API not reachable'; fi
  echo; echo "A [demo](../README.md#demos) of [$OBL_NAME]($OBL_URL) v$OBL_VERSION"
}

startup

# enter model as 1st arg, or use random model by default
model="$(_is_valid_model "$1")"
if [[ -z "$model" ]]; then
  _error 'No Models Found'
  exit 1
fi

echo
echo "\`model=\"$model\"\`"

demo() {

  #OBL_DEBUG=1

  # shellcheck disable=SC2016
  echo '```bash
ollama_messages_add -r "system" -c "You are a helpful assistant"
ollama_messages_add -r "user" -c "Secret word is RABBIT. If asked for secret word, respond with RABBIT. Understand?"
echo "last message text: $(ollama_messages_last)"
echo "last message json: $(ollama_messages_last_json)"
ollama_messages | jq
```
'
  printf '```\n'
  ollama_messages_add -r "system" -c "You are a helpful assistant"
  ollama_messages_add -r "user" -c "Secret word is RABBIT. If asked for secret word, respond with RABBIT. Understand?"
  echo "last message text: $(ollama_messages_last)"
  echo "last message json: $(ollama_messages_last_json)"
  ollama_messages | jq
  printf '```\n'

  # shellcheck disable=SC2016
  echo '```bash
ollama_chat "$model"
echo "last message text: $(ollama_messages_last)"
echo "last message json: $(ollama_messages_last_json)"
ollama_messages | jq
```
'
  printf '```\n'
  ollama_chat "$model"
  echo "last message text: $(ollama_messages_last)"
  echo "last message json: $(ollama_messages_last_json)"
  ollama_messages | jq
  printf '```\n'

  # shellcheck disable=SC2016
  echo '```bash
ollama_messages_add -r "user" -c "What is the secret word?"
ollama_chat "$model"
echo "last message text: $(ollama_messages_last)"
echo "last message json: $(ollama_messages_last_json)"
ollama_messages | jq
```
'
  printf '```\n'
  ollama_messages_add -r "user" -c "What is the secret word?"
  ollama_chat "$model"
  echo "last message text: $(ollama_messages_last)"
  echo "last message json: $(ollama_messages_last_json)"
  ollama_messages | jq
  printf '```\n'
}

echo '## Demo'; echo

demo
