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

echo
echo '```'
good='{"value":"abc\ndef"}'
echo "jq_sanitize \"$good\""
echo
jq_sanitize "$good"
echo '```'

echo '```'
bad='{"value":"abc
def"}'
echo "jq_sanitize \"$bad\""
echo
jq_sanitize "$bad"
echo '```'

echo '```'
bad='Control Characters: '
bad+=$(printf 'null:%b ' '\000') # null
bad+=$(printf 'bell:%b ' '\007') # bell
bad+=$(printf 'form feed:%b ' '\012') # form feed \n
bad+=$(printf 'carriage return:%b ' '\013') # carriage return \r
bad+=$(printf 'escape:%b ' '\027') # escape
bad+=$(printf 'unite separator:%b ' '\031') # unit separator
echo "jq_sanitize \"$bad\""
echo
jq_sanitize "$bad"
echo '```'
