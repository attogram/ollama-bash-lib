#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - ollama_ps, ollama_ps_json"

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh"; echo "ollama_bash_lib: $ollama_bash_lib"
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  echo "ollama_lib_version: v$(ollama_lib_version)"
echo -n "ollama_installed: "; if ! ollama_installed; then echo "ERROR: Ollama Not Found"; exit 1; fi; echo "OK";
}

startup

echo
echo "ollama_ps"
echo
ollama_ps

echo
echo "ollama_ps_json"
echo
ollama_ps_json | jq "."
