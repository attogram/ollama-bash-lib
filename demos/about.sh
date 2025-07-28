#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - ollama_lib_version, ollama_lib_about"

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh"; echo "ollama_bash_lib: $ollama_bash_lib"
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  echo -n "ollama_installed: "; if ! ollama_installed; then echo "ERROR: Ollama Not Found"; exit 1; fi; echo "OK";
  echo -n "ollama_api_ping: "; if ! ollama_api_ping; then echo "ERROR: API not reachable"; fi; echo "OK";
}

startup

echo
echo "ollama_lib_version"
echo
ollama_lib_version

echo
echo "ollama_lib_about"
echo
ollama_lib_about

echo
