#!/usr/bin/env bash

echo '# ollama_generate_stream_json'

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

model="$(ollama_model_random)"
prompt="Describe a rabbit in 3 words"

echo
echo '## Demo'
echo
echo '```bash'
echo "ollama_generate_stream_json -m \"$model\" -p \"$prompt\""
echo
echo '```'
echo '```json'
ollama_generate_stream_json -m "$model" -p "$prompt" | jq
echo '```'

echo
echo '## Demo Debug'
echo
echo '```bash'
echo "OBL_DEBUG=1 ollama_generate_stream_json -m \"$model\" -p \"$prompt\""
echo
echo '```'
echo '```json'
OBL_DEBUG=1 ollama_generate_stream_json -m "$model" -p "$prompt" | jq
echo '```'
