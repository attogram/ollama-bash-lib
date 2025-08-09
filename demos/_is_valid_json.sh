#!/usr/bin/env bash

echo '# _is_valid_json'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  #if ! ollama_app_installed; then echo "ERROR: Ollama Not Installed"; fi;
  #if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

test_strings=(
  '{"foo":"bar"}'
  '{"foo":"bar\nbaz"}'
  '{"foo":""}'
  ''
  '[]'
  '[foo]'
  '{}'
  '{foo}'
  "{'foo':'bar'}"
  '{"foo":bar}'
  #"$( { printf '{"null":"%b"}' '\000'; } 2>/dev/null )"
  "$(printf '{"carriage-return":"%b"}' '\013')"
  "$(printf '{"escape":"%b"}' '\027')"
  "$(printf '{"bell":"%b"}' '\007')"
  "$(printf '{"unit-separator":"%b"}' '\031')"
  '{"foo":
    "bar"}'
  "$(printf '{"form-feed":"%b"}' '\012')" # form feed \n
  '{"foo":"bar
    baz"}'
)

echo
echo '| test | result | return |'
echo '|------|--------|--------|'

for test_string in "${test_strings[@]}"; do
  display="${test_string//$'\n'/'<br />'}"
  display="${display//$'\r'/'<br />'}"
  display="${display//$'\013'/'<br />'}"
  # shellcheck disable=SC2016
  printf '| _is_valid_json \"%s\" ' "$display"
  _is_valid_json "$test_string"
  exit_code=$?
  if (( "$exit_code" > 0 )); then
    printf '| ❌ FAIL '
  else
    printf '| ✅ PASS '
  fi
  printf '| %s |\n' "$exit_code"
done
