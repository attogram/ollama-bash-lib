#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_BASH_LIB_NAME="Ollama Bash Lib"
OLLAMA_BASH_LIB_VERSION="0.16"
OLLAMA_BASH_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_BASH_LIB_LICENSE="MIT"
OLLAMA_BASH_LIB_COPYRIGHT="Copyright (c) 2025 Attogram Project <https://github.com/attogram>"
OLLAMA_BASH_LIB_DEBUG=0
OLLAMA_BASH_LIB_API=${OLLAMA_HOST:-"http://localhost:11434"} # no slash at end
RETURN_SUCCESS=0
RETURN_ERROR=1

# Debug message
#
# Usage: debug "message"
# Output: message to stderr
# Returns: none
debug() {
  if [ "$OLLAMA_BASH_LIB_DEBUG" == "1" ]; then
    >&2 echo -e "[DEBUG] $1"
  fi
}

# Is Ollama installed on the local system?
#
# Usage: if ollamaIsInstalled; then echo "Ollama Installed"; else echo "Ollama Not Installed"; fi
# Output: none
# Returns: 0 if Ollama is installed, 1 if Ollama is not installed
ollamaIsInstalled() {
  debug "ollamaIsInstalled"
  if [ -z "$(command -v "ollama" 2> /dev/null)" ]; then
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Escape a string for inclusion into JSON
#
# Usage: safeJson "string"
# Output: "quoted safe json value"
# Returns: 0 on success, 1 on error
safeJson() {
  debug "safeJson: $1"
  jq -Rn --arg str "$1" '$str'
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# GET request to the Ollama API
#
# Usage: ollamaApiGet "/api/command"
# Output: result of API call
# Returns: 0 on success, 1 on error
ollamaApiGet() {
  debug "ollamaApiGet: $1"
  curl -s -X GET "${OLLAMA_BASH_LIB_API}$1" -H 'Content-Type: application/json' -d ''
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# POST request to the Ollama API
#
# Usage: ollamaApiPost "/api/command" "{ json content }"
# Output: result of API call
# Returns: 0 on success, 1 on error
ollamaApiPost() {
  debug "ollamaApiPost: $1 $2"
  curl -s -X POST "${OLLAMA_BASH_LIB_API}$1" -H 'Content-Type: application/json' -d "$2"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# Unload a model from memory (Clear context for a model)
#
# Usage: ollamaClearModel "modelName"
# Output: none
# Returns: 0 on success, 1 on error
ollamaClearModel() {
  if [ -z "$1" ]; then
    debug "Error: ollamaClearModel: no model"
    return $RETURN_ERROR
  fi
  local response
  response=$(ollamaApiPost "/api/generate" "{\"model\": \"$1\", \"keep_alive\": 0}")
  debug "$response"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# Generate a completion, non-streaming
#
# Usage: ollamaGenerate "modelName" "prompt"
# Output: json
# Returns: 0 on success, 1 on error
ollamaGenerate() {
  debug "ollamaGenerate: $1 $2"
  ollamaApiPost "/api/generate" "{\"model\": \"$1\", \"prompt\": $(safeJson "$2"), \"stream\": false}"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# Generate a completion, streaming
#
# Usage: ollamaGenerateStreaming "modelName" "prompt"
# Output: json
# Returns: 0 on success, 1 on error
ollamaGenerateStreaming() {
  debug "ollamaGenerateStreaming: $1 $2"
  ollamaApiPost "/api/generate" "{\"model\": \"$1\", \"prompt\": $(safeJson "$2")}"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# All available models, cli version
#
# Usage: ollamaList
# Output: text
# Returns: 0 on success, 1 on error
ollamaList() {
  ollama list
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# All available models, JSON version
#
# Usage: ollamaListJson
# Output: json
# Returns: 0 on success, 1 on error
ollamaListJson() {
  ollamaApiGet "/api/tags"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# All available models, Bash array version
#
# Usage: models=($(ollamaListArray))
# Output: space separated list of model names
# Returns: 0 on success, 1 on error
ollamaListArray() {
  models=($(ollama list | awk '{if (NR > 1) print $1}' | sort)) # Get list of models, sorted alphabetically
  echo "${models[@]}"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# Get a random model
#
# Usage: ollamaGetRandomModel
# Output: 1 model name
# Returns: 0 on success, 1 on error
ollamaGetRandomModel() {
  debug "ollamaGetRandomModel"
  local models=($(ollamaListArray))
  echo "${models[RANDOM%${#models[@]}]}"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# Running model processes, cli version
#
# Usage: ollamaPs
# Output: text
# Returns: 0 on success, 1 on error
ollamaPs() {
  ollama ps
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# Running model processes, JSON version
#
# Usage: ollamaPsJson
# Output: json
# Returns: 0 on success, 1 on error
ollamaPsJson() {
  ollamaApiGet "/api/ps"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# Show model information, cli version
#
# Usage: ollamaShow "modelName"
# Output: text
# Returns: 0 on success, 1 on error
ollamaShow() {
  ollama show "$1"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# Show model information, JSON version
#
# Usage: ollamaShowJson "modelName"
# Output: json
# Returns: 0 on success, 1 on error
ollamaShowJson() {
  ollamaApiPost "/api/show" "{\"model\": \"$1\"}"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# Ollama application version, cli version
#
# Usage: ollamaVersion
# Output: text
# Returns: 0 on success, 1 on error
ollamaVersion() {
  ollama --version
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}

# Ollama application version, JSON version
#
# Usage: ollamaVersionJson
# Output: json
# Returns: 0 on success, 1 on error
ollamaVersionJson() {
  ollamaApiGet "/api/version"
  # TODO - check response for error/success
  return $RETURN_SUCCESS
}
