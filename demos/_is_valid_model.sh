#!/usr/bin/env bash

echo '# _is_valid_model'

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

tests=(
  'mistral:7b'                 # VALID
  ''                           # EMPTY → RANDOM
  'hf.co/user/Model-name:QUANT' # huggy face urls
  'abcdefghijklmnopqrstuvwxyz' # VALID
  '1234567890'                 # VALID
  'mistral:7b'                 # VALID
  'my:model:name'              # VALID
  ':leadingcolon'              # VALID
  'trailingcolon:'             # VALID
  'llama2'                     # VALID
  'llama2-13b'                 # VALID
  'gemma_2.0'                  # VALID
  'phi-3-mini'                 # VALID
  'mixtral.1.2'                # VALID
  'model-001_v2'               # VALID
  'A'                          # VALID
  'z'                          # VALID
  '0'                          # VALID
  '_.-:%-.0s'                  # ?
  'mistral 7b'                 # INVALID – space
  'mistral/7b'                 # INVALID – slash
  'mistral\7b'                 # INVALID – backslash
  'mistral@7b'                 # INVALID – @
  'mistral#7b'                 # INVALID – #
  # shellcheck disable=SC2016
  'mistral$7b'                 # INVALID – $
  'mistral%7b'                 # INVALID – %
  'mistral^7b'                 # INVALID – ^
  'mistral&7b'                 # INVALID – &
  'mistral*7b'                 # INVALID – *
  'mistral(7b)'                # INVALID – parentheses
  'mistral+7b'                 # INVALID – plus
  'mistral=7b'                 # INVALID – equal
  'mistral{7b}'                # INVALID – braces
  'mistral[7b]'                # INVALID – brackets
#  'mistral|7b'                 # INVALID – pipe
  'mistral<7b>'                # INVALID – angle brackets
  'mistral?7b'                 # INVALID – question mark
  'mistral,7b'                 # INVALID – comma
  'mistral;7b'                 # INVALID – semicolon
  'mistral:"7b'                # INVALID – quotes
  ' leadingSpace'            # INVALID – leading spaces
  'trailingSpace '           # INVALID – trailing spaces
  ' both '                   # INVALID – only spaces
  ' '                          # INVALID – single space (non‑empty)
#  $'\t'                        # INVALID – tab character
#  $'\n'                        # INVALID – newline
#  $'\r'                        # INVALID – carriage‑return
#  $'\x0b'                      # INVALID – vertical tab
#  "$(printf 'a%.0s' {1..200})"                         # VALID – 200 “a”s
#  "$(printf 'model_%.0s' {1..100})"                    # VALID – 100 “model_”
#  "$(printf  {1..50})"            # VALID – mix of all allowed symbols
  '模型'                        # INVALID – Chinese characters
  'модель'                     # INVALID – Cyrillic
  'modelé'                     # INVALID – accented e
  'model😀'                    # INVALID – emoji
)

printf '\n'
printf '| test | output | return | result |\n'
printf '|------|--------|--------|--------|\n'
for test in "${tests[@]}"; do
  output="$(_is_valid_model "$test")"
  exit_code=$?
  if (( "$exit_code" > 0 )); then
    result='❌ FAIL'
  else
    result='✅ PASS'
  fi
  # shellcheck disable=SC2016
  printf '| `%s` | %s | %d | %s |\n' "$test" "$output" "$exit_code" "$result"
done

