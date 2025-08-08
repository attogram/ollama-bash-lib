#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_LIB_NAME="Ollama Bash Lib"
OLLAMA_LIB_VERSION="0.42.34"
OLLAMA_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_LIB_DISCORD="https://discord.gg/BGQJCbYVBa"
OLLAMA_LIB_LICENSE="MIT"
OLLAMA_LIB_COPYRIGHT="Copyright (c) 2025 Ollama Bash Lib, Attogram Project <https://github.com/attogram>"

OLLAMA_LIB_API="${OLLAMA_HOST:-http://localhost:11434}" # Ollama API URL, No slash at end
OLLAMA_LIB_DEBUG="${OLLAMA_LIB_DEBUG:-0}"
OLLAMA_LIB_MESSAGES=()  # Array of messages
OLLAMA_LIB_STREAM=0     # 0 = No streaming, 1 = Yes streaming
OLLAMA_LIB_SAFE_MODE=0  # 0 = no safe mode, 1 = Safe Mode: uses _escape_control_characters

# Internal Functions

# Debug message
#
# Usage: _debug "message"
# Input: 1 - the debug message
# Output: message to stderr
# Requires: none
# Returns: 0 on success, 1 on error
_debug() {
  (( OLLAMA_LIB_DEBUG )) || return
  printf "[DEBUG] $(date '+%H:%M:%S:%N'): %s\n" "$1" >&2
}

# Error message
#
# Usage: _error "message"
# Input: 1 - the error message
# Output: message to stderr
# Requires: none
# Returns: 0 on success, 1 on error
_error() {
  printf "[ERROR] %s\n" "$1" >&2
}

# Does a command exist?
#
# Usage: _exists "command"
# Input: 1 - the command (ollama, curl, etc)
# Output: none
# Requires: command
# Returns: 0 if command exists, non-zero if command does not exist
_exists() {
  command -v "$1" >/dev/null 2>&1
  return $?
}

# Escape control characters in a string
# Keep the surrounding JSON syntax unchanged (braces, quotes, commas, etc)
#
# Usage: _escape_control_characters "string"
# Input  : 1 - any Bash string – it may already be a JSON fragment.
# Output : the same fragment, but every control byte (U+0000‑U+001F
#          and DEL) is turned into a JSON‑legal escape:
#            * \b, \t, \n, \f, \r for the five most common controls
#            * \u00XX for any other control character
#          Printable / UTF‑8 bytes are emitted unchanged.
# Requires: none
# Returns: 0
_escape_control_characters() {
  if (( OLLAMA_LIB_SAFE_MODE != 1 )); then # If Safe Mode is OFF, do not escape control characters
    printf '%s' "$1"
    return 0
  fi
  # @ai-assist gpt-oss:120b
  _debug "_escape_control_characters: [${1:0:120}]"
  local input="$1"
  local out='' # accumulator for the escaped result
  # Feed the exact bytes of $input to od – one decimal number per
  # byte (no address column, unsigned, never squeeze repeats).
  while IFS= read -r line; do
    set -- "$line" # split the od line into numbers
    for b in "$@"; do
      if (( b >= 0 && b <= 31 )) || (( b == 127 )); then # Control characters (U+0000‑U+001F and DEL)
        case $b in
          8)  out+="\\b" ;; # backspace
          9)  out+="\\t" ;; # horizontal tab
          10) out+="\\n" ;; # line feed (LF)
          12) out+="\\f" ;; # form‑feed
          13) out+="\\r" ;; # carriage‑return
          *) out+="$(printf '\\u%04x' "$b")" ;; # any other control → \u00XX
        esac
      else # Printable / UTF‑8 bytes – copy them unchanged
        #    Build a one‑byte variable that contains the raw byte.
        #    printf '\\%03o' produces a back‑slash‑octal escape,
        #    which we then expand with %b (only octal is expanded,
        #    not the \u escapes we added above).
        printf -v chr '\\%03o' "$b"
        out+="$(printf '%b' "$chr")"
      fi
    done
  done < <(printf '%s' "$input" | od -An -tuC -v)
  _debug "_escape_control_characters: out: [${out:0:120}]"
  printf '%s' "$out" # print the accumulator
}

