#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OBL_NAME='Ollama Bash Lib'
OBL_VERSION='0.46.8'
OBL_URL='https://github.com/attogram/ollama-bash-lib'
OBL_DISCORD='https://discord.gg/BGQJCbYVBa'
OBL_LICENSE='MIT'
OBL_COPYRIGHT='Copyright (c) 2025 Attogram Project <https://github.com/attogram>'

OBL_API="${OLLAMA_HOST:-http://localhost:11434}" # Ollama API URL, No slash at end
OBL_DEBUG="${OBL_DEBUG:-0}" # 0 = debug off, 1 = debug, 2 = verbose debug
OBL_MESSAGES=() # Array of messages, in JSON format
OBL_STREAM=0 # Streaming mode: 0 = No streaming, 1 = Yes streaming
OBL_THINKING="${OBL_THINKING:-off}" # Thinking mode: off, on, hide
OBL_TIMEOUT="${OBL_TIMEOUT:-300}" # Curl timeout in seconds

if (set -o pipefail 2>/dev/null); then # If pipefail is supported
    set -o pipefail # Exit the pipeline if any command fails (instead of only the last one)
fi

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
  if [[ -n "${OBL_TURBO_KEY}" ]]; then
    msg=${msg//"${OBL_TURBO_KEY}"/'[REDACTED]'} # never show the private api key
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
  (( OBL_DEBUG )) || return 0 # DEBUG must be 1 or higher to show debug messages
  local date_string # some date implementations do not support %N nanoseconds
  date_string="$(if ! date '+%H:%M:%S:%N' 2>/dev/null; then date '+%H:%M:%S'; fi)"
  printf '[DEBUG] %s: %s\n' "$date_string" "$(_redact "$1")" >&2
}

# Error message
#
# Usage: _error "message"
# Input: 1 - the error message
# Output: message to stderr
# Requires: none
# Returns: 0 on success, 1 on error
_error() {
  printf '[ERROR] %s\n' "$(_redact "$1")" >&2
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
  local url_regex='^(https?)://[A-Za-z0-9.-]+(:[0-9]+)?$'
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
      #_debug '_is_valid_json: success'
      return 0
      ;;
    1) # (Failure) The last value output was either false or null.
      _error '_is_valid_json: FAILURE jq: output false or null: return 1'
      return 1
      ;;
    2) # (Usage Error): There was a problem with how the jq command was used, such as incorrect command-line options.
      _error '_is_valid_json: USAGE ERROR jq: incorrect command-line options: return 2'
      return 2
      ;;
    3) # (Compile Error): The jq filter program itself had a syntax error.
      _error '_is_valid_json: COMPILE ERROR jq: filter syntax error: return 3'
      return 3
      ;;
    4) # (No Output): No valid result was ever produced. This can happen if the filter's output is empty.
      _error '_is_valid_json: NO OUTPUT jq: result empty: return 4'
      return 4
      ;;
    5) # (Halt Error)
      _error '_is_valid_json: HALT_ERROR jq: return 5'
      return 5
      ;;
    *) # (Unknown)
      _error "_is_valid_json: UNKNOWN jq error: return $return_code"
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

  _debug "_call_curl: OBL_API: $OBL_API"

  local curl_args=(
    -s
    -N
    --max-time "$OBL_TIMEOUT"
    -H 'Content-Type: application/json'
    -w 'HTTP_CODE_DELIMITER%{http_code}'
  )

  if [[ -n "${OBL_TURBO_KEY}" ]]; then
    _debug '_call_curl: Turbo Mode'
    curl_args+=( -H "Authorization: Bearer ${OBL_TURBO_KEY}" )
  fi

  curl_args+=( -X "$method" )
  curl_args+=( "${OBL_API}${endpoint}" )

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
  http_code="${response##*HTTP_CODE_DELIMITER}"
  local body
  body="${response%HTTP_CODE_DELIMITER*}"

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
    local usage='Usage: ollama_api_get [-P <path>] [-h] [-v]'
    local description
    description=$(cat <<'EOF'
GET request to the Ollama API.

  -P <path>   API path to send the GET request to (optional).
  -h          Show this help and exit.
  -v          Show version information and exit.

This is a fundamental function used by many other functions in this library to communicate with the Ollama API, such as 'ollama_list_json' and 'ollama_api_ping'.
It relies on the '_call_curl' function to perform the actual HTTP request.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG api_path
    while getopts ":P:hv" opt; do
        case $opt in
            P) api_path=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_api_get version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    _debug "ollama_api_get: [${api_path:0:42}]"
    _call_curl "GET" "$api_path"
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
    local usage='Usage: ollama_api_post -P <path> -d <data> [-h] [-v]'
    local description
    description=$(cat <<'EOF'
POST request to the Ollama API.

  -P <path>   API path to send the POST request to.
  -d <data>   JSON content to send in the request body.
  -h          Show this help and exit.
  -v          Show version information and exit.

This is a core function for sending data to the Ollama API, used by functions like 'ollama_generate_json', 'ollama_chat_json', and 'ollama_show_json'.
It relies on the '_call_curl' function to perform the actual HTTP request.
EOF
)

    OPTIND=1 # start parsing at $1 again
    local opt OPTARG api_path json_content
    while getopts ":P:d:hv" opt; do
        case $opt in
            P) api_path=$OPTARG ;;
            d) json_content=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_api_post version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ -z "$api_path" || -z "$json_content" ]]; then
        printf 'Error: Missing required arguments\n\n' >&2
        printf '%s\n' "$usage" >&2
        return 2
    fi

    _debug "ollama_api_post: [${api_path:0:42}] ${json_content:0:120}"
    _call_curl "POST" "$api_path" "$json_content"
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
    local usage='Usage: ollama_api_ping [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Ping the Ollama API to check for availability.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends a request to the root of the Ollama API to verify that it is running and accessible.
