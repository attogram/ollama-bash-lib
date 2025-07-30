#!/usr/bin/env bash

echo "# Review of README.md"

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

model="$(ollama_model_random)"

echo
echo '```bash'
echo 'prompt="Act as an expert Software Engineer.
Do a full review of this README:

$(cat "../README.md")"'
echo "ollama_generate_stream \"$model\" \"\$prompt\""
echo '```'

prompt="Act as an expert Software Engineer.
Do a full review of this README:

$(cat "../README.md")"

ollama_generate_stream "$model" "$prompt"