# API Functions

# Call curl
#
# Input: 1 - method (GET or POST)
# Input: 2 - endpoint
# Input: 3 - { json body } (optional)
# Output: curl result
# Requires: curl
# Returns: 0 on success, curl return status on error
_call_curl() {
  _debug "_call_curl: [$1] [$2] [${3:0:120}]"
  _debug "_call_curl: OLLAMA_LIB_API: $OLLAMA_LIB_API"
  local method="$1" # GET or POST
  local endpoint="$2"
  local json_body="$3"
  local curl_args
  curl_args=(
    -s # Silent (no progress meter)
    -N # No buffering (for streamed responses)
    -H 'Content-Type: application/json' # JSON Content Type
  )
  if [[ -n "${OLLAMA_LIB_TURBO_KEY}" ]]; then
    _debug "_call_curl: Turbo Mode"
    curl_args+=( -H "Authorization: Bearer ${OLLAMA_LIB_TURBO_KEY}" ) # API Key
  fi
  curl_args+=( "-X" "${method}" ) # GET or POST
  curl_args+=( "${OLLAMA_LIB_API}${endpoint}" ) # URL
  if [[ -n "${json_body}" ]]; then
    _debug "_call_curl: json_body: [${json_body:0:120}]"
    curl_args+=( "-d" "@-" )
    echo "$json_body" | curl "${curl_args[@]}"
    local error_curl=$?
    if [ "$error_curl" -gt 0 ]; then
      _error "_call_curl: curl error: $error_curl"
      return "$error_curl"
    fi
    return 0
  fi
  curl "${curl_args[@]}"
}

# GET request to the Ollama API
#
# Usage: ollama_api_get '/api/path'
# Input: 1 = API URL path
# Output: API call result, to stdout
# Requires: curl
# Returns: 0 on success, curl return status on error
ollama_api_get() {
  _debug "ollama_api_get: [$1]"
  _call_curl "GET" "$1"
  local error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    _error "ollama_api_get: curl error: $error_curl"
    return "$error_curl"
  fi
  _debug 'ollama_api_get: success: return 0'
  return 0
}

# POST request to the Ollama API
#
# Usage: ollama_api_post '/api/path' "{ json content }"
# Input: 1 - API URL path
# Input: 2 - JSON content
# Output: API call result, to stdout
# Requires: curl
# Returns: 0 on success, curl return status on error
ollama_api_post() {
  _debug "ollama_api_post: [$1] [${2:0:120}]"
  _call_curl "POST" "$1" "$2"
  local error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    _error "ollama_api_post: curl error: $error_curl"
    return "$error_curl"
  fi
  _debug 'ollama_api_post: success: return 0'
  return 0
}

