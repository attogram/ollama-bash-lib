#!/usr/bin/env bash

echo "Ollama Bash Lib - Demo - ollama_api_get"
echo

load_ollama_bash_lib() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh"; echo "ollama_bash_lib: $ollama_bash_lib"
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  echo; echo -n "ollama_installed: "; if ! ollama_installed; then echo "ERROR: Ollama Not Found"; exit 1; fi; echo "YES"; echo
}

load_ollama_bash_lib

echo "ollama_api_get \"/api/version\""
echo
ollama_api_get "/api/version"

echo
echo "ollama_api_get \"/error/path/not/found\""
echo
ollama_api_get "/error/path/not/found"

echo
echo "ollama_api_get \" bad string!\""
echo
ollama_api_get " bad sting! "

echo
echo "OLLAMA_LIB_DEBUG=1"
echo
OLLAMA_LIB_DEBUG=1

echo "ollama_api_get \"/api/version\""
ollama_api_get "/api/version"
ollama_api_get_return=$?
echo "ollama_api_get returned: $ollama_api_get_return"

echo
echo "ollama_api_get \"/error/path/not/found\""
ollama_api_get "/error/path/not/found"
ollama_api_get_return=$?
echo "ollama_api_get returned: $ollama_api_get_return"

echo
echo "ollama_api_get \" bad string!\""
ollama_api_get " bad sting! "
ollama_api_get_return=$?
echo "ollama_api_get returned: $ollama_api_get_return"
