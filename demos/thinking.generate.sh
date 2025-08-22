#!/usr/bin/env bash

echo "# ollama_thinking, ollama_generate"

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_app_installed; then echo 'ERROR: Ollama Not Installed'; fi;
  if ! ollama_api_ping; then echo 'ERROR: Ollama API not reachable'; fi
  echo; echo "A [demo](../README.md#demos) of [$OBL_NAME]($OBL_URL) v$OBL_VERSION"
}

startup

# shellcheck disable=SC2016
echo '
```
ollama_thinking on
ollama_thinking
ollama_generate -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```
'

ollama_thinking on
ollama_thinking
ollama_generate -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