# Ping the Ollama API
#
# Usage: ollama_api_ping
# Input: none
# Output: none
# Requires: curl
# Returns: 0 if API is reachable, 1 if API is not reachable
ollama_api_ping() {
  _debug 'ollama_api_ping'
  if [[ -n "${OLLAMA_LIB_TURBO_KEY}" ]]; then
    _debug "ollama_api_ping: function not available in Turbo Mode"
    return 0
  fi
  local result
  if ! result="$(ollama_api_get "")"; then
    _debug "ollama_api_ping: result=ollama_api_get failed"
    return 1
  fi
  if [[ "$result" == "Ollama is running" ]]; then # Valid as of Ollama 0.11
    return 0
  fi
  _debug "ollama_api_ping: unknown result: [${result:0:42}...]"
  return 1
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
  _debug "ollama_generate_json: [$1] [${2:0:42}]"
  _debug "ollama_generate_json: OLLAMA_LIB_STREAM: $OLLAMA_LIB_STREAM"
  local stream_bool=true
  if [[ "$OLLAMA_LIB_STREAM" -eq "0" ]]; then
    stream_bool=false
  fi
  local json_payload
  json_payload="$(jq -c -n \
    --arg model "$1" \
    --arg prompt "$2" \
    --argjson stream "$stream_bool" \
    '{model: $model, prompt: $prompt, stream: $stream}')"
  if ! ollama_api_post '/api/generate' "$json_payload"; then
    _error 'ollama_generate_json: ollama_api_post failed'
    return 1
  fi
  _debug 'ollama_generate_json: success: return: 0'
  return 0
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
  _debug "ollama_generate: [$1] [${2:0:42}]"
  OLLAMA_LIB_STREAM=0
  local result
  result="$(ollama_generate_json "$1" "$2")"
  local error_ollama_generate_json=$?
  _debug "ollama_generate: result: $(echo "$result" | wc -c | sed 's/ //g') bytes"
  if [[ "$error_ollama_generate_json" -gt 0 ]]; then
    _error "ollama_generate: error_ollama_generate_json: $error_ollama_generate_json"
    return 1
  fi
  if ! _escape_control_characters "$result" | jq -r ".response"; then
    _error "ollama_generate: _escape_control_characters|jq failed"
    return 1
  fi
  _debug 'ollama_generate: return: 0'
  return 0
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
  _debug "ollama_generate_stream_json: [$1] [${2:0:42}]"
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  if ! ollama_generate_json "$1" "$2"; then
    _error "ollama_generate_stream_json: ollama_generate_json failed"
    OLLAMA_LIB_STREAM=0 # Turn off streaming
    return 1
  fi
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  _debug 'ollama_generate_stream_json: return: 0'
  return 0
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
  _debug "ollama_generate_stream: [$1] [${2:0:42}]"
  OLLAMA_LIB_STREAM=1 # Turn on streaming for the API request
  if [[ "$OLLAMA_LIB_SAFE_MODE" -eq 1 ]]; then # Safe‑mode: escape control characters *before* handing the data to jq
    ollama_generate_json "$1" "$2" |
      _escape_control_characters |
      jq -j '.response' |
      while IFS= read -r -d '' chunk; do # read the whole stream without stripping newlines
        printf '%s' "$chunk"
      done
  else # Normal mode – just let jq emit the response field.
    ollama_generate_json "$1" "$2" |
      jq -j '.response'
  fi
  local error_ollama_generate_json=$?
  OLLAMA_LIB_STREAM=0 # Turn off streaming for subsequent calls
  if [[ "$error_ollama_generate_json" -gt 0 ]]; then
    _error "ollama_generate_stream: error_ollama_generate_json: $error_ollama_generate_json"
    return 1
  fi
  _debug "ollama_generate_stream: return: 0"
  return 0
}

# Messages Functions

