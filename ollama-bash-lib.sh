#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_BASH_LIB_NAME="Ollama Bash Lib"
OLLAMA_BASH_LIB_VERSION="0.23"
OLLAMA_BASH_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_BASH_LIB_LICENSE="MIT"
OLLAMA_BASH_LIB_COPYRIGHT="Copyright (c) 2025 Attogram Project <https://github.com/attogram>"
OLLAMA_BASH_LIB_DEBUG=0
OLLAMA_BASH_LIB_API=${OLLAMA_HOST:-"http://localhost:11434"} # no slash at end
RETURN_SUCCESS=0
RETURN_ERROR=1

# About Ollama Bash Lib
#
# Usage: ollamaBashLibAbout
# Output: text
# Returns: none
ollamaBashLibAbout() {
  echo "$OLLAMA_BASH_LIB_NAME v$OLLAMA_BASH_LIB_VERSION"
  echo
  echo "A Bash Library to interact with Ollama"
  echo
  echo "OLLAMA_BASH_LIB_NAME     : $OLLAMA_BASH_LIB_NAME"
  echo "OLLAMA_BASH_LIB_VERSION  : $OLLAMA_BASH_LIB_VERSION"
  echo "OLLAMA_BASH_LIB_URL      : $OLLAMA_BASH_LIB_URL"
  echo "OLLAMA_BASH_LIB_LICENSE  : $OLLAMA_BASH_LIB_LICENSE"
  echo "OLLAMA_BASH_LIB_COPYRIGHT: $OLLAMA_BASH_LIB_COPYRIGHT"
  echo "OLLAMA_BASH_LIB_DEBUG    : $OLLAMA_BASH_LIB_DEBUG"
  echo "OLLAMA_BASH_LIB_API      : $OLLAMA_BASH_LIB_API"
  echo
  echo "Functions:"
  echo
  compgen -A function
}

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