It is useful for health checks and ensuring connectivity before attempting to use other API functions.
This function relies on 'ollama_api_get' to make the request.
EOF
)
    OPTIND=1 # start parsing at $1 again
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_api_ping version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_api_ping: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    _debug 'ollama_api_ping'
    if [[ -n "${OBL_TURBO_KEY}" ]]; then
        # TODO - support for turbo mode pings
        _debug 'ollama_api_ping: function not available in Turbo Mode'
        return 0 # we return success for now, to keep outputs clean of other errors
    fi

    local result
    if ! result="$(ollama_api_get -P "")"; then
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
# Usage: _ollama_generate_json_payload "model" "prompt"
# Input: 1 - The model to use
# Input: 2 - The prompt
# Output: json payload to stdout
# Requires: jq
# Returns: 0 on success, 1 on error
_ollama_generate_json_payload() {
  local model="$1"
  local prompt="$2"
  local stream=true
  (( OBL_STREAM == 0 )) && stream=false
  local thinking=false
  [[ "$OBL_THINKING" == 'on' || "$OBL_THINKING" == 'hide' ]] && thinking=true

  local payload
  payload="$(jq -c -n \
    --arg model "$model" \
    --arg prompt "$prompt" \
    --argjson stream "$stream" \
    --argjson thinking "$thinking" \
    '{model: $model, prompt: $prompt, stream: $stream, thinking: $thinking}')"

  printf '%s' "$payload"
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
    local usage='Usage: ollama_generate_json -m <model> [-p <prompt>] [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Generate a completion from a model as JSON.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends a prompt to a specified model and returns the model's response as a raw JSON object.
If streaming is enabled via the global 'OBL_STREAM' variable, it will return a stream of JSON objects.
This is a foundational function for 'ollama_generate' and 'ollama_generate_stream', which process this JSON output into plain text.
EOF
)

    OPTIND=1 # start parsing at $1 again
    local opt OPTARG model prompt
    while getopts ":m:p:hv" opt; do
        case $opt in
            m) model=$OPTARG ;;
            p) prompt=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_generate_json version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if ! _exists 'jq'; then _error 'ollama_generate_json: Not Found: jq'; return 1; fi

    if [ -z "$model" ]; then
        model="$(_is_valid_model "")"
        if [ -z "$model" ]; then
            printf 'Error: -m <model> is required\n\n' >&2
            printf '%s\n' "$usage" >&2
            return 2
        fi
    fi

    if [ -z "$prompt" ] && [ ! -t 0 ]; then
        prompt=$(cat -)
    fi

    if [ -z "$prompt" ]; then
        _error 'ollama_generate_json: Not Found: prompt.'
        printf '%s\n' "$usage" >&2
        return 1
    fi

    _debug "ollama_generate_json: [${model:0:42}] [${prompt:0:42}]"

    local json_payload
    json_payload="$(_ollama_generate_json_payload "$model" "$prompt")"
    _debug "ollama_generate_json: json_payload: ${json_payload:0:120}"

    if ! ollama_api_post -P '/api/generate' -d "$json_payload"; then
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
    _debug "ollama_generate: [${1:0:42}] [${2:0:42}] [${3:0:42}] [${4:0:42}]"

    local usage='Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]'
    #_debug "ollama_generate: usage: $usage"

    local description
    description=$(cat <<'EOF'
Generate a completion from a model as plain text.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function is a wrapper around 'ollama_generate_json'. It takes the raw JSON output and extracts the 'response' field, returning it as a single string.
This is useful for when you only need the generated text and don't want to parse the JSON yourself.
EOF
)

    OPTIND=1 # start parsing at $1 again
    local opt OPTARG model prompt

    _debug "ollama_generate: init: model: [${model:0:120}] prompt: [${prompt:0:120}]"

    while getopts ":m:p:hv" opt; do
        _debug "ollama_generate: while getopts: OPTARG: [$OPTARG] opt: [$opt]"
        case $opt in
            m) model=$OPTARG ;;
            p) prompt=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_generate version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done

    shift $((OPTIND-1))

    if [ -z "$prompt" ] && [ ! -t 0 ]; then
        prompt=$(cat -)
    fi

    _debug "ollama_generate: final: model: [${model:0:120}] prompt: [${prompt:0:120}]"


    if ! _exists 'jq'; then _error 'ollama_generate: jq Not Found'; return 1; fi

   _debug "ollama_generate: checking: model: [${model:0:120}]"

    if [ -z "$model" ]; then
        model="$(ollama_model_random)"
        if [ -z "$model" ]; then
            printf 'Error: -m <model> is required\n\n' >&2
            printf '%s\n' "$usage" >&2
            return 2
        fi
    fi
   _debug "ollama_generate: checked: model: [${model:0:120}]"

    if [ -z "$prompt" ]; then
        _error 'ollama_generate: Not Found: prompt.'
        printf '%s\n' "$usage" >&2
        return 1
    fi

    OBL_STREAM=0 # Turn off streaming

    local result
    result="$(ollama_generate_json -m "$model" -p "$prompt")"
    local error_ollama_generate_json=$?
    _debug "ollama_generate: result: $(echo "$result" | wc -c | tr -d ' ') bytes: ${result:0:120}"
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

    _debug "ollama_generate: thinking: $OBL_THINKING"
    if [[ "$OBL_THINKING" != 'hide' ]]; then
        local thinking
        thinking="$(printf '%s' "$result" | jq -r '.thinking // empty')"
        if [[ -n "$thinking" ]]; then
            _debug 'ollama_generate: thinking FOUND'
            printf '#### <thinking>\n#### %s\n#### </thinking>\n\n' "$thinking" >&2 # send thinking to stderr
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
    local usage='Usage: ollama_generate_stream_json -m <model> [-p <prompt>] [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Generate a completion from a model as a stream of JSON objects.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sets the global 'OBL_STREAM' variable to 1 and then calls 'ollama_generate_json'.