# Get all messages
#
# Usage: messages="$(ollama_messages)"
# Output: json, 1 messages per line, to stdout
# Requires: none
# Returns: 0 on success, 1 on error
ollama_messages() {
  _debug "ollama_messages"
  if [[ ${#OLLAMA_LIB_MESSAGES[@]} -eq 0 ]]; then
    _debug "ollama_messages: no messages"
    return 1
  fi
  printf '%s\n' "${OLLAMA_LIB_MESSAGES[@]}"
  return 0
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
  _debug "ollama_messages_add: [$1] [${2:0:42}]"
  local json_payload
  json_payload="$(jq -c -n \
      --arg role "$1" \
      --arg content "$2" \
      '{role: $role, content: $content}')"
  OLLAMA_LIB_MESSAGES+=("$json_payload")
}

# Clear all messages
#
# Usage: ollama_messages_clear
# Output: none
# Requires: none
# Returns: 0
ollama_messages_clear() {
  _debug "ollama_messages_clear"
  OLLAMA_LIB_MESSAGES=()
}

# Messages count
#
# Usage: ollama_messages_count
# Output: number of messages, to stdout
# Requires: none
# Returns: 0
ollama_messages_count() {
  _debug "ollama_messages_count"
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
  _debug "ollama_chat_json: [${1:0:42}]"
  local model="$1"
  if [[ -z "$model" ]]; then
    _error 'ollama_chat_json: Model Not Found. Usage: ollama_chat_json "model"'
    return 1
  fi
  local stream_bool=true
  if [[ "$OLLAMA_LIB_STREAM" -eq "0" ]]; then
    stream_bool=false
  fi
  # Join array elements with comma and wrap in []
  local messages_array_json
  messages_array_json="$(printf ",%s" "${OLLAMA_LIB_MESSAGES[@]}")"
  messages_array_json="[${messages_array_json:1}]" # Remove leading comma
  local json_payload
  json_payload="$(jq -c -n \
      --arg model "$model" \
      --argjson messages "$messages_array_json" \
      --argjson stream "$stream_bool" \
      '{model: $model, messages: $messages, stream: $stream}')"

  _debug "ollama_chat_json: json_payload: [${json_payload:0:120}]"
  local result
  if ! result="$(ollama_api_post '/api/chat' "$json_payload")"; then
    _error "ollama_chat_json: ollama_api_post failed"
    return 1
  fi
  local content
  content="$(_escape_control_characters "$result" | jq -r ".message.content")"
  local error_jq_message_content=$?
  _debug "ollama_chat_json: content: [${content:0:42}]"
  if [[ "$error_jq_message_content" -gt 0 ]]; then
    _error "ollama_chat_json: error_jq_message_content: $error_jq_message_content"
    return 1
  fi
  echo "$result"
  _debug "ollama_chat_json: return 0"
}

# Chat completion request as text
#
# Usage: ollama_chat "model"
# Input: 1 - model
# Output: text, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_chat() {
  _debug "ollama_chat: [${1:0:42}]"
  local model="$1"
  if [[ -z "$model" ]]; then
    _error 'ollama_chat: Model Not Found. Usage: ollama_chat "model"'
    return 1
  fi
  OLLAMA_LIB_STREAM=0
  local response
  response="$(ollama_chat_json "$model")"
  if [[ -z "$response" ]]; then
    _error 'ollama_chat: ollama_chat_json response empty'
    return 1
  fi
  local message_content
  if ! message_content="$(_escape_control_characters "$response" | jq -r ".message.content")"; then
    _error 'ollama_chat: _escape_control_characters|jq failed'
    return 1
  fi
  printf '%s\n' "$message_content"
  _debug 'ollama_chat: return: 0'
  return 0
}

# Chat completion request as streaming text
#
# Usage: ollama_chat_stream "model"
# Input: 1 - model
# Output: streaming text, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_chat_stream() {
  _debug "ollama_chat_stream: [$1]"
  OLLAMA_LIB_STREAM=1
  if ! ollama_chat "$1"; then
    _error "ollama_chat_stream: ollama_chat failed"
    OLLAMA_LIB_STREAM=0
    return 1
  fi
  OLLAMA_LIB_STREAM=0
  return 0
}

# Chat completion request as streaming json
#
# Usage: ollama_chat_stream_json "model"
# Input: 1 - model
# Output: streaming json, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_chat_stream_json() {
  _debug "ollama_chat_stream_json: [$1]"
  OLLAMA_LIB_STREAM=1
  if ! ollama_chat_json "$1"; then
    _error "ollama_chat_stream_json: ollama_chat_json failed"
    OLLAMA_LIB_STREAM=0
    return 1
  fi
  OLLAMA_LIB_STREAM=0
  return 0
}

# List Functions

# All available models, CLI version
#
# Usage: ollama_list
# Output: text, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_list() {
  _debug "ollama_list"
  local list
  if ! list="$(ollama list)"; then # get ollama list
    _error "ollama_list: list=|ollama list failed"
    return 1
  fi
  if ! echo "$list" | head -n+1; then # print header
    _error "ollama_list: echo|head failed"
    return 1
  fi
  if ! echo "$list" | tail -n+2 | sort; then # sorted list of models
    _error "ollama_list: ollama echo|tail|sort failed"
    return 1
  fi
  return 0
}

# All available models, JSON version
#
# Usage: ollama_list_json
# Output: json, to stdout
# Requires: ollama, curl
# Returns: 0 on success, 1 on error
ollama_list_json() {
  _debug "ollama_list_json"
  if ! ollama_api_get '/api/tags'; then
    _error "ollama_list_json: ollama_api_get failed"
    return 1
  fi
  return 0
}