# Escape a string for use as a JSON value
#
# Usage: safeJson "string"
# Output: "quoted safe json value"
# Returns: 0 on success, 1 on error
safeJson() {
  debug "safeJson: $1"
  jq -Rn --arg str "$1" '$str'
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# GET request to the Ollama API
#
# Usage: ollamaApiGet "/api/command"
# Output: result of API call
# Returns: 0 on success, 1 on error
ollamaApiGet() {
  debug "ollamaApiGet: $1"
  curl -s -X GET "${OLLAMA_BASH_LIB_API}$1" -H 'Content-Type: application/json' -d ''
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# POST request to the Ollama API
#
# Usage: ollamaApiPost "/api/command" "{ json content }"
# Output: result of API call
# Returns: 0 on success, 1 on error
ollamaApiPost() {
  debug "ollamaApiPost: $1 $2"
  curl -s -X POST "${OLLAMA_BASH_LIB_API}$1" -H 'Content-Type: application/json' -d "$2"
  return $RETURN_SUCCESS # TODO - check response for error/success
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
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# Generate a completion, non-streaming
#
# Usage: ollamaGenerate "modelName" "prompt"
# Output: json
# Returns: 0 on success, 1 on error
ollamaGenerate() {
  debug "ollamaGenerate: $1 $2"
  ollamaApiPost "/api/generate" "{\"model\": \"$1\", \"prompt\": $(safeJson "$2"), \"stream\": false}"
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# Generate a completion, streaming
#
# Usage: ollamaGenerateStreaming "modelName" "prompt"
# Output: json
# Returns: 0 on success, 1 on error
ollamaGenerateStreaming() {
  debug "ollamaGenerateStreaming: $1 $2"
  ollamaApiPost "/api/generate" "{\"model\": \"$1\", \"prompt\": $(safeJson "$2")}"
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# All available models, CLI version
#
# Usage: ollamaList
# Output: text
# Returns: 0 on success, 1 on error
ollamaList() {
  debug "ollamaList"
  ollama list
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# All available models, JSON version
#
# Usage: ollamaListJson
# Output: json
# Returns: 0 on success, 1 on error
ollamaListJson() {
  debug "ollamaListJson"
  ollamaApiGet "/api/tags"
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# All available models, Bash array version
#
# Usage: models=($(ollamaListArray))
# Output: space separated list of model names
# Returns: 0 on success, 1 on error
ollamaListArray() {
  debug "ollamaListArray"
  local models
  models=($(ollama list | awk '{if (NR > 1) print $1}' | sort)) # Get list of models, sorted alphabetically
  echo "${models[@]}"
  return $RETURN_SUCCESS # TODO - check response for error/success
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
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# Running model processes, CLI version
#
# Usage: ollamaPs
# Output: text
# Returns: 0 on success, 1 on error
ollamaPs() {
  debug "ollamaPs"
  ollama ps
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# Running model processes, JSON version
#
# Usage: ollamaPsJson
# Output: json
# Returns: 0 on success, 1 on error
ollamaPsJson() {
  debug "ollamaPsJson"
  ollamaApiGet "/api/ps"
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# Show model information, TEXT version
#
# Usage: ollamaShow "modelName"
# Output: text
# Returns: 0 on success, 1 on error
ollamaShow() {
  debug "ollamaShow"
  ollama show "$1"
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# Show model information, JSON version
#
# Usage: ollamaShowJson "modelName"
# Output: json
# Returns: 0 on success, 1 on error
ollamaShowJson() {
  debug "ollamaShowJson"
  ollamaApiPost "/api/show" "{\"model\": \"$1\"}"
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# Ollama application version, TEXT version
#
# Usage: ollamaVersion
# Output: text
# Returns: 0 on success, 1 on error
ollamaVersion() {
  debug "ollamaVersion"
  local versionJson
  ollamaApiGet "/api/version" | jq -r ".version"
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# Ollama application version, JSON version
#
# Usage: ollamaVersionJson
# Output: json
# Returns: 0 on success, 1 on error
ollamaVersionJson() {
  debug "ollamaVersionJson"
  ollamaApiGet "/api/version"
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# Ollama application version, CLI version
#
# Usage: ollamaVersionCli
# Output: text
# Returns: 0 on success, 1 on error
ollamaVersionCli() {
  debug "ollamaVersionCli"
  ollama --version
  return $RETURN_SUCCESS # TODO - check response for error/success
}

# Estimated number of tokens in a string
#
# Usage: ollamaEstimatedTokens "string"
# Usage: verbose: ollamaEstimatedTokens "string" 1
# Output: token estimate
# Output: verbose: # token estimate with error range
# Returns: 0 on success, 1 on error
tokenEstimate() {
  debug "tokenEstimate" # $1"
  local string verbose tokensWords words tokensChars chars tokensBytes bytes tokens

  if [ -t 0 ]; then # Not piped input
    if [ -f "$1" ]; then
      debug "Getting string from file (arg 1 is filename)"
      string=$(<"$1")
    elif [ -n "$1" ]; then
      debug "Getting string from arg 1"
      string="$1"
    else
      debug "Usage: tokenEstimate <text|string|file> [verbose: 1])"
      return $RETURN_ERROR
    fi
    verbose=${2:-0} # verbose is arg 2
  else
    debug "Getting string from piped input, multiline"
    string=$(cat -)
    verbose=${1:-0} # verbose is arg 1
  fi
  debug "verbose: $verbose"

  words=$(echo "$string" | wc -w)
  chars=$(printf "%s" "$string" | wc -m)
  bytes=$(printf "%s" "$string" | wc -c)

  tokensWords=$(( (words * 100) / 75 )) # 1 token = 0.75 words
  debug "words      : $words"
  debug "tokensWords: $tokensWords"

  tokensChars=$(( (chars + 1) / 4 )) # 1 token = 4 characters
  debug "chars      : $chars"
  debug "tokensChars: $tokensChars"

  tokensBytes=$(( (bytes + 1) / 4 )) # 1 token = 4 bytes
  debug "bytes      : $bytes"
  debug "tokensBytes: $tokensBytes"

  # Get largest estimate
  tokens=$tokensBytes
  (( tokensChars > tokens )) && tokens=$tokensChars
  (( tokensWords > tokens )) && tokens=$tokensWords
  debug "tokens     : $tokens"

  if [ "$verbose" -eq 0 ]; then
   echo "$tokens"
   return $RETURN_SUCCESS
  fi

  local min max offsetMin offsetMax error

  min=$tokensWords
  (( tokensChars < min )) && min=$tokensChars
  (( tokensBytes < min )) && min=$tokensBytes
  debug "min        : $min"

  max=$tokensWords
  (( tokensChars > max )) && max=$tokensChars
  (( tokensBytes > max )) && max=$tokensBytes
  debug "max        : $max"

  offsetMin=$(( max - tokens ))
  debug "offsetMin  : $offsetMin"

  offsetMax=$(( tokens - min ))
  debug "offsetMax  : $offsetMax"

  error=$offsetMin
  (( error < offsetMax )) && error=$offsetMax
  debug "error      : $error"

  echo "$tokens ± $error (range $min to $max)"
  return $RETURN_SUCCESS
}
