#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_LIB_NAME="Ollama Bash Lib"
OLLAMA_LIB_VERSION="0.42.6"
OLLAMA_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_LIB_DISCORD="https://discord.gg/BGQJCbYVBa"
OLLAMA_LIB_LICENSE="MIT"
OLLAMA_LIB_COPYRIGHT="Copyright (c) 2025 Ollama Bash Lib, Attogram Project <https://github.com/attogram>"

OLLAMA_LIB_API=${OLLAMA_HOST:-"http://localhost:11434"} # Ollama API URL, No slash at end
OLLAMA_LIB_DEBUG=0     # 0 = No debug messages, 1 = Yes debug messages
OLLAMA_LIB_MESSAGES=() # Array of messages
OLLAMA_LIB_STREAM=0    # 0 = No streaming, 1 = Yes streaming
RETURN_SUCCESS=0       # Standard success return value
RETURN_ERROR=1         # Standard error return value

set -o pipefail

# Internal Functions

# Debug message
#
# Usage: debug "message"
# Input: 1 - the debug message
# Output: message to stderr
# Requires: none
# Returns: 0 on success, 1 on error
debug() {
  if [ "$OLLAMA_LIB_DEBUG" -eq "1" ]; then
    printf "[DEBUG] $(date '+%H:%M:%S:%N'): %s\n" "$1" >&2
  fi
}

# Error message
#
# Usage: error "message"
# Input: 1 - the error message
# Output: message to stderr
# Requires: none
# Returns: 0 on success, 1 on error
error() {
  printf "[ERROR] %s\n" "$1" >&2
}

