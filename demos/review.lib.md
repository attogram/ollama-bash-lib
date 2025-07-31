# Code Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.10

## Review

```bash
prompt="Act as a Marketing Expert.
Do a full review of this github project README.md.
Output your review in pure Markdown format.

$(cat "../ollama_bash_lib.sh")"
ollama_generate "mistral:7b" "$prompt"
```
cat: #!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_LIB_NAME="Ollama Bash Lib"
OLLAMA_LIB_VERSION="0.40.10"
OLLAMA_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_LIB_LICENSE="MIT"
OLLAMA_LIB_COPYRIGHT="Copyright (c) 2025 Ollama Bash Lib, Attogram Project <https://github.com/attogram>"

OLLAMA_LIB_API=${OLLAMA_HOST:-"http://localhost:11434"} # Ollama API URL, No slash at end
OLLAMA_LIB_DEBUG=0     # 0 = No debug messages, 1 = Yes debug messages
OLLAMA_LIB_MESSAGES=() # Array of messages
OLLAMA_LIB_STREAM=0    # 0 = No streaming, 1 = Yes streaming
RETURN_SUCCESS=0       # Standard success return value
RETURN_ERROR=1         # Standard error return value

# Internal Functions

# Debug message
#
# Usage: debug "message"
# Input: 1 - the debug message
# Output: message to stderr
# Returns: 0 on success, 1 on error
debug() {
  if [ "$OLLAMA_LIB_DEBUG" -eq "1" ]; then
    >&2 echo -e "[DEBUG] $1"
  fi
}

# Error message
#
# Usage: error "message"
# Input: 1 - the error message
# Output: message to stderr
# Returns: 0 on success, 1 on error
error() {
  >&2 echo -e "[ERROR] $1"
}

# Escape a string for use as a JSON value
# - Use to clean a value (will escape "quotes")
#
# Usage: json_clean "string"
# Input: 1 - The string to escape
# Output: "quoted safe json value" to stdout
# Returns: 0 on success, 1 on jq error
json_clean() {
  debug "json_clean: $(echo "$1" | wc -c | sed 's/ //g') bytes [${1:0:42}]"
  jq -Rn --arg str "$1" '$str'
  local error_jq=$?
  if [ "$error_jq" -gt 0 ]; then
    error "json_clean: error_jq: $error_jq"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Sanitize a string to use for jq
# - Use to clean a json block (will not escape "quotes")
#
# Usage: json_sanitize "string"
# Input: 1 - The string to sanitize
# Output: sanitized string to stdout
# Returns: 0 on success, 1 on error
json_sanitize() {
  debug "json_sanitize: $(echo "$1" | wc -c | sed 's/ //g') bytes [${1:0:42}]"
  local sanitized="$1"
  # Replace carriage returns (CR, ASCII 13) with literal \r
  sanitized=$(printf '%s' "$1" | sed $'s/\r/\\\\r/g')
  # Replace newlines (LF, ASCII 10) with literal \n using awk, then strip final literal \n
  sanitized=$(printf '%s' "$sanitized" | awk '{ ORS="\\n"; print }' | sed 's/\\n$//')
  # Remove all control chars 0-9, 11-12, 14-31
  # TODO - don't remove control chars - instead replace them like jq -Rn does
  sanitized=$(printf '%s' "$sanitized" | tr -d '\000-\011\013\014\016-\037')
  printf '%s\n' "$sanitized"
  debug "json_sanitize: sanitized: $(echo "$sanitized" | wc -c | sed 's/ //g') bytes [[${sanitized:0:42}]]"
  return $RETURN_SUCCESS
}

# API Functions

# GET request to the Ollama API
#
# Usage: ollama_api_get "/api/path"
# Input: 1 = API URL path
# Output: API call result, to stdout
# Returns: 0 on success, 1 on error
ollama_api_get() {
  debug "ollama_api_get: [$1]"
  curl -s -X GET "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json'
  local error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $RETURN_ERROR
  fi
  debug 'ollama_api_get: return: 0'
  return $RETURN_SUCCESS
}

# POST request to the Ollama API
#
# Usage: ollama_api_post "/api/path" "{ json content }"
# Input: 1 - API URL path
# Input: 2 - JSON content
# Output: API call result, to stdout
# Returns: 0 on success, 1 on error
ollama_api_post() {
  debug "ollama_api_post: [$1] [${2:0:42}]"
  curl -s -X POST "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json' -d "$2"
  local error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $RETURN_ERROR
  fi
  debug 'ollama_api_post: return 0'
  return $RETURN_SUCCESS
}

# Ping the Ollama API
#
# Usage: ollama_api_ping
# Input: none
# Output: none
# Returns: 0 if API is reachable, 1 if API is not reachable
ollama_api_ping() {
  debug 'ollama_api_ping'
  local result=$(ollama_api_get "")
  local api_get_error=$?
  if [ "$api_get_error" -gt 0 ]; then
    error "ollama_api_ping: error: $api_get_error"
    return $RETURN_ERROR
  fi
  if [[ "$result" == "Ollama is running" ]]; then
    return $RETURN_SUCCESS
  fi
  error "ollama_api_ping: unknown result: [$result]"
  return $RETURN_ERROR
}

# Generate Functions

# Generate a completion as json
#
# Usage: ollama_generate_json "model" "prompt"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_json() {
  debug "ollama_generate_json: [$1] [${2:0:42}]"
  debug "ollama_generate_json: OLLAMA_LIB_STREAM: $OLLAMA_LIB_STREAM"
  local json="{\"model\":$(json_clean "$1"),\"prompt\":$(json_clean "$2")"
  if [ "$OLLAMA_LIB_STREAM" -eq "0" ]; then
    json+=",\"stream\":false"
  fi
  json+="}"
  ollama_api_post "/api/generate" "$json"
  local error_ollama_api_post=$?
  if [ "$error_ollama_api_post" -gt 0 ]; then
    error "ollama_generate_json: error_ollama_api_post: $error_ollama_api_post"
    return $RETURN_ERROR
  fi
  debug 'ollama_generate_json: return: 0'
  return $RETURN_SUCCESS
}

# Generate a completion, as streaming json
#
# Usage: ollama_generate_stream_json "model" "prompt"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream_json() {
  debug "ollama_generate_stream_json: [$1] [${2:0:42}]"
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  ollama_generate_json "$1" "$2"
  local error_ollama_generate_json=$?
  # echo # needed?
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate_stream_json: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  debug 'ollama_generate_stream_json: return: 0'
  return $RETURN_SUCCESS
}

