#!/usr/bin/env bash

echo '# json_sanitize'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  #if ! ollama_installed; then echo "ERROR: Ollama Not Installed"; fi;
  #if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

echo
echo 'Usage: `json_sanitize "string"`'
echo

echo
echo '```'
string='{"value":"abc def"}'
clean=$(json_sanitize "$string")
echo "string: $(echo "$string" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$string")]"
echo "clean : $(echo "$clean" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$clean")]"
echo '```'

echo
echo '```'
ff=$'\n'
string="{\"value\":\"abc${ff}def\"}"
clean=$(json_sanitize "$string")
echo "string: $(echo "$string" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$string")]"
echo "clean : $(echo "$clean" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$clean")]"
echo '```'

echo
echo '```'
string='start: '
string+=$(printf 'null:%b, ' '\000') # null
string+=$(printf 'bell:%b, ' '\007') # bell
string+=$(printf 'form-feed:%b, ' '\012') # form feed \n
string+=$(printf 'carriage-return:%b, ' '\013') # carriage return \r
string+=$(printf 'escape:%b, ' '\027') # escape
string+=$(printf 'unit-separator:%b' '\031') # unit separator
string+=' :end'
clean=$(json_sanitize "$string")
echo "string: $(echo "$string" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$string")]"
echo "clean : $(echo "$clean" | wc -c | sed 's/ //g') bytes: [$(printf '%s' "$clean")]"
echo '```'
