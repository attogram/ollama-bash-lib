#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_BASH_LIB_NAME="Ollama Bash Lib"
OLLAMA_BASH_LIB_VERSION="0.28.1"
OLLAMA_BASH_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_BASH_LIB_LICENSE="MIT"
OLLAMA_BASH_LIB_COPYRIGHT="Copyright (c) 2025 Attogram Project <https://github.com/attogram>"
OLLAMA_BASH_LIB_DEBUG=0
OLLAMA_BASH_LIB_API=${OLLAMA_HOST:-"http://localhost:11434"} # no slash at end
OLLAMA_BASH_LIB_MESSAGES=() # array of messages
RETURN_SUCCESS=0
RETURN_ERROR=1

# About Ollama Bash Lib
#
# Usage: ollama_about_lib
# Output: text to stdout
# Returns: 0 on success, 1 on error
ollama_about_lib() {
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
  echo "OLLAMA_BASH_LIB_MESSAGES : ${OLLAMA_BASH_LIB_MESSAGES[*]}"
  echo
  echo "Functions:"
  echo
  compgen -A function
  return $?
}

# Debug message
#
# Usage: debug "message"
# Output: text, to stderr
# Returns: 0 on success, 1 on error
debug() {
  if [ "$OLLAMA_BASH_LIB_DEBUG" == "1" ]; then
    >&2 echo -e "[DEBUG] $1"
  fi
  return $?
}

# Is Ollama installed on the local system?
#
# Usage: if ollama_installed; then echo "Ollama Installed"; else echo "Ollama Not Installed"; fi
# Output: none
# Returns: 0 if Ollama is installed, 1 if Ollama is not installed
ollama_installed() {
  debug "ollama_installed"
  if [ -z "$(command -v "ollama" 2> /dev/null)" ]; then
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Escape a string for use as a JSON value
#
# Usage: json_safe "string"
# Output: "quoted safe json value" to stdout
# Returns: 0 on success, 1 on error
json_safe() {
  debug "json_safe: $1"
  jq -Rn --arg str "$1" '$str'
  return $? # TODO - if jq error, get error info
}

# GET request to the Ollama API
#
# Usage: ollama_get "/api/path"
# Output: API call result, to stdout
# Returns: 0 on success, 1 on error
ollama_get() {
  debug "ollama_get: $1"
  curl -s -X GET "${OLLAMA_BASH_LIB_API}$1" -H 'Content-Type: application/json'
  return $? # TODO - if curl error, get error info
}

# POST request to the Ollama API
#
# Usage: ollama_post "/api/path" "{ json content }"
# Output: API call result, to stdout
# Returns: 0 on success, 1 on error
ollama_post() {
  debug "ollama_post: $1 $2"
  curl -s -X POST "${OLLAMA_BASH_LIB_API}$1" -H 'Content-Type: application/json' -d "$2"
  return $? # TODO - if curl error, get error info
}

# Unload a model from memory (Clear context for a model)
#
# Usage: ollama_unload_model "modelName"
# Output: none
# Returns: 0 on success, 1 on error
ollama_unload_model() {
  if [ -z "$1" ]; then
    debug "Error: ollama_unload_model: no model"
    return $RETURN_ERROR
  fi
  local response return
  response=$(ollama_post "/api/generate" "{\"model\": \"$1\", \"keep_alive\": 0}")
  return=$?
  debug "$response"
  return $return # TODO - if Post error, get error info
}

# Generate a completion, non-streaming, TEXT version
#
# Usage: ollama_generate "modelName" "prompt"
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_generate() {
  debug "ollama_generate: $1 $2"
  local result return
  result=$(ollama_post "/api/generate" "{\"model\": \"$1\", \"prompt\": $(json_safe "$2"), \"stream\": false}")
  return=$?
  # TODO - if Post error, show error and return 1
  echo "$result" | jq -r ".response" # Get the raw response content
  return $return # TODO - if echo/jq error, get error info
}

# Generate a completion, non-streaming, JSON version
#
# Usage: ollama_generate_json "modelName" "prompt"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_json() {
  debug "ollama_generate_json: $1 $2"
  ollama_post "/api/generate" "{\"model\": \"$1\", \"prompt\": $(json_safe "$2"), \"stream\": false}"
  return $? # TODO - if Post error, get error info
}