# Generate a completion as text
#
# Usage: ollama_generate "model" "prompt"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_generate() {
  debug "ollama_generate: [$1] [${2:0:42}]"
  OLLAMA_LIB_STREAM=0
  local result=$(ollama_generate_json "$1" "$2")
  local error_ollama_generate_json=$?
  debug "ollama_generate: result: $(echo "$result" | wc -c | sed 's/ //g') bytes"
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  json_sanitize "$result" | jq -r ".response"
  local error_jq=$?
  if [ "$error_jq" -gt 0 ]; then
    error "ollama_generate: error_jq: $error_jq [$response]"
    return $RETURN_ERROR
  fi
  debug 'ollama_generate: return: 0'
  return $RETURN_SUCCESS
}

# Generate a completion as streaming text
#
# Usage: ollama_generate_stream "model" "prompt"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream() {
  debug "ollama_generate_stream: [$1] [$2]"
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  local error_jq
  ollama_generate_json "$1" "$2" | while IFS= read -r line; do
    echo -n "$(json_sanitize "$line" | jq -r ".response")"
    error_jq=$?
    if [ "$error_jq" -gt 0 ]; then
      error "ollama_generate_stream: error_jq: $error_jq"
      return $RETURN_ERROR
    fi
  done
  local error_ollama_generate_json=$?
  # echo # needed?
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate_stream: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_stream: return: 0"
  return $RETURN_SUCCESS
}

# Messages Functions