# escape_control_characters
#
# Usage: escape_control_characters "string"
# Input: 1 - string
# Output: string with control characters escaped
# Requires: none
# Returns: 0 on success, 1 on error
escape_control_characters() {
  local input="$1"
  local i out c ascii hex
  out=""
  i=0
  while [ $i -lt ${#input} ]; do
    c="${input:$i:1}"
    # Bash 3.x: get ASCII code using printf and od (works for all printable, most control chars except NUL)
    #           Suppress warnings from od about null bytes
    ascii=$(printf '%s' "$c" | od -An -tuC 2>/dev/null | tr -d ' ')
    # If blank, probably a NUL (Bash can't store NULs)
    if [ -z "$ascii" ]; then
      :
    elif [ "$ascii" -ge 0 ] 2>/dev/null && [ "$ascii" -le 31 ]; then
      hex=$(printf '%04x' "$ascii")
      out="${out}\\u$hex"
    else
      out="${out}$c"
    fi
    i=$((i+1))
  done
  printf '%s' "$out"
}

# API Functions

# GET request to the Ollama API
#
# Usage: ollama_api_get '/api/path'
# Input: 1 = API URL path
# Output: API call result, to stdout
# Requires: curl
# Returns: 0 on success, 1 on error
ollama_api_get() {
  debug "ollama_api_get: [$1]"
  curl -s -X GET "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json'
  local error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $error_curl
  fi
  debug 'ollama_api_get: return: 0'
  return $RETURN_SUCCESS
}

# POST request to the Ollama API
#
# Usage: ollama_api_post '/api/path' "{ json content }"
# Input: 1 - API URL path
# Input: 2 - JSON content
# Output: API call result, to stdout
# Requires: curl
# Returns: 0 on success, 1 on error
ollama_api_post() {
  debug "ollama_api_post: [$1] [${2:0:42}]"
  curl -s -X POST "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json' -d "$2"
  local error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_post: error_curl: $error_curl"
    return $error_curl
  fi
  debug 'ollama_api_post: return 0'
  return $RETURN_SUCCESS
}

# Ping the Ollama API
#
# Usage: ollama_api_ping
# Input: none
# Output: none
# Requires: curl
# Returns: 0 if API is reachable, 1 if API is not reachable
ollama_api_ping() {
  debug 'ollama_api_ping'
  local result
  result=$(ollama_api_get "")
  local api_get_error=$?
  if [ "$api_get_error" -gt 0 ]; then
    error "ollama_api_ping: error: $api_get_error"
    return $RETURN_ERROR
  fi
  if [[ "$result" == "Ollama is running" ]]; then # This depends on Ollama app not changing this wording
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
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_generate_json() {
  debug "ollama_generate_json: [$1] [${2:0:42}]"
  debug "ollama_generate_json: OLLAMA_LIB_STREAM: $OLLAMA_LIB_STREAM"
  local stream_bool=true
  if [ "$OLLAMA_LIB_STREAM" -eq "0" ]; then
    stream_bool=false
  fi
  local json_payload
  json_payload=$(jq -n \
    --arg model "$1" \
    --arg prompt "$2" \
    --argjson stream "$stream_bool" \
    '{model: $model, prompt: $prompt, stream: $stream}')
  if ! ollama_api_post '/api/generate' "$json_payload"; then
    error "ollama_generate_json: ollama_api_post failed"
    return $RETURN_ERROR
  fi
  debug 'ollama_generate_json: return: 0'
  return $RETURN_SUCCESS
}

# Generate a completion, as streaming json
#
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Usage: ollama_generate_stream_json "model" "prompt"
# Output: json, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_generate_stream_json() {
  debug "ollama_generate_stream_json: [$1] [${2:0:42}]"
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  if ! ollama_generate_json "$1" "$2"; then
    error "ollama_generate_stream_json: ollama_generate_json failed"
    OLLAMA_LIB_STREAM=0 # Turn off streaming
    return $RETURN_ERROR
  fi
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  debug 'ollama_generate_stream_json: return: 0'
  return $RETURN_SUCCESS
}

# Generate a completion as text
#
# Usage: ollama_generate "model" "prompt"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: text, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_generate() {
  debug "ollama_generate: [$1] [${2:0:42}]"
  OLLAMA_LIB_STREAM=0
  local result
  result=$(ollama_generate_json "$1" "$2")
  local error_ollama_generate_json=$?
  debug "ollama_generate: result: $(echo "$result" | wc -c | sed 's/ //g') bytes"
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  if ! escape_control_characters "$result" | jq -r ".response"; then
    error "ollama_generate: escape_control_characters|jq failed"
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
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_generate_stream() {
  debug "ollama_generate_stream: [$1] [${2:0:42}]"
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  local error_jq
  ollama_generate_json "$1" "$2" | while IFS= read -r line; do
  if ! echo -n "$(escape_control_characters "$line" | jq -r ".response")"; then
    error "ollama_generate_stream: escape_control_characters|jq failed"
    return $RETURN_ERROR
  fi
  done
  local error_ollama_generate_json=$?
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
# Requires: none
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
# Usage: ollama_messages_add "role" "message"
# Input: 1 - role (user/assistant/tool/system)
# Input: 2 - the messages
# Output: none
# Requires: jq
# Returns: 0
ollama_messages_add() {
  debug "ollama_messages_add: [$1] [${2:0:42}]"
  local json_payload
  json_payload=$(jq -n \
      --arg role "$1" \
      --arg content "$2" \
      '{role: $role, content: $content}')
  OLLAMA_LIB_MESSAGES+=("$json_payload")
}

# Clear all messages
#
# Usage: ollama_messages_clear
# Output: none
# Requires: none
# Returns: 0
ollama_messages_clear() {
  debug "ollama_messages_clear"
  OLLAMA_LIB_MESSAGES=()
}

# Messages count
#
# Usage: ollama_messages_count
# Output: number of messages, to stdout
# Requires: none
# Returns: 0
ollama_messages_count() {
  debug "ollama_messages_count"
  echo "${#OLLAMA_LIB_MESSAGES[@]}"
}

# Chat Functions

# Chat completion request as json
#
# Usage: ollama_chat_json "model"
# Input: 1 - model
# Output: json, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_chat_json() {
  debug "ollama_chat_json: [${1:0:42}]"
  local model="$1"
  if [ -z "$model" ]; then
    error 'ollama_chat_json: Model Not Found. Usage: ollama_chat_json "model"'
    return $RETURN_ERROR
  fi

  local stream_bool=true
  if [ "$OLLAMA_LIB_STREAM" -eq "0" ]; then
    stream_bool=false
  fi

  # Join array elements with comma and wrap in []
  local messages_array_json
  messages_array_json=$(printf ",%s" "${OLLAMA_LIB_MESSAGES[@]}")
  messages_array_json="[${messages_array_json:1}]" # Remove leading comma

  local json_payload
  json_payload=$(jq -n \
      --arg model "$model" \
      --argjson messages "$messages_array_json" \
      --argjson stream "$stream_bool" \
      '{model: $model, messages: $messages, stream: $stream}')

  debug "ollama_chat_json: json_payload: $json_payload"

  local result
  if ! result=$(ollama_api_post '/api/chat' "$json_payload"); then
    error "ollama_chat_json: ollama_api_post failed"
    return $RETURN_ERROR
  fi

  content=$(escape_control_characters "$result" | jq -r ".message.content")
  local error_jq_message_content=$?
  debug "ollama_chat_json: content: [${content:0:42}]"
  if [ "$error_jq_message_content" -gt 0 ]; then
    error "ollama_chat_json: error_jq_message_content: $error_jq_message_content"
    return $RETURN_ERROR
  fi

  echo "$result"
  debug "ollama_chat_json: return 0"
}

# Chat completion request as text
#
# Usage: ollama_chat "model"
# Input: 1 - model
# Output: text, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_chat() {
  debug "ollama_chat: [${1:0:42}]"
  local model="$1"
  if [ -z "$model" ]; then
    error 'ollama_chat: Model Not Found. Usage: ollama_chat "model"'
    return $RETURN_ERROR
  fi
  OLLAMA_LIB_STREAM=0

  local response
  if ! response=$(ollama_chat_json "$model"); then
    error 'ollama_chat: ollama_chat_json failed'
    return $RETURN_ERROR
  fi

  local message_content
  if ! message_content=$(escape_control_characters "$response" | jq -r ".message.content"); then
    error 'ollama_chat: escape_control_characters|jq failed'
    return $RETURN_ERROR
  fi

  printf '%s\n' "$message_content"

  debug 'ollama_chat: return: 0'
  return $RETURN_SUCCESS
}

# Chat completion request as streaming text
#
# Usage: ollama_chat_stream "model"
# Input: 1 - model
# Output: streaming text, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_chat_stream() {
  debug "ollama_chat_stream: [$1]"
  OLLAMA_LIB_STREAM=1
  if ! ollama_chat "$1"; then
    error "ollama_chat_stream: ollama_chat failed"
    OLLAMA_LIB_STREAM=0
    return $RETURN_ERROR
  fi
  OLLAMA_LIB_STREAM=0
  return $RETURN_SUCCESS
}

