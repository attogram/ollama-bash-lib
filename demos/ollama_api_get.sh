#!/usr/bin/env bash

echo '# ollama_api_get'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_installed; then echo "ERROR: Ollama Not Installed"; fi;
  if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

echo
echo '## Demo'
echo '```'
echo
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
echo '```'

echo
echo '## Demo Debug'
echo '```'

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

echo '```'
