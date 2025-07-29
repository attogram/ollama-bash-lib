#!/usr/bin/env bash

echo "# jq_sanitize"
echo

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
echo 'Usage: `jq_santize "string"`'
echo

echo
echo '```'
string='{"value":"abc def"}'
clean=$(jq_sanitize "$string")
echo "string: $(echo "$string" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$string")]"
echo "clean : $(echo "$clean" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$clean")]"
echo '```'

echo
echo '```'
ff=$'\n'
string="{\"value\":\"abc${ff}def\"}"
clean=$(jq_sanitize "$string")
echo "string: $(echo "$string" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$string")]"
echo "clean : $(echo "$clean" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$clean")]"
echo '```'

echo
echo '```'
string=""
string+=$(printf 'null:%b, ' '\000') # null
string+=$(printf 'bell:%b, ' '\007') # bell
string+=$(printf 'form-feed:%b, ' '\012') # form feed \n
string+=$(printf 'carriage-return:%b, ' '\013') # carriage return \r
string+=$(printf 'escape:%b, ' '\027') # escape
string+=$(printf 'unit-separator:%b' '\031') # unit separator
clean=$(jq_sanitize "$string")
echo "string: $(echo "$string" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$string")]"
echo "clean : $(echo "$clean" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$clean")]"
echo '```'