It is the basis for 'ollama_generate_stream', which further processes the output into a continuous stream of text.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG model prompt
    while getopts ":m:p:hv" opt; do
        case $opt in
            m) model=$OPTARG ;;
            p) prompt=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_generate_stream_json version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [ -z "$model" ]; then
        model="$(_is_valid_model "")"
        if [ -z "$model" ]; then
            printf 'Error: -m <model> is required\n\n' >&2
            printf '%s\n' "$usage" >&2
            return 2
        fi
    fi

    if [ -z "$prompt" ] && [ ! -t 0 ]; then
        prompt=$(cat -)
    fi

    if [ -z "$prompt" ]; then
        _error 'ollama_generate_stream_json: Not Found: prompt.'
        printf '%s\n' "$usage" >&2
        return 1
    fi

    _debug "ollama_generate_stream_json: [${model:0:42}] [${prompt:0:42}]"
    OBL_STREAM=1 # Turn on streaming
    if ! ollama_generate_json -m "$model" -p "$prompt"; then
        _error "ollama_generate_stream_json: ollama_generate_json failed"
        OBL_STREAM=0 # Turn off streaming
        return 1
    fi
    OBL_STREAM=0 # Turn off streaming
    _debug 'ollama_generate_stream_json: success'
    return 0
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
    printf '#### <thinking>\n' >&2
    printf '#### %s' "$chunk" >&2
    cat >&2
    printf '\n#### </thinking>\n\n' >&2
  fi
}