# All available models, Bash array version
#
# Usage: IFS=" " read -r -a models <<< "$(ollama_list_array)"
# Usage: models=($(ollama_list_array))
# Output: space separated list of model names, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_list_array() {
  _debug "ollama_list_array"
  local models=()
  while IFS= read -r line; do
    models+=("$line")
  done < <(ollama list | awk 'NR > 1 {print $1}' | sort)
  echo "${models[@]}" # space separated list of model names
  _debug "ollama_list_array: ${#models[@]} models found: return 0"
  return 0
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
  _debug "ollama_model_random"
  IFS=" " read -r -a models <<< "$(ollama_list_array)"
  _debug "ollama_model_random: ${#models[@]} models found"
  if [[ ${#models[@]} -eq 0 ]]; then
    _error "ollama_model_random: No Models Found"
    return 1
  fi
  echo "${models[RANDOM%${#models[@]}]}"
  return 0
}

# Unload a model from memory
#
# Usage: ollama_model_unload "model"
# Input: 1 - Model name to unload
# Output: unload result, in json, to stdout
# Requires: ollama, curl, jq
# Returns: 0 on success, 1 on error
ollama_model_unload() {
  _debug 'ollama_model_unload'
  if [[ -z "$1" ]]; then
    _error 'ollama_model_unload: no model. Usage: ollama_model_unload "model"'
    return 1
  fi

  local json_payload
  json_payload="$(jq -c -n \
      --arg model "$1" \
      --arg keep_alive '0' \
      '{model: $model, keep_alive: $keep_alive}')"
  local result
  if ! result="$(ollama_api_post '/api/generate' "$json_payload")"; then
    _error "ollama_model_unload: ollama_api_post failed [$result]"
    return 1
  fi
  local is_error
  is_error="$(printf '%s' "$result" | jq -r .error)"
  if [[ -n "$is_error" ]]; then
    _error "ollama_model_unload: $is_error"
    return 1
  fi
  printf '%s\n' "$result"
  return 0
}

# Processes Functions

# Running model processes, CLI version
#
# Usage: ollama_ps
# Output: text, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_ps() {
  _debug "ollama_ps"
  if ! ollama ps; then
    _error "ollama_ps: ollama ps failed"
    return 1
  fi
  return 0
}

# Running model processes, JSON version
#
# Usage: ollama_ps_json
# Output: json, to stdout
# Requires: ollama, curl
# Returns: 0 on success, 1 on error
ollama_ps_json() {
  _debug "ollama_ps_json"
  if ! ollama_api_get '/api/ps'; then
    _error "ollama_ps_json: ollama_api_get failed"
    return 1
  fi
  return 0
}

# Show Functions

# Show model information, TEXT version
#
# Usage: ollama_show "model"
# Output: text, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_show() {
  _debug "ollama_show"
  if ! ollama show "$1"; then
    _error "ollama_show: ollama show failed"
    return 1
  fi
  return 0
}

# Show model information, JSON version
#
# Usage: ollama_show_json "model"
# Input: 1 - The model to show
# Output: json, to stdout
# Requires: ollama, curl, jq
# Returns: 0 on success, 1 on error
ollama_show_json() {
  _debug "ollama_show_json: [$1]"
  local json_payload
  json_payload="$(jq -c -n \
      --arg model "$1" \
      '{model: $model}')"
  if ! ollama_api_post '/api/show' "$json_payload"; then
    _error "ollama_show_json: ollama_api_post failed"
    return 1
  fi
  return 0
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
  _debug "ollama_app_installed"
  _exists "ollama"
}

