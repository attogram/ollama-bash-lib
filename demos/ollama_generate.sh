#!/usr/bin/env bash

echo '# ollama_generate'

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

# echo; echo '## Setup'; echo
# echo "OLLAMA_HOST: $OLLAMA_HOST"
# echo "OBL_API: $OBL_API"
# echo

model="$(ollama_model_random)"
prompt="Describe a rabbit in 3 words"


echo; echo '## Demo'; echo
echo '
```
ollama_generate -m "$model" -p "$prompt"
```'
echo '```'
ollama_generate -m "$model" -p "$prompt"
echo '```'


echo; echo '## Demo Debug'; echo
echo '
```
OBL_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```'
echo '```'
OBL_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
echo '```'