# Generate a completion as streaming text
#
# Usage: ollama_generate_stream -m <model> [-p <prompt>] [-h] [-v]
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: text, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_generate_stream() {
    local usage='Usage: ollama_generate_stream -m <model> [-p <prompt>] [-h] [-v]'
    local description='Generate a completion from a model as a stream of text.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.
  
    This function calls ollama_generate_stream_json and pipes the output to jq to extract the response field from each JSON object, providing a continuous stream of text.
    It is ideal for displaying real-time generation in interactive scripts.' 

    OPTIND=1
    local opt OPTARG model prompt
    while getopts ":m:p:hv" opt; do
        case $opt in
            m) model=$OPTARG ;;
            p) prompt=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_generate_stream version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if ! _exists 'jq'; then
        _error 'ollama_generate_stream: jq Not Found'
        return 1
    fi

    if [ -z "$model" ]; then
        model="$(ollama_model_random)" || return 1
    fi

    if [ -z "$prompt" ]; then
        [[ -t 0 ]] || prompt=$(cat -)
    fi
    if [ -z "$prompt" ]; then
        _error 'ollama_generate_stream: No prompt supplied'
        printf '%s\n' "$usage" >&2
        return 1
    fi

    _debug "ollama_generate_stream: model='$model'  prompt='${prompt:0:40}'"

    OBL_STREAM=1

    local is_thinking=false
    local is_responding=false

    ollama_generate_json -m "$model" -p "$prompt" |
    while IFS= read -r line; do

        #_debug "ollama_generate_stream: line: [${line:0:1000}]"

        thinking="$(jq '.thinking // empty' <<<"$line")"
        thinking=${thinking#\"} # strip first "
        thinking=${thinking%\"} # strip last "
        if [[ -n "$thinking" ]]; then
            if [[ "$is_thinking" == 'false' ]]; then
                # first thinking input received
                is_thinking=true
                printf '\n#### %b' "$thinking"
            else 
                # subsequent thinking input received
                printf '%b' "$thinking"
            fi
        fi
        
        response="$(jq '.response // empty' <<<"$line")"
        response=${response#\"} # strip first "
        response=${response%\"} # strip last "
        if [[ -n "$response" ]]; then
            if [[ "$is_responding" == 'false' ]]; then
                # first response input received
                is_responding=true
                printf '\n\n%b' "$response"
            else 
                # subsequent response input received
                printf '%b' "$response"
            fi
        fi
    done
    rc=$?    # exit status of the whole pipeline

    OBL_STREAM=0

    # Final newline (only on success)
    (( rc == 0 )) && printf '\n'

    _debug "ollama_generate_stream: exit=$rc"
    return $rc
}

# Messages Functions

# Get all messages
#
# Usage: messages="$(ollama_messages)"
# Output: a valid json array of message objects, to stdout
# Env: OBL_MESSAGES
# Requires: none
# Returns: 0 on success, 1 on error
ollama_messages() {
    local usage='Usage: ollama_messages [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Get all messages in the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns a JSON array of all messages that have been added to the current session via 'ollama_messages_add'.
The output of this function is suitable for use in the 'messages' field of a chat completion request.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_messages version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_messages: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    if [[ ${#OBL_MESSAGES[@]} -eq 0 ]]; then
        _debug 'ollama_messages: no messages'
        printf '[]'
        return 1
    fi
    printf '[%s]' "$(printf '%s,' "${OBL_MESSAGES[@]}" | sed 's/,$//')"
    return 0
}

# Add a message
#
# Usage: ollama_messages_add -r <role> -c <content>
# Input: 1 - role (user/assistant/system)
# Input: 2 - the message content
# Output: none
# Env: OBL_MESSAGES
# Requires: jq
# Returns: 0
ollama_messages_add() {
    local usage='Usage: ollama_messages_add -r <role> -c <content> [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Add a message to the current session's message history.

  -r <role>   The role of the message sender (user, assistant, system).
  -c <content> The content of the message.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function appends a new message object to the \'OBL_MESSAGES\' array.
This history is then used by \'ollama_chat\' and related functions to maintain a conversation with the model.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG role content
    while getopts ":r:c:hv" opt; do
        case $opt in
            r) role=$OPTARG ;;
            c) content=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_messages_add version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if ! _exists 'jq'; then _error 'ollama_messages_add: jq Not Found'; return 1; fi

    if [ -z "$role" ] || [ -z "$content" ]; then
        printf 'Error: Missing required arguments\n\n' >&2
        printf '%s\n' "$usage" >&2
        return 2
    fi

    _debug "ollama_messages_add: [${role:0:42}] [${content:0:42}]"

    local json_payload

    json_payload="$(jq -c -n \
        --arg role "$role" \
        --arg content "$content" \
        '{role: $role, content: $content}')"

    OBL_MESSAGES+=("$json_payload")
}

# Clear all messages
#
# Usage: ollama_messages_clear
# Output: none
# Env: OBL_MESSAGES
# Requires: none
# Returns: 0
ollama_messages_clear() {
    local usage='Usage: ollama_messages_clear [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Clear all messages from the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function resets the \'OBL_MESSAGES\' array, effectively deleting the entire conversation history for the current session.
This is useful for starting a new conversation without restarting the script.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_messages_clear version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_messages_clear: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    _debug 'ollama_messages_clear'
    OBL_MESSAGES=()
}

# Messages count
#
# Usage: ollama_messages_count
# Output: number of messages, to stdout
# Env: OBL_MESSAGES
# Requires: none
# Returns: 0
ollama_messages_count() {
    local usage='Usage: ollama_messages_count [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Get the number of messages in the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current number of messages stored in the 'OBL_MESSAGES' array.
It can be used to check if a conversation has started or to monitor the length of the conversation history.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_messages_count version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_messages_count: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    echo "${#OBL_MESSAGES[@]}"
}

# Get Last Message, JSON format
#
# Usage: ollama_messages_last_json [-h] [-v]
# Output: last element of message history, in JSON format
# Env: OBL_MESSAGES
# Requires: none
# Returns 0 on success, 1 on error
ollama_messages_last_json() {
    local usage='Usage: ollama_messages_last_json [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Get the last message from the session history in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function retrieves the most recent message from the 'OBL_MESSAGES' array and outputs it as a JSON string.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_messages_last_json version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_messages_last_json: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    local count
    count=${#OBL_MESSAGES[@]}
    if [[ $count -lt 1 ]]; then
        _error "ollama_messages_last_json: Message History is empty: count: [$count]"
        echo
        return 1
    fi
    local last=''
    last="${OBL_MESSAGES[$(( count - 1 ))]}"
    if [[ -z "$last" ]]; then
        _error 'ollama_messages_last_json: No message found'
        echo
        return 1
    fi
    printf '%s\n' "$last"
    if ! _is_valid_json "$last"; then
        _error 'ollama_messages_last_json: last message is not valid json'
        return 1
    fi
    return 0
}

# Get Last Message, string format
#
# Usage: ollama_messages_last [-h] [-v]
# Output: last element of message history, as a string
# Env: OBL_MESSAGES
# Requires: ollama_messages_last_json
# Returns 0 on success, 1 on error
ollama_messages_last() {
    local usage='Usage: ollama_messages_last [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Get the content of the last message from the session history as a string.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function retrieves the last message using 'ollama_messages_last_json' and extracts the 'content' field, returning it as a plain string.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_messages_last version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_messages_last: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    local last
    last="$(ollama_messages_last_json | jq -r '.content // empty')"
    local error=$?
    if (( error )); then
        _error "ollama_messages_last: error getting message content: $error"
        return 1
    fi
    printf '%s\n' "$last"
    return 0
}

# Chat Functions

_ollama_chat_stream_true() {
  local json_payload="$1"
  _debug '_ollama_chat_stream_true: stream starting'
  if ! ollama_api_post -P '/api/chat' -d "$json_payload"; then
    _error '_ollama_chat_stream_true: ollama_api_post failed'
    return 1
  fi
  _debug '_ollama_chat_stream_true: stream finished'
  return 0
}

_ollama_chat_stream_false() {
  local json_payload="$1";
  local result
  if ! result="$(ollama_api_post -P '/api/chat' -d "$json_payload")"; then
    _error '_ollama_chat_stream_false: ollama_api_post failed'
    return 1
  fi
  if ! _is_valid_json "$result"; then
    _error '_ollama_chat_stream_false: response is not valid JSON'
    return 1
  fi

  local content
  content="$(printf '%s' "$result" | jq -r ".message.content")"
  local error=$?
  _debug "_ollama_chat_stream_false: content: [${content:0:42}]"
  if (( error )); then
    _error "_ollama_chat_stream_false: jq error getting message content: $error"
    return 1
  fi

  _debug "_ollama_chat_stream_false: ollama_messages_count: [$(ollama_messages_count)]"
  _debug "_ollama_chat_stream_false: adding assistant message: [${content:0:42}]"
  ollama_messages_add -r 'assistant' -c "$content"
  _debug "_ollama_chat_stream_false: ollama_messages_count: [$(ollama_messages_count)]"

  _debug '_ollama_chat_stream_false: success'
  return 0
}

_ollama_chat_payload() {
  local model="$1"

  local stream=true
  if [[ "$OBL_STREAM" -eq '0' ]]; then
    stream=false
  fi

  if (( ${#OBL_MESSAGES[@]} == 0 )); then
    _error '_ollama_chat_payload: Message history is empty'
    # return 1 # TODO - decide: return 1, or allow empty message history?
  fi

  local thinking=true
  if [[ "$OBL_THINKING" == 'off' ]]; then
    thinking=false
  fi

  # Safely construct the JSON payload using jq
  # The OBL_MESSAGES array already contains valid JSON objects.
  # We print each on a new line and use jq's slurp (-s) flag to create a JSON array.
  # Then we add the other fields (model, stream, thinking).
  local json_payload
  json_payload="$(printf '%s\n' "${OBL_MESSAGES[@]}" | jq -s -c \
      --arg model "$model" \
      --argjson stream "$stream" \
      --argjson thinking "$thinking" \
      '{model: $model, messages: ., stream: $stream, thinking: $thinking}')"

  printf '%s\n' "$json_payload"
}

# Add Chat completion response to Message History
#
# Usage: ollama_chat -m <model>
# Input: 1 - model
# Output: none
# Env: OBL_MESSAGES
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_chat_json() {
    local usage='Usage: ollama_chat_json -m <model> [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Request a chat completion from a model, receiving JSON output.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends the entire message history ('OBL_MESSAGES') to the specified model and returns the model's response as a raw JSON object.
It serves as the foundation for 'ollama_chat_stream', which provides more user-friendly text-based outputs.
If 'OBL_STREAM' is 0, it adds the assistant's response to the message history.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG model
    while getopts ":m:hv" opt; do
        case $opt in
            m) model=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_chat_json version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if ! _exists 'jq'; then _error 'ollama_chat_json: jq Not Found'; return 1; fi

    if [ -z "$model" ]; then
        model="$(_is_valid_model "")"
        if [ -z "$model" ]; then
            printf 'Error: -m <model> is required\n\n' >&2
            printf '%s\n' "$usage" >&2
            return 2
        fi
    fi
    _debug "ollama_chat_json: model: [${model:0:120}]"

    local json_payload
    json_payload="$(_ollama_chat_payload "$model")"
    _debug "ollama_chat_json: json_payload: [${json_payload:0:120}]"

    if [[ "$OBL_STREAM" -eq 1 ]]; then
        _ollama_chat_stream_true "$json_payload"
    else
        _ollama_chat_stream_false "$json_payload"
    fi
}

# Chat completion request as text
#
# Usage: ollama_chat "model"
# Input: 1 - model
# Output: text, to stdout
# Requires: curl, jq
# Returns: 0 on success, 1 on error
ollama_chat() {
    local usage='Usage: ollama_chat -m <model> [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Request a chat completion from a model, receiving a plain text response.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function is a user-friendly wrapper around \'ollama_chat_json\'.
It handles the JSON parsing and returns only the content of the model\'s message as a single string.
It is ideal for simple, non-streaming chat interactions.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG model
    while getopts ":m:hv" opt; do
        case $opt in
            m) model=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_chat version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if ! _exists 'jq'; then _error 'ollama_chat: jq Not Found'; return 1; fi

    if [ -z "$model" ]; then
        model="$(_is_valid_model "")"
        if [ -z "$model" ]; then
            printf 'Error: -m <model> is required\n\n' >&2
            printf '%s\n' "$usage" >&2
            return 2
        fi
    fi
    _debug "ollama_chat: model: [${model:0:120}]"

    OBL_STREAM=0

    ollama_chat_json -m "$model" # set assistant response into message history

    local response
    response="$(ollama_messages_last)"

    if [[ -z "$response" ]]; then
        _error 'ollama_chat: ollama_chat_json response empty'
        return 1
    fi

    printf '%s\n' "$response"
    _debug 'ollama_chat: success'
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
    local usage='Usage: ollama_chat_stream -m <model> [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Request a chat completion from a model, receiving a stream of text.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls \'ollama_chat\' with streaming enabled and processes the output to provide a continuous stream of text from the model\'s response.
It is perfect for interactive chat applications where you want to display the response as it is being generated.
The assistant\'s response is NOT added to the message history.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG model
    while getopts ":m:hv" opt; do
        case $opt in
            m) model=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_chat_stream version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if ! _exists 'jq'; then _error 'ollama_chat_stream: jq Not Found'; return 1; fi

    if [ -z "$model" ]; then
        model="$(_is_valid_model "")"
        if [ -z "$model" ]; then
            printf 'Error: -m <model> is required\n\n' >&2
            printf '%s\n' "$usage" >&2
            return 2
        fi
    fi
    _debug "ollama_chat_stream: model: [${model:0:120}]"

    OBL_STREAM=1
    (
        ollama_chat_json -m "$model" | while IFS= read -r line; do
            if ! _is_valid_json "$line"; then continue; fi
            if [[ "$OBL_THINKING" == 'on' ]]; then
                printf '%s' "$(jq -r '.thinking // empty' <<<"$line")" >&2
            fi
            read -r -d '' content < <(jq -r '.message.content // empty' <<<"$line")
            printf '%s' "$content"
        done
        exit "${PIPESTATUS[0]}"
    ) 2> >( _ollama_thinking_stream )
    local error_code=$?
    OBL_STREAM=0
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
    local usage='Usage: ollama_chat_stream_json -m <model> [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Request a chat completion from a model, receiving a stream of JSON objects.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function enables streaming and calls \'ollama_chat\' to get a raw stream of JSON objects from the model.
It is the basis for the \'ollama_chat_stream\' function, which turns the JSON stream into a more human-readable text stream.
The assistant\'s response is NOT added to the message history.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG model
    while getopts ":m:hv" opt; do
        case $opt in
            m) model=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_chat_stream_json version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [ -z "$model" ]; then
        model="$(_is_valid_model "")"
        if [ -z "$model" ]; then
            printf 'Error: -m <model> is required\n\n' >&2
            printf '%s\n' "$usage" >&2
            return 2
        fi
    fi
    _debug "ollama_chat_stream_json: model: [${model:0:120}]"

    OBL_STREAM=1
    if ! ollama_chat_json -m "$model"; then
        _error 'ollama_chat_stream_json: ollama_chat_json failed'
        OBL_STREAM=0
        return 1
    fi
    OBL_STREAM=0
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
    local usage='Usage: ollama_list [-h] [-v]'
    local description
    description=$(cat <<'EOF'
List all available models in a human-readable format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses 'ollama list' to display a formatted table of all locally available models.
It is a convenient way to quickly see the models you have installed.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_list version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_list: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

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
    local usage='Usage: ollama_list_json [-h] [-v]'
    local description
    description=$(cat <<'EOF'
List all available models in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API for the list of available models and returns the raw JSON response.
This is useful for programmatic access to model information, allowing for easy parsing and manipulation with 'jq'.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_list_json version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_list_json: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    _debug 'ollama_list_json'
    if ! ollama_api_get -P '/api/tags'; then
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
    local usage='Usage: ollama_list_array [-h] [-v]'
    local description
    description=$(cat <<'EOF'
List all available models as a Bash array.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function retrieves the list of models and formats them as a space-separated string, suitable for loading directly into a Bash array.
Example:
  models=($(ollama_list_array))
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_list_array version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_list_array: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

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
  #_debug "_is_valid_model: VALID: [${model:0:120}]"
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
    local usage='Usage: ollama_model_random [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Get the name of a randomly selected model.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function selects a model at random from the list of locally available models.
It is useful when you want to use any available model without specifying one, for example, in testing or for creative applications.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_model_random version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_model_random: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

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
        printf '%s\n' "$models" | awk 'BEGIN{srand()} {a[NR]=$0} END{if(NR>0) print a[int(rand()*NR)+1]}'
    fi
}

# Unload a model from memory
#
# Usage: ollama_model_unload -m <model>
# Input: 1 - Model name to unload
# Output: unload result, in json, to stdout
# Requires: ollama, curl, jq
# Returns: 0 on success, 1 on error
ollama_model_unload() {
    local usage='Usage: ollama_model_unload -m <model> [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Unload a model from memory.

  -m <model>  Name of the model to unload (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function frees up system resources by unloading a specified model from memory.
This is useful for managing memory usage, especially on systems with limited resources.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG model
    while getopts ":m:hv" opt; do
        case $opt in
            m) model=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_model_unload version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if ! _exists 'jq'; then _error 'ollama_model_unload: jq Not Found'; return 1; fi

    if [[ -z "$model" ]]; then
        printf 'Error: -m <model> is required\n\n' >&2
        printf '%s\n' "$usage" >&2
        return 2
    fi

    local json_payload
    json_payload="$(jq -c -n \
        --arg model "$model" \
        --arg prompt "" \
        --arg keep_alive "0" \
        '{model: $model, prompt: $prompt, keep_alive: $keep_alive}')"
    local result
    if ! result="$(ollama_api_post -P '/api/generate' -d "$json_payload")"; then
        _error "ollama_model_unload: ollama_api_post failed [$result]"
        return 1
    fi
    local is_error
    is_error="$(printf '%s' "$result" | jq -r .error)"
    if [[ -n "$is_error" && "$is_error" != "null" ]]; then
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
    local usage='Usage: ollama_ps [-h] [-v]'
    local description
    description=$(cat <<'EOF'
List running model processes in a human-readable format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses 'ollama ps' to display a table of all models currently running in memory.
It is a quick way to check which models are active and consuming resources.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_ps version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_ps: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi
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
    local usage='Usage: ollama_ps_json [-h] [-v]'
    local description
    description=$(cat <<'EOF'
List running model processes in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API to get a list of running models and returns the raw JSON response.
This is useful for programmatic monitoring and management of running models.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_ps_json version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_ps_json: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi
    _debug 'ollama_ps_json'
    if ! ollama_api_get -P '/api/ps'; then
        _error 'ollama_ps_json: ollama_api_get failed'
        return 1
    fi
    return 0
}

# Show Functions

# Show model information, CLI version
#
# Usage: ollama_show -m <model>
# Output: text, to stdout
# Requires: ollama
# Returns: 0 on success, 1 on error
ollama_show() {
    local usage='Usage: ollama_show -m <model> [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Show detailed information about a model in a human-readable format.

  -m <model>  Name of the model to show (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses 'ollama show' to display details about a specified model, including its parameters, template, and more.
It is useful for inspecting the configuration of a model.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG model
    while getopts ":m:hv" opt; do
        case $opt in
            m) model=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_show version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if ! ollama_app_installed; then _error 'ollama_show: ollama is not installed'; return 1; fi

    if [[ -z "$model" ]]; then
        printf 'Error: -m <model> is required\n\n' >&2
        printf '%s\n' "$usage" >&2
        return 2
    fi

    if ! ollama show "$model"; then
        _error 'ollama_show: ollama show failed'
        return 1
    fi
    return 0
}

# Show model information, JSON version
#
# Usage: ollama_show_json -m <model>
# Input: 1 - The model to show
# Output: json, to stdout
# Requires: ollama, curl, jq
# Returns: 0 on success, 1 on error
ollama_show_json() {
    local usage='Usage: ollama_show_json -m <model> [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Show detailed information about a model in JSON format.

  -m <model>  Name of the model to show (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API to get detailed information about a specific model and returns the raw JSON response.
This is ideal for programmatic access to model details, allowing for automated configuration checks or modifications.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG model
    while getopts ":m:hv" opt; do
        case $opt in
            m) model=$OPTARG ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_show_json version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if ! _exists 'jq'; then _error 'ollama_show_json: jq Not Found'; return 1; fi

    if [[ -z "$model" ]]; then
        printf 'Error: -m <model> is required\n\n' >&2
        printf '%s\n' "$usage" >&2
        return 2
    fi

    _debug "ollama_show_json: [${model:0:42}]"
    local json_payload
    json_payload="$(jq -c -n \
        --arg model "$model" \
        '{model: $model}')"
    if ! ollama_api_post -P '/api/show' -d "$json_payload"; then
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
    local usage='Usage: ollama_app_installed [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Check if the Ollama application is installed on the local system.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the \'command -v\' utility to determine if the \'ollama\' executable is in the system\'s PATH.
It is useful for pre-flight checks in scripts to ensure that required dependencies are available.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_app_installed version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_app_installed: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    #_debug 'ollama_app_installed'
    _exists "ollama"
}

# Turbo Mode on/off
#
# Usage: ollama_app_turbo -m <mode> [-e]
# Input: 1 - The mode: empty, "on" or "off", default to "on"
# Output: if OBL_TURBO_KEY is not set, then prompts user to enter key
# Requires: a valid API key from ollama.com
# Returns: 0 on success, 1 on error
ollama_app_turbo() {
    local usage='Usage: ollama_app_turbo -m <on|off> [-e] [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Enable or disable Turbo Mode.

  -m <on|off> Enable or disable Turbo Mode.
  -e          Export the API key to the environment.
  -h          Show this help and exit.
  -v          Show version information and exit.

Turbo Mode configures the library to use the Ollama.com API, which may provide faster responses.
This requires an API key, which the function will prompt for if not already set.
Use 'off' to revert to using the local Ollama instance.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG export_key mode
    export_key=false # default to not exporting the key
    while getopts ":m:ehv" opt; do
        case $opt in
            m) mode=$OPTARG ;;
            e) export_key=true ;;
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_app_turbo version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
            :)  printf 'Error: -%s requires an argument\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    _debug "ollama_app_turbo: export_key: $export_key"
    _debug "ollama_app_turbo: mode: $mode"

    local host_api

    case "$mode" in
        on)
            _debug 'ollama_app_turbo: Turning Turbo Mode ON'
            local api_key="$OBL_TURBO_KEY"
            if [[ -z "$api_key" ]]; then
                echo -n 'Enter Ollama API Key (input hidden): '
                read -r -s api_key
                echo
            fi
            if [[ -z "$api_key" ]]; then
                _error 'ollama_app_turbo: Ollama API Key empty'
                return 1
            fi
            OBL_TURBO_KEY="$api_key"
            if $export_key; then
                _debug 'ollama_app_turbo: export OBL_TURBO_KEY'
                export OBL_TURBO_KEY="$OBL_TURBO_KEY"
            else
                _debug 'ollama_app_turbo: NO EXPORT of OBL_TURBO_KEY'
            fi
            host_api='https://ollama.com'
            ;;
        off)
            _debug 'ollama_app_turbo: unset OBL_TURBO_KEY'
            unset OBL_TURBO_KEY
            host_api='http://localhost:11434'
            ;;
        *)
            _error 'ollama_app_turbo: Unknown mode'
            printf '%s\n' "$usage" >&2
            return 1
            ;;
    esac

    _debug "ollama_app_turbo: OBL_TURBO_KEY: $([[ -n ${OBL_TURBO_KEY+x} && -n "$OBL_TURBO_KEY" ]] && echo YES || echo NO)"
    host_api="${host_api%%/}"
    if ! _is_valid_url "$host_api"; then
        _error "ollama_app_turbo: Invalid host API URL: $host_api"
        return 1
    fi
    _debug "ollama_app_turbo: export OLLAMA_HOST=$host_api"
    export OLLAMA_HOST="$host_api"
    _debug "ollama_app_turbo: export OBL_API=$host_api"
    export OBL_API="$host_api"
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
    local usage='Usage: ollama_app_vars [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Display Ollama-related environment variables.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function prints a list of environment variables that can be used to configure the behavior of the Ollama application.
It is a helpful reference for understanding the available settings and their current values.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_app_vars version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_app_vars: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

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
    local usage='Usage: ollama_app_version [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Get the version of the Ollama application as plain text.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API for its version and returns just the version string.
It provides a simple way to check the installed Ollama version.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_app_version version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_app_version: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    if ! _exists 'jq'; then _error 'ollama_app_version: jq Not Found'; return 1; fi
    if ! ollama_api_get -P '/api/version' | jq -r ".version"; then
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
    local usage='Usage: ollama_app_version_json [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Get the version of the Ollama application in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API and returns the raw JSON response containing the version information.
This is useful for programmatic version checking and comparison.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_app_version_json version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_app_version_json: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    _debug 'ollama_app_version_json'
    if ! ollama_api_get -P '/api/version'; then
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
    local usage='Usage: ollama_app_version_cli [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Get the version of the installed Ollama application

  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls 'ollama --version' to get the version information directly from the command-line application.
This can be useful for verifying the ollama core cli is installed and working correctly.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_app_version_cli version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_app_version_cli: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

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
    local usage='Usage: ollama_thinking [on|off|hide] [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Configure the 'thinking' mode for model responses.

  on|off|hide Set the thinking mode.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sets the \'OBL_THINKING\' environment variable, which controls whether the model\'s \'thinking\' process is displayed.
Modes:
- on: Show thinking output.
- off: Hide thinking output.
- hide: Do not show thinking output, but it is still available in the JSON.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_thinking version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    local mode="${1:-}"
    _debug "ollama_thinking: [${mode}:0:42}]"
    case "$mode" in
        on|ON)
            export OBL_THINKING="on"
            ;;
        off|OFF)
            export OBL_THINKING="off"
            ;;
        hide|HIDE)
            export OBL_THINKING="hide"
            ;;
        '')
            printf 'thinking is %s\n' "$OBL_THINKING"
            ;;
        *)
            _error 'ollama_thinking: Unknown mode.'
            printf '%s\n' "$usage" >&2
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
    local usage='Usage: ollama_lib_about [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Display information about the Ollama Bash Lib.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function shows details about the library, including its name, version, URL, and other relevant information.