# Chat completion request as streaming json
#
# Usage: ollama_chat_stream_json "model"
# Input: 1 - model
# Output: streaming json, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_chat_stream_json() {
  debug "ollama_chat_stream_json: [$1]"
  OLLAMA_LIB_STREAM=1
  if ! ollama_chat_json "$1"; then
    error "ollama_chat_stream_json: ollama_chat_json failed"
    OLLAMA_LIB_STREAM=0
    return $RETURN_ERROR
  fi
  OLLAMA_LIB_STREAM=0
  return $RETURN_SUCCESS
}

# List Functions

# All available models, CLI version
#
# Usage: ollama_list
# Output: text, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_list() {
  debug "ollama_list"
  local list
  if ! list="$(ollama list)"; then # get ollama list
    error "ollama_list: list=|ollama list failed"
    return $RETURN_ERROR
  fi
  if ! echo "$list" | head -n+1; then # print header
    error "ollama_list: echo|head failed"
    return $RETURN_ERROR
  fi
  if ! echo "$list" | tail -n+2 | sort; then # sorted list of models
    error "ollama_list: ollama echo|tail|sort failed"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# All available models, JSON version
#
# Usage: ollama_list_json
# Output: json, to stdout
# Requires: ollama, curl
# Returns: 0 on success, 1 on error
ollama_list_json() {
  debug "ollama_list_json"
  if ! ollama_api_get '/api/tags'; then
    error "ollama_list_json: ollama_api_get failed"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# All available models, Bash array version
#
# Usage: IFS=" " read -r -a models <<< "$(ollama_list_array)"
# Usage: models=($(ollama_list_array))
# Output: space separated list of model names, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_list_array() {
  debug "ollama_list_array"
  local models=()
  while IFS= read -r line; do
    models+=("$line")
  done < <(ollama list | awk 'NR > 1 {print $1}' | sort)
  echo "${models[@]}" # space separated list of model names
  debug "ollama_list_array: ${#models[@]} models found: return 0"
  return $RETURN_SUCCESS
}

