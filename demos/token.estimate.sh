#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - estimate_tokens"
echo

load_ollama_bash_lib() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh"; echo "ollama_bash_lib: $ollama_bash_lib"
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  echo; echo -n "ollama_installed: "; if ! ollama_installed; then echo "ERROR: Ollama Not Found"; exit 1; fi; echo "YES"; echo
}

load_ollama_bash_lib

echo "estimate_tokens \"string\""
echo "estimate_tokens \"string\" 1 (verbose)"
OLLAMA_BASH_LIB_DEBUG=0

echo
string="My hovercraft is full of eels"
echo "$string"
echo -n "tokens : "
estimate_tokens "$string"
echo -n "verbose: "
estimate_tokens "$string" 1

echo
string="我的气垫船上满是鳗鱼" # Simplified Chinese "My hovercraft is full of eels"
echo "$string"
echo -n "tokens : "
estimate_tokens "$string"
echo -n "verbose: "
estimate_tokens "$string" 1

echo
echo "(contents of ../README.md)"
echo -n "tokens : "
estimate_tokens ../README.md
echo -n "verbose: "
estimate_tokens ../README.md 1

echo
echo "(contents of ../ollama_bash_lib.sh)"
echo -n "tokens : "
estimate_tokens < ../ollama_bash_lib.sh
echo -n "verbose: "
estimate_tokens < ../ollama_bash_lib.sh 1