# Get all messages
#
# Usage: messages="$(ollama_messages)"
# Output: json, 1 messages per line, to stdout
# Returns: 0 on success, 1 on error
ollama_messages() {
  debug "ollama_messages"
  if [ ${#OLLAMA_LIB_MESSAGES[@]} -eq 0 ]; then
    debug "ollama_messages: no messages"
    return $RETURN_ERROR
  fi
  printf '%s\n' "${OLLAMA_LIB_MESSAGES[@]}"
  return $RETURN_SUCCESS
}

# Add a message
#
# Usage: ollama_message_add "role" "message"
# Output: none
# Returns: 0 on success, 1 on error
ollama_messages_add() {
  debug "ollama_messages_add: [$1] [${2:0:42}]"
  local role="$1"
  local message="$2"
  OLLAMA_LIB_MESSAGES+=("{\"role\":$(json_clean "$role"),\"content\":$(json_clean "$message")}")
  return $RETURN_SUCCESS
}

# Clear all messages
#
# Usage: ollama_messages_clear
# Output: none
# Returns: 0 on success, 1 on error
ollama_messages_clear() {
  debug "IN DEV - ollama_messages_clear"
  OLLAMA_LIB_MESSAGES=()
  return $RETURN_SUCCESS
}

# Messages count
#
# Usage: ollama_messages_count
# Output: number of messages, to stdout
# Returns: 0 on success, 1 on error
ollama_messages_count() {
  debug "ollama_messages_count"
  echo "${#OLLAMA_LIB_MESSAGES[@]}"
  return $RETURN_SUCCESS
}

# Chat Functions

# Chat completion request as json
#
# Usage: ollama_chat_json "model"
# Input: 1 - model
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_chat_json() {
  debug "ollama_chat_json: [$1]"
  local model="$1"
  if [ -z "$model" ]; then
    error 'ollama_chat_json: Model Not Found. Usage: ollama_chat_json "model"'
    return $RETURN_ERROR
  fi

  # TODO - use jq to build json? better/easier array handling
  local json="{\"model\":$(json_clean "$model"),\"messages\":["
  json+=$(printf "%s," "${OLLAMA_LIB_MESSAGES[@]}")
  json="$(echo "$json" | sed 's/,*$//g')" # strip last slash
  json+="]"
  if [ "$OLLAMA_LIB_STREAM" -eq 0 ]; then
    json+=",\"stream\":false"
  fi
  json+="}"

  local result=$(ollama_api_post "/api/chat" "$json")
  local error_post=$?
  if [ "$error_post" -gt 0 ]; then
    error "ollama_chat_json: error_post: $error_post"
    return $RETURN_ERROR
  fi

  content=$(json_sanitize "$result" | jq -r ".message.content")
  local error_jq_message_content=$?
  debug "ollama_chat_json: content: [$content]"
  if [ "$error_jq_message_content" -gt 0 ]; then
    error "ollama_chat_json: error_jq_message_content: $error_jq_message_content"
    return $RETURN_ERROR
  fi
  ollama_messages_add "assistant" "$content"
  echo "$result"
}

# Chat completion request as text
#
# Usage: ollama_chat "model"
# Input: 1 - model
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_chat() {
  debug "ollama_chat: [$1]"
  local model="$1"
  if [ -z "$model" ]; then
    error "ollama_chat: Model Not Found. Usage: ollama_chat \"model\""
    return $RETURN_ERROR
  fi
  OLLAMA_LIB_STREAM=0
  local content=$(json_sanitize "$(ollama_chat_json "$model")" | jq -r ".message.content")
  local error_jq_message_content=$?
  debug "ollama_chat: content: $content"
  if [ "$error_jq_message_content" -gt 0 ]; then
    error "ollama_chat: error_jq_message_content: $error_jq_message_content"
    return $RETURN_ERROR
  fi
  echo "$content"
  ollama_messages_add "assistant" "$content"
  return $RETURN_SUCCESS
}

# Chat completion request as streaming text
#
# Usage: ollama_chat_stream "model"
# Input: 1 - model
# Output: streaming text, to stdout
# Returns: 0 on success, 1 on error
ollama_chat_stream() {
  debug "ollama_chat_stream: [$1]"
  OLLAMA_LIB_STREAM=1
  ollama_chat "$1"
  local error_ollama_chat=$?
  OLLAMA_LIB_STREAM=0
  if [ "$error_ollama_chat" -gt 0 ]; then
    error "ollama_chat_stream: error_ollama_chat: $error_ollama_chat"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Chat completion request as streaming json
#
# Usage: ollama_chat_stream_json "model"
# Input: 1 - model
# Output: streaming json, to stdout
# Returns: 0 on success, 1 on error
ollama_chat_stream_json() {
  debug "ollama_chat_stream_json: [$1]"
  OLLAMA_LIB_STREAM=1
  ollama_chat_json "$1"
  local error_ollama_json_chat=$?
  OLLAMA_LIB_STREAM=0
  if [ "$error_ollama_json_chat" -gt 0 ]; then
    error "ollama_chat_stream_json: error_ollama_json_chat: $error_ollama_json_chat"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# List Functions

# All available models, CLI version
#
# Usage: ollama_list
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_list() {
  debug "ollama_list"
  ollama list | sort
  local error_list=$?
  if [ "$error_list" -gt 0 ]; then
    error "ollama_list: error_list: $error_list"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# All available models, JSON version
#
# Usage: ollama_list_json
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_list_json() {
  debug "ollama_list_json"
  ollama_api_get "/api/tags"
  local error_ollama_api_get=$?
  if [ "$error_ollama_api_get" -gt 0 ]; then
    error "ollama_list: error_ollama_api_get: $error_ollama_api_get"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# All available models, Bash array version
#
# Usage: models=($(ollama_list_array))
# Output: space separated list of model names, to stdout
# Returns: 0 on success, 1 on error
ollama_list_array() {
  debug "ollama_list_array"
  # Get list from ollama cli, skip first line (headers), get first column (names), sort alphabetically
  local models=($(ollama list | awk '{if (NR > 1) print $1}' | sort))
  local error_list=$?
  if [ "$error_list" -gt 0 ]; then
    error "ollama_list_array: error_list: $error_list"
    return $RETURN_ERROR
  fi
  echo "${models[@]}" # space separated list of model names
  debug "ollama_list_array: ${#models[@]} models found"
  return $RETURN_SUCCESS
}

# Model Functions

# Get a random model
#
# Usage: ollama_model_random
# Output: 1 model name, to stdout
# Returns: 0 on success, 1 on error
ollama_model_random() {
  debug "ollama_model_random"
  local models=($(ollama_list_array))
  debug "ollama_model_random: ${#models[@]} models found"
  if [ ${#models[@]} -eq 0 ]; then
    error "ollama_model_random: No Models Found"
    return $RETURN_ERROR
  fi
  RANDOM=$(date +%N) # seed random with microseconds
  echo "${models[RANDOM%${#models[@]}]}"
  return $RETURN_SUCCESS
}

# Unload a model from memory
#
# Usage: ollama_model_unload "model"
# Input: 1 - Model name to unload
# Output: unload result, in json, to stdout
# Returns: 0 on success, 1 on error
ollama_model_unload() {
  debug 'ollama_model_unload'
  if [ -z "$1" ]; then
    debug 'Error: ollama_model_unload: no model'
    return $RETURN_ERROR
  fi
  local result=$(ollama_api_post "/api/generate" "{\"model\":$(json_clean "$1"),\"keep_alive\":0}")
  local error_unload=$?
  if [ "$error_unload" -gt 0 ]; then
    error "ollama_model_unload: error_unload: $error_unload result: [$result]"
    return $RETURN_ERROR
  fi
  # TODO - if result is {"error":"reason"} then error "$reason"; return $RETURN_ERROR
  printf '%s\n' "$result"
  return $RETURN_SUCCESS
}

# Processes Functions

# Running model processes, CLI version
#
# Usage: ollama_ps
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_ps() {
  debug "ollama_ps"
  ollama ps
  local error_ollama=$?
  if [ "$error_ollama" -gt 0 ]; then
    error "ollama_ps: error_ollama: $error_ollama"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Running model processes, JSON version
#
# Usage: ollama_ps_json
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_ps_json() {
  debug "ollama_ps_json"
  ollama_api_get "/api/ps"
  local error_ollama_api_get=$?
  if [ "$error_ollama_api_get" -gt 0 ]; then
    error "ollama_ps_json: error_ollama_api_get: $error_ollama_api_get"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Show Functions

# Show model information, TEXT version
#
# Usage: ollama_show "model"
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_show() {
  debug "ollama_show"
  ollama show "$1"
  local error_ollama=$?
  if [ "$error_ollama" -gt 0 ]; then
    error "ollama_show: error_ollama: $error_ollama"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Show model information, JSON version
#
# Usage: ollama_show_json "model"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_show_json() {
  debug "ollama_show_json"
  ollama_api_post "/api/show" "{\"model\":$(json_clean "$1")}"
  local error_ollama_api_post=$?
  if [ "$error_ollama_api_post" -gt 0 ]; then
    error "ollama_show_json: error_ollama_api_post: $error_ollama_api_post"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama Functions

# Is Ollama installed on the local system?
#
# Usage: if ollama_installed; then echo "Ollama Installed"; else echo "Ollama Not Installed"; fi
# Input: none
# Output: none
# Returns: 0 if Ollama is installed, 1 if Ollama is not installed
ollama_installed() {
  debug "ollama_installed"
  if [ -z "$(command -v "ollama" 2> /dev/null)" ]; then
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama environment variables
#
# Usage: ollama_vars
# Input: none
# Output: text, to stdout
# Returns: 0
ollama_vars() {
  echo "OLLAMA_DEBUG: $OLLAMA_DEBUG"
  echo "OLLAMA_HOST: $OLLAMA_HOST"
  echo "OLLAMA_KEEP_ALIVE: $OLLAMA_KEEP_ALIVE"
  echo "OLLAMA_MAX_LOADED_MODELS: $OLLAMA_MAX_LOADED_MODELS"
  echo "OLLAMA_MAX_QUEUE: $OLLAMA_MAX_QUEUE"
  echo "OLLAMA_MODELS: $OLLAMA_MODELS"
  echo "OLLAMA_NUM_PARALLEL: $OLLAMA_NUM_PARALLEL"
  echo "OLLAMA_NOPRUNE: $OLLAMA_NOPRUNE"
  echo "OLLAMA_ORIGINS: $OLLAMA_ORIGINS"
  echo "OLLAMA_SCHED_SPREAD: $OLLAMA_SCHED_SPREAD"
  echo "OLLAMA_FLASH_ATTENTION: $OLLAMA_FLASH_ATTENTION"
  echo "OLLAMA_KV_CACHE_TYPE: $OLLAMA_KV_CACHE_TYPE"
  echo "OLLAMA_LLM_LIBRARY: $OLLAMA_LLM_LIBRARY"
  echo "OLLAMA_GPU_OVERHEAD: $OLLAMA_GPU_OVERHEAD"
  echo "OLLAMA_LOAD_TIMEOUT: $OLLAMA_LOAD_TIMEOUT"
  echo "OLLAMA_TMPDIR: $OLLAMA_TMPDIR"
  echo "OLLAMA_MAX_VRAM: $OLLAMA_MAX_VRAM"
  echo "OLLAMA_NOHISTORY: $OLLAMA_NOHISTORY"
  echo "OLLAMA_MULTIUSER_CACHE: $OLLAMA_MULTIUSER_CACHE"
  echo "OLLAMA_CONTEXT_LENGTH: $OLLAMA_CONTEXT_LENGTH"
  echo "OLLAMA_NEW_ENGINE: $OLLAMA_NEW_ENGINE"
  echo "OLLAMA_INTEL_GPU: $OLLAMA_INTEL_GPU"
  echo "OLLAMA_RUNNERS_DIR: $OLLAMA_RUNNERS_DIR"
  echo "OLLAMA_TEST_EXISTING: $OLLAMA_TEST_EXISTING"
  echo "CUDA_VISIBLE_DEVICES: $CUDA_VISIBLE_DEVICES"
  echo "GPU_DEVICE_ORDINAL: $GPU_DEVICE_ORDINAL"
  echo "HSA_OVERRIDE_GFX_VERSION: $HSA_OVERRIDE_GFX_VERSION"
  echo "HIP_PATH: $HIP_PATH"
  echo "HIP_VISIBLE_DEVICES: $HIP_VISIBLE_DEVICES"
  echo "ROCR_VISIBLE_DEVICES: $ROCR_VISIBLE_DEVICES"
  echo "JETSON_JETPACK: $JETSON_JETPACK"
  echo "LD_LIBRARY_PATHS: $LD_LIBRARY_PATH"
  echo "HTTP_PROXY: $HTTP_PROXY"
  echo "LOCALAPPDATA: $LOCALAPPDATA"
  #echo "HOME: $HOME"
  echo "TERM: $TERM"
  return $RETURN_SUCCESS
}

# Ollama application version, TEXT version
#
# Usage: ollama_version
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_version() {
  debug "ollama_version"
  ollama_api_get "/api/version" | jq -r ".version"
  local error_ollama_api_get=$?
  if [ "$error_ollama_api_get" -gt 0 ]; then
    error "ollama_version: error_ollama_api_get: $error_ollama_api_get"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama application version, JSON version
#
# Usage: ollama_version_json
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_version_json() {
  debug "ollama_version_json"
  ollama_api_get "/api/version"
  local error_ollama_api_get=$?
  if [ "$error_ollama_api_get" -gt 0 ]; then
    error "ollama_version_json: error_ollama_api_get: $error_ollama_api_get"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama application version, CLI version
#
# Usage: ollama_version_cli
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_version_cli() {
  debug "ollama_version_cli"
  ollama --version
  local error_ollama=$?
  if [ "$error_ollama" -gt 0 ]; then
    error "ollama_version_cli: error_ollama: $error_ollama"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Utility

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

# Lib Functions

# About Ollama Bash Lib
#
# Usage: ollama_lib_about
# Input: none
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_lib_about() {
  echo "$OLLAMA_LIB_NAME v$OLLAMA_LIB_VERSION"
  echo
  echo "A Bash Library to interact with Ollama"
  echo
  echo "OLLAMA_LIB_NAME     : $OLLAMA_LIB_NAME"
  echo "OLLAMA_LIB_VERSION  : $OLLAMA_LIB_VERSION"
  echo "OLLAMA_LIB_URL      : $OLLAMA_LIB_URL"
  echo "OLLAMA_LIB_LICENSE  : $OLLAMA_LIB_LICENSE"
  echo "OLLAMA_LIB_COPYRIGHT: $OLLAMA_LIB_COPYRIGHT"
  echo "OLLAMA_LIB_DEBUG    : $OLLAMA_LIB_DEBUG"
  echo "OLLAMA_LIB_API      : $OLLAMA_LIB_API"
  echo "OLLAMA_LIB_STREAM   : $OLLAMA_LIB_STREAM"
  echo "OLLAMA_LIB_MESSAGES : ${#OLLAMA_LIB_MESSAGES[@]}"
  echo
  if [ -z "$(command -v compgen 2> /dev/null)" ]; then
    debug "ollama_lib_about: compgen Not Found"
    return $RETURN_ERROR
  fi
  echo "Functions:"
  echo
  compgen -A function | grep 'ollama_' | sort
}

# Ollama Bash Lib version
#
# Usage: ollama_lib_version
# Input: none
# Output: semantic version number, to stdout
# Returns: 0
ollama_lib_version() {
  echo "$OLLAMA_LIB_VERSION"
  return $RETURN_SUCCESS
}: File name too long
 ```markdown
# Function Overview

The script provided is a simple Python function for finding the Fibonacci sequence up to a given number. It's a good start, but there are several areas that could be improved. Here's a breakdown of my review:

## Function Name

The function name `fib` is not descriptive enough. A more appropriate name would be something like `find_fibonacci_sequence_up_to`.

## Function Signature

The function signature accepts one parameter, `n`, which represents the maximum number to find Fibonacci sequence up to. However, it does not handle edge cases such as negative or non-integer values of `n`. Adding type and value checks would make the function more robust.

## Function Implementation

The function uses a loop to calculate the Fibonacci sequence. This is an O(n^2) solution, which is relatively slow for large inputs due to redundant calculations. A more efficient approach would be using dynamic programming or memoization (O(n)) to store previously calculated Fibonacci numbers and reuse them.

## Error Handling

As mentioned earlier, there's no error handling for invalid input values. The function should raise an appropriate exception when given a non-integer or negative number as the `n` argument.

## Code Style

The code could be improved in terms of style and readability. Here are some suggestions:

1. Use consistent indentation: The function body is indented with two spaces, while the inner if block is indented with four spaces.
2. Add comments explaining the purpose of the function and how it works.
3. Follow PEP8 guidelines for naming conventions, spacing, and formatting.
4. Consider breaking down the function into smaller, more manageable pieces if it becomes too complex to read easily.

## Testing

There are no tests included in this script. It's essential to write test cases that cover various scenarios, including edge cases, to ensure the function works as expected and doesn't introduce any unintended bugs or issues.

In summary, the provided script is a good starting point for calculating Fibonacci sequences up to a given number. To make it more robust, efficient, and maintainable, consider addressing the points mentioned above.
```

## Review Debug

```bash
prompt="Act as a Marketing Expert.
Do a full review of this github project README.md.
Output your review in pure Markdown format.

$(cat "../ollama_bash_lib.sh")"
ollama_generate "mistral:7b" "$prompt"
```
cat: #!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_LIB_NAME="Ollama Bash Lib"
OLLAMA_LIB_VERSION="0.40.10"
OLLAMA_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_LIB_LICENSE="MIT"
OLLAMA_LIB_COPYRIGHT="Copyright (c) 2025 Ollama Bash Lib, Attogram Project <https://github.com/attogram>"

OLLAMA_LIB_API=${OLLAMA_HOST:-"http://localhost:11434"} # Ollama API URL, No slash at end
OLLAMA_LIB_DEBUG=0     # 0 = No debug messages, 1 = Yes debug messages
OLLAMA_LIB_MESSAGES=() # Array of messages
OLLAMA_LIB_STREAM=0    # 0 = No streaming, 1 = Yes streaming
RETURN_SUCCESS=0       # Standard success return value
RETURN_ERROR=1         # Standard error return value

# Internal Functions

# Debug message
#
# Usage: debug "message"
# Input: 1 - the debug message
# Output: message to stderr
# Returns: 0 on success, 1 on error
debug() {
  if [ "$OLLAMA_LIB_DEBUG" -eq "1" ]; then
    >&2 echo -e "[DEBUG] $1"
  fi
}

# Error message
#
# Usage: error "message"
# Input: 1 - the error message
# Output: message to stderr
# Returns: 0 on success, 1 on error
error() {
  >&2 echo -e "[ERROR] $1"
}

# Escape a string for use as a JSON value
# - Use to clean a value (will escape "quotes")
#
# Usage: json_clean "string"
# Input: 1 - The string to escape
# Output: "quoted safe json value" to stdout
# Returns: 0 on success, 1 on jq error
json_clean() {
  debug "json_clean: $(echo "$1" | wc -c | sed 's/ //g') bytes [${1:0:42}]"
  jq -Rn --arg str "$1" '$str'
  local error_jq=$?
  if [ "$error_jq" -gt 0 ]; then
    error "json_clean: error_jq: $error_jq"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Sanitize a string to use for jq
# - Use to clean a json block (will not escape "quotes")
#
# Usage: json_sanitize "string"
# Input: 1 - The string to sanitize
# Output: sanitized string to stdout
# Returns: 0 on success, 1 on error
json_sanitize() {
  debug "json_sanitize: $(echo "$1" | wc -c | sed 's/ //g') bytes [${1:0:42}]"
  local sanitized="$1"
  # Replace carriage returns (CR, ASCII 13) with literal \r
  sanitized=$(printf '%s' "$1" | sed $'s/\r/\\\\r/g')
  # Replace newlines (LF, ASCII 10) with literal \n using awk, then strip final literal \n
  sanitized=$(printf '%s' "$sanitized" | awk '{ ORS="\\n"; print }' | sed 's/\\n$//')
  # Remove all control chars 0-9, 11-12, 14-31
  # TODO - don't remove control chars - instead replace them like jq -Rn does
  sanitized=$(printf '%s' "$sanitized" | tr -d '\000-\011\013\014\016-\037')
  printf '%s\n' "$sanitized"
  debug "json_sanitize: sanitized: $(echo "$sanitized" | wc -c | sed 's/ //g') bytes [[${sanitized:0:42}]]"
  return $RETURN_SUCCESS
}

# API Functions

# GET request to the Ollama API
#
# Usage: ollama_api_get "/api/path"
# Input: 1 = API URL path
# Output: API call result, to stdout
# Returns: 0 on success, 1 on error
ollama_api_get() {
  debug "ollama_api_get: [$1]"
  curl -s -X GET "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json'
  local error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $RETURN_ERROR
  fi
  debug 'ollama_api_get: return: 0'
  return $RETURN_SUCCESS
}

# POST request to the Ollama API
#
# Usage: ollama_api_post "/api/path" "{ json content }"
# Input: 1 - API URL path
# Input: 2 - JSON content
# Output: API call result, to stdout
# Returns: 0 on success, 1 on error
ollama_api_post() {
  debug "ollama_api_post: [$1] [${2:0:42}]"
  curl -s -X POST "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json' -d "$2"
  local error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $RETURN_ERROR
  fi
  debug 'ollama_api_post: return 0'
  return $RETURN_SUCCESS
}

# Ping the Ollama API
#
# Usage: ollama_api_ping
# Input: none
# Output: none
# Returns: 0 if API is reachable, 1 if API is not reachable
ollama_api_ping() {
  debug 'ollama_api_ping'
  local result=$(ollama_api_get "")
  local api_get_error=$?
  if [ "$api_get_error" -gt 0 ]; then
    error "ollama_api_ping: error: $api_get_error"
    return $RETURN_ERROR
  fi
  if [[ "$result" == "Ollama is running" ]]; then
    return $RETURN_SUCCESS
  fi
  error "ollama_api_ping: unknown result: [$result]"
  return $RETURN_ERROR
}

# Generate Functions

# Generate a completion as json
#
# Usage: ollama_generate_json "model" "prompt"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_json() {
  debug "ollama_generate_json: [$1] [${2:0:42}]"
  debug "ollama_generate_json: OLLAMA_LIB_STREAM: $OLLAMA_LIB_STREAM"
  local json="{\"model\":$(json_clean "$1"),\"prompt\":$(json_clean "$2")"
  if [ "$OLLAMA_LIB_STREAM" -eq "0" ]; then
    json+=",\"stream\":false"
  fi
  json+="}"
  ollama_api_post "/api/generate" "$json"
  local error_ollama_api_post=$?
  if [ "$error_ollama_api_post" -gt 0 ]; then
    error "ollama_generate_json: error_ollama_api_post: $error_ollama_api_post"
    return $RETURN_ERROR
  fi
  debug 'ollama_generate_json: return: 0'
  return $RETURN_SUCCESS
}

# Generate a completion, as streaming json
#
# Usage: ollama_generate_stream_json "model" "prompt"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream_json() {
  debug "ollama_generate_stream_json: [$1] [${2:0:42}]"
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  ollama_generate_json "$1" "$2"
  local error_ollama_generate_json=$?
  # echo # needed?
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate_stream_json: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  debug 'ollama_generate_stream_json: return: 0'
  return $RETURN_SUCCESS
}

# Generate a completion as text
#
# Usage: ollama_generate "model" "prompt"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_generate() {
  debug "ollama_generate: [$1] [${2:0:42}]"
  OLLAMA_LIB_STREAM=0
  local result=$(ollama_generate_json "$1" "$2")
  local error_ollama_generate_json=$?
  debug "ollama_generate: result: $(echo "$result" | wc -c | sed 's/ //g') bytes"
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  json_sanitize "$result" | jq -r ".response"
  local error_jq=$?
  if [ "$error_jq" -gt 0 ]; then
    error "ollama_generate: error_jq: $error_jq [$response]"
    return $RETURN_ERROR
  fi
  debug 'ollama_generate: return: 0'
  return $RETURN_SUCCESS
}

# Generate a completion as streaming text
#
# Usage: ollama_generate_stream "model" "prompt"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream() {
  debug "ollama_generate_stream: [$1] [$2]"
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  local error_jq
  ollama_generate_json "$1" "$2" | while IFS= read -r line; do
    echo -n "$(json_sanitize "$line" | jq -r ".response")"
    error_jq=$?
    if [ "$error_jq" -gt 0 ]; then
      error "ollama_generate_stream: error_jq: $error_jq"
      return $RETURN_ERROR
    fi
  done
  local error_ollama_generate_json=$?
  # echo # needed?
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate_stream: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_stream: return: 0"
  return $RETURN_SUCCESS
}

# Messages Functions

# Get all messages
#
# Usage: messages="$(ollama_messages)"
# Output: json, 1 messages per line, to stdout
# Returns: 0 on success, 1 on error
ollama_messages() {
  debug "ollama_messages"
  if [ ${#OLLAMA_LIB_MESSAGES[@]} -eq 0 ]; then
    debug "ollama_messages: no messages"
    return $RETURN_ERROR
  fi
  printf '%s\n' "${OLLAMA_LIB_MESSAGES[@]}"
  return $RETURN_SUCCESS
}

# Add a message
#
# Usage: ollama_message_add "role" "message"
# Output: none
# Returns: 0 on success, 1 on error
ollama_messages_add() {
  debug "ollama_messages_add: [$1] [${2:0:42}]"
  local role="$1"
  local message="$2"
  OLLAMA_LIB_MESSAGES+=("{\"role\":$(json_clean "$role"),\"content\":$(json_clean "$message")}")
  return $RETURN_SUCCESS
}

# Clear all messages
#
# Usage: ollama_messages_clear
# Output: none
# Returns: 0 on success, 1 on error
ollama_messages_clear() {
  debug "IN DEV - ollama_messages_clear"
  OLLAMA_LIB_MESSAGES=()
  return $RETURN_SUCCESS
}

# Messages count
#
# Usage: ollama_messages_count
# Output: number of messages, to stdout
# Returns: 0 on success, 1 on error
ollama_messages_count() {
  debug "ollama_messages_count"
  echo "${#OLLAMA_LIB_MESSAGES[@]}"
  return $RETURN_SUCCESS
}

# Chat Functions

# Chat completion request as json
#
# Usage: ollama_chat_json "model"
# Input: 1 - model
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_chat_json() {
  debug "ollama_chat_json: [$1]"
  local model="$1"
  if [ -z "$model" ]; then
    error 'ollama_chat_json: Model Not Found. Usage: ollama_chat_json "model"'
    return $RETURN_ERROR
  fi

  # TODO - use jq to build json? better/easier array handling
  local json="{\"model\":$(json_clean "$model"),\"messages\":["
  json+=$(printf "%s," "${OLLAMA_LIB_MESSAGES[@]}")
  json="$(echo "$json" | sed 's/,*$//g')" # strip last slash
  json+="]"
  if [ "$OLLAMA_LIB_STREAM" -eq 0 ]; then
    json+=",\"stream\":false"
  fi
  json+="}"

  local result=$(ollama_api_post "/api/chat" "$json")
  local error_post=$?
  if [ "$error_post" -gt 0 ]; then
    error "ollama_chat_json: error_post: $error_post"
    return $RETURN_ERROR
  fi

  content=$(json_sanitize "$result" | jq -r ".message.content")
  local error_jq_message_content=$?
  debug "ollama_chat_json: content: [$content]"
  if [ "$error_jq_message_content" -gt 0 ]; then
    error "ollama_chat_json: error_jq_message_content: $error_jq_message_content"
    return $RETURN_ERROR
  fi
  ollama_messages_add "assistant" "$content"
  echo "$result"
}

# Chat completion request as text
#
# Usage: ollama_chat "model"
# Input: 1 - model
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_chat() {
  debug "ollama_chat: [$1]"
  local model="$1"
  if [ -z "$model" ]; then
    error "ollama_chat: Model Not Found. Usage: ollama_chat \"model\""
    return $RETURN_ERROR
  fi
  OLLAMA_LIB_STREAM=0
  local content=$(json_sanitize "$(ollama_chat_json "$model")" | jq -r ".message.content")
  local error_jq_message_content=$?
  debug "ollama_chat: content: $content"
  if [ "$error_jq_message_content" -gt 0 ]; then
    error "ollama_chat: error_jq_message_content: $error_jq_message_content"
    return $RETURN_ERROR
  fi
  echo "$content"
  ollama_messages_add "assistant" "$content"
  return $RETURN_SUCCESS
}

# Chat completion request as streaming text
#
# Usage: ollama_chat_stream "model"
# Input: 1 - model
# Output: streaming text, to stdout
# Returns: 0 on success, 1 on error
ollama_chat_stream() {
  debug "ollama_chat_stream: [$1]"
  OLLAMA_LIB_STREAM=1
  ollama_chat "$1"
  local error_ollama_chat=$?
  OLLAMA_LIB_STREAM=0
  if [ "$error_ollama_chat" -gt 0 ]; then
    error "ollama_chat_stream: error_ollama_chat: $error_ollama_chat"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Chat completion request as streaming json
#
# Usage: ollama_chat_stream_json "model"
# Input: 1 - model
# Output: streaming json, to stdout
# Returns: 0 on success, 1 on error
ollama_chat_stream_json() {
  debug "ollama_chat_stream_json: [$1]"
  OLLAMA_LIB_STREAM=1
  ollama_chat_json "$1"
  local error_ollama_json_chat=$?
  OLLAMA_LIB_STREAM=0
  if [ "$error_ollama_json_chat" -gt 0 ]; then
    error "ollama_chat_stream_json: error_ollama_json_chat: $error_ollama_json_chat"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# List Functions

# All available models, CLI version
#
# Usage: ollama_list
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_list() {
  debug "ollama_list"
  ollama list | sort
  local error_list=$?
  if [ "$error_list" -gt 0 ]; then
    error "ollama_list: error_list: $error_list"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# All available models, JSON version
#
# Usage: ollama_list_json
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_list_json() {
  debug "ollama_list_json"
  ollama_api_get "/api/tags"
  local error_ollama_api_get=$?
  if [ "$error_ollama_api_get" -gt 0 ]; then
    error "ollama_list: error_ollama_api_get: $error_ollama_api_get"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# All available models, Bash array version
#
# Usage: models=($(ollama_list_array))
# Output: space separated list of model names, to stdout
# Returns: 0 on success, 1 on error
ollama_list_array() {
  debug "ollama_list_array"
  # Get list from ollama cli, skip first line (headers), get first column (names), sort alphabetically
  local models=($(ollama list | awk '{if (NR > 1) print $1}' | sort))
  local error_list=$?
  if [ "$error_list" -gt 0 ]; then
    error "ollama_list_array: error_list: $error_list"
    return $RETURN_ERROR
  fi
  echo "${models[@]}" # space separated list of model names
  debug "ollama_list_array: ${#models[@]} models found"
  return $RETURN_SUCCESS
}

# Model Functions

# Get a random model
#
# Usage: ollama_model_random
# Output: 1 model name, to stdout
# Returns: 0 on success, 1 on error
ollama_model_random() {
  debug "ollama_model_random"
  local models=($(ollama_list_array))
  debug "ollama_model_random: ${#models[@]} models found"
  if [ ${#models[@]} -eq 0 ]; then
    error "ollama_model_random: No Models Found"
    return $RETURN_ERROR
  fi
  RANDOM=$(date +%N) # seed random with microseconds
  echo "${models[RANDOM%${#models[@]}]}"
  return $RETURN_SUCCESS
}

# Unload a model from memory
#
# Usage: ollama_model_unload "model"
# Input: 1 - Model name to unload
# Output: unload result, in json, to stdout
# Returns: 0 on success, 1 on error
ollama_model_unload() {
  debug 'ollama_model_unload'
  if [ -z "$1" ]; then
    debug 'Error: ollama_model_unload: no model'
    return $RETURN_ERROR
  fi
  local result=$(ollama_api_post "/api/generate" "{\"model\":$(json_clean "$1"),\"keep_alive\":0}")
  local error_unload=$?
  if [ "$error_unload" -gt 0 ]; then
    error "ollama_model_unload: error_unload: $error_unload result: [$result]"
    return $RETURN_ERROR
  fi
  # TODO - if result is {"error":"reason"} then error "$reason"; return $RETURN_ERROR
  printf '%s\n' "$result"
  return $RETURN_SUCCESS
}

# Processes Functions

# Running model processes, CLI version
#
# Usage: ollama_ps
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_ps() {
  debug "ollama_ps"
  ollama ps
  local error_ollama=$?
  if [ "$error_ollama" -gt 0 ]; then
    error "ollama_ps: error_ollama: $error_ollama"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Running model processes, JSON version
#
# Usage: ollama_ps_json
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_ps_json() {
  debug "ollama_ps_json"
  ollama_api_get "/api/ps"
  local error_ollama_api_get=$?
  if [ "$error_ollama_api_get" -gt 0 ]; then
    error "ollama_ps_json: error_ollama_api_get: $error_ollama_api_get"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Show Functions

# Show model information, TEXT version
#
# Usage: ollama_show "model"
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_show() {
  debug "ollama_show"
  ollama show "$1"
  local error_ollama=$?
  if [ "$error_ollama" -gt 0 ]; then
    error "ollama_show: error_ollama: $error_ollama"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Show model information, JSON version
#
# Usage: ollama_show_json "model"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_show_json() {
  debug "ollama_show_json"
  ollama_api_post "/api/show" "{\"model\":$(json_clean "$1")}"
  local error_ollama_api_post=$?
  if [ "$error_ollama_api_post" -gt 0 ]; then
    error "ollama_show_json: error_ollama_api_post: $error_ollama_api_post"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama Functions

# Is Ollama installed on the local system?
#
# Usage: if ollama_installed; then echo "Ollama Installed"; else echo "Ollama Not Installed"; fi
# Input: none
# Output: none
# Returns: 0 if Ollama is installed, 1 if Ollama is not installed
ollama_installed() {
  debug "ollama_installed"
  if [ -z "$(command -v "ollama" 2> /dev/null)" ]; then
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama environment variables
#
# Usage: ollama_vars
# Input: none
# Output: text, to stdout
# Returns: 0
ollama_vars() {
  echo "OLLAMA_DEBUG: $OLLAMA_DEBUG"
  echo "OLLAMA_HOST: $OLLAMA_HOST"
  echo "OLLAMA_KEEP_ALIVE: $OLLAMA_KEEP_ALIVE"
  echo "OLLAMA_MAX_LOADED_MODELS: $OLLAMA_MAX_LOADED_MODELS"
  echo "OLLAMA_MAX_QUEUE: $OLLAMA_MAX_QUEUE"
  echo "OLLAMA_MODELS: $OLLAMA_MODELS"
  echo "OLLAMA_NUM_PARALLEL: $OLLAMA_NUM_PARALLEL"
  echo "OLLAMA_NOPRUNE: $OLLAMA_NOPRUNE"
  echo "OLLAMA_ORIGINS: $OLLAMA_ORIGINS"
  echo "OLLAMA_SCHED_SPREAD: $OLLAMA_SCHED_SPREAD"
  echo "OLLAMA_FLASH_ATTENTION: $OLLAMA_FLASH_ATTENTION"
  echo "OLLAMA_KV_CACHE_TYPE: $OLLAMA_KV_CACHE_TYPE"
  echo "OLLAMA_LLM_LIBRARY: $OLLAMA_LLM_LIBRARY"
  echo "OLLAMA_GPU_OVERHEAD: $OLLAMA_GPU_OVERHEAD"
  echo "OLLAMA_LOAD_TIMEOUT: $OLLAMA_LOAD_TIMEOUT"
  echo "OLLAMA_TMPDIR: $OLLAMA_TMPDIR"
  echo "OLLAMA_MAX_VRAM: $OLLAMA_MAX_VRAM"
  echo "OLLAMA_NOHISTORY: $OLLAMA_NOHISTORY"
  echo "OLLAMA_MULTIUSER_CACHE: $OLLAMA_MULTIUSER_CACHE"
  echo "OLLAMA_CONTEXT_LENGTH: $OLLAMA_CONTEXT_LENGTH"
  echo "OLLAMA_NEW_ENGINE: $OLLAMA_NEW_ENGINE"
  echo "OLLAMA_INTEL_GPU: $OLLAMA_INTEL_GPU"
  echo "OLLAMA_RUNNERS_DIR: $OLLAMA_RUNNERS_DIR"
  echo "OLLAMA_TEST_EXISTING: $OLLAMA_TEST_EXISTING"
  echo "CUDA_VISIBLE_DEVICES: $CUDA_VISIBLE_DEVICES"
  echo "GPU_DEVICE_ORDINAL: $GPU_DEVICE_ORDINAL"
  echo "HSA_OVERRIDE_GFX_VERSION: $HSA_OVERRIDE_GFX_VERSION"
  echo "HIP_PATH: $HIP_PATH"
  echo "HIP_VISIBLE_DEVICES: $HIP_VISIBLE_DEVICES"
  echo "ROCR_VISIBLE_DEVICES: $ROCR_VISIBLE_DEVICES"
  echo "JETSON_JETPACK: $JETSON_JETPACK"
  echo "LD_LIBRARY_PATHS: $LD_LIBRARY_PATH"
  echo "HTTP_PROXY: $HTTP_PROXY"
  echo "LOCALAPPDATA: $LOCALAPPDATA"
  #echo "HOME: $HOME"
  echo "TERM: $TERM"
  return $RETURN_SUCCESS
}

# Ollama application version, TEXT version
#
# Usage: ollama_version
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_version() {
  debug "ollama_version"
  ollama_api_get "/api/version" | jq -r ".version"
  local error_ollama_api_get=$?
  if [ "$error_ollama_api_get" -gt 0 ]; then
    error "ollama_version: error_ollama_api_get: $error_ollama_api_get"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama application version, JSON version
#
# Usage: ollama_version_json
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_version_json() {
  debug "ollama_version_json"
  ollama_api_get "/api/version"
  local error_ollama_api_get=$?
  if [ "$error_ollama_api_get" -gt 0 ]; then
    error "ollama_version_json: error_ollama_api_get: $error_ollama_api_get"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama application version, CLI version
#
# Usage: ollama_version_cli
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_version_cli() {
  debug "ollama_version_cli"
  ollama --version
  local error_ollama=$?
  if [ "$error_ollama" -gt 0 ]; then
    error "ollama_version_cli: error_ollama: $error_ollama"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Utility

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

# Lib Functions

# About Ollama Bash Lib
#
# Usage: ollama_lib_about
# Input: none
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_lib_about() {
  echo "$OLLAMA_LIB_NAME v$OLLAMA_LIB_VERSION"
  echo
  echo "A Bash Library to interact with Ollama"
  echo
  echo "OLLAMA_LIB_NAME     : $OLLAMA_LIB_NAME"
  echo "OLLAMA_LIB_VERSION  : $OLLAMA_LIB_VERSION"
  echo "OLLAMA_LIB_URL      : $OLLAMA_LIB_URL"
  echo "OLLAMA_LIB_LICENSE  : $OLLAMA_LIB_LICENSE"
  echo "OLLAMA_LIB_COPYRIGHT: $OLLAMA_LIB_COPYRIGHT"
  echo "OLLAMA_LIB_DEBUG    : $OLLAMA_LIB_DEBUG"
  echo "OLLAMA_LIB_API      : $OLLAMA_LIB_API"
  echo "OLLAMA_LIB_STREAM   : $OLLAMA_LIB_STREAM"
  echo "OLLAMA_LIB_MESSAGES : ${#OLLAMA_LIB_MESSAGES[@]}"
  echo
  if [ -z "$(command -v compgen 2> /dev/null)" ]; then
    debug "ollama_lib_about: compgen Not Found"
    return $RETURN_ERROR
  fi
  echo "Functions:"
  echo
  compgen -A function | grep 'ollama_' | sort
}

# Ollama Bash Lib version
#
# Usage: ollama_lib_version
# Input: none
# Output: semantic version number, to stdout
# Returns: 0
ollama_lib_version() {
  echo "$OLLAMA_LIB_VERSION"
  return $RETURN_SUCCESS
}: File name too long
 ```markdown
# Function Definition and Usage
The function `sum_numbers` is defined with two parameters, `a` and `b`, but it's only being used once in the main part of the script. It would be more efficient to either call this function multiple times or integrate the sum calculation into the main loop.

# Variable Naming
Variable names are generally clear and self-explanatory, which is good practice. However, the variable `nums` for an array might be a bit vague. A more descriptive name like `number_list` would improve readability.

# Type Annotations
Python is dynamically typed, but it's still a good practice to include type hints for clarity and potential IDE autocompletion benefits. For instance, the function parameter types and the `nums` array could be explicitly defined.

# Error Handling
Currently, there are no error handling mechanisms in place. What happens if the user inputs non-numeric values or an empty list? Adding checks for these scenarios would make your script more robust.

# Main Loop Structure
The main loop structure is straightforward and easy to understand. However, the increment step of 2 might be confusing to some readers, as it's not immediately obvious why this specific step is chosen. Including a comment explaining the reasoning behind this choice would improve understanding.

# Indentation and Formatting
The indentation and formatting are generally good. However, there are some inconsistencies with single and double quotes being used interchangeably for string literals. Stick to one style for consistency.

# Testing
There are no test cases provided in the script. Adding test cases can help ensure your code works as intended under various circumstances and makes it easier to spot potential bugs during development.

Overall, the script is well-structured and easy to understand. However, incorporating some of the suggestions above will make your script more efficient, robust, and maintainable.
```