# Model Functions

# Get a random model
#
# Usage: ollama_model_random
# Input: none
# Output: 1 model name, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_model_random() {
  debug "ollama_model_random"
  IFS=" " read -r -a models <<< "$(ollama_list_array)"
  debug "ollama_model_random: ${#models[@]} models found"
  if [ ${#models[@]} -eq 0 ]; then
    error "ollama_model_random: No Models Found"
    return $RETURN_ERROR
  fi
  RANDOM="$(date +%N | sed 's/^0*//')" # seed random with microseconds (removing any leading 0's so won't be interpreted as octal)
  echo "${models[RANDOM%${#models[@]}]}"
  return $RETURN_SUCCESS
}

# Unload a model from memory
#
# Usage: ollama_model_unload "model"
# Input: 1 - Model name to unload
# Output: unload result, in json, to stdout
# Requires: ollama, curl, jq
# Returns: 0 on success, 1 on error
ollama_model_unload() {
  debug 'ollama_model_unload'
  if [ -z "$1" ]; then
    error 'ollama_model_unload: no model. Usage: ollama_model_unload "model"'
    return $RETURN_ERROR
  fi

  local json_payload
  json_payload=$(jq -n \
      --arg model "$1" \
      --arg keep_alive '0' \
      '{model: $model, keep_alive: $keep_alive}')
  local result
  if ! result="$(ollama_api_post '/api/generate' "$json_payload")"; then
    error "ollama_model_unload: ollama_api_post failed [$result]"
    return $RETURN_ERROR
  fi
  local is_error
  is_error=$(printf '%s' "$result" | jq -r .error)
  if [ -n "$is_error" ]; then
    error "ollama_model_unload: $is_error"
    return $RETURN_ERROR
  fi
  printf '%s\n' "$result"
  return $RETURN_SUCCESS
}

# Processes Functions

# Running model processes, CLI version
#
# Usage: ollama_ps
# Output: text, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_ps() {
  debug "ollama_ps"
  if ! ollama ps; then
    error "ollama_ps: ollama ps failed"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Running model processes, JSON version
#
# Usage: ollama_ps_json
# Output: json, to stdout
# Requires: ollama, curl
# Returns: 0 on success, 1 on error
ollama_ps_json() {
  debug "ollama_ps_json"
  if ! ollama_api_get '/api/ps'; then
    error "ollama_ps_json: ollama_api_get failed"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Show Functions

# Show model information, TEXT version
#
# Usage: ollama_show "model"
# Output: text, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_show() {
  debug "ollama_show"
  if ! ollama show "$1"; then
    error "ollama_show: ollama show failed"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Show model information, JSON version
#
# Usage: ollama_show_json "model"
# Input: 1 - The model to show
# Output: json, to stdoutF
# Requires: ollama, curl, jq
# Returns: 0 on success, 1 on error
ollama_show_json() {
  debug "ollama_show_json: [$1]"
  local json_payload
  json_payload=$(jq -n \
      --arg model "$1" \
      '{model: $model}')
  if ! ollama_api_post '/api/show' "$json_payload"; then
    error "ollama_show_json: ollama_api_post failed"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama App Functions

# Is Ollama App installed on the local system?
#
# Usage: if ollama_app_installed; then echo "Ollama Installed"; else echo "Ollama Not Installed"; fi
# Input: none
# Output: none
# Requires: none
# Returns: 0 if Ollama is installed, 1 if Ollama is not installed
ollama_app_installed() {
  debug "ollama_app_installed"
  if [ -z "$(command -v "ollama" 2> /dev/null)" ]; then
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama App environment variables
#
# Usage: ollama_app_vars
# Input: none
# Output: text, to stdout
# Requires: none
# Returns: 0
ollama_app_vars() {
  # https://github.com/ollama/ollama/blob/main/docs/modelfile.md#valid-parameters-and-values
  # https://github.com/ollama/ollama/blob/main/envconfig/config.go
  printf '%s\t%s\n' "OLLAMA_AUTH             : ${OLLAMA_AUTH}" "# Enables authentication between the Ollama client and server"
  printf '%s\t%s\n' "OLLAMA_CONTEXT_LENGTH   : ${OLLAMA_CONTEXT_LENGTH}" "# Context length to use unless otherwise specified (default: 4096)"
  printf '%s\t%s\n' "OLLAMA_DEBUG            : ${OLLAMA_DEBUG}" "# Show additional debug information (e.g. OLLAMA_DEBUG=1)"
  printf '%s\t%s\n' "OLLAMA_FLASH_ATTENTION  : ${OLLAMA_FLASH_ATTENTION}" "# Enabled flash attention"
  printf '%s\t%s\n' "OLLAMA_GPU_OVERHEAD     : $OLLAMA_GPU_OVERHEAD" "# Reserve a portion of VRAM per GPU (bytes)"
  printf '%s\t%s\n' "OLLAMA_HOST             : $OLLAMA_HOST" "# IP Address for the ollama server (default 127.0.0.1:11434)"
  printf '%s\t%s\n' "OLLAMA_INTEL_GPU        : ${OLLAMA_INTEL_GPU}" "# Enable experimental Intel GPU detection"
  printf '%s\t%s\n' "OLLAMA_KEEP_ALIVE       : $OLLAMA_KEEP_ALIVE" "# The duration that models stay loaded in memory (default \"5m\")"
  printf '%s\t%s\n' "OLLAMA_KV_CACHE_TYPE    : ${OLLAMA_KV_CACHE_TYPE}" "# Quantization type for the K/V cache (default: f16)"
  printf '%s\t%s\n' "OLLAMA_LLM_LIBRARY      : $OLLAMA_LLM_LIBRARY" "# Set LLM library to bypass autodetection"
  printf '%s\t%s\n' "OLLAMA_LOAD_TIMEOUT     : $OLLAMA_LOAD_TIMEOUT" "# How long to allow model loads to stall before giving up (default \"5m\")"
  printf '%s\t%s\n' "OLLAMA_MAX_LOADED_MODELS: $OLLAMA_MAX_LOADED_MODELS" "# Maximum number of loaded models per GPU"
  printf '%s\t%s\n' "OLLAMA_MAX_QUEUE        : $OLLAMA_MAX_QUEUE" "# Maximum number of queued requests"
  printf '%s\t%s\n' "OLLAMA_MAX_VRAM         : $OLLAMA_MAX_VRAM" ""
  printf '%s\t%s\n' "OLLAMA_MODELS           : $OLLAMA_MODELS" "# The path to the models directory"
  printf '%s\t%s\n' "OLLAMA_MULTIUSER_CACHE  : ${OLLAMA_MULTIUSER_CACHE}" "# Optimize prompt caching for multi-user scenarios"
  printf '%s\t%s\n' "OLLAMA_NEW_ENGINE       : ${OLLAMA_NEW_ENGINE}" "# Enable the new Ollama engine"
  printf '%s\t%s\n' "OLLAMA_NOHISTORY        : ${OLLAMA_NOHISTORY}" "# Do not preserve readline history"
  printf '%s\t%s\n' "OLLAMA_NOPRUNE          : ${OLLAMA_NOPRUNE}" "# Do not prune model blobs on startup"
  printf '%s\t%s\n' "OLLAMA_NUM_PARALLEL     : $OLLAMA_NUM_PARALLEL" "# Maximum number of parallel request"
  printf '%s\t%s\n' "OLLAMA_ORIGINS          : $OLLAMA_ORIGINS" "# A comma separated list of allowed origins"
  printf '%s\t%s\n' "OLLAMA_RUNNERS_DIR      : $OLLAMA_RUNNERS_DIR" "# Sets the location for runners"
  printf '%s\t%s\n' "OLLAMA_SCHED_SPREAD     : ${OLLAMA_SCHED_SPREAD}" "# Always schedule model across all GPUs"
  printf '%s\t%s\n' "OLLAMA_TEST_EXISTING    : $OLLAMA_TEST_EXISTING" ""
  printf '%s\t%s\n' "OLLAMA_TMPDIR           : $OLLAMA_TMPDIR" ""
  printf '%s\t%s\n' "CUDA_VISIBLE_DEVICES    : $CUDA_VISIBLE_DEVICES" "# Set which NVIDIA devices are visible"
  printf '%s\t%s\n' "GPU_DEVICE_ORDINAL      : $GPU_DEVICE_ORDINAL" "# Set which AMD devices are visible by numeric ID"
  printf '%s\t%s\n' "HIP_PATH                : $HIP_PATH" ""
  printf '%s\t%s\n' "HIP_VISIBLE_DEVICES     : $HIP_VISIBLE_DEVICES" "# Set which AMD devices are visible by numeric ID"
  printf '%s\t%s\n' "HSA_OVERRIDE_GFX_VERSION: $HSA_OVERRIDE_GFX_VERSION" "# Override the gfx used for all detected AMD GPUs"
  printf '%s\t%s\n' "HTTP_PROXY              : $HTTP_PROXY" ""
  printf '%s\t%s\n' "JETSON_JETPACK          : $JETSON_JETPACK" ""
  printf '%s\t%s\n' "LD_LIBRARY_PATHS        : $LD_LIBRARY_PATH" ""
  printf '%s\t%s\n' "ROCR_VISIBLE_DEVICES    : $ROCR_VISIBLE_DEVICES" "# Set which AMD devices are visible by UUID or numeric ID"
  printf '%s\t%s\n' "TERM                    : $TERM" ""
  return $RETURN_SUCCESS
}

# Ollama App version, TEXT version
#
# Usage: ollama_app_version
# Input: none
# Requires: ollama, curl, jq
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_app_version() {
  debug "ollama_app_version"
  if ! ollama_api_get '/api/version' | jq -r ".version"; then
    error "ollama_app_version: error_ollama_api_get|jq failed"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama App version, JSON version
#
# Usage: ollama_app_version_json
# Input: none
# Output: json, to stdout
# Requires: ollama, curl
# Returns: 0 on success, 1 on error
ollama_app_version_json() {
  debug "ollama_app_version_json"
  if ! ollama_api_get '/api/version'; then
    error "ollama_app_version_json: error_ollama_api_get failed"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama App version, CLI version
#
# Usage: ollama_app_version_cli
# Input: none
# Output: text, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_app_version_cli() {
  debug "ollama_app_version_cli"
  if ! ollama --version; then
    error "ollama_app_version_cli: ollama --version failed"
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
# Requires: none
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
# Requires: compgen (for function list)
# Returns: 0 on success, 1 on error
ollama_lib_about() {
  echo "$OLLAMA_LIB_NAME v$OLLAMA_LIB_VERSION"
  echo
  echo "A Bash Library to interact with Ollama"
  echo
  echo "OLLAMA_LIB_NAME     : $OLLAMA_LIB_NAME"
  echo "OLLAMA_LIB_VERSION  : $OLLAMA_LIB_VERSION"
  echo "OLLAMA_LIB_URL      : $OLLAMA_LIB_URL"
  echo "OLLAMA_LIB_DISCORD  : $OLLAMA_LIB_DISCORD"
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
# Requires: none
# Returns: 0
ollama_lib_version() {
  echo "$OLLAMA_LIB_VERSION"
}
