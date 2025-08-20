#!/usr/bin/env bash

echo  '# Taglines for Ollama Bash Lib'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_app_installed; then echo 'ERROR: Ollama Not Installed'; fi;
  if ! ollama_api_ping; then echo 'ERROR: Ollama API not reachable'; fi;
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

model="$(ollama_model_random)"

demo() {

  task="Generate a list of Descriptions of Ollama Bash Lib.
Descriptions must be 250 words or less.
Review the README.md file below for context.
Generate 2 serious descriptions,
and 5 generally funny,
and 5 funny for programmers,
and 5 funny for sysadmins,
and 5 funny for devops,
and 5 just crazy.
Output in Markdown format.
"

  file="../README.md"

  echo
  echo '```bash'
  echo "task=\"$task\""
  echo "file=\"$file\""
  echo 'ollama_thinking hide'
  # shellcheck disable=SC2028
  echo "ollama_generate \"$model\" \"\$task\\n\\n\$(cat \"\$file\")\""
  echo '```'

  ollama_thinking hide
  ollama_generate "$model" "$task\n\n$(cat "$file")"
}

echo
demo
