#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_BASH_LIB_NAME="Ollama Bash Lib"
OLLAMA_BASH_LIB_VERSION="0.15"
OLLAMA_BASH_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_BASH_LIB_LICENSE="MIT"
OLLAMA_BASH_LIB_COPYRIGHT="Copyright (c) 2025 Attogram Project <https://github.com/attogram>"

OLLAMA_BASH_DEBUG=0

RETURN_SUCCESS=0
RETURN_ERROR=1

# OLLAMA_API_HOST (string) - URL to local Ollama API (no slash at end)
OLLAMA_API_HOST="http://localhost:11434" # TODO - use standard OLLAMA_HOST var, with default

# Send debug messages to stderr
debug() {
  if [ "$OLLAMA_BASH_DEBUG" == "1" ]; then
    >&2 echo -e "[DEBUG] $1"
  fi
}

# Is Ollama installed on the local system?
# Usage: if ollamaIsInstalled; then echo "Ollama Installed"; else echo "Ollama Not Installed"; fi
# Returns: 0 if Ollama is installed, 1 if Ollama is not installed
ollamaIsInstalled() {
  debug "ollamaIsInstalled"
  if [ -z "$(command -v "ollama" 2> /dev/null)" ]; then
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Escape a string for inclusion into JSON
# Usage: safeJson "string"
safeJson() {
  debug "safeJson: $1"
  jq -Rn --arg str "$1" '$str'
}

# GET request to the Ollama API
# Usage: ollamaApiGet "/api/command"
ollamaApiGet() {
  debug "ollamaApiGet: $1"
  curl -s -X GET "${OLLAMA_API_HOST}$1" -H 'Content-Type: application/json' -d ''
}

# POST request to the Ollama API
# Usage: ollamaApiPost "/api/command" "{ json content }"
ollamaApiPost() {
  debug "ollamaApiPost: $1 $2"
  curl -s -X POST "${OLLAMA_API_HOST}$1" -H 'Content-Type: application/json' -d "$2"
}

# Clear Ollama Context for a model
# Usage: ollamaClear "modelName"
ollamaClear() {
  local model="$1"
  if [ -z "$model" ]; then
    debug "Error: ollamaClear: no model"
    return $RETURN_ERROR
  fi
  local response
  response=$(ollamaApiPost "/api/generate" "{\"model\": \"$1\", \"keep_alive\": 0}")
  debug "$response"
}

# Generate a completion, non-streaming
# Usage: ollamaGenerate "modelName" "prompt"
ollamaGenerate() {
  debug "ollamaGenerate: $1 $2"
  ollamaApiPost "/api/generate" "{\"model\": \"$1\", \"prompt\": $(safeJson "$2"), \"stream\": false}"
}

# Generate a completion, streaming
# Usage: ollamaGenerateStreaming "modelName" "prompt"
ollamaGenerateStreaming() {
  debug "ollamaGenerateStreaming: $1 $2"
  ollamaApiPost "/api/generate" "{\"model\": \"$1\", \"prompt\": $(safeJson "$2")}"
}

# Get a random model
# Returns: 1 model name
ollamaGetRandomModel() {
  debug "ollamaGetRandomModel"
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
