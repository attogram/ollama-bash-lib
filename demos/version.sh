#!/usr/bin/env bash

echo "# ollama_version, ollama_version_json, ollama_version_cli"

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

echo
echo "ollama_version"
echo
ollama_version

echo
echo "ollama_version_json"
echo
ollama_version_json | jq "."

echo
echo "ollama_version_cli"
echo
ollama_version_cli

echo '```'
