#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_LIB_NAME='Ollama Bash Lib'
OLLAMA_LIB_VERSION='0.44.7'
OLLAMA_LIB_URL='https://github.com/attogram/ollama-bash-lib'
OLLAMA_LIB_DISCORD='https://discord.gg/BGQJCbYVBa'
OLLAMA_LIB_LICENSE='MIT'
OLLAMA_LIB_COPYRIGHT='Copyright (c) 2025 Ollama Bash Lib, Attogram Project <https://github.com/attogram>'

OLLAMA_LIB_API="${OLLAMA_HOST:-http://localhost:11434}" # Ollama API URL, No slash at end
OLLAMA_LIB_DEBUG="${OLLAMA_LIB_DEBUG:-0}" # 0 = debug off, 1 = debug, 2 = verbose debug
OLLAMA_LIB_MESSAGES=() # Array of messages
OLLAMA_LIB_STREAM=0 # Streaming mode: 0 = No streaming, 1 = Yes streaming
OLLAMA_LIB_THINKING="${OLLAMA_LIB_THINKING:-off}" # Thinking mode: off, on, hide
OLLAMA_LIB_TIMEOUT="${OLLAMA_LIB_TIMEOUT:-300}" # Curl timeout in seconds
OLLAMA_LIB_SAFE_MODE="${OLLAMA_LIB_SAFE_MODE:-0}" # Safe mode: 0 = off, 1 = disable ollama_eval and _debug
set -o pipefail # Exit the pipeline if any command fails (instead of only the last one)

# Internal Functions

# Redact private information from string
#
# Usage: _redact "string"
# Input: 1 - the string to be redacted
# Output: redacted string to stdout
# Requires: none
# return 0 on success, 1 on error
_redact() {
  local msg="$1"
  if [[ -n "${OLLAMA_LIB_TURBO_KEY}" ]]; then
    msg=${msg//"${OLLAMA_LIB_TURBO_KEY}"/'[REDACTED]'} # never show the private api key
  fi
  printf '%s' "$msg"
}

# Debug message
#
# Usage: _debug "message"
# Input: 1 - the debug message
# Output: message to stderr
# Requires: none
# Returns: 0 on success, 1 on error
_debug() {
  (( OLLAMA_LIB_SAFE_MODE )) || return 0 # _debug is disabled in safe mode
  (( OLLAMA_LIB_DEBUG )) || return 0 # DEBUG must be 1 or higher to show debug messages
  local date_string # some date implementations do not support %N nanoseconds
  date_string="$(if ! date '+%H:%M:%S:%N' 2>/dev/null; then date '+%H:%M:%S'; fi)"
  printf "[DEBUG] ${date_string}: %s\n" "$(_redact "$1")" >&2
}

# Error message
#
# Usage: _error "message"
# Input: 1 - the error message
# Output: message to stderr
# Requires: none
# Returns: 0 on success, 1 on error
_error() {
  printf "[ERROR] %s\n" "$(_redact "$1")" >&2
}

# Wraps a stream of text with <thinking> tags
#
# Usage: <stream> | _ollama_thinking_stream
# Input: stream of text from stdin
# Output: wrapped text to stderr
# Requires: none
# Returns: 0
_ollama_thinking_stream() {
  local chunk
  if read -r -n 1 chunk && [[ -n "$chunk" ]]; then
    printf "# <thinking>\n" >&2
    printf "# %s" "$chunk" >&2
    cat >&2
    printf "\n# </thinking>\n\n" >&2
  fi
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

# Is a string a valid URL?
#
# Usage: _is_valid_url "string"
# Input: 1 - the string to be tested
# Output: none
# Requires: none
# Returns: 0 if valid, 1 if not valid
_is_valid_url() {
  local url_regex='^(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]$'
  if [[ "$1" =~ $url_regex ]]; then
    return 0
  else
    return 1
  fi
}

# Is a string valid JSON?
#
# Usage: _is_valid_json "string"
# Input: 1 - the string to be tested
# Output: none
# Requires: jq
# Returns: 0 if valid, 1 or higher if not valid
_is_valid_json() {
  if [[ -z "$1" ]]; then # empty string is not valid json
    _debug '_is_valid_json: empty string'
    return 1
  fi
  if ! _exists 'jq'; then _error '_is_valid_json: jq Not Found'; return 1; fi
  printf '%s' "$1" | jq -e '.' >/dev/null 2>&1 # use -e for jq exit-status mode
  local return_code=$?
  case $return_code in
    0) # Exit code 0: The JSON is valid and "truthy"
      _debug '_is_valid_json: success'
      return 0
      ;;
    1) # (Failure) The last value output was either false or null.
      _debug '_is_valid_json: FAILURE jq: output false or null: return 1'
      return 1
      ;;
    2) # (Usage Error): There was a problem with how the jq command was used, such as incorrect command-line options.
      _debug '_is_valid_json: USAGE ERROR jq: incorrect command-line options: return 2'
      return 2
      ;;
    3) # (Compile Error): The jq filter program itself had a syntax error.
      _debug '_is_valid_json: COMPILE ERROR jq: filter syntax error: return 3'
      return 3
      ;;
    4) # (No Output): No valid result was ever produced. This can happen if the filter's output is empty.
      _debug '_is_valid_json: NO OUTPUT jq: result empty: return 4'
      return 4
      ;;
    5) # (Halt Error)
      _debug '_is_valid_json: HALT_ERROR jq: return 5'
      return 5
      ;;
    *) # (Unknown)
      _debug "_is_valid_json: UNKNOWN jq error: return $return_code"
      return "$return_code"
      ;;
  esac
}

# API Functions

