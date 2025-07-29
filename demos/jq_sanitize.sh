#!/usr/bin/env bash

echo "# jq_sanitize"

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

echo '```'

good_json='{"value":"abc\ndef"}'
echo
echo "good_json: $good_json"
echo
echo "jq_sanitize \"$good_json\""
echo
jq_sanitize "$good_json"

bad_json='{"value":"abc
def"}'
echo
echo "bad_json: $bad_json"
echo
echo "jq_sanitize \"$bad_json\""
echo
jq_sanitize "$bad_json"

echo '```'
