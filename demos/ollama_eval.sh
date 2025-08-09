#!/usr/bin/env bash

echo '# ollama_eval, oe'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  #if ! ollama_app_installed; then echo "ERROR: Ollama Not Installed"; fi;
  #if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

#OLLAMA_LIB_DEBUG=1
#OLLAMA_LIB_SAFE_MODE=1

echo '## Usage'
echo '```bash'
echo 'ollama_eval "task"          # generate command with random model'
echo 'ollama_eval "task" "model"  # generate command with specific model'
echo 'oe "task"                   # alias for ollama_eval'
echo 'oe "task" "model"           # alias for ollama_eval'
echo '```'
echo

demo() {
  local task='show me all shell files in current directory'
  echo -n '`'; echo -n "oe \"$task\""; echo '`'; echo; echo '```'
  echo 'y' | oe "$task"; echo; echo '```'; echo

  task='get system load'
  echo -n '`'; echo -n "oe \"$task\""; echo '`'; echo; echo '```'
  echo 'y' | oe "$task"; echo; echo '```'; echo
}

demo