It also lists all the available 'ollama_*' functions for easy reference.
EOF
)
    OPTIND=1 # start parsing at $1 again
    local opt OPTARG
    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_lib_about version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_lib_about: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    printf 'A Bash Library to interact with Ollama\n\n'
    local turbo_key_status="NO"
    if [[ -n "${OBL_TURBO_KEY}" ]]; then
        turbo_key_status="YES [REDACTED]"
    fi
    printf '%-20s : %s\n' "OBL_NAME" "$OBL_NAME"
    printf '%-20s : %s\n' "OBL_VERSION" "$OBL_VERSION"
    printf '%-20s : %s\n' "OBL_URL" "$OBL_URL"
    printf '%-20s : %s\n' "OBL_DISCORD" "$OBL_DISCORD"
    printf '%-20s : %s\n' "OBL_LICENSE" "$OBL_LICENSE"
    printf '%-20s : %s\n' "OBL_COPYRIGHT" "$OBL_COPYRIGHT"
    printf '%-20s : %s\n' "OBL_API" "$OBL_API"
    printf '%-20s : %s\n' "OBL_DEBUG" "$OBL_DEBUG"
    printf '%-20s : %s\n' "OBL_STREAM" "$OBL_STREAM"
    printf '%-20s : %s\n' "OBL_THINKING" "$OBL_THINKING"
    printf '%-20s : %s\n' "OBL_MESSAGES" "${#OBL_MESSAGES[@]} messages"
    printf '%-20s : %s\n' "OBL_TURBO_KEY" "$turbo_key_status"
    printf '%-20s : %s\n' "OBL_TIMEOUT" "$OBL_TIMEOUT seconds"
    if ! _exists 'compgen'; then _debug 'ollama_lib_about: compgen Not Found'; return 0; fi
    printf '\nFunctions:\n\n'
    if ! _exists 'column'; then
        _debug 'ollama_lib_about: column Not Found'
        compgen -A function -X '!*ollama*' | sort
        return 0
    fi
    compgen -A function -X '!*ollama*' | sort | column
}

