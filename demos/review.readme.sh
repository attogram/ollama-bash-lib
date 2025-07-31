#!/usr/bin/env bash

echo "# Review of project [README.md](../README.md)"

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_installed; then echo "ERROR: Ollama Not Installed"; fi;
  if ! ollama_api_ping; then echo "ERROR: Ollama API not reachable"; fi;
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

model="$(ollama_model_random)"

demo() {
  echo
  echo '```bash'
  if [[ "$debug" -gt 0 ]]; then echo 'OLLAMA_LIB_DEBUG=1'; fi
  echo 'prompt="Act as a Marketing Expert.
Do a full review of this github project README.md.
Output your review in pure Markdown format.

$(cat "../README.md")"'
  echo "ollama_generate \"$model\" \"\$prompt\""
  echo '```'
  prompt="Act as an expert Technical Marketer.
Do a full review of this project README:
Output your review in pure Markdown format.

$(cat "../README.md")"
  if [[ "$debug" -gt 0 ]]; then OLLAMA_LIB_DEBUG=1; fi
  ollama_generate "$model" "$prompt"
}

echo; echo '## Review'
demo

echo; echo '## Review Debug'
demo 1