# Generate a completion, streaming, TEXT version
#
# Usage: ollama_generate_stream "modelName" "prompt"
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream() {
  debug "ollama_generate_stream: $1 $2"
  local response return
  while read -r line
  do
    response=$(printf "%s" "$line" | jq ".response")
    response="${response#\"}" # remove pre quote
    response="${response%\"}" # remove post quote
    echo -ne "$response"
  done < <(ollama_post "/api/generate" "{\"model\": \"$1\", \"prompt\": $(json_safe "$2")}")
  return=$?
  echo
  return $return # TODO - If Post error, get error info
}

# Generate a completion, streaming, JSON version
#
# Usage: ollama_generate_stream_json "modelName" "prompt"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream_json() {
  debug "ollama_generate_stream_json: $1 $2"
  ollama_post "/api/generate" "{\"model\": \"$1\", \"prompt\": $(json_safe "$2")}"
  return $? # TODO - if Post error, get error info
}

# All available models, CLI version
#
# Usage: ollama_list
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_list() {
  debug "ollama_list"
  ollama list
  return $?
}

# All available models, JSON version
#
# Usage: ollama_list_json
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_list_json() {
  debug "ollama_list_json"
  ollama_get "/api/tags"
  return $?
}

# All available models, Bash array version
#
# Usage: models=($(ollama_list_array))
# Output: space separated list of model names, to stdout
# Returns: 0 on success, 1 on error
ollama_list_array() {
  debug "ollama_list_array"
  local models return
  models=($(ollama list | awk '{if (NR > 1) print $1}' | sort)) # Get list of models, sorted alphabetically
  return=$?
  # TODO - If error, return 1
  echo "${models[@]}"
  return $return # TODO - also check echo status
}

# Get a random model
#
# Usage: ollama_random_model
# Output: 1 model name, to stdout
# Returns: 0 on success, 1 on error
ollama_random_model() {
  debug "ollama_random_model"
  local models return
  models=($(ollama_list_array))
  return=$?
  # TODO - If error, return 1
  echo "${models[RANDOM%${#models[@]}]}"
  return $return # TODO - also check echo status?
}

# Running model processes, CLI version
#
# Usage: ollama_ps
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_ps() {
  debug "ollama_ps"
  ollama ps
  return $?
}

# Running model processes, JSON version
#
# Usage: ollama_ps_json
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_ps_json() {
  debug "ollama_ps_json"
  ollama_get "/api/ps"
  return $?
}

# Show model information, TEXT version
#
# Usage: ollama_show "modelName"
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_show() {
  debug "ollama_show"
  ollama show "$1"
  return $?
}

# Show model information, JSON version
#
# Usage: ollama_show_json "modelName"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_show_json() {
  debug "ollama_show_json"
  ollama_post "/api/show" "{\"model\": \"$1\"}"
  return $?
}

# Ollama application version, TEXT version
#
# Usage: ollama_version
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_version() {
  debug "ollama_version"
  local versionJson
  ollama_get "/api/version" | jq -r ".version"
  return $?
}

# Ollama application version, JSON version
#
# Usage: ollama_version_json
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_version_json() {
  debug "ollama_version_json"
  ollama_get "/api/version"
  return $?
}

# Ollama application version, CLI version
#
# Usage: ollama_version_cli
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_version_cli() {
  debug "ollama_version_cli"
  ollama --version
  return $?
}

# Estimate the number of tokens in a string
#
# Usage: estimate_tokens "string"
# Usage: verbose: estimate_tokens "string" 1
# Output: token estimate, to stdout
# Output: verbose: token estimate with error range, to stdout
# Returns: 0 on success, 1 on error
estimate_tokens() {
  debug "estimate_tokens" # $1"
  local string verbose tokensWords words tokensChars chars tokensBytes bytes tokens

  if [ -t 0 ]; then # Not piped input
    if [ -f "$1" ]; then
      debug "Getting string from file (arg 1 is filename)"
      string=$(<"$1")
    elif [ -n "$1" ]; then
      debug "Getting string from arg 1"
      string="$1"
    else
      debug "Usage: estimate_tokens <text|string|file> [verbose: 1])"
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
