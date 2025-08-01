#!/usr/bin/env bash

echo "# Code Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)"

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

model="$(ollama_model_random)"

demo() {

  task="Act as an Expert Software Engineer.
Do a critical Code Review of this script.
Output your review in Markdown format."

  file="../ollama_bash_lib.sh"

  echo
  echo '```bash'
  echo "task=\"$task\""
  echo "file=\"$file\""
  echo "ollama_generate \"$model\" \"\$task\\n\\n\$(cat \"\$file\")\""
  echo '```'

  ollama_generate "$model" "$task\n\n$(cat "$file")"
}

echo
demo