# Turbo Mode on/off
#
# Usage: ollama_app_turbo "on" OR ollama_app_turbo "off"
# Input: 1 - The mode: empty, "on" or "off", default to "on"
# Output: if OLLAMA_LIB_TURBO_KEY is not set, then prompts user to enter key
# Requires: a valid API key from ollama.com
# Returns: 0 on success, 1 on error
ollama_app_turbo() {
  _debug "ollama_app_turbo: [${1:0:42}]"
  local host_api
  case "$1" in
    on|ON|true|TRUE|1|'')
      _debug "ollama_app_turbo: Turning Turbo Mode ON"
      local api_key
      if [[ -z "$OLLAMA_LIB_TURBO_KEY" ]]; then # If api key is not set
        echo -n 'Enter Ollama API Key (input hidden): '
        read -r -s api_key # Read api_key silently
        echo
        if [[ -z "$api_key" ]]; then
          _error 'ollama_app_turbo: Ollama API Key empty'
          return 1
        fi
        OLLAMA_LIB_TURBO_KEY="$api_key" # Set the api key
      fi
      host_api='https://ollama.com' # Ollama Cloud Service
      ;;
    off|OFF|false|FALSE|0)
      _debug "ollama_app_turbo: Turning Turbo Mode OFF"
      unset OLLAMA_LIB_TURBO_KEY # Erase the api key
      host_api='http://localhost:11434' # Local Ollama
      ;;
    *)
      _error "ollama_app_turbo: Unknown mode: Usage: ollama_app_turbo on, or ollama_app_turbo off"
      return 1
      ;;
  esac

  _debug "ollama_app_turbo: OLLAMA_LIB_TURBO_KEY: (${#OLLAMA_LIB_TURBO_KEY} characters)"
  export OLLAMA_HOST="$host_api" # Set host
  _debug "ollama_app_turbo: OLLAMA_HOST: $OLLAMA_HOST"
  OLLAMA_LIB_API="$host_api" # Set api
  _debug "ollama_app_turbo: OLLAMA_LIB_API: $OLLAMA_LIB_API"
  return 0
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
  return 0
}

# Ollama App version, TEXT version
#
# Usage: ollama_app_version
# Input: none
# Requires: ollama, curl, jq
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_app_version() {
  _debug "ollama_app_version"
  if ! ollama_api_get '/api/version' | jq -r ".version"; then
    _error "ollama_app_version: error_ollama_api_get|jq failed"
    return 1
  fi
  return 0
}

# Ollama App version, JSON version
#
# Usage: ollama_app_version_json
# Input: none
# Output: json, to stdout
# Requires: ollama, curl
# Returns: 0 on success, 1 on error
ollama_app_version_json() {
  _debug "ollama_app_version_json"
  if ! ollama_api_get '/api/version'; then
    _error "ollama_app_version_json: error_ollama_api_get failed"
    return 1
  fi
  return 0
}

# Ollama App version, CLI version
#
# Usage: ollama_app_version_cli
# Input: none
# Output: text, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_app_version_cli() {
  _debug "ollama_app_version_cli"
  if ! ollama --version; then
    _error "ollama_app_version_cli: ollama --version failed"
    return 1
  fi
  return 0
}

# Lib Functions

# About Ollama Bash Lib
#
# Usage: ollama_lib_about
# Input: none
# Output: text, to stdout
# Requires: compgen (for function list)
# Returns: 0 on success, 1 on missing compgen or colum
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
  echo "OLLAMA_LIB_API      : $OLLAMA_LIB_API"
  echo "OLLAMA_LIB_DEBUG    : $OLLAMA_LIB_DEBUG"
  echo "OLLAMA_LIB_STREAM   : $OLLAMA_LIB_STREAM"
  echo "OLLAMA_LIB_SAFE_MODE: $OLLAMA_LIB_SAFE_MODE"
  echo "OLLAMA_LIB_MESSAGES : (${#OLLAMA_LIB_MESSAGES[@]} messages)"
  echo "OLLAMA_LIB_TURBO_KEY: (${#OLLAMA_LIB_TURBO_KEY} characters)"
  if ! _exists "compgen"; then
    _debug 'ollama_lib_about: compgen Not Found'
    return 1
  fi
  echo
  echo "Functions:"
  echo
  if ! _exists "column"; then
    _debug 'ollama_lib_about: column Not Found'
    compgen -A function -X '!*ollama_*' | sort
    return 0
  fi
  compgen -A function -X '!*ollama_*' | sort | column
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
