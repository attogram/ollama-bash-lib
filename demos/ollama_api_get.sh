#!/usr/bin/env bash

echo '# ollama_api_get'

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
  echo
  echo '```'
  echo 'ollama_api_get'
  echo
  result=$(ollama_api_get)
  echo "result: lines: $(echo "$result" | wc -l)"
  echo "result: output: ${result:0:42}"
  echo '```';

  echo
  echo '```'
  echo 'ollama_api_get -P "/api/version"'
  echo
  result=$(  ollama_api_get -P "/api/version")
  echo "result: lines: $(echo "$result" | wc -l)"
  echo "result: output: ${result:0:42}"
  echo '```';
}

echo; echo '## Setup'; echo
echo "OLLAMA_HOST: $OLLAMA_HOST"
echo
echo "OBL_API: $OBL_API"
echo

echo; echo '## Demo'; echo
demo

echo; echo '## Demo Debug'
echo
echo "\`export OBL_DEBUG=1\`"; echo;
export OBL_DEBUG=1
demo
export OBL_DEBUG=0
