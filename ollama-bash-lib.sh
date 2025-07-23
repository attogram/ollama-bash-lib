#!/usr/bin/env bash
#
# Ollama Bash Lib
#
# A Bash Library to interact with the Ollama application

OLLAMA_BASH_LIB_NAME="ollama-bash-lib"
OLLAMA_BASH_LIB_VERSION="0.8"
OLLAMA_BASH_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_BASH_LIB_LICENSE="MIT"

RETURN_SUCCESS=0
RETURN_ERROR=1

# apiUrl (string) - URL to local Ollama API (no slash at end)
apiUrl="http://localhost:11434"

# Is Ollama installed on local system?
# Returns: 0/1 (yes/no)
isOllamaInstalled() {
  check=$(command -v "ollama" 2> /dev/null)
  if [ -z "$check" ]; then
    echo "$RETURN_ERROR"
    return $RETURN_ERROR
  fi
  echo "$RETURN_SUCCESS"
  return $RETURN_SUCCESS
}

# GET request to the Ollama API
# Usage: ollamaApiGet "/api/command"
ollamaApiGet() {
  call="$1"
  curl -s -X GET "${apiUrl}${call}" -H 'Content-Type: application/json' -d ''
}

# POST request to the Ollama API
# Usage: ollamaApiPost "/api/command" "{ json content }"
ollamaApiPost() {
  curl -s -X POST "${apiUrl}$1" -H 'Content-Type: application/json' -d "$2"
}

# Generate a completion, non streaming
# Usage: ollamaGenerate "modelName" "prompt"
ollamaGenerate() {
  ollamaApiPost "/api/generate" "{\"model\": \"$1\", \"prompt\": \"$2\", \"stream\": false}"
}

# Generate a completion, streaming
# Usage: ollamaGenerate "modelName" "prompt"
ollamaGenerateStreaming() {
  ollamaApiPost "/api/generate" "{\"model\": \"$1\", \"prompt\": \"$2\"}"
}

# Get a random model
# Returns: 1 model name
getRandomModel() {
  # shellcheck disable=SC2207
  local models=($(ollamaListArray))
  echo "${models[RANDOM%${#models[@]}]}"
}

# All available models, cli version
ollamaList() {
  ollama list
}

# All available models, JSON version
ollamaListJson() {
  ollamaApiGet "/api/tags"
}

# All available models, Bash array version
# Usage: models=($(ollamaListArray))
# Returns: space separated list of model names
ollamaListArray() {
  # shellcheck disable=SC2207
  models=($(ollama list | awk '{if (NR > 1) print $1}' | sort)) # Get list of models, sorted alphabetically
  echo "${models[@]}"
}

# Running model processes, cli version
ollamaPs() {
  ollama ps
}

# Running model processes, JSON version
ollamaPsJson() {
  ollamaApiGet "/api/ps"
}

# Show model information, cli version
# Usage: ollamaShow "modelName"
ollamaShow() {
  ollama show "$1"
}

# Show model information, JSON version
# Usage: ollamaShowJson "modelName"
ollamaShowJson() {
  ollamaApiPost "/api/show" "{\"model\": \"$1\"}"
}

# Ollama application version, cli version
ollamaVersion() {
  ollama --version
}

# Ollama application version, JSON version
ollamaVersionJson() {
  ollamaApiGet "/api/version"
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