# Ollama Bash Lib version
#
# Usage: ollama_lib_version
# Input: none
# Output: semantic version number, to stdout
# Requires: none
# Returns: 0
ollama_lib_version() {
    local usage='Usage: ollama_lib_version [-h] [-v]'
    local description
    description=$(cat <<'EOF'
Get the version of the Ollama Bash Lib.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current version number of the library as defined in the 'OBL_VERSION' variable.
It is useful for checking the library version for compatibility or debugging purposes.
EOF
)

    while getopts ":hv" opt; do
        case $opt in
            h) printf '%s\n\n%s\n' "$usage" "$description"; return 0 ;;
            v) printf 'ollama_lib_version version %s\n' "$OBL_VERSION"; return 0 ;;
            \?) printf 'Error: unknown option -%s\n\n' "$OPTARG" >&2
                printf '%s\n' "$usage" >&2; return 2 ;;
        esac
    done
    shift $((OPTIND-1))

    if [[ $# -gt 0 ]]; then
        _error "ollama_lib_version: Unknown argument(s): $*"
        printf '%s\n' "$usage" >&2
        return 1
    fi

    printf '%s\n' "$OBL_VERSION"
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
omclear()  { ollama_messages_clear "$@"; }
omco() { ollama_messages_count "$@"; }

omr()  { ollama_model_random "$@"; }
omu()  { ollama_model_unload "$@"; }

op()   { ollama_ps "$@"; }
opj()  { ollama_ps_json "$@"; }

os()   { ollama_show "$@"; }
osj()  { ollama_show_json "$@"; }

ot()   { ollama_thinking "$@"; }

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
