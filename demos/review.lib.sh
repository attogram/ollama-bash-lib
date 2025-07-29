#!/usr/bin/env bash

echo "# Review of ollama_bash_lib.sh"

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

echo
echo '```bash'
echo 'prompt="Act as an expert Software Engineer.
Do a full review of this script:

$(cat "../ollama_bash_lib.sh")"'
echo "ollama_generate_stream \"$model\" \"\$prompt\""
echo '```'

prompt="Act as an expert Software Engineer.
Do a full review of this script:

$(cat "../ollama_bash_lib.sh")"

ollama_generate_stream "$model" "$prompt"