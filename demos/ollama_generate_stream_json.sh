#!/usr/bin/env bash

echo '# ollama_generate_stream_json'

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

model="$(ollama_model_random)"
prompt="Describe a rabbit in 2 short sentences"

echo
echo '## Demo'
echo
echo '```bash'
echo "ollama_generate_stream_json \"$model\" \"$prompt\""
echo '```'
echo '```json'
ollama_generate_stream_json "$model" "$prompt"
echo '```'

echo
echo "## Demo Debug"
echo
echo '```bash'
echo "\`OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json \"$model\" \"$prompt\"\`"
echo '```'
echo '```json'
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "$model" "$prompt"
echo '```'
