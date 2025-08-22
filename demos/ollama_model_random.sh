#!/usr/bin/env bash

echo '# ollama_model_random'

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

demo() {
  local debug="$1"
  echo '```bash'
  if [[ "$debug" -gt 0 ]]; then echo 'OBL_DEBUG=1'; fi
  echo 'ollama_model_random'
  # shellcheck disable=SC2016
  echo 'model="$(ollama_model_random)"; echo "$model"'
  echo '```'
  echo '```'
  if [[ "$debug" -gt 0 ]]; then OBL_DEBUG=1; fi
  ollama_model_random
  model="$(ollama_model_random)"; echo "$model"
  echo '```'
}

echo; echo '## Demo'; echo
demo

echo; echo '## Demo Debug'; echo
demo 1
