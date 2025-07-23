#!/usr/bin/env bash
#
# Ollama Bash Lib
#
# A Bash Library to interact with the Ollama application

OLLAMA_BASH_LIB_NAME="ollama-bash-lib"
OLLAMA_BASH_LIB_VERSION="0.4"
OLLAMA_BASH_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_BASH_LIB_LICENSE="MIT"

RETURN_SUCCESS=0
RETURN_ERROR=1

# apiUrl (string) - URL to local Ollama API
apiUrl="http://localhost:11434"

# Is Ollama installed on local system?
# Returns: 0/1 yes/no)
isOllamaInstalled() {
  check=$(command -v "ollama" 2> /dev/null)
  if [ -z "$check" ]; then
    echo "$RETURN_ERROR"
    return $RETURN_ERROR
  fi
  echo "$RETURN_SUCCESS"
  return $RETURN_SUCCESS
}

# All available models, cli version
ollamaList() {
  ollama list
}

# All available models, as a Bash array
# Usage: models=($(ollamaListArray))
# Returns: space separated list of model names
ollamaListArray() {
  # shellcheck disable=SC2207
  models=($(ollama list | awk '{if (NR > 1) print $1}' | sort)) # Get list of models, sorted alphabetically
  echo "${models[@]}"
}

# Show model information
ollamaShow() {
  local model="$1"
  ollama show "$model"
}

# Running model processes
ollamaPs() {
  ollama ps
}

# Ollama application version
ollamaVersion() {
  ollama --version
}

# ollama cli help
ollamaHelp() {
  ollama --help
}

# ollama cli help for run command
ollamaHelpRun() {
  ollama help run
}

# ollama cli help for show command
ollamaHelpShow() {
  ollama help show
}