# Call curl
#
# Input: 1 - method (GET or POST)
# Input: 2 - endpoint (/api/path) (optional)
# Input: 3 - { json body } (optional)
# Output: curl result body to stdout
# Requires: curl
# Returns: 0 on success, 1 or higher on error
_call_curl() {
  _debug "_call_curl: [${1:0:42}] [${2:0:42}] ${3:0:120}"

  if ! _exists 'curl'; then _error '_call_curl: curl Not Found'; return 1; fi

  local method="$1"
  if [[ -z "$method" || ( "$method" != "GET" && "$method" != "POST" ) ]]; then
    _error '_call_curl: Method Not Found. Usage: _call_curl "GET|POST" "/api/path" "{ optional json content }"'
    return 1
  fi

  local endpoint="$2"
  if [[ -n "$endpoint" && ( "$endpoint" != /* || "$endpoint" == *" "* || "$endpoint" == *"\\"* ) ]]; then
    _error "_call_curl: Invalid API Path: [${endpoint:0:120}]"
    return 1
  fi

  local json_body="$3"
  if [[ -n "$json_body" ]] && ! _is_valid_json "$json_body"; then
    _error "_call_curl: JSON body is invalid: [${json_body:0:120}]"
    return 1
  fi

  _debug "_call_curl: OLLAMA_LIB_API: $OLLAMA_LIB_API"

  local curl_args=(
    -s
    -N
    --max-time "$OLLAMA_LIB_TIMEOUT"
    -H 'Content-Type: application/json'
    -w '\n%{http_code}'
  )

  if [[ -n "${OLLAMA_LIB_TURBO_KEY}" ]]; then
    _debug '_call_curl: Turbo Mode'
    curl_args+=( -H "Authorization: Bearer ${OLLAMA_LIB_TURBO_KEY}" )
  fi

  curl_args+=( -X "$method" )
  curl_args+=( "${OLLAMA_LIB_API}${endpoint}" )

  local response
  local curl_exit_code

  if [[ -n "$json_body" ]]; then
    _debug "_call_curl: json_body: ${json_body:0:120}"
    curl_args+=( -d "@-" )
    _debug "_call_curl: piping json_body | curl ${curl_args[*]}"
    response="$(printf '%s' "$json_body" | curl "${curl_args[@]}")"
    curl_exit_code=$?
  else
    _debug "_call_curl: args: ${curl_args[*]}"
    response="$(curl "${curl_args[@]}")"
    curl_exit_code=$?
  fi

  if (( curl_exit_code )); then
    _error "_call_curl: curl command failed with exit code $curl_exit_code"
    return "$curl_exit_code"
  fi

  local http_code
  http_code="$(printf '%s' "$response" | tail -n1)"
  local body
  body="$(printf '%s' "$response" | sed '$d')"

  if (( http_code >= 400 )); then
    _error "_call_curl: HTTP error ${http_code}: ${body}"
    return 1
  fi

  printf '%s' "$body"
  return 0
}

# GET request to the Ollama API
#
# Usage: ollama_api_get '/api/path'
# Input: 1 = API URL path
# Output: API call result, to stdout
# Requires: curl
# Returns: 0 on success, curl return status on error
ollama_api_get() {
  _debug "ollama_api_get: [${1:0:42}]"
  _call_curl "GET" "$1"
  local error_curl=$?
  if (( error_curl )); then
    _error "ollama_api_get: curl error: $error_curl"
    return "$error_curl"
  fi
  _debug 'ollama_api_get: success'
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
  _debug "ollama_api_post: [${1:0:42}] ${2:0:120}"
  _call_curl "POST" "$1" "$2"
  local error_curl=$?
  if (( error_curl )); then
    _error "ollama_api_post: curl error: $error_curl"
    return "$error_curl"
  fi
  _debug 'ollama_api_post: success'
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
    # TODO - support for turbo mode pings
    _debug 'ollama_api_ping: function not available in Turbo Mode'
    return 0 # we return success for now, to keep outputs clean of other errors
  fi
  local result
  if ! result="$(ollama_api_get "")"; then
    _debug 'ollama_api_ping: ollama_api_get failed'
    return 1
  fi
  if [[ "$result" == 'Ollama is running' ]]; then # Valid as of Ollama 0.11
    return 0
  fi
  _debug "ollama_api_ping: unknown result: [${result:0:42}]"
  return 1
}

# Generate Functions

# Create a JSON payload for the generate endpoint
#
# Usage: _ollama_payload_generate "model" "prompt"
# Input: 1 - The model to use
# Input: 2 - The prompt
# Output: json payload to stdout
# Requires: jq
# Returns: 0 on success, 1 on error
_ollama_payload_generate() {
  local model="$1"
  local prompt="$2"
  local stream=true
  (( OLLAMA_LIB_STREAM == 0 )) && stream=false
  local thinking=false
  [[ "$OLLAMA_LIB_THINKING" == 'on' || "$OLLAMA_LIB_THINKING" == 'hide' ]] && thinking=true

  jq -c -n \
    --arg model "$model" \
    --arg prompt "$prompt" \
    --argjson stream "$stream" \
    --argjson thinking "$thinking" \
    '{model: $model, prompt: $prompt, stream: $stream, thinking: $thinking}'
}

# Generate a completion as json
#
# Usage: ollama_generate_json "model" "prompt"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: json (or a stream of json objects) on stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_generate_json() {
  _debug "ollama_generate_json: [${1:0:42}] [${2:0:42}]"
  if ! _exists 'jq'; then _error 'ollama_generate_json: Not Found: jq'; return 1; fi

  local model
  model="$(_is_valid_model "$1")" # if no model specific, will use random model
  if [[ -z "$model" ]]; then
    _error 'ollama_generate_json: Not Found: model. Usage: ollama_generate_json "model" "prompt"'
    return 1
  fi

  local prompt="$2"
  if [[ -z "$prompt" ]]; then
    _error 'ollama_generate_json: Not Found: prompt. Usage: ollama_generate_json "model" "prompt"'
    return 1
  fi

  local json_payload
  json_payload="$(_ollama_payload_generate "$model" "$prompt")"
  _debug "ollama_generate_json: json_payload: ${json_payload:0:120}"

  if ! ollama_api_post '/api/generate' "$json_payload"; then
    _error 'ollama_generate_json: ollama_api_post failed'
    return 1
  fi
  _debug 'ollama_generate_json: success'
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
  if ! _exists 'jq'; then _error 'ollama_generate: jq Not Found'; return 1; fi
  _debug "ollama_generate: [${1:0:42}] [${2:0:42}]"

  OLLAMA_LIB_STREAM=0 # Turn off streaming

  local result
  result="$(ollama_generate_json "$1" "$2")"
  local error_ollama_generate_json=$?
  _debug "ollama_generate: result: $(echo "$result" | wc -c | tr -d ' ') bytes: ${result:0:120}"
  # _debug "ollama_generate: result: $(echo "$result" | jq)"  # TODO verbose debug mode = 2
  if (( error_ollama_generate_json )); then
    _error "ollama_generate: error_ollama_generate_json: $error_ollama_generate_json"
    return 1
  fi

  if ! _is_valid_json "$result"; then
    _error 'ollama_generate: model response is not valid JSON'
    return 1
  fi

  if error_msg=$(printf '%s' "$result" | jq -r '.error // empty'); then
    if [[ -n $error_msg ]]; then
      _error "ollama_generate: $error_msg"
      return 1
    fi
  fi

  _debug "ollama_generate: thinking: $OLLAMA_LIB_THINKING"
  if [[ "$OLLAMA_LIB_THINKING" != 'hide' ]]; then
    local thinking
    thinking="$(printf '%s' "$result" | jq -r '.thinking // empty')"
    #thinking="$(printf '%s' "$result" | jq -r '.think // empty')"
    if [[ -n "$thinking" ]]; then
      _debug 'ollama_generate: thinking FOUND'
      printf '# <thinking>\n# %s\n# </thinking>\n\n' "$thinking" >&2 # send thinking to stderr
    fi
  fi

  local result_response
  result_response="$(printf '%s' "$result" | jq -r '.response')"
  if [[ -z "$result_response" ]]; then
    _error 'ollama_generate: jq failed to get .response'
    return 1
  fi

  printf '%s\n' "$result_response"
  _debug 'ollama_generate: success'
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
  _debug "ollama_generate_stream_json: [${1:0:42}] [${2:0:42}]"
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
  if ! _exists 'jq'; then _error 'ollama_generate_stream: jq Not Found'; return 1; fi
  _debug "ollama_generate_stream: [${1:0:42}] [${2:0:42}]"
  OLLAMA_LIB_STREAM=1
  (
    ollama_generate_json "$1" "$2" | while IFS= read -r line; do
      if [[ "$OLLAMA_LIB_THINKING" == "on" ]]; then
        printf '%s' "$(jq -r '.thinking // empty' <<<"$line")" >&2
      fi
      printf '%s' "$(jq -r '.response // empty' <<<"$line")"
    done
    exit "${PIPESTATUS[0]}"
  ) 2> >( _ollama_thinking_stream )
  local error_code=$?
  OLLAMA_LIB_STREAM=0
  if [[ $error_code -ne 0 ]]; then
    _error "ollama_generate_stream: ollama_generate_json failed with code $error_code"
    return 1
  fi
  printf '\n'
  _debug 'ollama_generate_stream: return: 0'
  return 0
}

# Messages Functions

# Get all messages
#
# Usage: messages="$(ollama_messages)"
# Output: a valid json array of message objects, to stdout
# Requires: none
# Returns: 0 on success, 1 on error
ollama_messages() {
  _debug 'ollama_messages'
  if [[ ${#OLLAMA_LIB_MESSAGES[@]} -eq 0 ]]; then
    _debug 'ollama_messages: no messages'
    printf '[]'
    return 1
  fi
  printf "[%s]" "$(printf "%s," "${OLLAMA_LIB_MESSAGES[@]}" | sed 's/,$//')"
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
  if ! _exists 'jq'; then _error 'ollama_messages_add: jq Not Found'; return 1; fi
  _debug "ollama_messages_add: [${1:0:42}] [${2:0:42}]"
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
  _debug 'ollama_messages_clear'
  OLLAMA_LIB_MESSAGES=()
}

# Messages count
#
# Usage: ollama_messages_count
# Output: number of messages, to stdout
# Requires: none
# Returns: 0
ollama_messages_count() {
  _debug 'ollama_messages_count'
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
  if ! _exists 'jq'; then _error 'ollama_chat_json: jq Not Found'; return 1; fi
  _debug "ollama_chat_json: [${1:0:42}]"
  local model
  model="$(_is_valid_model "$1")"
  _debug "ollama_chat_json: model: [${model:0:120}]"
  if [[ -z "$model" ]]; then
    _error 'ollama_chat_json: No Models Found'
    return 1
  fi
  local stream=true
  if [[ "$OLLAMA_LIB_STREAM" -eq "0" ]]; then
    stream=false
  fi
  if (( ${#OLLAMA_LIB_MESSAGES[@]} == 0 )); then
    _error 'ollama_chat_json: No messages to send'
    return 1
  fi
  local messages_json
  messages_json='['$(IFS=,; echo "${OLLAMA_LIB_MESSAGES[*]}")']'

  local thinking=false
  if [[ "$OLLAMA_LIB_THINKING" == "on" || "$OLLAMA_LIB_THINKING" == "hide" ]]; then
    thinking=true
  fi
  local json_payload
  json_payload="$(jq -c -n \
      --arg model "$model" \
      --argjson messages "$messages_json" \
      --argjson stream "$stream" \
      --argjson thinking "$thinking" \
      '{model: $model, messages: $messages, stream: $stream, thinking: $thinking}')"

  _debug "ollama_chat_json: json_payload: [${json_payload:0:120}]"

  if [[ "$OLLAMA_LIB_STREAM" -eq 1 ]]; then
    if ! ollama_api_post '/api/chat' "$json_payload"; then
      _error 'ollama_chat_json: ollama_api_post failed'
      return 1
    fi
    _debug 'ollama_chat_json: stream finished'
    return 0
  fi

  local result
  if ! result="$(ollama_api_post '/api/chat' "$json_payload")"; then
    _error 'ollama_chat_json: ollama_api_post failed'
    return 1
  fi

  if ! _is_valid_json "$result"; then
    _error 'ollama_chat_json: response is not valid JSON'
    return 1
  fi

  local content
  content="$(printf '%s' "$result" | jq -r ".message.content")"
  local error_jq_message_content=$?
  _debug "ollama_chat_json: content: [${content:0:42}]"
  if (( error_jq_message_content )); then
    _error "ollama_chat_json: error_jq_message_content: $error_jq_message_content"
    return 1
  fi
  echo "$result"
  _debug 'ollama_chat_json: success'
}

# Chat completion request as text
#
# Usage: ollama_chat "model"
# Input: 1 - model
# Output: text, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_chat() {
  if ! _exists 'jq'; then _error 'ollama_chat: jq Not Found'; return 1; fi
  _debug "ollama_chat: [${1:0:42}]"
  local model
  model="$(_is_valid_model "$1")"
  _debug "ollama_chat: model: [${model:0:120}]"
  if [[ -z "$model" ]]; then
    _error 'ollama_chat: No Models Found'
    return 1
  fi
  OLLAMA_LIB_STREAM=0
  local response
  response="$(ollama_chat_json "$model")"
  if [[ -z "$response" ]]; then
    _error 'ollama_chat: ollama_chat_json response empty'
    return 1
  fi
  if ! _is_valid_json "$response"; then
    _error 'ollama_chat: response is not valid JSON'
    return 1
  fi

  if [[ "$OLLAMA_LIB_THINKING" == "on" ]]; then
    local thinking
    thinking="$(printf '%s' "$response" | jq -r '.thinking // empty')"
    if [[ -n "$thinking" ]]; then
      printf '<thinking>\n%s\n</thinking>\n\n' "$thinking" >&2
    fi
  fi

  local message_content
  if ! message_content="$(printf '%s' "$response" | jq -r ".message.content")"; then
    _error 'ollama_chat: failed to get .message.content'
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
  if ! _exists 'jq'; then _error 'ollama_chat_stream: jq Not Found'; return 1; fi
  _debug "ollama_chat_stream: [${1:0:42}]"
  local model
  model="$(_is_valid_model "$1")"
  _debug "ollama_chat_stream: model: [${model:0:120}]"
  if [[ -z "$model" ]]; then
    _error 'ollama_chat_stream: No Models Found'
    return 1
  fi
  OLLAMA_LIB_STREAM=1
  (
    ollama_chat_json "$model" | while IFS= read -r line; do
      if [[ "$OLLAMA_LIB_THINKING" == "on" ]]; then
        printf '%s' "$(jq -r '.thinking // empty' <<<"$line")" >&2
      fi
      printf '%s' "$(jq -r '.message.content // empty' <<<"$line")"
    done
    exit "${PIPESTATUS[0]}"
  ) 2> >( _ollama_thinking_stream )
  local error_code=$?
  OLLAMA_LIB_STREAM=0
  if [[ $error_code -ne 0 ]]; then
    _error "ollama_chat_stream: ollama_chat_json failed with code $error_code"
    return 1
  fi
  printf '\n'
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
  _debug "ollama_chat_stream_json: [${1:0:42}]"
  local model
  model="$(_is_valid_model "$1")"
  _debug "ollama_chat_stream_json: model: [${model:0:120}]"
  if [[ -z "$model" ]]; then
    _error 'ollama_chat_stream_json: No Models Found'
    return 1
  fi
  OLLAMA_LIB_STREAM=1
  if ! ollama_chat_json "$model"; then
    _error 'ollama_chat_stream_json: ollama_chat_json failed'
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
  if ! ollama_app_installed; then _error 'ollama_list: ollama is not installed'; return 1; fi
  local list
  if ! list="$(ollama list)"; then # get ollama list
    _error 'ollama_list: list=|ollama list failed'
    return 1
  fi
  if ! echo "$list" | head -n+1; then # print header
    _error 'ollama_list: echo|head failed'
    return 1
  fi
  if ! echo "$list" | tail -n+2 | sort; then # sorted list of models
    _error 'ollama_list: ollama echo|tail|sort failed'
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
  _debug 'ollama_list_json'
  if ! ollama_api_get '/api/tags'; then
    _error 'ollama_list_json: ollama_api_get failed'
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
  if ! ollama_app_installed; then _error 'ollama_list_array: ollama is not installed'; return 1; fi
  local models=()
  while IFS= read -r line; do
    models+=("$line")
  done < <(ollama list | awk 'NR > 1 {print $1}' | sort)
  echo "${models[@]}" # space separated list of model names
  _debug "ollama_list_array: ${#models[@]} models found: return 0"
  return 0
}

# Model Functions

# Is a model name valid?
# If model name is empty, then get a random model
#
# Usage: _is_valid_model "model"
# Input: 1 - the model name
# Output: The valid model name, or a random model name if input 1 is empty, or empty string on error
# Requires: none
# Returns: 0 if model name is valid, 1 if model name is not valid
_is_valid_model() {
  local model="${1:-}" # The Model Name, may be empty
  if [[ -z "$model" ]]; then
    _debug '_is_valid_model: Model name empty: getting random model'
    model="$(ollama_model_random)"
    if [[ -z "$model" ]]; then
      _debug '_is_valid_model: Model Not Found: ollama_model_random failed'
      printf ''
      return 1
    fi
  fi
  if [[ ! "$model" =~ ^[a-zA-Z0-9._:/-]+$ ]]; then
    _debug "_is_valid_model: INVALID: [${model:0:120}]"
    printf ''
    return 1
  fi
  _debug "_is_valid_model: VALID: [${model:0:120}]"
  printf '%s' "$model"
  return 0
}

# Get a random model
#
# Usage: ollama_model_random
# Input: none
# Output: 1 model name, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_model_random() {
  if ! ollama_app_installed; then _error 'ollama_model_random: ollama is not installed'; return 1; fi
  local models
  # TODO - get list via api, not cli
  models=$(ollama list | awk 'NR>1 {print $1}' | grep -v '^$') # Grab the raw list, skip header, keep the first column.
  if [[ -z "$models" ]]; then
    _error 'ollama_model_random: get ollama list failed'
    return 1
  fi
  if _exists 'shuf'; then # `shuf -n1` prints a random line.
    printf '%s\n' "$models" | shuf -n1
  else # If shuf is unavailable, fall back to awk's srand().
    # awk's built‑in random generator (more portable, but less uniform)
    printf '%s\n' "$models" | awk 'BEGIN{srand()} {a[NR]=$0} END{if(NR) print a[int(rand()*NR)+1]}'
  fi
}

# Unload a model from memory
#
# Usage: ollama_model_unload "model"
# Input: 1 - Model name to unload
# Output: unload result, in json, to stdout
# Requires: ollama, curl, jq
# Returns: 0 on success, 1 on error
ollama_model_unload() {
  if ! _exists 'jq'; then _error 'ollama_model_unload: jq Not Found'; return 1; fi
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
  if ! ollama_app_installed; then _error 'ollama_ps: ollama is not installed'; return 1; fi
  if ! ollama ps; then
    _error 'ollama_ps: ollama ps failed'
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
  _debug 'ollama_ps_json'
  if ! ollama_api_get '/api/ps'; then
    _error 'ollama_ps_json: ollama_api_get failed'
    return 1
  fi
  return 0
}

# Show Functions

# Show model information, CLI version
#
# Usage: ollama_show "model"
# Output: text, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_show() {
  if ! ollama_app_installed; then _error 'ollama_show: ollama is not installed'; return 1; fi
  if ! ollama show "$1"; then
    _error 'ollama_show: ollama show failed'
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
  if ! _exists 'jq'; then _error 'ollama_show_json: jq Not Found'; return 1; fi
  _debug "ollama_show_json: [${1:0:42}]"
  local json_payload
  json_payload="$(jq -c -n \
      --arg model "$1" \
      '{model: $model}')"
  if ! ollama_api_post '/api/show' "$json_payload"; then
    _error 'ollama_show_json: ollama_api_post failed'
    return 1
  fi
  return 0
}

# Get a redacted environment variable
#
# Usage: _get_redacted_var "VAR_NAME"
# Input: 1 - the name of the environment variable
# Output: the value of the variable, redacted if it contains a secret
# Requires: none
# Returns: 0
_get_redacted_var() {
  local var_name="$1"
  local var_value="${!var_name}"
  if [[ "$var_name" == *"AUTH"* || "$var_name" == *"KEY"* || "$var_name" == *"TOKEN"* ]]; then
    [[ -n "$var_value" ]] && var_value="[REDACTED]"
  fi
  printf '%s' "$var_value"
}

# Ollama App Functions

# Is Ollama App installed on the local system?
#
# Usage: if ollama_app_installed; then echo 'Ollama Installed'; else echo 'Ollama Not Installed'; fi
# Input: none
# Output: none
# Requires: none
# Returns: 0 if Ollama is installed, 1 if Ollama is not installed
ollama_app_installed() {
  _debug 'ollama_app_installed'
  _exists "ollama"
}

# Turbo Mode on/off
#
# Usage: ollama_app_turbo on    # Turn on Turbo Mode, set api host to ollama.com, export api host and set api key
# Usage: ollama_app_turbo -e on # Turn on Turbo Mode, and export api key into environment
# Usage: ollama_app_turbo off   # Turn off Turbo Mode, set api host to local, unset api key
# Input: 1 - The mode: empty, "on" or "off", default to "on"
# Output: if OLLAMA_LIB_TURBO_KEY is not set, then prompts user to enter key
# Requires: a valid API key from ollama.com
# Returns: 0 on success, 1 on error
ollama_app_turbo() {
  _debug "ollama_app_turbo: [${1:0:42}] [${2:0:42}]"

  local usage="Usage: ollama_app_turbo [-e] {on|off}"
  local export_key=false
  local mode=''

  while (( $# )); do
    case "$1" in
      -e|--export) # optional
        export_key=true
        shift
        ;;
      on|off) # required mode
        if [[ -n $mode ]]; then
          _error "More than one mode supplied: '${mode:0:42}' and '${1:0:42}'"
          _error "$usage"
          return 1
        fi
        mode="$1"
        shift
        ;;
      -h|--help)
        echo "$usage"
        return 0
        ;;
      *)
        _error "Invalid argument: ${1:0:42}"
        _error "$usage"
        return 1
        ;;
    esac
  done

  _debug "ollama_app_turbo: export_key: $export_key"
  _debug "ollama_app_turbo: mode: $mode"

  local host_api

  case "$mode" in
    on)
      _debug 'ollama_app_turbo: Turning Turbo Mode ON'

      local api_key="$OLLAMA_LIB_TURBO_KEY"

      if [[ -z "$api_key" ]]; then # If api key is not set in current environment
        echo -n 'Enter Ollama API Key (input hidden): '
        read -r -s api_key # Read api_key silently
        echo
      fi

      if [[ -z "$api_key" ]]; then
        _error 'ollama_app_turbo: Ollama API Key empty'
        return 1
      fi

      OLLAMA_LIB_TURBO_KEY="$api_key" # Set the api key in local environment only

      if $export_key; then
        _debug 'ollama_app_turbo: export OLLAMA_LIB_TURBO_KEY'
        export OLLAMA_LIB_TURBO_KEY="$OLLAMA_LIB_TURBO_KEY"
      else
        _debug 'ollama_app_turbo: NO EXPORT of OLLAMA_LIB_TURBO_KEY'
      fi

      host_api='https://ollama.com' # Ollama Cloud Service
      ;;

    off)
      _debug 'ollama_app_turbo: unset OLLAMA_LIB_TURBO_KEY'
      unset OLLAMA_LIB_TURBO_KEY # Erase the api key
      host_api='http://localhost:11434' # Local Ollama
      ;;

    *)
      _error 'ollama_app_turbo: Unknown mode'
      _error "$usage"
      return 1
      ;;

  esac

  _debug "ollama_app_turbo: OLLAMA_LIB_TURBO_KEY: $([[ -n ${OLLAMA_LIB_TURBO_KEY+x} && -n "$OLLAMA_LIB_TURBO_KEY" ]] && echo YES || echo NO)"

  host_api="${host_api%%/}" # remove trailing slash

  if ! _is_valid_url "$host_api"; then
    _error "ollama_app_turbo: Invalid host API URL: $host_api"
    return 1
  fi

  _debug "ollama_app_turbo: export OLLAMA_HOST=$host_api"
  export OLLAMA_HOST="$host_api" # Set host and export it

  _debug "ollama_app_turbo: export OLLAMA_LIB_API=$host_api"
  export OLLAMA_LIB_API="$host_api" # Set api and export it

  return 0
}

# Ollama App environment variables
#
# Usage: ollama_app_vars
# Input: none
# Output: text, to stdout
# Requires: none
# Returns: 0 on success, 1 on error
ollama_app_vars() {
  # https://github.com/ollama/ollama/blob/main/docs/modelfile.md#valid-parameters-and-values
  # https://github.com/ollama/ollama/blob/main/envconfig/config.go
  printf '%s\t%s\n' "OLLAMA_AUTH             : $(_get_redacted_var "OLLAMA_AUTH")" "# Enables authentication between the Ollama client and server"
  printf '%s\t%s\n' "OLLAMA_CONTEXT_LENGTH   : $OLLAMA_CONTEXT_LENGTH" "# Context length to use unless otherwise specified (default: 4096)"
  printf '%s\t%s\n' "OLLAMA_DEBUG            : $OLLAMA_DEBUG" "# Show additional debug information (e.g. OLLAMA_DEBUG=1)"
  printf '%s\t%s\n' "OLLAMA_FLASH_ATTENTION  : $OLLAMA_FLASH_ATTENTION" "# Enabled flash attention"
  printf '%s\t%s\n' "OLLAMA_GPU_OVERHEAD     : $OLLAMA_GPU_OVERHEAD" "# Reserve a portion of VRAM per GPU (bytes)"
  printf '%s\t%s\n' "OLLAMA_HOST             : $OLLAMA_HOST" "# IP Address for the ollama server (default 127.0.0.1:11434)"
  printf '%s\t%s\n' "OLLAMA_INTEL_GPU        : $OLLAMA_INTEL_GPU" "# Enable experimental Intel GPU detection"
  printf '%s\t%s\n' "OLLAMA_KEEP_ALIVE       : $OLLAMA_KEEP_ALIVE" "# The duration that models stay loaded in memory (default \"5m\")"
  printf '%s\t%s\n' "OLLAMA_KV_CACHE_TYPE    : $OLLAMA_KV_CACHE_TYPE" "# Quantization type for the K/V cache (default: f16)"
  printf '%s\t%s\n' "OLLAMA_LLM_LIBRARY      : $OLLAMA_LLM_LIBRARY" "# Set LLM library to bypass autodetection"
  printf '%s\t%s\n' "OLLAMA_LOAD_TIMEOUT     : $OLLAMA_LOAD_TIMEOUT" "# How long to allow model loads to stall before giving up (default \"5m\")"
  printf '%s\t%s\n' "OLLAMA_MAX_LOADED_MODELS: $OLLAMA_MAX_LOADED_MODELS" "# Maximum number of loaded models per GPU"
  printf '%s\t%s\n' "OLLAMA_MAX_QUEUE        : $OLLAMA_MAX_QUEUE" "# Maximum number of queued requests"
  printf '%s\t%s\n' "OLLAMA_MAX_VRAM         : $OLLAMA_MAX_VRAM" ""
  printf '%s\t%s\n' "OLLAMA_MODELS           : $OLLAMA_MODELS" "# The path to the models directory"
  printf '%s\t%s\n' "OLLAMA_MULTIUSER_CACHE  : $OLLAMA_MULTIUSER_CACHE" "# Optimize prompt caching for multi-user scenarios"
  printf '%s\t%s\n' "OLLAMA_NEW_ENGINE       : $OLLAMA_NEW_ENGINE" "# Enable the new Ollama engine"
  printf '%s\t%s\n' "OLLAMA_NOHISTORY        : $OLLAMA_NOHISTORY" "# Do not preserve readline history"
  printf '%s\t%s\n' "OLLAMA_NOPRUNE          : $OLLAMA_NOPRUNE" "# Do not prune model blobs on startup"
  printf '%s\t%s\n' "OLLAMA_NUM_PARALLEL     : $OLLAMA_NUM_PARALLEL" "# Maximum number of parallel request"
  printf '%s\t%s\n' "OLLAMA_ORIGINS          : $OLLAMA_ORIGINS" "# A comma separated list of allowed origins"
  printf '%s\t%s\n' "OLLAMA_RUNNERS_DIR      : $OLLAMA_RUNNERS_DIR" "# Sets the location for runners"
  printf '%s\t%s\n' "OLLAMA_SCHED_SPREAD     : $OLLAMA_SCHED_SPREAD" "# Always schedule model across all GPUs"
  printf '%s\t%s\n' "OLLAMA_TEST_EXISTING    : $OLLAMA_TEST_EXISTING" ""
  printf '%s\t%s\n' "OLLAMA_TMPDIR           : $OLLAMA_TMPDIR" ""
  printf '%s\t%s\n' "CUDA_VISIBLE_DEVICES    : $(_get_redacted_var "CUDA_VISIBLE_DEVICES")" "# Set which NVIDIA devices are visible"
  printf '%s\t%s\n' "GPU_DEVICE_ORDINAL      : $(_get_redacted_var "GPU_DEVICE_ORDINAL")" "# Set which AMD devices are visible by numeric ID"
  printf '%s\t%s\n' "HIP_PATH                : $HIP_PATH" ""
  printf '%s\t%s\n' "HIP_VISIBLE_DEVICES     : $(_get_redacted_var "HIP_VISIBLE_DEVICES")" "# Set which AMD devices are visible by numeric ID"
  printf '%s\t%s\n' "HSA_OVERRIDE_GFX_VERSION: $HSA_OVERRIDE_GFX_VERSION" "# Override the gfx used for all detected AMD GPUs"
  printf '%s\t%s\n' "HTTP_PROXY              : $(_get_redacted_var "HTTP_PROXY")" ""
  printf '%s\t%s\n' "JETSON_JETPACK          : $JETSON_JETPACK" ""
  printf '%s\t%s\n' "LD_LIBRARY_PATHS        : $LD_LIBRARY_PATH" ""
  printf '%s\t%s\n' "ROCR_VISIBLE_DEVICES    : $(_get_redacted_var "ROCR_VISIBLE_DEVICES")" "# Set which AMD devices are visible by UUID or numeric ID"
  printf '%s\t%s\n' "TERM                    : $TERM" ""
}

# Ollama App version, TEXT version
#
# Usage: ollama_app_version
# Input: none
# Requires: ollama, curl, jq
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_app_version() {
  if ! _exists 'jq'; then _error 'ollama_app_version: jq Not Found'; return 1; fi
  if ! ollama_api_get '/api/version' | jq -r ".version"; then
    _error 'ollama_app_version: error_ollama_api_get|jq failed'
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
  _debug 'ollama_app_version_json'
  if ! ollama_api_get '/api/version'; then
    _error 'ollama_app_version_json: error_ollama_api_get failed'
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
  _debug 'ollama_app_version_cli'
  if ! ollama --version; then
    _error 'ollama_app_version_cli: ollama --version failed'
    return 1
  fi
  return 0
}

# Lib Functions

# Ollama Thinking Mode
#
# Alias: ot
# Usage: ollama_thinking on|off|hide
# Input: 1 - The mode: "on", "off", or "hide", default to show current setting
# Output: if no input, then the current setting is printed
# Requires: none
# Returns: 0 on success, 1 on error
ollama_thinking() {
  _debug "ollama_thinking: [${1:0:42}]"
  case "${1:-}" in
    on|ON)
      export OLLAMA_LIB_THINKING="on"
      ;;
    off|OFF)
      export OLLAMA_LIB_THINKING="off"
      ;;
    hide|HIDE)
      export OLLAMA_LIB_THINKING="hide"
      ;;
    '')
      printf "thinking is %s\n" "$OLLAMA_LIB_THINKING"
      ;;
    *)
      _error 'ollama_thinking: Unknown mode. Usage: ollama_thinking on|off|hide'
      return 1
      ;;
  esac
  return 0
}

# About Ollama Bash Lib
#
# Usage: ollama_lib_about
# Input: none
# Output: text, to stdout
# Requires: compgen (for function list)
# Returns: 0 on success, 1 on missing compgen or column
ollama_lib_about() {
  printf "%s v%s\n" "$OLLAMA_LIB_NAME" "$OLLAMA_LIB_VERSION"
  printf 'A Bash Library to interact with Ollama\n\n'

  local turbo_key_status="NO"
  if [[ -n "${OLLAMA_LIB_TURBO_KEY}" ]]; then
    turbo_key_status="YES [REDACTED]"
  fi

  printf "%-25s : %s\n" "OLLAMA_LIB_NAME" "$OLLAMA_LIB_NAME"
  printf "%-25s : %s\n" "OLLAMA_LIB_VERSION" "$OLLAMA_LIB_VERSION"
  printf "%-25s : %s\n" "OLLAMA_LIB_URL" "$OLLAMA_LIB_URL"
  printf "%-25s : %s\n" "OLLAMA_LIB_DISCORD" "$OLLAMA_LIB_DISCORD"
  printf "%-25s : %s\n" "OLLAMA_LIB_LICENSE" "$OLLAMA_LIB_LICENSE"
  printf "%-25s : %s\n" "OLLAMA_LIB_COPYRIGHT" "$OLLAMA_LIB_COPYRIGHT"
  printf "%-25s : %s\n" "OLLAMA_LIB_API" "$OLLAMA_LIB_API"
  printf "%-25s : %s\n" "OLLAMA_LIB_DEBUG" "$OLLAMA_LIB_DEBUG"
  printf "%-25s : %s\n" "OLLAMA_LIB_STREAM" "$OLLAMA_LIB_STREAM"
  printf "%-25s : %s\n" "OLLAMA_LIB_THINKING" "$OLLAMA_LIB_THINKING"
  printf "%-25s : %s\n" "OLLAMA_LIB_MESSAGES" "${#OLLAMA_LIB_MESSAGES[@]} messages"
  printf "%-25s : %s\n" "OLLAMA_LIB_TURBO_KEY" "$turbo_key_status"
  printf "%-25s : %s\n" "OLLAMA_LIB_TIMEOUT" "$OLLAMA_LIB_TIMEOUT seconds"

  if ! _exists 'compgen'; then _debug 'ollama_lib_about: compgen Not Found'; return 1; fi

  printf '\nFunctions:\n\n'

  if ! _exists 'column'; then
    _debug 'ollama_lib_about: column Not Found'
    compgen -A function -X '!ollama_*' | sort
    return 0
  fi
  compgen -A function -X '!ollama_*' | sort | column
}

# Ollama Bash Lib version
#
# Usage: ollama_lib_version
# Input: none
# Output: semantic version number, to stdout
# Requires: none
# Returns: 0
ollama_lib_version() {
  printf '%s\n' "$OLLAMA_LIB_VERSION"
}

# Helper Functions

# Command Line Eval
#
# Alias: oe
# Usage: ollama_eval "task" "model"
# Input: 1 - The task to be run on the command line
# Input: 2 - Model to use to generate command (Optional) If empty, uses random model
# Output: prompts user for permission, then runs command
# Requires: none
# Returns: 0 on success, 1 or higher on error
ollama_eval() {
  if (( OLLAMA_LIB_SAFE_MODE )); then
    _error "ollama_eval is disabled in safe mode."
    return 1
  fi
  if ! _exists 'jq'; then _error 'ollama_eval: jq Not Found'; return 1; fi
  _debug "ollama_eval: [${1:0:42}] [${2:0:42}]"

  local task="$1"
  if [[ -z "$task" ]]; then
    _error 'ollama_eval: Task Not Found. Usage: oe "task" "model"'
    return 1
  fi

  local model
  model="$(_is_valid_model "$2")"
  _debug "ollama_eval: model: [${model:0:120}]"
  if [[ -z "$model" ]]; then
    _error 'ollama_eval: No Models Found'
    return 1
  fi

  local prompt='Write a bash one-liner to do the following task:\n\n'
  prompt+="$task\n\n"
  prompt+="You are on a $(uname -s) system, with bash version ${BASH_VERSION:-$(bash --version | head -n1)}.\n"
  prompt+="If you can not do the task but you can instruct the user how to do it, then reply with an 'echo' command with your instructions.\n"
  prompt+="If you can not do the task for any other reason, then reply with an 'echo' command with your reason.\n"
  prompt+="Reply ONLY with the ready-to-run bash one-liner.\n"
  prompt+='Do NOT add any commentary, description, markdown formatting or anything extraneous.\n'
  _debug "ollama_eval: prompt: [${prompt:0:240}]"

  printf "\nOllama Eval - %s\n" "$task"
  printf "Using model: %s\n" "$model"

  OLLAMA_LIB_STREAM=0

  local json_result
  json_result="$(ollama_generate_json "$model" "$prompt")"
  if [[ -z "$json_result" ]]; then
    _error 'ollama_eval: ollama_generate_json failed'
    return 1
  fi
  if ! _is_valid_json "$json_result"; then
    _error 'ollama_eval: received invalid json result'
    return 1
  fi

  local cmd
  cmd="$(printf '%s' "$json_result" | jq -r '.response // empty')"
  if [[ -z "$cmd" ]]; then
    _error 'ollama_eval: error extracting response from model'
    return 1
  fi

  printf "\nGenerated Command:\n"
  printf "  %s\n\n" "$cmd"

  printf "Safety & Syntax Check:\n"

  local first_word
  read -r first_word _ <<<"$cmd"

  if [[ "$first_word" =~ ^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_]*\(\)[[:space:]]*\{ ]]; then
    printf "  ✅ Valid start: function definition\n"
  elif [[ "$first_word" =~ ^[a-zA-Z_][a-zA-Z0-9_]*= ]]; then
    printf "  ✅ Valid start: variable assignment\n"
  elif _exists "$first_word"; then
    printf "  ✅ Valid start: %s\n" "$first_word"
  else
    printf "  ❌ Invalid start: %s.\n" "$first_word"
    return 1
  fi

  local errors
  if _exists 'timeout'; then
    if ! errors=$(timeout 1 bash -n <<<"$cmd" 2>&1); then
      local rc=$?
      printf "  ❌ Invalid Bash Syntax (code $rc)\n%s\n" "$errors"
      return 1
    else
      printf "  ✅ Valid Bash Syntax\n"
    fi
  else
    _debug "ollama_eval: 'timeout' command not found, skipping syntax check."
    if ! errors=$(bash -n <<<"$cmd" 2>&1); then
      local rc=$?
      printf "  ❌ Invalid Bash Syntax (code $rc)\n%s\n" "$errors"
      return 1
    else
      printf "  ✅ Valid Bash Syntax (checked without timeout)\n"
    fi
  fi

  local dangerous=(
    rm mv dd mkfs shred shutdown reboot init kill pkill killall umount mount userdel groupdel passwd su sudo systemctl
    bash '/bin/sh' '-delete' exec eval source '\.'
  )
  local IFS='|'
  local danger_regex="(^|[^[:alnum:]_])(${dangerous[*]})($|[^[:alnum:]_])"
  if [[ "$cmd" =~ $danger_regex ]]; then
    local bad="${BASH_REMATCH[2]}"
    printf "  ⚠️ WARNING: The generated command contains a potentially dangerous token: \"%s\"\n" "$bad"
  else
    printf "  ✅ No dangerous commands found\n"
  fi

  printf '\nRun command in sandbox (y/N/eval)? '
  read -r permission
  case "$permission" in
    [Yy])
      _debug "ollama_eval: sandboxed eval cmd: [${cmd:0:240}]"
      echo
      printf 'Running command in a sandboxed environment...\n\n'
      env -i PATH="/bin:/usr/bin" bash -r -c "$cmd"
      return $? # return sandboxed eval error status
      ;;
    eval)
      printf 'Are you sure? [y/N] '
      read -r permission2
      case "$permission2" in
        [Yy])
          _debug "ollama_eval: dangerous eval cmd: [${cmd:0:240}]"
          echo
          printf 'Running command in DANGEROUS mode (not sandboxed)...\n\n'
          eval "$cmd"
          return $?
          ;;
        *)
          echo "Aborted."
          return 0
          ;;
      esac
      ;;
    *)
      echo "Aborted."
      return 0
      ;;
  esac
}

# Aliases

oag()  { ollama_api_get "$@"; }
oapi() { ollama_api_ping "$@"; }
oap()  { ollama_api_post "$@"; }

oai()  { ollama_app_installed "$@"; }
oat()  { ollama_app_turbo "$@"; }
oav()  { ollama_app_vars "$@"; }
oave() { ollama_app_version "$@"; }
oavj() { ollama_app_version_json "$@"; }
oavc() { ollama_app_version_cli "$@"; }

oc()   { ollama_chat "$@"; }
ocj()  { ollama_chat_json "$@"; }
ocs()  { ollama_chat_stream "$@"; }
ocsj() { ollama_chat_stream_json "$@"; }

oe()   { ollama_eval "$@"; }

og()   { ollama_generate "$@"; }
ogj()  { ollama_generate_json "$@"; }
ogs()  { ollama_generate_stream "$@"; }
ogsj() { ollama_generate_stream_json "$@"; }

olab() { ollama_lib_about "$@"; }
olv()  { ollama_lib_version "$@"; }

ol()   { ollama_list "$@"; }
ola()  { ollama_list_array "$@"; }
olj()  { ollama_list_json "$@"; }

om()   { ollama_messages "$@"; }
oma()  { ollama_messages_add "$@"; }
omc()  { ollama_messages_clear "$@"; }
omco() { ollama_messages_count "$@"; }

omr()  { ollama_model_random "$@"; }
omu()  { ollama_model_unload "$@"; }

os()   { ollama_show "$@"; }
osj()  { ollama_show_json "$@"; }

ot()   { ollama_thinking "$@"; }

op()   { ollama_ps "$@"; }
opj()  { ollama_ps_json "$@"; }

#
# Enjoying Ollama Bash Lib?
#
# Give the project a star on GitHub! ✨
#
# https://github.com/attogram/ollama-bash-lib
#

#
# Need some technical support, or just want to chat?
#
# Join our Discord channel #ollama-bash-lib
#
# https://discord.gg/BGQJCbYVBa
#
