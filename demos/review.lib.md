# Code Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.2

## Review


```bash
prompt="Act as an expert Software Engineer.
Do a full Code Review of this script:

$(cat "../ollama_bash_lib.sh")"
ollama_generate "gemma3n:e4b" "$prompt"
```
```
This is a comprehensive and well-structured Bash library for interacting with the Ollama API. Here's a breakdown of the code, its functionality, and some potential improvements:

**Overall Structure and Organization**

*   **Modular Design:** The code is well-organized into functions, each performing a specific task. This makes it easy to understand, maintain, and reuse.
*   **Clear Comments:**  Comments explain the purpose of each function, its arguments, and its return values.
*   **Error Handling:**  The code includes error handling for API calls and missing dependencies (like `compgen`).  It uses `error` to signal failures.
*   **Configuration:**  Uses environment variables (e.g., `OLLAMA_LIB_NAME`, `OLLAMA_LIB_VERSION`) to configure the library, making it adaptable.
*   **Utility Functions:** Includes useful utility functions like `estimate_tokens` and `ollama_lib_about`.

**Function Breakdown**

1.  **`estimate_tokens(string [verbose: 1])`**:
    *   **Purpose:** Estimates the number of tokens in a given string.
    *   **Input:**
        *   `string`: The text to estimate tokens for. Can be a filename, a string argument, or piped input.
        *   `verbose`: (Optional)  If set to 1, provides a more detailed breakdown of the token estimation process (min/max token range).
    *   **Logic:**
        *   Handles input from a file, a string, or piped input.
        *   Calculates token estimates based on word, character, and byte counts.
        *   Provides a range of estimated tokens if `verbose` is enabled.
    *   **Improvements:**
        *   Consider using a more sophisticated tokenization library if accuracy is critical.  The current method is a simple approximation.
        *   Add more error handling for invalid input.

2.  **`ollama_lib_about()`**:
    *   **Purpose:** Displays information about the Ollama Bash library.
    *   **Output:** Prints the library's name, version, URL, license, copyright, and a list of available functions.
    *   **Improvements:**
        *   Could include more detailed information about the library's dependencies and usage.
        *   Consider using a more structured format (e.g., using `echo -e` for better formatting).

3.  **`ollama_lib_version()`**:
    *   **Purpose:** Returns the version number of the Ollama Bash library.
    *   **Output:** Prints the version number to standard output.
    *   **Improvements:**
        *   None.  It's already concise and effective.

4.  **`ollama_version()`**:
    *   **Purpose:** Returns the version of the Ollama application itself.
    *   **Output:** Prints the version number to standard output.
    *   **Improvements:**
        *   None.

5.  **`ollama_version_cli()`**:
    *   **Purpose:** Returns the version of the Ollama application using the `ollama --version` command.
    *   **Output:** Prints the version number to standard output.
    *   **Improvements:**
        *   None.

6.  **`ollama_lib_name`, `ollama_lib_version`, `ollama_lib_url`, `ollama_lib_license`, `ollama_lib_copyright`, `ollama_lib_debug`, `ollama_lib_api`, `ollama_lib_stream`, `ollama_lib_messages`**:
    *   **Purpose:** These are essentially configuration variables that define the library's metadata.
    *   **Improvements:**
        *   Consider using a more structured way to store this information, such as a separate configuration file (e.g., a JSON or YAML file).  This would make it easier to manage and update the library's metadata.

7.  **`ollama_lib_about`**:
    *   **Purpose:** Provides information about the library itself.
    *   **Improvements:**
        *   Could be enhanced to include links to documentation, issue trackers, or other relevant resources.

**Potential Improvements and Considerations**

*   **Input Validation:** Add more robust input validation to functions like `estimate_tokens` to handle invalid input gracefully.
*   **Error Handling:**  While there's error handling for API calls, consider adding more specific error handling for other potential issues (e.g., file not found, invalid arguments).
*   **Documentation:**  Generate documentation using a tool like `Sphinx` or `Doxygen` to make the library easier to use.
*   **Testing:**  Write unit tests to ensure the library functions are working correctly.
*   **Asynchronous Operations:**  For long-running operations (e.g., downloading models), consider using asynchronous operations to avoid blocking the main thread.
*   **Configuration Management:**  As mentioned earlier, using a separate configuration file (e.g., JSON or YAML) would make it easier to manage the library's metadata.
*   **Code Style:**  Ensure consistent code style (e.g., using a linter like `shellcheck`) to improve readability and maintainability.
*   **Security:** If the library interacts with external resources (e.g., APIs), be sure to follow security best practices to prevent vulnerabilities.

**Example Usage**

```bash
# Get the version of the Ollama application
ollama_version

# Estimate the number of tokens in a file
estimate_tokens my_text_file.txt

# Estimate the number of tokens in a string with verbose output
estimate_tokens "This is a test string" 1

# Display information about the library
ollama_lib_about

# Display the version of the library
ollama_lib_version
```

**In summary, this is a well-written and useful Bash library.  By incorporating the suggested improvements, you can make it even more robust, maintainable, and user-friendly.**
```

## Review Debug


```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gemma3n:e4b" "$prompt"
```
```
[DEBUG] ollama_generate: [gemma3n:e4b] [Act as an expert Software Engineer.
Do a full code review of this bash script:

#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_LIB_NAME="Ollama Bash Lib"
OLLAMA_LIB_VERSION="0.39.2"
OLLAMA_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_LIB_LICENSE="MIT"
OLLAMA_LIB_COPYRIGHT="Copyright (c) 2025 Attogram Project <https://github.com/attogram>"

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
  return $?
}

# Error message
#
# Usage: error "message"
# Input: 1 - the error message
# Output: message to stderr
# Returns: 0 on success, 1 on error
error() {
  >&2 echo -e "[ERROR] $1"
  # shellcheck disable=SC2320
  return $?
}

# Escape a string for use as a JSON value
#
# Usage: json_safe_value "string"
# Input: 1 - The string to escape
# Output: "quoted safe json value" to stdout
# Returns: 0 on success, 1 on jq error
json_safe_value() {
  debug "json_safe_value: $(echo "$1" | wc -c | sed 's/ //g') bytes [$1]"
  local error_jq
  jq -Rn --arg str "$1" '$str'
  error_jq=$?
  if [ "$error_jq" -gt 0 ]; then
    error "json_safe_value: error_jq: $error_jq"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Sanitize a string for jq use
#
# Usage: jq_sanitize "string"
# Input: 1 - The string to sanitize
# Output: sanitized string to stdout
# Returns: 0 on success, 1 on error
jq_sanitize() {
  debug "jq_sanitize: $(echo "$1" | wc -c | sed 's/ //g') bytes [$1]"
  local sanitized
  sanitized="$1"
  # Replace carriage returns (CR, ASCII 13) with literal 
  sanitized=$(printf '%s' "$1" | sed $'s//\\r/g')
  # Replace newlines (LF, ASCII 10) with literal 
 using awk, then strip final literal 

  sanitized=$(printf '%s' "$sanitized" | awk '{ ORS="\n"; print }' | sed 's/\n$//')
  # Remove all control chars 0-9, 11-12, 14-31
  sanitized=$(printf '%s' "$sanitized" | tr -d '-	-')
  printf '%s
' "$sanitized"
  debug "jq_sanitized: sanitized: [$sanitized]"
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
  local result error_curl
  curl -s -X GET "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json'
  error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $RETURN_ERROR
  fi
  debug "ollama_api_get: return 0"
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
  debug "ollama_api_post: [$1] [$2]"
  local result error_curl
  curl -s -X POST "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json' -d "$2"
  error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $RETURN_ERROR
  fi
  debug "ollama_api_post: return 0"
  return $RETURN_SUCCESS
}

# Ping the Ollama API
#
# Usage: ollama_api_ping
# Input: none
# Output: none
# Returns: 0 if API is reachable, 1 if API is not reachable
ollama_api_ping() {
  debug "ollama_api_ping"
  local result api_get_error
  result=$(ollama_api_get "")
  api_get_error=$?
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
  debug "ollama_generate_json: [$1] [$2]"
  debug "ollama_generate_json: OLLAMA_LIB_STREAM: $OLLAMA_LIB_STREAM"
  local json error_ollama_api_post
  json="{\"model\":$(json_safe_value "$1"),\"prompt\":$(json_safe_value "$2")"
  if [ "$OLLAMA_LIB_STREAM" -eq "0" ]; then
    json+=",\"stream\":false"
  fi
  json+="}"
  ollama_api_post "/api/generate" "$json"
  error_ollama_api_post=$?
  if [ "$error_ollama_api_post" -gt 0 ]; then
    error "ollama_generate_json: error_ollama_api_post: $error_ollama_api_post"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_json: return: 0"
  return $RETURN_SUCCESS
}

# Generate a completion, as streaming json
#
# Usage: ollama_generate_stream_json "model" "prompt"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream_json() {
  debug "ollama_generate_stream_json: [$1] [$2]"
  local json response error_ollama_generate_json
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  ollama_generate_json "$1" "$2"
  error_ollama_generate_json=$?
  echo # needed?
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate_stream_json: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_stream_json: return: 0"
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
  debug "ollama_generate: [$1] [$2]"
  local json result error_ollama_generate_json error_jq
  OLLAMA_LIB_STREAM=0
  result=$(ollama_generate_json "$1" "$2")
  error_ollama_generate_json=$?
  debug "ollama_generate: result: $(echo "$result" | wc -c | sed 's/ //g') bytes"
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  jq_sanitize "$result" | jq -r ".response"
  error_jq=$?
  if [ "$error_jq" -gt 0 ]; then
    error "ollama_generate: error_jq: $error_jq [$response]"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_stream_json: return: 0"
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
  local line error_ollama_generate_json error_jq
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  ollama_generate_json "$1" "$2" | while IFS= read -r line; do
    echo -n "$(jq_sanitize "$line" | jq -r ".response")"
    error_jq=$?
    if [ "$error_jq" -gt 0 ]; then
      error "ollama_generate_stream: error_jq: $error_jq"
      return $RETURN_ERROR
    fi
  done
  error_ollama_generate_json=$?
  echo # needed?
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
  printf '%s
' "${OLLAMA_LIB_MESSAGES[@]}"
  return $RETURN_SUCCESS
}

# Add a message
#
# Usage: ollama_message_add "role" "message"
# Output: none
# Returns: 0 on success, 1 on error
ollama_messages_add() {
  debug "ollama_messages_add: [$1]"
  local role message
  role="$1"
  message="$2"
  OLLAMA_LIB_MESSAGES+=("{\"role\":$(json_safe_value "$role"),\"content\":$(json_safe_value "$message")}")
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
  local model json result error_post error_jq_message_content

  model="$1"
  if [ -z "$model" ]; then
    error "ollama_chat_json: Model Not Found. Usage: ollama_chat_json \"model\""
    return $RETURN_ERROR
  fi

  # TODO - use jq to build json? better/easier array handling
  json="{\"model\":$(json_safe_value "$model"),\"messages\":["
  json+=$(printf "%s," "${OLLAMA_LIB_MESSAGES[@]}")
  json="$(echo "$json" | sed 's/,*$//g')" # strip last slash
  json+="]"
  if [ "$OLLAMA_LIB_STREAM" -eq 0 ]; then
    json+=",\"stream\":false"
  fi
  json+="}"

  result=$(ollama_api_post "/api/chat" "$json")
  error_post=$?
  if [ "$error_post" -gt 0 ]; then
    error "ollama_chat_json: error_post: $error_post"
    return $RETURN_ERROR
  fi

  content=$(jq_sanitize "$result" | jq -r ".message.content")
  error_jq_message_content=$?
  debug "ollama_chat_json: content: $content"
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
  local model content error_jq_message_content
  model="$1"
  if [ -z "$model" ]; then
    error "ollama_chat: Model Not Found. Usage: ollama_chat \"model\""
    return $RETURN_ERROR
  fi
  OLLAMA_LIB_STREAM=0
  content=$(jq_sanitize "$(ollama_chat_json "$model")" | jq -r ".message.content")
  error_jq_message_content=$?
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
  local error_ollama_chat
  OLLAMA_LIB_STREAM=1
  ollama_chat "$1"
  error_ollama_chat=$?
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
  local error_ollama_json_chat
  OLLAMA_LIB_STREAM=1
  ollama_chat_json "$1"
  error_ollama_json_chat=$?
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
  local error_list
  ollama list
  error_list=$?
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
  local error_ollama_api_get
  ollama_api_get "/api/tags"
  error_ollama_api_get=$?
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
  local models error_list
  # Get list from ollama cli, skip first line (headers), get first column (names), sort alphabetically
  models=($(ollama list | awk '{if (NR > 1) print $1}' | sort))
  error_list=$?
  if [ "$error_list" -gt 0 ]; then
    error "ollama_list_array: error_list: $error_list"
    return $RETURN_ERROR
  fi
  echo "${models[@]}" # space separated list of model names
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
  local models
  models=($(ollama_list_array))
  if [ ${#models[@]} -eq 0 ]; then
    error "ollama_model_random: No Models Found"
    return $RETURN_ERROR
  fi
  RANDOM=$(date +%s%N) # seed random with unixtime + microseconds
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
  debug result error_unload
  if [ -z "$1" ]; then
    debug "Error: ollama_model_unload: no model"
    return $RETURN_ERROR
  fi
  local response result error_unload
  result=$(ollama_api_post "/api/generate" "{\"model\":$(json_safe_value "$1"),\"keep_alive\":0}")
  error_unload=$?
  if [ "$error_unload" -gt 0 ]; then
    error "ollama_model_unload: error_unload: $error_unload result: [$result]"
    return $RETURN_ERROR
  fi
  # TODO - if result is {"error":"reason"} then error "$reason"; return $RETURN_ERROR
  printf '%s
' "$result"
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
  ollama_api_post "/api/show" "{\"model\":$(json_safe_value "$1")}"
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
}]
[DEBUG] ollama_generate_json: [gemma3n:e4b] [Act as an expert Software Engineer.
Do a full code review of this bash script:

#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_LIB_NAME="Ollama Bash Lib"
OLLAMA_LIB_VERSION="0.39.2"
OLLAMA_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_LIB_LICENSE="MIT"
OLLAMA_LIB_COPYRIGHT="Copyright (c) 2025 Attogram Project <https://github.com/attogram>"

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
  return $?
}

# Error message
#
# Usage: error "message"
# Input: 1 - the error message
# Output: message to stderr
# Returns: 0 on success, 1 on error
error() {
  >&2 echo -e "[ERROR] $1"
  # shellcheck disable=SC2320
  return $?
}

# Escape a string for use as a JSON value
#
# Usage: json_safe_value "string"
# Input: 1 - The string to escape
# Output: "quoted safe json value" to stdout
# Returns: 0 on success, 1 on jq error
json_safe_value() {
  debug "json_safe_value: $(echo "$1" | wc -c | sed 's/ //g') bytes [$1]"
  local error_jq
  jq -Rn --arg str "$1" '$str'
  error_jq=$?
  if [ "$error_jq" -gt 0 ]; then
    error "json_safe_value: error_jq: $error_jq"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Sanitize a string for jq use
#
# Usage: jq_sanitize "string"
# Input: 1 - The string to sanitize
# Output: sanitized string to stdout
# Returns: 0 on success, 1 on error
jq_sanitize() {
  debug "jq_sanitize: $(echo "$1" | wc -c | sed 's/ //g') bytes [$1]"
  local sanitized
  sanitized="$1"
  # Replace carriage returns (CR, ASCII 13) with literal 
  sanitized=$(printf '%s' "$1" | sed $'s//\\r/g')
  # Replace newlines (LF, ASCII 10) with literal 
 using awk, then strip final literal 

  sanitized=$(printf '%s' "$sanitized" | awk '{ ORS="\n"; print }' | sed 's/\n$//')
  # Remove all control chars 0-9, 11-12, 14-31
  sanitized=$(printf '%s' "$sanitized" | tr -d '-	-')
  printf '%s
' "$sanitized"
  debug "jq_sanitized: sanitized: [$sanitized]"
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
  local result error_curl
  curl -s -X GET "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json'
  error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $RETURN_ERROR
  fi
  debug "ollama_api_get: return 0"
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
  debug "ollama_api_post: [$1] [$2]"
  local result error_curl
  curl -s -X POST "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json' -d "$2"
  error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $RETURN_ERROR
  fi
  debug "ollama_api_post: return 0"
  return $RETURN_SUCCESS
}

# Ping the Ollama API
#
# Usage: ollama_api_ping
# Input: none
# Output: none
# Returns: 0 if API is reachable, 1 if API is not reachable
ollama_api_ping() {
  debug "ollama_api_ping"
  local result api_get_error
  result=$(ollama_api_get "")
  api_get_error=$?
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
  debug "ollama_generate_json: [$1] [$2]"
  debug "ollama_generate_json: OLLAMA_LIB_STREAM: $OLLAMA_LIB_STREAM"
  local json error_ollama_api_post
  json="{\"model\":$(json_safe_value "$1"),\"prompt\":$(json_safe_value "$2")"
  if [ "$OLLAMA_LIB_STREAM" -eq "0" ]; then
    json+=",\"stream\":false"
  fi
  json+="}"
  ollama_api_post "/api/generate" "$json"
  error_ollama_api_post=$?
  if [ "$error_ollama_api_post" -gt 0 ]; then
    error "ollama_generate_json: error_ollama_api_post: $error_ollama_api_post"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_json: return: 0"
  return $RETURN_SUCCESS
}

# Generate a completion, as streaming json
#
# Usage: ollama_generate_stream_json "model" "prompt"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream_json() {
  debug "ollama_generate_stream_json: [$1] [$2]"
  local json response error_ollama_generate_json
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  ollama_generate_json "$1" "$2"
  error_ollama_generate_json=$?
  echo # needed?
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate_stream_json: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_stream_json: return: 0"
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
  debug "ollama_generate: [$1] [$2]"
  local json result error_ollama_generate_json error_jq
  OLLAMA_LIB_STREAM=0
  result=$(ollama_generate_json "$1" "$2")
  error_ollama_generate_json=$?
  debug "ollama_generate: result: $(echo "$result" | wc -c | sed 's/ //g') bytes"
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  jq_sanitize "$result" | jq -r ".response"
  error_jq=$?
  if [ "$error_jq" -gt 0 ]; then
    error "ollama_generate: error_jq: $error_jq [$response]"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_stream_json: return: 0"
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
  local line error_ollama_generate_json error_jq
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  ollama_generate_json "$1" "$2" | while IFS= read -r line; do
    echo -n "$(jq_sanitize "$line" | jq -r ".response")"
    error_jq=$?
    if [ "$error_jq" -gt 0 ]; then
      error "ollama_generate_stream: error_jq: $error_jq"
      return $RETURN_ERROR
    fi
  done
  error_ollama_generate_json=$?
  echo # needed?
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
  printf '%s
' "${OLLAMA_LIB_MESSAGES[@]}"
  return $RETURN_SUCCESS
}

# Add a message
#
# Usage: ollama_message_add "role" "message"
# Output: none
# Returns: 0 on success, 1 on error
ollama_messages_add() {
  debug "ollama_messages_add: [$1]"
  local role message
  role="$1"
  message="$2"
  OLLAMA_LIB_MESSAGES+=("{\"role\":$(json_safe_value "$role"),\"content\":$(json_safe_value "$message")}")
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
  local model json result error_post error_jq_message_content

  model="$1"
  if [ -z "$model" ]; then
    error "ollama_chat_json: Model Not Found. Usage: ollama_chat_json \"model\""
    return $RETURN_ERROR
  fi

  # TODO - use jq to build json? better/easier array handling
  json="{\"model\":$(json_safe_value "$model"),\"messages\":["
  json+=$(printf "%s," "${OLLAMA_LIB_MESSAGES[@]}")
  json="$(echo "$json" | sed 's/,*$//g')" # strip last slash
  json+="]"
  if [ "$OLLAMA_LIB_STREAM" -eq 0 ]; then
    json+=",\"stream\":false"
  fi
  json+="}"

  result=$(ollama_api_post "/api/chat" "$json")
  error_post=$?
  if [ "$error_post" -gt 0 ]; then
    error "ollama_chat_json: error_post: $error_post"
    return $RETURN_ERROR
  fi

  content=$(jq_sanitize "$result" | jq -r ".message.content")
  error_jq_message_content=$?
  debug "ollama_chat_json: content: $content"
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
  local model content error_jq_message_content
  model="$1"
  if [ -z "$model" ]; then
    error "ollama_chat: Model Not Found. Usage: ollama_chat \"model\""
    return $RETURN_ERROR
  fi
  OLLAMA_LIB_STREAM=0
  content=$(jq_sanitize "$(ollama_chat_json "$model")" | jq -r ".message.content")
  error_jq_message_content=$?
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
  local error_ollama_chat
  OLLAMA_LIB_STREAM=1
  ollama_chat "$1"
  error_ollama_chat=$?
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
  local error_ollama_json_chat
  OLLAMA_LIB_STREAM=1
  ollama_chat_json "$1"
  error_ollama_json_chat=$?
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
  local error_list
  ollama list
  error_list=$?
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
  local error_ollama_api_get
  ollama_api_get "/api/tags"
  error_ollama_api_get=$?
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
  local models error_list
  # Get list from ollama cli, skip first line (headers), get first column (names), sort alphabetically
  models=($(ollama list | awk '{if (NR > 1) print $1}' | sort))
  error_list=$?
  if [ "$error_list" -gt 0 ]; then
    error "ollama_list_array: error_list: $error_list"
    return $RETURN_ERROR
  fi
  echo "${models[@]}" # space separated list of model names
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
  local models
  models=($(ollama_list_array))
  if [ ${#models[@]} -eq 0 ]; then
    error "ollama_model_random: No Models Found"
    return $RETURN_ERROR
  fi
  RANDOM=$(date +%s%N) # seed random with unixtime + microseconds
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
  debug result error_unload
  if [ -z "$1" ]; then
    debug "Error: ollama_model_unload: no model"
    return $RETURN_ERROR
  fi
  local response result error_unload
  result=$(ollama_api_post "/api/generate" "{\"model\":$(json_safe_value "$1"),\"keep_alive\":0}")
  error_unload=$?
  if [ "$error_unload" -gt 0 ]; then
    error "ollama_model_unload: error_unload: $error_unload result: [$result]"
    return $RETURN_ERROR
  fi
  # TODO - if result is {"error":"reason"} then error "$reason"; return $RETURN_ERROR
  printf '%s
' "$result"
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
  ollama_api_post "/api/show" "{\"model\":$(json_safe_value "$1")}"
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
}]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 12 bytes [gemma3n:e4b]
[DEBUG] json_safe_value: 23446 bytes [Act as an expert Software Engineer.
Do a full code review of this bash script:

#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_LIB_NAME="Ollama Bash Lib"
OLLAMA_LIB_VERSION="0.39.2"
OLLAMA_LIB_URL="https://github.com/attogram/ollama-bash-lib"
OLLAMA_LIB_LICENSE="MIT"
OLLAMA_LIB_COPYRIGHT="Copyright (c) 2025 Attogram Project <https://github.com/attogram>"

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
  return $?
}

# Error message
#
# Usage: error "message"
# Input: 1 - the error message
# Output: message to stderr
# Returns: 0 on success, 1 on error
error() {
  >&2 echo -e "[ERROR] $1"
  # shellcheck disable=SC2320
  return $?
}

# Escape a string for use as a JSON value
#
# Usage: json_safe_value "string"
# Input: 1 - The string to escape
# Output: "quoted safe json value" to stdout
# Returns: 0 on success, 1 on jq error
json_safe_value() {
  debug "json_safe_value: $(echo "$1" | wc -c | sed 's/ //g') bytes [$1]"
  local error_jq
  jq -Rn --arg str "$1" '$str'
  error_jq=$?
  if [ "$error_jq" -gt 0 ]; then
    error "json_safe_value: error_jq: $error_jq"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Sanitize a string for jq use
#
# Usage: jq_sanitize "string"
# Input: 1 - The string to sanitize
# Output: sanitized string to stdout
# Returns: 0 on success, 1 on error
jq_sanitize() {
  debug "jq_sanitize: $(echo "$1" | wc -c | sed 's/ //g') bytes [$1]"
  local sanitized
  sanitized="$1"
  # Replace carriage returns (CR, ASCII 13) with literal 
  sanitized=$(printf '%s' "$1" | sed $'s//\\r/g')
  # Replace newlines (LF, ASCII 10) with literal 
 using awk, then strip final literal 

  sanitized=$(printf '%s' "$sanitized" | awk '{ ORS="\n"; print }' | sed 's/\n$//')
  # Remove all control chars 0-9, 11-12, 14-31
  sanitized=$(printf '%s' "$sanitized" | tr -d '-	-')
  printf '%s
' "$sanitized"
  debug "jq_sanitized: sanitized: [$sanitized]"
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
  local result error_curl
  curl -s -X GET "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json'
  error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $RETURN_ERROR
  fi
  debug "ollama_api_get: return 0"
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
  debug "ollama_api_post: [$1] [$2]"
  local result error_curl
  curl -s -X POST "${OLLAMA_LIB_API}$1" -H 'Content-Type: application/json' -d "$2"
  error_curl=$?
  if [ "$error_curl" -gt 0 ]; then
    error "ollama_api_get: error_curl: $error_curl"
    return $RETURN_ERROR
  fi
  debug "ollama_api_post: return 0"
  return $RETURN_SUCCESS
}

# Ping the Ollama API
#
# Usage: ollama_api_ping
# Input: none
# Output: none
# Returns: 0 if API is reachable, 1 if API is not reachable
ollama_api_ping() {
  debug "ollama_api_ping"
  local result api_get_error
  result=$(ollama_api_get "")
  api_get_error=$?
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
  debug "ollama_generate_json: [$1] [$2]"
  debug "ollama_generate_json: OLLAMA_LIB_STREAM: $OLLAMA_LIB_STREAM"
  local json error_ollama_api_post
  json="{\"model\":$(json_safe_value "$1"),\"prompt\":$(json_safe_value "$2")"
  if [ "$OLLAMA_LIB_STREAM" -eq "0" ]; then
    json+=",\"stream\":false"
  fi
  json+="}"
  ollama_api_post "/api/generate" "$json"
  error_ollama_api_post=$?
  if [ "$error_ollama_api_post" -gt 0 ]; then
    error "ollama_generate_json: error_ollama_api_post: $error_ollama_api_post"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_json: return: 0"
  return $RETURN_SUCCESS
}

# Generate a completion, as streaming json
#
# Usage: ollama_generate_stream_json "model" "prompt"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream_json() {
  debug "ollama_generate_stream_json: [$1] [$2]"
  local json response error_ollama_generate_json
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  ollama_generate_json "$1" "$2"
  error_ollama_generate_json=$?
  echo # needed?
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate_stream_json: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_stream_json: return: 0"
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
  debug "ollama_generate: [$1] [$2]"
  local json result error_ollama_generate_json error_jq
  OLLAMA_LIB_STREAM=0
  result=$(ollama_generate_json "$1" "$2")
  error_ollama_generate_json=$?
  debug "ollama_generate: result: $(echo "$result" | wc -c | sed 's/ //g') bytes"
  if [ "$error_ollama_generate_json" -gt 0 ]; then
    error "ollama_generate: error_ollama_generate_json: $error_ollama_generate_json"
    return $RETURN_ERROR
  fi
  jq_sanitize "$result" | jq -r ".response"
  error_jq=$?
  if [ "$error_jq" -gt 0 ]; then
    error "ollama_generate: error_jq: $error_jq [$response]"
    return $RETURN_ERROR
  fi
  debug "ollama_generate_stream_json: return: 0"
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
  local line error_ollama_generate_json error_jq
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  ollama_generate_json "$1" "$2" | while IFS= read -r line; do
    echo -n "$(jq_sanitize "$line" | jq -r ".response")"
    error_jq=$?
    if [ "$error_jq" -gt 0 ]; then
      error "ollama_generate_stream: error_jq: $error_jq"
      return $RETURN_ERROR
    fi
  done
  error_ollama_generate_json=$?
  echo # needed?
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
  printf '%s
' "${OLLAMA_LIB_MESSAGES[@]}"
  return $RETURN_SUCCESS
}

# Add a message
#
# Usage: ollama_message_add "role" "message"
# Output: none
# Returns: 0 on success, 1 on error
ollama_messages_add() {
  debug "ollama_messages_add: [$1]"
  local role message
  role="$1"
  message="$2"
  OLLAMA_LIB_MESSAGES+=("{\"role\":$(json_safe_value "$role"),\"content\":$(json_safe_value "$message")}")
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
  local model json result error_post error_jq_message_content

  model="$1"
  if [ -z "$model" ]; then
    error "ollama_chat_json: Model Not Found. Usage: ollama_chat_json \"model\""
    return $RETURN_ERROR
  fi

  # TODO - use jq to build json? better/easier array handling
  json="{\"model\":$(json_safe_value "$model"),\"messages\":["
  json+=$(printf "%s," "${OLLAMA_LIB_MESSAGES[@]}")
  json="$(echo "$json" | sed 's/,*$//g')" # strip last slash
  json+="]"
  if [ "$OLLAMA_LIB_STREAM" -eq 0 ]; then
    json+=",\"stream\":false"
  fi
  json+="}"

  result=$(ollama_api_post "/api/chat" "$json")
  error_post=$?
  if [ "$error_post" -gt 0 ]; then
    error "ollama_chat_json: error_post: $error_post"
    return $RETURN_ERROR
  fi

  content=$(jq_sanitize "$result" | jq -r ".message.content")
  error_jq_message_content=$?
  debug "ollama_chat_json: content: $content"
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
  local model content error_jq_message_content
  model="$1"
  if [ -z "$model" ]; then
    error "ollama_chat: Model Not Found. Usage: ollama_chat \"model\""
    return $RETURN_ERROR
  fi
  OLLAMA_LIB_STREAM=0
  content=$(jq_sanitize "$(ollama_chat_json "$model")" | jq -r ".message.content")
  error_jq_message_content=$?
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
  local error_ollama_chat
  OLLAMA_LIB_STREAM=1
  ollama_chat "$1"
  error_ollama_chat=$?
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
  local error_ollama_json_chat
  OLLAMA_LIB_STREAM=1
  ollama_chat_json "$1"
  error_ollama_json_chat=$?
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
  local error_list
  ollama list
  error_list=$?
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
  local error_ollama_api_get
  ollama_api_get "/api/tags"
  error_ollama_api_get=$?
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
  local models error_list
  # Get list from ollama cli, skip first line (headers), get first column (names), sort alphabetically
  models=($(ollama list | awk '{if (NR > 1) print $1}' | sort))
  error_list=$?
  if [ "$error_list" -gt 0 ]; then
    error "ollama_list_array: error_list: $error_list"
    return $RETURN_ERROR
  fi
  echo "${models[@]}" # space separated list of model names
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
  local models
  models=($(ollama_list_array))
  if [ ${#models[@]} -eq 0 ]; then
    error "ollama_model_random: No Models Found"
    return $RETURN_ERROR
  fi
  RANDOM=$(date +%s%N) # seed random with unixtime + microseconds
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
  debug result error_unload
  if [ -z "$1" ]; then
    debug "Error: ollama_model_unload: no model"
    return $RETURN_ERROR
  fi
  local response result error_unload
  result=$(ollama_api_post "/api/generate" "{\"model\":$(json_safe_value "$1"),\"keep_alive\":0}")
  error_unload=$?
  if [ "$error_unload" -gt 0 ]; then
    error "ollama_model_unload: error_unload: $error_unload result: [$result]"
    return $RETURN_ERROR
  fi
  # TODO - if result is {"error":"reason"} then error "$reason"; return $RETURN_ERROR
  printf '%s
' "$result"
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
  ollama_api_post "/api/show" "{\"model\":$(json_safe_value "$1")}"
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
}]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"gemma3n:e4b","prompt":"Act as an expert Software Engineer.
Do a full code review of this bash script:

#!/usr/bin/env bash
#
# Ollama Bash Lib - A Bash Library to interact with Ollama
#

OLLAMA_LIB_NAME=\"Ollama Bash Lib\"
OLLAMA_LIB_VERSION=\"0.39.2\"
OLLAMA_LIB_URL=\"https://github.com/attogram/ollama-bash-lib\"
OLLAMA_LIB_LICENSE=\"MIT\"
OLLAMA_LIB_COPYRIGHT=\"Copyright (c) 2025 Attogram Project <https://github.com/attogram>\"

OLLAMA_LIB_API=${OLLAMA_HOST:-\"http://localhost:11434\"} # Ollama API URL, No slash at end
OLLAMA_LIB_DEBUG=0     # 0 = No debug messages, 1 = Yes debug messages
OLLAMA_LIB_MESSAGES=() # Array of messages
OLLAMA_LIB_STREAM=0    # 0 = No streaming, 1 = Yes streaming
RETURN_SUCCESS=0       # Standard success return value
RETURN_ERROR=1         # Standard error return value

# Internal Functions

# Debug message
#
# Usage: debug \"message\"
# Input: 1 - the debug message
# Output: message to stderr
# Returns: 0 on success, 1 on error
debug() {
  if [ \"$OLLAMA_LIB_DEBUG\" -eq \"1\" ]; then
    >&2 echo -e \"[DEBUG] $1\"
  fi
  return $?
}

# Error message
#
# Usage: error \"message\"
# Input: 1 - the error message
# Output: message to stderr
# Returns: 0 on success, 1 on error
error() {
  >&2 echo -e \"[ERROR] $1\"
  # shellcheck disable=SC2320
  return $?
}

# Escape a string for use as a JSON value
#
# Usage: json_safe_value \"string\"
# Input: 1 - The string to escape
# Output: \"quoted safe json value\" to stdout
# Returns: 0 on success, 1 on jq error
json_safe_value() {
  debug \"json_safe_value: $(echo \"$1\" | wc -c | sed 's/ //g') bytes [$1]\"
  local error_jq
  jq -Rn --arg str \"$1\" '$str'
  error_jq=$?
  if [ \"$error_jq\" -gt 0 ]; then
    error \"json_safe_value: error_jq: $error_jq\"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Sanitize a string for jq use
#
# Usage: jq_sanitize \"string\"
# Input: 1 - The string to sanitize
# Output: sanitized string to stdout
# Returns: 0 on success, 1 on error
jq_sanitize() {
  debug \"jq_sanitize: $(echo \"$1\" | wc -c | sed 's/ //g') bytes [$1]\"
  local sanitized
  sanitized=\"$1\"
  # Replace carriage returns (CR, ASCII 13) with literal \r
  sanitized=$(printf '%s' \"$1\" | sed $'s/\r/\\\\r/g')
  # Replace newlines (LF, ASCII 10) with literal \n using awk, then strip final literal \n
  sanitized=$(printf '%s' \"$sanitized\" | awk '{ ORS=\"\\n\"; print }' | sed 's/\\n$//')
  # Remove all control chars 0-9, 11-12, 14-31
  sanitized=$(printf '%s' \"$sanitized\" | tr -d '\000-\011\013\014\016-\037')
  printf '%s\n' \"$sanitized\"
  debug \"jq_sanitized: sanitized: [$sanitized]\"
  return $RETURN_SUCCESS
}

# API Functions

# GET request to the Ollama API
#
# Usage: ollama_api_get \"/api/path\"
# Input: 1 = API URL path
# Output: API call result, to stdout
# Returns: 0 on success, 1 on error
ollama_api_get() {
  debug \"ollama_api_get: [$1]\"
  local result error_curl
  curl -s -X GET \"${OLLAMA_LIB_API}$1\" -H 'Content-Type: application/json'
  error_curl=$?
  if [ \"$error_curl\" -gt 0 ]; then
    error \"ollama_api_get: error_curl: $error_curl\"
    return $RETURN_ERROR
  fi
  debug \"ollama_api_get: return 0\"
  return $RETURN_SUCCESS
}

# POST request to the Ollama API
#
# Usage: ollama_api_post \"/api/path\" \"{ json content }\"
# Input: 1 - API URL path
# Input: 2 - JSON content
# Output: API call result, to stdout
# Returns: 0 on success, 1 on error
ollama_api_post() {
  debug \"ollama_api_post: [$1] [$2]\"
  local result error_curl
  curl -s -X POST \"${OLLAMA_LIB_API}$1\" -H 'Content-Type: application/json' -d \"$2\"
  error_curl=$?
  if [ \"$error_curl\" -gt 0 ]; then
    error \"ollama_api_get: error_curl: $error_curl\"
    return $RETURN_ERROR
  fi
  debug \"ollama_api_post: return 0\"
  return $RETURN_SUCCESS
}

# Ping the Ollama API
#
# Usage: ollama_api_ping
# Input: none
# Output: none
# Returns: 0 if API is reachable, 1 if API is not reachable
ollama_api_ping() {
  debug \"ollama_api_ping\"
  local result api_get_error
  result=$(ollama_api_get \"\")
  api_get_error=$?
  if [ \"$api_get_error\" -gt 0 ]; then
    error \"ollama_api_ping: error: $api_get_error\"
    return $RETURN_ERROR
  fi
  if [[ \"$result\" == \"Ollama is running\" ]]; then
    return $RETURN_SUCCESS
  fi
  error \"ollama_api_ping: unknown result: [$result]\"
  return $RETURN_ERROR
}

# Generate Functions

# Generate a completion as json
#
# Usage: ollama_generate_json \"model\" \"prompt\"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_json() {
  debug \"ollama_generate_json: [$1] [$2]\"
  debug \"ollama_generate_json: OLLAMA_LIB_STREAM: $OLLAMA_LIB_STREAM\"
  local json error_ollama_api_post
  json=\"{\\"model\\":$(json_safe_value \"$1\"),\\"prompt\\":$(json_safe_value \"$2\")\"
  if [ \"$OLLAMA_LIB_STREAM\" -eq \"0\" ]; then
    json+=\",\\"stream\\":false\"
  fi
  json+=\"}\"
  ollama_api_post \"/api/generate\" \"$json\"
  error_ollama_api_post=$?
  if [ \"$error_ollama_api_post\" -gt 0 ]; then
    error \"ollama_generate_json: error_ollama_api_post: $error_ollama_api_post\"
    return $RETURN_ERROR
  fi
  debug \"ollama_generate_json: return: 0\"
  return $RETURN_SUCCESS
}

# Generate a completion, as streaming json
#
# Usage: ollama_generate_stream_json \"model\" \"prompt\"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream_json() {
  debug \"ollama_generate_stream_json: [$1] [$2]\"
  local json response error_ollama_generate_json
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  ollama_generate_json \"$1\" \"$2\"
  error_ollama_generate_json=$?
  echo # needed?
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  if [ \"$error_ollama_generate_json\" -gt 0 ]; then
    error \"ollama_generate_stream_json: error_ollama_generate_json: $error_ollama_generate_json\"
    return $RETURN_ERROR
  fi
  debug \"ollama_generate_stream_json: return: 0\"
  return $RETURN_SUCCESS
}

# Generate a completion as text
#
# Usage: ollama_generate \"model\" \"prompt\"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_generate() {
  debug \"ollama_generate: [$1] [$2]\"
  local json result error_ollama_generate_json error_jq
  OLLAMA_LIB_STREAM=0
  result=$(ollama_generate_json \"$1\" \"$2\")
  error_ollama_generate_json=$?
  debug \"ollama_generate: result: $(echo \"$result\" | wc -c | sed 's/ //g') bytes\"
  if [ \"$error_ollama_generate_json\" -gt 0 ]; then
    error \"ollama_generate: error_ollama_generate_json: $error_ollama_generate_json\"
    return $RETURN_ERROR
  fi
  jq_sanitize \"$result\" | jq -r \".response\"
  error_jq=$?
  if [ \"$error_jq\" -gt 0 ]; then
    error \"ollama_generate: error_jq: $error_jq [$response]\"
    return $RETURN_ERROR
  fi
  debug \"ollama_generate_stream_json: return: 0\"
  return $RETURN_SUCCESS
}

# Generate a completion as streaming text
#
# Usage: ollama_generate_stream \"model\" \"prompt\"
# Input: 1 - The model to use to generate a response
# Input: 2 - The prompt
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_generate_stream() {
  debug \"ollama_generate_stream: [$1] [$2]\"
  local line error_ollama_generate_json error_jq
  OLLAMA_LIB_STREAM=1 # Turn on streaming
  ollama_generate_json \"$1\" \"$2\" | while IFS= read -r line; do
    echo -n \"$(jq_sanitize \"$line\" | jq -r \".response\")\"
    error_jq=$?
    if [ \"$error_jq\" -gt 0 ]; then
      error \"ollama_generate_stream: error_jq: $error_jq\"
      return $RETURN_ERROR
    fi
  done
  error_ollama_generate_json=$?
  echo # needed?
  OLLAMA_LIB_STREAM=0 # Turn off streaming
  if [ \"$error_ollama_generate_json\" -gt 0 ]; then
    error \"ollama_generate_stream: error_ollama_generate_json: $error_ollama_generate_json\"
    return $RETURN_ERROR
  fi
  debug \"ollama_generate_stream: return: 0\"
  return $RETURN_SUCCESS
}

# Messages Functions

# Get all messages
#
# Usage: messages=\"$(ollama_messages)\"
# Output: json, 1 messages per line, to stdout
# Returns: 0 on success, 1 on error
ollama_messages() {
  debug \"ollama_messages\"
  if [ ${#OLLAMA_LIB_MESSAGES[@]} -eq 0 ]; then
    debug \"ollama_messages: no messages\"
    return $RETURN_ERROR
  fi
  printf '%s\n' \"${OLLAMA_LIB_MESSAGES[@]}\"
  return $RETURN_SUCCESS
}

# Add a message
#
# Usage: ollama_message_add \"role\" \"message\"
# Output: none
# Returns: 0 on success, 1 on error
ollama_messages_add() {
  debug \"ollama_messages_add: [$1]\"
  local role message
  role=\"$1\"
  message=\"$2\"
  OLLAMA_LIB_MESSAGES+=(\"{\\"role\\":$(json_safe_value \"$role\"),\\"content\\":$(json_safe_value \"$message\")}\")
  return $RETURN_SUCCESS
}

# Clear all messages
#
# Usage: ollama_messages_clear
# Output: none
# Returns: 0 on success, 1 on error
ollama_messages_clear() {
  debug \"IN DEV - ollama_messages_clear\"
  OLLAMA_LIB_MESSAGES=()
  return $RETURN_SUCCESS
}

# Messages count
#
# Usage: ollama_messages_count
# Output: number of messages, to stdout
# Returns: 0 on success, 1 on error
ollama_messages_count() {
  debug \"ollama_messages_count\"
  echo \"${#OLLAMA_LIB_MESSAGES[@]}\"
  return $RETURN_SUCCESS
}

# Chat Functions

# Chat completion request as json
#
# Usage: ollama_chat_json \"model\"
# Input: 1 - model
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_chat_json() {
  debug \"ollama_chat_json: [$1]\"
  local model json result error_post error_jq_message_content

  model=\"$1\"
  if [ -z \"$model\" ]; then
    error \"ollama_chat_json: Model Not Found. Usage: ollama_chat_json \\"model\\"\"
    return $RETURN_ERROR
  fi

  # TODO - use jq to build json? better/easier array handling
  json=\"{\\"model\\":$(json_safe_value \"$model\"),\\"messages\\":[\"
  json+=$(printf \"%s,\" \"${OLLAMA_LIB_MESSAGES[@]}\")
  json=\"$(echo \"$json\" | sed 's/,*$//g')\" # strip last slash
  json+=\"]\"
  if [ \"$OLLAMA_LIB_STREAM\" -eq 0 ]; then
    json+=\",\\"stream\\":false\"
  fi
  json+=\"}\"

  result=$(ollama_api_post \"/api/chat\" \"$json\")
  error_post=$?
  if [ \"$error_post\" -gt 0 ]; then
    error \"ollama_chat_json: error_post: $error_post\"
    return $RETURN_ERROR
  fi

  content=$(jq_sanitize \"$result\" | jq -r \".message.content\")
  error_jq_message_content=$?
  debug \"ollama_chat_json: content: $content\"
  if [ \"$error_jq_message_content\" -gt 0 ]; then
    error \"ollama_chat_json: error_jq_message_content: $error_jq_message_content\"
    return $RETURN_ERROR
  fi
  ollama_messages_add \"assistant\" \"$content\"
  echo \"$result\"
}

# Chat completion request as text
#
# Usage: ollama_chat \"model\"
# Input: 1 - model
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_chat() {
  debug \"ollama_chat: [$1]\"
  local model content error_jq_message_content
  model=\"$1\"
  if [ -z \"$model\" ]; then
    error \"ollama_chat: Model Not Found. Usage: ollama_chat \\"model\\"\"
    return $RETURN_ERROR
  fi
  OLLAMA_LIB_STREAM=0
  content=$(jq_sanitize \"$(ollama_chat_json \"$model\")\" | jq -r \".message.content\")
  error_jq_message_content=$?
  debug \"ollama_chat: content: $content\"
  if [ \"$error_jq_message_content\" -gt 0 ]; then
    error \"ollama_chat: error_jq_message_content: $error_jq_message_content\"
    return $RETURN_ERROR
  fi
  echo \"$content\"
  ollama_messages_add \"assistant\" \"$content\"
  return $RETURN_SUCCESS
}

# Chat completion request as streaming text
#
# Usage: ollama_chat_stream \"model\"
# Input: 1 - model
# Output: streaming text, to stdout
# Returns: 0 on success, 1 on error
ollama_chat_stream() {
  debug \"ollama_chat_stream: [$1]\"
  local error_ollama_chat
  OLLAMA_LIB_STREAM=1
  ollama_chat \"$1\"
  error_ollama_chat=$?
  OLLAMA_LIB_STREAM=0
  if [ \"$error_ollama_chat\" -gt 0 ]; then
    error \"ollama_chat_stream: error_ollama_chat: $error_ollama_chat\"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Chat completion request as streaming json
#
# Usage: ollama_chat_stream_json \"model\"
# Input: 1 - model
# Output: streaming json, to stdout
# Returns: 0 on success, 1 on error
ollama_chat_stream_json() {
  debug \"ollama_chat_stream_json: [$1]\"
  local error_ollama_json_chat
  OLLAMA_LIB_STREAM=1
  ollama_chat_json \"$1\"
  error_ollama_json_chat=$?
  OLLAMA_LIB_STREAM=0
  if [ \"$error_ollama_json_chat\" -gt 0 ]; then
    error \"ollama_chat_stream_json: error_ollama_json_chat: $error_ollama_json_chat\"
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
  debug \"ollama_list\"
  local error_list
  ollama list
  error_list=$?
  if [ \"$error_list\" -gt 0 ]; then
    error \"ollama_list: error_list: $error_list\"
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
  debug \"ollama_list_json\"
  local error_ollama_api_get
  ollama_api_get \"/api/tags\"
  error_ollama_api_get=$?
  if [ \"$error_ollama_api_get\" -gt 0 ]; then
    error \"ollama_list: error_ollama_api_get: $error_ollama_api_get\"
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
  debug \"ollama_list_array\"
  local models error_list
  # Get list from ollama cli, skip first line (headers), get first column (names), sort alphabetically
  models=($(ollama list | awk '{if (NR > 1) print $1}' | sort))
  error_list=$?
  if [ \"$error_list\" -gt 0 ]; then
    error \"ollama_list_array: error_list: $error_list\"
    return $RETURN_ERROR
  fi
  echo \"${models[@]}\" # space separated list of model names
  return $RETURN_SUCCESS
}

# Model Functions

# Get a random model
#
# Usage: ollama_model_random
# Output: 1 model name, to stdout
# Returns: 0 on success, 1 on error
ollama_model_random() {
  debug \"ollama_model_random\"
  local models
  models=($(ollama_list_array))
  if [ ${#models[@]} -eq 0 ]; then
    error \"ollama_model_random: No Models Found\"
    return $RETURN_ERROR
  fi
  RANDOM=$(date +%s%N) # seed random with unixtime + microseconds
  echo \"${models[RANDOM%${#models[@]}]}\"
  return $RETURN_SUCCESS
}

# Unload a model from memory
#
# Usage: ollama_model_unload \"model\"
# Input: 1 - Model name to unload
# Output: unload result, in json, to stdout
# Returns: 0 on success, 1 on error
ollama_model_unload() {
  debug result error_unload
  if [ -z \"$1\" ]; then
    debug \"Error: ollama_model_unload: no model\"
    return $RETURN_ERROR
  fi
  local response result error_unload
  result=$(ollama_api_post \"/api/generate\" \"{\\"model\\":$(json_safe_value \"$1\"),\\"keep_alive\\":0}\")
  error_unload=$?
  if [ \"$error_unload\" -gt 0 ]; then
    error \"ollama_model_unload: error_unload: $error_unload result: [$result]\"
    return $RETURN_ERROR
  fi
  # TODO - if result is {\"error\":\"reason\"} then error \"$reason\"; return $RETURN_ERROR
  printf '%s\n' \"$result\"
  return $RETURN_SUCCESS
}

# Processes Functions

# Running model processes, CLI version
#
# Usage: ollama_ps
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_ps() {
  debug \"ollama_ps\"
  ollama ps
  local error_ollama=$?
  if [ \"$error_ollama\" -gt 0 ]; then
    error \"ollama_ps: error_ollama: $error_ollama\"
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
  debug \"ollama_ps_json\"
  ollama_api_get \"/api/ps\"
  local error_ollama_api_get=$?
  if [ \"$error_ollama_api_get\" -gt 0 ]; then
    error \"ollama_ps_json: error_ollama_api_get: $error_ollama_api_get\"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Show Functions

# Show model information, TEXT version
#
# Usage: ollama_show \"model\"
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_show() {
  debug \"ollama_show\"
  ollama show \"$1\"
  local error_ollama=$?
  if [ \"$error_ollama\" -gt 0 ]; then
    error \"ollama_show: error_ollama: $error_ollama\"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Show model information, JSON version
#
# Usage: ollama_show_json \"model\"
# Output: json, to stdout
# Returns: 0 on success, 1 on error
ollama_show_json() {
  debug \"ollama_show_json\"
  ollama_api_post \"/api/show\" \"{\\"model\\":$(json_safe_value \"$1\")}\"
  local error_ollama_api_post=$?
  if [ \"$error_ollama_api_post\" -gt 0 ]; then
    error \"ollama_show_json: error_ollama_api_post: $error_ollama_api_post\"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Ollama Functions

# Is Ollama installed on the local system?
#
# Usage: if ollama_installed; then echo \"Ollama Installed\"; else echo \"Ollama Not Installed\"; fi
# Input: none
# Output: none
# Returns: 0 if Ollama is installed, 1 if Ollama is not installed
ollama_installed() {
  debug \"ollama_installed\"
  if [ -z \"$(command -v \"ollama\" 2> /dev/null)\" ]; then
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
  echo \"OLLAMA_DEBUG: $OLLAMA_DEBUG\"
  echo \"OLLAMA_HOST: $OLLAMA_HOST\"
  echo \"OLLAMA_KEEP_ALIVE: $OLLAMA_KEEP_ALIVE\"
  echo \"OLLAMA_MAX_LOADED_MODELS: $OLLAMA_MAX_LOADED_MODELS\"
  echo \"OLLAMA_MAX_QUEUE: $OLLAMA_MAX_QUEUE\"
  echo \"OLLAMA_MODELS: $OLLAMA_MODELS\"
  echo \"OLLAMA_NUM_PARALLEL: $OLLAMA_NUM_PARALLEL\"
  echo \"OLLAMA_NOPRUNE: $OLLAMA_NOPRUNE\"
  echo \"OLLAMA_ORIGINS: $OLLAMA_ORIGINS\"
  echo \"OLLAMA_SCHED_SPREAD: $OLLAMA_SCHED_SPREAD\"
  echo \"OLLAMA_FLASH_ATTENTION: $OLLAMA_FLASH_ATTENTION\"
  echo \"OLLAMA_KV_CACHE_TYPE: $OLLAMA_KV_CACHE_TYPE\"
  echo \"OLLAMA_LLM_LIBRARY: $OLLAMA_LLM_LIBRARY\"
  echo \"OLLAMA_GPU_OVERHEAD: $OLLAMA_GPU_OVERHEAD\"
  echo \"OLLAMA_LOAD_TIMEOUT: $OLLAMA_LOAD_TIMEOUT\"
  echo \"OLLAMA_TMPDIR: $OLLAMA_TMPDIR\"
  echo \"OLLAMA_MAX_VRAM: $OLLAMA_MAX_VRAM\"
  echo \"OLLAMA_NOHISTORY: $OLLAMA_NOHISTORY\"
  echo \"OLLAMA_MULTIUSER_CACHE: $OLLAMA_MULTIUSER_CACHE\"
  echo \"OLLAMA_CONTEXT_LENGTH: $OLLAMA_CONTEXT_LENGTH\"
  echo \"OLLAMA_NEW_ENGINE: $OLLAMA_NEW_ENGINE\"
  echo \"OLLAMA_INTEL_GPU: $OLLAMA_INTEL_GPU\"
  echo \"OLLAMA_RUNNERS_DIR: $OLLAMA_RUNNERS_DIR\"
  echo \"OLLAMA_TEST_EXISTING: $OLLAMA_TEST_EXISTING\"
  echo \"CUDA_VISIBLE_DEVICES: $CUDA_VISIBLE_DEVICES\"
  echo \"GPU_DEVICE_ORDINAL: $GPU_DEVICE_ORDINAL\"
  echo \"HSA_OVERRIDE_GFX_VERSION: $HSA_OVERRIDE_GFX_VERSION\"
  echo \"HIP_PATH: $HIP_PATH\"
  echo \"HIP_VISIBLE_DEVICES: $HIP_VISIBLE_DEVICES\"
  echo \"ROCR_VISIBLE_DEVICES: $ROCR_VISIBLE_DEVICES\"
  echo \"JETSON_JETPACK: $JETSON_JETPACK\"
  echo \"LD_LIBRARY_PATHS: $LD_LIBRARY_PATH\"
  echo \"HTTP_PROXY: $HTTP_PROXY\"
  echo \"LOCALAPPDATA: $LOCALAPPDATA\"
  #echo \"HOME: $HOME\"
  echo \"TERM: $TERM\"
  return $RETURN_SUCCESS
}

# Ollama application version, TEXT version
#
# Usage: ollama_version
# Output: text, to stdout
# Returns: 0 on success, 1 on error
ollama_version() {
  debug \"ollama_version\"
  ollama_api_get \"/api/version\" | jq -r \".version\"
  local error_ollama_api_get=$?
  if [ \"$error_ollama_api_get\" -gt 0 ]; then
    error \"ollama_version: error_ollama_api_get: $error_ollama_api_get\"
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
  debug \"ollama_version_json\"
  ollama_api_get \"/api/version\"
  local error_ollama_api_get=$?
  if [ \"$error_ollama_api_get\" -gt 0 ]; then
    error \"ollama_version_json: error_ollama_api_get: $error_ollama_api_get\"
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
  debug \"ollama_version_cli\"
  ollama --version
  local error_ollama=$?
  if [ \"$error_ollama\" -gt 0 ]; then
    error \"ollama_version_cli: error_ollama: $error_ollama\"
    return $RETURN_ERROR
  fi
  return $RETURN_SUCCESS
}

# Utility

# Estimate the number of tokens in a string
#
# Usage: estimate_tokens \"string\"
# Usage: verbose: estimate_tokens \"string\" 1
# Output: token estimate, to stdout
# Output: verbose: token estimate with error range, to stdout
# Returns: 0 on success, 1 on error
estimate_tokens() {
  debug \"estimate_tokens\" # $1\"
  local string verbose tokensWords words tokensChars chars tokensBytes bytes tokens

  if [ -t 0 ]; then # Not piped input
    if [ -f \"$1\" ]; then
      debug \"Getting string from file (arg 1 is filename)\"
      string=$(<\"$1\")
    elif [ -n \"$1\" ]; then
      debug \"Getting string from arg 1\"
      string=\"$1\"
    else
      debug \"Usage: estimate_tokens <text|string|file> [verbose: 1])\"
      return $RETURN_ERROR
    fi
    verbose=${2:-0} # verbose is arg 2
  else
    debug \"Getting string from piped input, multiline\"
    string=$(cat -)
    verbose=${1:-0} # verbose is arg 1
  fi
  debug \"verbose: $verbose\"

  words=$(echo \"$string\" | wc -w)
  chars=$(printf \"%s\" \"$string\" | wc -m)
  bytes=$(printf \"%s\" \"$string\" | wc -c)

  tokensWords=$(( (words * 100) / 75 )) # 1 token = 0.75 words
  debug \"words      : $words\"
  debug \"tokensWords: $tokensWords\"

  tokensChars=$(( (chars + 1) / 4 )) # 1 token = 4 characters
  debug \"chars      : $chars\"
  debug \"tokensChars: $tokensChars\"

  tokensBytes=$(( (bytes + 1) / 4 )) # 1 token = 4 bytes
  debug \"bytes      : $bytes\"
  debug \"tokensBytes: $tokensBytes\"

  # Get largest estimate
  tokens=$tokensBytes
  (( tokensChars > tokens )) && tokens=$tokensChars
  (( tokensWords > tokens )) && tokens=$tokensWords
  debug \"tokens     : $tokens\"

  if [ \"$verbose\" -eq 0 ]; then
   echo \"$tokens\"
   return $RETURN_SUCCESS
  fi

  local min max offsetMin offsetMax error

  min=$tokensWords
  (( tokensChars < min )) && min=$tokensChars
  (( tokensBytes < min )) && min=$tokensBytes
  debug \"min        : $min\"

  max=$tokensWords
  (( tokensChars > max )) && max=$tokensChars
  (( tokensBytes > max )) && max=$tokensBytes
  debug \"max        : $max\"

  offsetMin=$(( max - tokens ))
  debug \"offsetMin  : $offsetMin\"

  offsetMax=$(( tokens - min ))
  debug \"offsetMax  : $offsetMax\"

  error=$offsetMin
  (( error < offsetMax )) && error=$offsetMax
  debug \"error      : $error\"

  echo \"$tokens ± $error (range $min to $max)\"
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
  echo \"$OLLAMA_LIB_NAME v$OLLAMA_LIB_VERSION\"
  echo
  echo \"A Bash Library to interact with Ollama\"
  echo
  echo \"OLLAMA_LIB_NAME     : $OLLAMA_LIB_NAME\"
  echo \"OLLAMA_LIB_VERSION  : $OLLAMA_LIB_VERSION\"
  echo \"OLLAMA_LIB_URL      : $OLLAMA_LIB_URL\"
  echo \"OLLAMA_LIB_LICENSE  : $OLLAMA_LIB_LICENSE\"
  echo \"OLLAMA_LIB_COPYRIGHT: $OLLAMA_LIB_COPYRIGHT\"
  echo \"OLLAMA_LIB_DEBUG    : $OLLAMA_LIB_DEBUG\"
  echo \"OLLAMA_LIB_API      : $OLLAMA_LIB_API\"
  echo \"OLLAMA_LIB_STREAM   : $OLLAMA_LIB_STREAM\"
  echo \"OLLAMA_LIB_MESSAGES : ${#OLLAMA_LIB_MESSAGES[@]}\"
  echo
  if [ -z \"$(command -v compgen 2> /dev/null)\" ]; then
    debug \"ollama_lib_about: compgen Not Found\"
    return $RETURN_ERROR
  fi
  echo \"Functions:\"
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
  echo \"$OLLAMA_LIB_VERSION\"
  return $RETURN_SUCCESS
}","stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 65854 bytes
[DEBUG] jq_sanitize: 65854 bytes [{"model":"gemma3n:e4b","created_at":"2025-07-30T17:50:58.576592Z","response":"This is a comprehensive and well-structured Bash library for interacting with the Ollama API. Here's a breakdown of the code, its functionality, and potential improvements:

**Overall Structure and Design:**

* **Modular:** The code is organized into functions, each performing a specific task. This makes it easy to understand, maintain, and extend.
* **Clear Naming:** Function names are descriptive and follow a consistent `ollama_` prefix.
* **Error Handling:**  The code includes error checking using `if [ \"$error_ollama\" -gt 0 ]` to handle potential issues with the `ollama` command.
* **Configuration:**  Uses environment variables (e.g., `OLLAMA_LIB_NAME`, `OLLAMA_LIB_VERSION`) to configure the library.
* **Documentation:**  Each function has a comment block explaining its purpose, usage, input, output, and return value.  This is excellent!
* **Utility Functions:** Includes helpful utility functions like `estimate_tokens` and `ollama_lib_about`.

**Function Breakdown and Explanation:**

* **`ollama_lib_about`:**  Provides information about the library itself, including its name, version, URL, license, and a list of functions.  Uses `compgen` to dynamically generate the list of functions.
* **`ollama_lib_version`:**  Returns the version number of the library.
* **`estimate_tokens`:**  Estimates the number of tokens in a given string.  It handles both file input and piped input.  It provides both raw token count and a range of estimated tokens with a confidence interval.
* **`ollama_version`:**  Gets the version of the Ollama application.
* **`ollama_version_json`:** Gets the version of the Ollama application and returns it in JSON format.
* **`ollama_version_cli`:** Gets the version of the Ollama application using the `ollama --version` command.
* **`estimate_tokens`:**  This function is well-written and handles different input types gracefully. The token estimation logic is reasonable, using a common approximation.
* **`ollama_lib_name`:**  Prints the name of the library.
* **`ollama_lib_version`:**  Prints the version of the library.
* **`ollama_lib_url`:**  Prints the URL of the library.
* **`ollama_lib_license`:**  Prints the license of the library.
* **`ollama_lib_copyright`:**  Prints the copyright information.
* **`ollama_lib_debug`:**  Prints the debug flag.
* **`ollama_lib_api`:**  Prints the API version.
* **`ollama_lib_stream`:**  Prints the stream flag.
* **`ollama_lib_messages`:**  Prints the messages flag.

**Potential Improvements and Considerations:**

* **Input Validation:**  The `estimate_tokens` function could benefit from more robust input validation.  For example, it could check if the input is a valid string or a valid file path.
* **Error Handling in `estimate_tokens`:**  The `estimate_tokens` function doesn't handle potential errors when reading from a file.  Consider adding error handling to gracefully handle cases where the file doesn't exist or is not readable.
* **More Robust Token Estimation:** The token estimation method is a simple approximation.  For more accurate token counts, consider using a dedicated tokenization library or API.  However, this would add a dependency.
* **Command-Line Arguments:**  Consider using `getopts` to handle command-line arguments for the functions.  This would make the library more flexible and easier to use.
* **Documentation Generation:**  Use a tool like `doxygen` or `Sphinx` to automatically generate documentation from the code comments.
* **Testing:**  Write unit tests to ensure the correctness of the functions.
* **Asynchronous Operations:**  For long-running operations, consider using asynchronous operations to avoid blocking the main thread.  This would improve the responsiveness of the application.
* **More Functions:**  Consider adding functions for other common tasks, such as:
    * Running a model
    * Downloading a model
    * Listing available models
    * Managing the Ollama data directory
* **`verbose` flag:** The `verbose` flag in `estimate_tokens` is not well-defined. It's not clear what it does.  Consider renaming it to something more descriptive, such as `debug` or `detailed`.
* **`compgen` usage:** The use of `compgen` to generate the list of functions in `ollama_lib_about` is a bit fragile.  If the library is updated, the output of `compgen` might change.  Consider a more robust approach, such as a predefined list of functions.

**Example Usage:**

```bash
# Get the Ollama version
o_version

# Estimate the number of tokens in a string
o_estimate_tokens \"This is a test string.\"

# Estimate the number of tokens in a file
o_estimate_tokens my_text_file.txt

# Get information about the library
o_lib_about

# Get the library version
o_lib_version

# Get the library version in JSON format
o_lib_version_json

# Get the library version using the CLI
o_lib_version_cli

# Estimate tokens with verbose output
o_estimate_tokens \"This is a test string.\" 1
```

**In summary, this is a well-written and useful Bash library for interacting with the Ollama API.  By addressing the potential improvements outlined above, you can make it even more robust, flexible, and maintainable.**","done":true,"done_reason":"stop","context":[105,2364,107,3895,618,614,7710,37293,15088,733,31016,236761,107,6294,496,2587,3393,3540,529,672,55299,8948,236787,107,107,38752,20268,236786,6264,236786,7291,55299,107,236865,107,236865,96412,2327,64830,11565,753,562,64830,13826,531,12740,607,96412,2327,107,236865,107,107,3769,89458,236776,236779,56506,236779,11415,718,51397,49751,64830,11565,236775,107,3769,89458,236776,236779,56506,236779,24767,718,236771,236761,236800,236819,236761,236778,236775,107,3769,89458,236776,236779,56506,236779,6738,718,2574,1411,4995,87285,236763,236761,854,236786,1667,9118,236786,236748,212922,236772,42422,236772,5285,236775,107,3769,89458,236776,236779,56506,236779,42515,718,36320,236775,107,3769,89458,236776,236779,56506,236779,94957,204306,9658,718,32090,568,236755,236768,236743,236778,236771,236778,236810,7058,9118,593,166652,539,655,2574,1411,4995,87285,236763,236761,854,236786,1667,9118,47005,107,107,3769,89458,236776,236779,56506,236779,10252,19899,3769,89458,236776,236779,42447,236787,31621,2855,1411,3022,207986,540,236787,236770,236770,236812,236800,236812,25938,997,96412,2327,9299,10739,236764,2301,70922,657,1345,107,3769,89458,236776,236779,56506,236779,236796,56343,14436,236784,236771,140,997,236743,236771,578,2301,15862,10396,236764,236743,236770,578,8438,15862,10396,107,3769,89458,236776,236779,56506,236779,88189,236773,33950,9036,236768,997,8199,529,10396,107,3769,89458,236776,236779,56506,236779,61217,236784,236771,139,997,236743,236771,578,2301,21566,236764,236743,236770,578,8438,21566,107,56268,236779,236773,13551,33811,236773,236784,236771,142,997,13029,2630,637,50347,50073,1550,107,56268,236779,18344,236784,236770,144,997,13029,3165,637,50347,50073,1550,107,107,236865,26946,39104,107,107,236865,32063,3618,107,236865,107,236865,42056,236787,15862,623,4375,236775,107,236865,564,8435,550,236787,236743,236770,753,506,15862,3618,107,236865,43228,32172,550,236787,3618,531,85542,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,11118,825,642,107,236743,768,870,6610,3769,89458,236776,236779,56506,236779,236796,56343,14436,236775,753,4076,623,236770,236775,20772,1299,107,140,29094,236778,9263,753,236744,28286,236796,56343,14436,236842,609,236770,236775,107,236743,7999,107,236743,637,50347,50073,236743,223680,107,236783,107,107,236865,11489,3618,107,236865,107,236865,42056,236787,3165,623,4375,236775,107,236865,564,8435,550,236787,236743,236770,753,506,3165,3618,107,236865,43228,32172,550,236787,3618,531,85542,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,1899,825,642,107,138,29094,236778,9263,753,236744,28286,18344,236842,609,236770,236775,107,236743,997,11113,34953,236754,113843,1001,87144,519,236784,7427,236778,236800,236778,236771,107,236743,637,50347,50073,236743,223680,107,236783,107,107,236865,68980,496,2483,573,1161,618,496,10434,1550,107,236865,107,236865,42056,236787,8373,236779,12977,236779,2394,623,2383,236775,107,236865,564,8435,550,236787,236743,236770,753,669,2483,531,14317,107,236865,43228,32172,550,236787,623,148758,6338,8373,1550,236775,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,218484,3165,107,3723,236779,12977,236779,2394,825,642,107,236743,15862,623,3723,236779,12977,236779,2394,236787,3498,17454,6610,236770,236775,1109,61291,753,236755,1109,7559,756,236751,236786,973,236759,1606,17234,130208,236770,50190,107,236743,2263,3165,236779,179400,107,236743,218484,753,130968,2617,1187,1540,6610,236770,236775,36467,1714,236789,107,236743,3165,236779,179400,236784,223680,107,236743,768,870,6610,1899,236779,179400,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,3723,236779,12977,236779,2394,236787,3165,236779,179400,236787,609,1899,236779,179400,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,5054,77372,496,2483,573,218484,1161,107,236865,107,236865,42056,236787,218484,236779,132064,623,2383,236775,107,236865,564,8435,550,236787,236743,236770,753,669,2483,531,118270,107,236865,43228,32172,550,236787,211883,2483,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,179400,236779,132064,825,642,107,236743,15862,623,179400,236779,132064,236787,3498,17454,6610,236770,236775,1109,61291,753,236755,1109,7559,756,236751,236786,973,236759,1606,17234,130208,236770,50190,107,236743,2263,211883,107,236743,211883,16948,236770,236775,107,236743,997,44635,41985,637,50347,50073,236751,568,6459,236764,562,199884,236777,236743,236770,236800,236768,607,37087,621,236750,107,236743,211883,47184,8641,23951,236751,236789,6610,236770,236775,1109,7559,219051,236751,17804,236750,17804,97292,236750,236786,236759,1606,107,236743,997,44635,770,76033,1472,568,43102,236764,562,199884,236777,236743,236770,236771,236768,607,37087,621,236749,1699,33100,236764,1299,13356,1626,37087,621,236749,107,236743,211883,47184,8641,23951,236751,236789,6610,29321,185165,236775,1109,33100,43836,236743,15494,96508,236785,236749,1721,1887,236743,24768,1109,7559,756,236751,17804,236785,236749,9907,107914,107,236743,997,22221,784,2256,56256,236743,236771,236772,236819,236764,236743,236770,236770,236772,236770,236778,236764,236743,236770,236812,236772,236800,236770,107,236743,211883,47184,8641,23951,236751,236789,6610,29321,185165,236775,1109,719,753,236753,16594,236771,236771,236771,2242,236771,236770,236770,236785,236771,236770,236800,236785,236771,236770,236812,236785,236771,236770,236825,2242,236771,236800,236832,1606,107,236743,9006,23951,236751,236785,236749,236789,6610,29321,185165,236775,107,236743,15862,623,179400,236779,29321,185165,236787,211883,236787,130208,29321,185165,50190,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,9299,39104,107,107,236865,20088,2864,531,506,96412,2327,9299,107,236865,107,236865,42056,236787,512,212922,236779,3677,236779,828,9560,3677,236786,2337,236775,107,236865,564,8435,550,236787,236743,236770,578,9299,10739,2479,107,236865,43228,32172,550,236787,9299,2246,1354,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,3677,236779,828,825,642,107,236743,15862,623,236748,212922,236779,3677,236779,828,236787,130208,236770,50190,107,236743,2263,1354,3165,236779,40192,107,236743,24268,753,236751,753,236917,20088,15753,3769,89458,236776,236779,56506,236779,10252,823,236770,236775,753,236814,756,4795,236772,2328,236787,3739,236786,3723,236789,107,236743,3165,236779,40192,236784,223680,107,236743,768,870,6610,1899,236779,40192,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,3677,236779,828,236787,3165,236779,40192,236787,609,1899,236779,40192,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,3677,236779,828,236787,637,50347,50073,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,25544,2864,531,506,96412,2327,9299,107,236865,107,236865,42056,236787,512,212922,236779,3677,236779,3274,9560,3677,236786,2337,236775,32928,8373,3004,123792,107,236865,564,8435,550,236787,236743,236770,753,9299,10739,2479,107,236865,564,8435,550,236787,236743,236778,753,10434,3004,107,236865,43228,32172,550,236787,9299,2246,1354,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,3677,236779,3274,825,642,107,236743,15862,623,236748,212922,236779,3677,236779,3274,236787,130208,236770,236842,130208,236778,50190,107,236743,2263,1354,3165,236779,40192,107,236743,24268,753,236751,753,236917,25544,15753,3769,89458,236776,236779,56506,236779,10252,823,236770,236775,753,236814,756,4795,236772,2328,236787,3739,236786,3723,236789,753,236753,6610,236778,236775,107,236743,3165,236779,40192,236784,223680,107,236743,768,870,6610,1899,236779,40192,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,3677,236779,828,236787,3165,236779,40192,236787,609,1899,236779,40192,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,3677,236779,3274,236787,637,50347,50073,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,65113,506,96412,2327,9299,107,236865,107,236865,42056,236787,512,212922,236779,3677,236779,21787,107,236865,564,8435,550,236787,7293,107,236865,43228,32172,550,236787,7293,107,236865,630,50347,50073,236751,236787,236743,236771,768,9299,563,125466,236764,236743,236770,768,9299,563,711,125466,107,236748,212922,236779,3677,236779,21787,825,642,107,236743,15862,623,236748,212922,236779,3677,236779,21787,236775,107,236743,2263,1354,14017,236779,828,236779,1899,107,236743,1354,47184,236748,212922,236779,3677,236779,828,25682,107,236743,14017,236779,828,236779,1899,236784,223680,107,236743,768,870,6610,3677,236779,828,236779,1899,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,3677,236779,21787,236787,3165,236787,609,3677,236779,828,236779,1899,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,768,15385,6610,500,113109,236745,236775,1251,623,51397,49751,563,4710,236775,87038,1299,107,139,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236743,7999,107,236743,3165,623,236748,212922,236779,3677,236779,21787,236787,11908,1354,236787,130208,500,113109,236745,50190,107,236743,637,50347,50073,609,56268,236779,18344,107,236783,107,107,236865,43550,39104,107,107,236865,43550,496,15323,618,8373,107,236865,107,236865,42056,236787,512,212922,236779,19057,236779,3723,623,4368,236775,623,972,25011,236745,236775,107,236865,564,8435,550,236787,236743,236770,753,669,2028,531,1161,531,8729,496,637,85622,185648,107,236865,564,8435,550,236787,236743,236778,753,669,865,25011,236745,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,19057,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,19057,236779,3723,236787,130208,236770,236842,130208,236778,50190,107,236743,15862,623,236748,212922,236779,19057,236779,3723,236787,53418,89458,236776,236779,56506,236779,61217,236787,609,3769,89458,236776,236779,56506,236779,61217,236775,107,236743,2263,8373,3165,236779,236748,212922,236779,3677,236779,3274,107,236743,8373,68415,8455,4368,8455,47901,236769,3723,236779,12977,236779,2394,6610,236770,1373,84252,972,25011,236745,8455,47901,236769,3723,236779,12977,236779,2394,6610,236778,236775,16291,107,236743,768,870,6610,3769,89458,236776,236779,56506,236779,61217,236775,753,4076,623,236771,236775,20772,1299,107,139,8373,154039,84252,6678,50416,4530,236775,107,236743,7999,107,236743,8373,23927,25938,236775,107,236743,512,212922,236779,3677,236779,3274,9560,3677,236786,19057,236775,6610,3723,236775,107,236743,3165,236779,236748,212922,236779,3677,236779,3274,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,3274,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,19057,236779,3723,236787,3165,236779,236748,212922,236779,3677,236779,3274,236787,609,1899,236779,236748,212922,236779,3677,236779,3274,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,19057,236779,3723,236787,637,50347,50073,236787,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,43550,496,15323,236764,618,21566,8373,107,236865,107,236865,42056,236787,512,212922,236779,19057,236779,6678,236779,3723,623,4368,236775,623,972,25011,236745,236775,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,19057,236779,6678,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,19057,236779,6678,236779,3723,236787,130208,236770,236842,130208,236778,50190,107,236743,2263,8373,637,85622,185648,3165,236779,236748,212922,236779,19057,236779,3723,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236770,997,14132,580,21566,107,236743,512,212922,236779,19057,236779,3723,6610,236770,236775,6610,236778,236775,107,236743,3165,236779,236748,212922,236779,19057,236779,3723,236784,223680,107,236743,9263,997,4354,236881,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,997,14132,1135,21566,107,236743,768,870,6610,1899,236779,236748,212922,236779,19057,236779,3723,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,19057,236779,6678,236779,3723,236787,3165,236779,236748,212922,236779,19057,236779,3723,236787,609,1899,236779,236748,212922,236779,19057,236779,3723,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,19057,236779,6678,236779,3723,236787,637,50347,50073,236787,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,43550,496,15323,618,1816,107,236865,107,236865,42056,236787,512,212922,236779,19057,623,4368,236775,623,972,25011,236745,236775,107,236865,564,8435,550,236787,236743,236770,753,669,2028,531,1161,531,8729,496,637,85622,185648,107,236865,564,8435,550,236787,236743,236778,753,669,865,25011,236745,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,19057,825,642,107,236743,15862,623,236748,212922,236779,19057,236787,130208,236770,236842,130208,236778,50190,107,236743,2263,8373,1354,3165,236779,236748,212922,236779,19057,236779,3723,3165,236779,179400,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,107,236743,1354,47184,236748,212922,236779,19057,236779,3723,6610,236770,236775,6610,236778,1373,107,236743,3165,236779,236748,212922,236779,19057,236779,3723,236784,223680,107,236743,15862,623,236748,212922,236779,19057,236787,1354,236787,3498,17454,6610,500,113109,236745,236775,1109,61291,753,236755,1109,7559,756,236751,236786,973,236759,1606,17234,236775,107,236743,768,870,6610,1899,236779,236748,212922,236779,19057,236779,3723,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,19057,236787,3165,236779,236748,212922,236779,19057,236779,3723,236787,609,1899,236779,236748,212922,236779,19057,236779,3723,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,218484,236779,132064,6610,500,113109,236745,236775,1109,218484,753,236750,16150,236750,85622,185648,236775,107,236743,3165,236779,179400,236784,223680,107,236743,768,870,6610,1899,236779,179400,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,19057,236787,3165,236779,179400,236787,609,1899,236779,179400,130208,236750,85622,185648,50190,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,19057,236779,6678,236779,3723,236787,637,50347,50073,236787,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,43550,496,15323,618,21566,1816,107,236865,107,236865,42056,236787,512,212922,236779,19057,236779,6678,623,4368,236775,623,972,25011,236745,236775,107,236865,564,8435,550,236787,236743,236770,753,669,2028,531,1161,531,8729,496,637,85622,185648,107,236865,564,8435,550,236787,236743,236778,753,669,865,25011,236745,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,19057,236779,6678,825,642,107,236743,15862,623,236748,212922,236779,19057,236779,6678,236787,130208,236770,236842,130208,236778,50190,107,236743,2263,1757,3165,236779,236748,212922,236779,19057,236779,3723,3165,236779,179400,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236770,997,14132,580,21566,107,236743,512,212922,236779,19057,236779,3723,6610,236770,236775,6610,236778,236775,1109,1651,205249,236784,1676,753,236750,1757,236793,776,107,139,9263,753,236749,116478,179400,236779,132064,6610,1257,236775,1109,218484,753,236750,16150,236750,85622,185648,236775,16291,107,139,3165,236779,179400,236784,223680,107,139,768,870,6610,1899,236779,179400,236775,753,7037,236743,236771,20772,1299,107,141,3165,623,236748,212922,236779,19057,236779,6678,236787,3165,236779,179400,236787,609,1899,236779,179400,236775,107,141,637,50347,50073,609,56268,236779,18344,107,139,7999,107,236743,3028,107,236743,3165,236779,236748,212922,236779,19057,236779,3723,236784,223680,107,236743,9263,997,4354,236881,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,997,14132,1135,21566,107,236743,768,870,6610,1899,236779,236748,212922,236779,19057,236779,3723,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,19057,236779,6678,236787,3165,236779,236748,212922,236779,19057,236779,3723,236787,609,1899,236779,236748,212922,236779,19057,236779,3723,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,19057,236779,6678,236787,637,50347,50073,236787,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,73997,39104,107,107,236865,4987,784,10396,107,236865,107,236865,42056,236787,10396,56736,236748,212922,236779,28546,16291,107,236865,43228,32172,550,236787,8373,236764,236743,236770,10396,810,1757,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,28546,825,642,107,236743,15862,623,236748,212922,236779,28546,236775,107,236743,768,870,609,73313,3769,89458,236776,236779,56506,236779,88189,236773,33950,236840,103234,236783,753,4076,236743,236771,20772,1299,107,139,15862,623,236748,212922,236779,28546,236787,951,10396,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,9006,23951,236751,236785,236749,236789,15753,3769,89458,236776,236779,56506,236779,88189,236773,33950,236840,103234,10623,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,4140,496,3618,107,236865,107,236865,42056,236787,512,212922,236779,4375,236779,1282,623,10639,236775,623,4375,236775,107,236865,43228,32172,550,236787,7293,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,28546,236779,1282,825,642,107,236743,15862,623,236748,212922,236779,28546,236779,1282,236787,130208,236770,50190,107,236743,2263,3853,3618,107,236743,3853,16948,236770,236775,107,236743,3618,16948,236778,236775,107,236743,53418,89458,236776,236779,56506,236779,88189,236773,33950,23927,45457,8455,10639,8455,47901,236769,3723,236779,12977,236779,2394,6610,10639,1373,84252,3955,8455,47901,236769,3723,236779,12977,236779,2394,6610,4375,236775,147829,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,25179,784,10396,107,236865,107,236865,42056,236787,512,212922,236779,28546,236779,9347,107,236865,43228,32172,550,236787,7293,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,28546,236779,9347,825,642,107,236743,15862,623,1204,101671,753,512,212922,236779,28546,236779,9347,236775,107,236743,53418,89458,236776,236779,56506,236779,88189,236773,33950,9036,236768,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,73997,1527,107,236865,107,236865,42056,236787,512,212922,236779,28546,236779,2861,107,236865,43228,32172,550,236787,1548,529,10396,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,28546,236779,2861,825,642,107,236743,15862,623,236748,212922,236779,28546,236779,2861,236775,107,236743,9263,15753,236865,3769,89458,236776,236779,56506,236779,88189,236773,33950,236840,103234,10623,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,25380,39104,107,107,236865,25380,15323,2864,618,8373,107,236865,107,236865,42056,236787,512,212922,236779,12952,236779,3723,623,4368,236775,107,236865,564,8435,550,236787,236743,236770,753,2028,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,12952,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,12952,236779,3723,236787,130208,236770,50190,107,236743,2263,2028,8373,1354,3165,236779,3274,3165,236779,179400,236779,4375,236779,3955,107,107,236743,2028,16948,236770,236775,107,236743,768,870,753,236802,6610,4368,236775,20772,1299,107,139,3165,623,236748,212922,236779,12952,236779,3723,236787,9483,3790,7989,236761,42056,236787,512,212922,236779,12952,236779,3723,7339,4368,236785,8612,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,107,236743,997,13638,753,1161,218484,531,2016,8373,236881,2480,236786,82492,1099,3499,12804,107,236743,8373,68415,8455,4368,8455,47901,236769,3723,236779,12977,236779,2394,6610,4368,1373,84252,28546,236785,138609,107,236743,8373,23927,8989,8641,22389,236751,2098,15753,3769,89458,236776,236779,56506,236779,88189,236773,33950,236840,103234,17074,107,236743,8373,56736,17454,6610,3723,236775,1109,7559,756,236751,49766,199758,715,236759,85263,997,13356,1774,70922,107,236743,8373,154039,50190,107,236743,768,870,6610,3769,89458,236776,236779,56506,236779,61217,236775,753,4076,236743,236771,20772,1299,107,139,8373,154039,84252,6678,50416,4530,236775,107,236743,7999,107,236743,8373,23927,25938,236775,107,107,236743,1354,47184,236748,212922,236779,3677,236779,3274,9560,3677,236786,12952,236775,6610,3723,1373,107,236743,3165,236779,3274,236784,223680,107,236743,768,870,6610,1899,236779,3274,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,12952,236779,3723,236787,3165,236779,3274,236787,609,1899,236779,3274,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,107,236743,3004,47184,179400,236779,132064,6610,500,113109,236745,236775,1109,218484,753,236750,16150,4375,236761,3955,1373,107,236743,3165,236779,179400,236779,4375,236779,3955,236784,223680,107,236743,15862,623,236748,212922,236779,12952,236779,3723,236787,3004,236787,609,3955,236775,107,236743,768,870,6610,1899,236779,179400,236779,4375,236779,3955,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,12952,236779,3723,236787,3165,236779,179400,236779,4375,236779,3955,236787,609,1899,236779,179400,236779,4375,236779,3955,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,512,212922,236779,28546,236779,1282,623,111457,236775,6610,3955,236775,107,236743,9263,6610,500,113109,236745,236775,107,236783,107,107,236865,25380,15323,2864,618,1816,107,236865,107,236865,42056,236787,512,212922,236779,12952,623,4368,236775,107,236865,564,8435,550,236787,236743,236770,753,2028,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,12952,825,642,107,236743,15862,623,236748,212922,236779,12952,236787,130208,236770,50190,107,236743,2263,2028,3004,3165,236779,179400,236779,4375,236779,3955,107,236743,2028,16948,236770,236775,107,236743,768,870,753,236802,6610,4368,236775,20772,1299,107,139,3165,623,236748,212922,236779,12952,236787,9483,3790,7989,236761,42056,236787,512,212922,236779,12952,7339,4368,236785,8612,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,107,236743,3004,47184,179400,236779,132064,116478,236748,212922,236779,12952,236779,3723,6610,4368,236775,16291,1109,218484,753,236750,16150,4375,236761,3955,1373,107,236743,3165,236779,179400,236779,4375,236779,3955,236784,223680,107,236743,15862,623,236748,212922,236779,12952,236787,3004,236787,609,3955,236775,107,236743,768,870,6610,1899,236779,179400,236779,4375,236779,3955,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,12952,236787,3165,236779,179400,236779,4375,236779,3955,236787,609,1899,236779,179400,236779,4375,236779,3955,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,9263,6610,3955,236775,107,236743,512,212922,236779,28546,236779,1282,623,111457,236775,6610,3955,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,25380,15323,2864,618,21566,1816,107,236865,107,236865,42056,236787,512,212922,236779,12952,236779,6678,623,4368,236775,107,236865,564,8435,550,236787,236743,236770,753,2028,107,236865,43228,32172,550,236787,21566,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,12952,236779,6678,825,642,107,236743,15862,623,236748,212922,236779,12952,236779,6678,236787,130208,236770,50190,107,236743,2263,3165,236779,236748,212922,236779,12952,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236770,107,236743,512,212922,236779,12952,6610,236770,236775,107,236743,3165,236779,236748,212922,236779,12952,236784,223680,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,107,236743,768,870,6610,1899,236779,236748,212922,236779,12952,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,12952,236779,6678,236787,3165,236779,236748,212922,236779,12952,236787,609,1899,236779,236748,212922,236779,12952,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,25380,15323,2864,618,21566,8373,107,236865,107,236865,42056,236787,512,212922,236779,12952,236779,6678,236779,3723,623,4368,236775,107,236865,564,8435,550,236787,236743,236770,753,2028,107,236865,43228,32172,550,236787,21566,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,12952,236779,6678,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,12952,236779,6678,236779,3723,236787,130208,236770,50190,107,236743,2263,3165,236779,236748,212922,236779,3723,236779,12952,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236770,107,236743,512,212922,236779,12952,236779,3723,6610,236770,236775,107,236743,3165,236779,236748,212922,236779,3723,236779,12952,236784,223680,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,107,236743,768,870,6610,1899,236779,236748,212922,236779,3723,236779,12952,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,12952,236779,6678,236779,3723,236787,3165,236779,236748,212922,236779,3723,236779,12952,236787,609,1899,236779,236748,212922,236779,3723,236779,12952,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,4361,39104,107,107,236865,2343,496,138661,177846,4681,236764,71597,3567,107,236865,107,236865,42056,236787,512,212922,236779,2234,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,2234,825,642,107,236743,15862,623,236748,212922,236779,2234,236775,107,236743,2263,3165,236779,2234,107,236743,512,212922,1694,107,236743,3165,236779,2234,236784,223680,107,236743,768,870,6610,1899,236779,2234,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,2234,236787,3165,236779,2234,236787,609,1899,236779,2234,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,2343,496,138661,177846,4681,236764,10434,3567,107,236865,107,236865,42056,236787,512,212922,236779,2234,236779,3723,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,2234,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,2234,236779,3723,236775,107,236743,2263,3165,236779,236748,212922,236779,3677,236779,828,107,236743,512,212922,236779,3677,236779,828,9560,3677,236786,19112,236775,107,236743,3165,236779,236748,212922,236779,3677,236779,828,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,828,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,2234,236787,3165,236779,236748,212922,236779,3677,236779,828,236787,609,1899,236779,236748,212922,236779,3677,236779,828,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,2343,496,138661,177846,4681,236764,64830,3499,3567,107,236865,107,236865,42056,236787,4681,9036,8989,236748,212922,236779,2234,236779,2513,1223,107,236865,43228,32172,550,236787,2557,15914,1694,529,2028,5618,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,2234,236779,2513,825,642,107,236743,15862,623,236748,212922,236779,2234,236779,2513,236775,107,236743,2263,4681,3165,236779,2234,107,236743,997,4987,1694,699,512,212922,67336,236764,20327,1171,1757,568,20714,779,974,1171,1028,60945,236749,568,5900,779,4260,14434,236763,45628,107,236743,4681,9036,8989,236748,212922,1694,1109,33100,43836,584,568,30496,1890,236743,236770,236768,1887,609,236770,24768,1109,4260,1223,107,236743,3165,236779,2234,236784,223680,107,236743,768,870,6610,1899,236779,2234,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,2234,236779,2513,236787,3165,236779,2234,236787,609,1899,236779,2234,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,9263,15753,11245,236840,103234,10623,997,2557,15914,1694,529,2028,5618,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,9483,39104,107,107,236865,4987,496,4940,2028,107,236865,107,236865,42056,236787,512,212922,236779,4368,236779,7513,107,236865,43228,32172,550,236787,236743,236770,2028,1463,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4368,236779,7513,825,642,107,236743,15862,623,236748,212922,236779,4368,236779,7513,236775,107,236743,2263,4681,107,236743,4681,9036,8989,236748,212922,236779,2234,236779,2513,1223,107,236743,768,870,609,73313,11245,236840,103234,236783,753,4076,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4368,236779,7513,236787,2301,40121,7989,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,218673,47184,1896,236743,217474,236751,236908,236797,236768,997,10338,4940,607,163116,2289,900,67967,1050,42677,107,236743,9263,15753,11245,236840,147055,25053,73478,73313,11245,236840,103234,165075,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,1286,2335,496,2028,699,6571,107,236865,107,236865,42056,236787,512,212922,236779,4368,236779,219985,623,4368,236775,107,236865,564,8435,550,236787,236743,236770,753,9483,1463,531,121091,107,236865,43228,32172,550,236787,121091,1354,236764,528,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4368,236779,219985,825,642,107,236743,15862,1354,3165,236779,219985,107,236743,768,870,753,236802,6610,236770,236775,20772,1299,107,139,15862,623,3494,236787,512,212922,236779,4368,236779,219985,236787,951,2028,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,2263,637,85622,185648,1354,3165,236779,219985,107,236743,1354,47184,236748,212922,236779,3677,236779,3274,9560,3677,236786,19057,236775,32928,8455,4368,8455,47901,236769,3723,236779,12977,236779,2394,6610,236770,1373,84252,27611,236779,89911,50416,236771,17074,107,236743,3165,236779,219985,236784,223680,107,236743,768,870,6610,1899,236779,219985,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4368,236779,219985,236787,3165,236779,219985,236787,609,1899,236779,219985,1354,236787,130208,500,113109,236745,50190,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,997,13638,753,768,1354,563,3714,1899,12375,27388,25938,1299,3165,6610,27388,1721,637,50347,50073,609,56268,236779,18344,107,236743,9006,23951,236751,236785,236749,236789,6610,500,113109,236745,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,63023,39104,107,107,236865,18704,12211,522,2028,6585,236764,71597,3567,107,236865,107,236865,42056,236787,512,212922,236779,975,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,975,825,642,107,236743,15862,623,236748,212922,236779,975,236775,107,236743,512,212922,4929,107,236743,2263,3165,236779,236748,212922,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,975,236787,3165,236779,236748,212922,236787,609,1899,236779,236748,212922,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,18704,12211,522,2028,6585,236764,10434,3567,107,236865,107,236865,42056,236787,512,212922,236779,975,236779,3723,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,975,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,975,236779,3723,236775,107,236743,512,212922,236779,3677,236779,828,9560,3677,236786,975,236775,107,236743,2263,3165,236779,236748,212922,236779,3677,236779,828,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,828,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,975,236779,3723,236787,3165,236779,236748,212922,236779,3677,236779,828,236787,609,1899,236779,236748,212922,236779,3677,236779,828,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,8754,39104,107,107,236865,8754,2028,1938,236764,3309,3567,107,236865,107,236865,42056,236787,512,212922,236779,4919,623,4368,236775,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4919,825,642,107,236743,15862,623,236748,212922,236779,4919,236775,107,236743,512,212922,1407,6610,236770,236775,107,236743,2263,3165,236779,236748,212922,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4919,236787,3165,236779,236748,212922,236787,609,1899,236779,236748,212922,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,8754,2028,1938,236764,10434,3567,107,236865,107,236865,42056,236787,512,212922,236779,4919,236779,3723,623,4368,236775,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4919,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,4919,236779,3723,236775,107,236743,512,212922,236779,3677,236779,3274,9560,3677,236786,4919,236775,32928,8455,4368,8455,47901,236769,3723,236779,12977,236779,2394,6610,236770,236775,181339,107,236743,2263,3165,236779,236748,212922,236779,3677,236779,3274,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,3274,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4919,236779,3723,236787,3165,236779,236748,212922,236779,3677,236779,3274,236787,609,1899,236779,236748,212922,236779,3677,236779,3274,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,96412,2327,39104,107,107,236865,2375,96412,2327,10142,580,506,2263,1458,236881,107,236865,107,236865,42056,236787,768,512,212922,236779,63007,236793,1299,9263,623,51397,49751,169527,1721,1663,9263,623,51397,49751,3790,169527,1721,7999,107,236865,564,8435,550,236787,7293,107,236865,43228,32172,550,236787,7293,107,236865,630,50347,50073,236751,236787,236743,236771,768,96412,2327,563,10142,236764,236743,236770,768,96412,2327,563,711,10142,107,236748,212922,236779,63007,825,642,107,236743,15862,623,236748,212922,236779,63007,236775,107,236743,768,870,753,236802,116478,7674,753,236766,623,236748,212922,236775,236743,236778,236813,965,5099,236786,6455,16291,20772,1299,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,96412,2327,30214,530,2405,7016,107,236865,107,236865,42056,236787,512,212922,236779,17954,107,236865,564,8435,550,236787,7293,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,107,236748,212922,236779,17954,825,642,107,236743,9263,623,3769,89458,236776,236779,236796,56343,14436,236787,609,3769,89458,236776,236779,236796,56343,14436,236775,107,236743,9263,623,3769,89458,236776,236779,42447,236787,609,3769,89458,236776,236779,42447,236775,107,236743,9263,623,3769,89458,236776,236779,182533,236779,51700,11818,236787,609,3769,89458,236776,236779,182533,236779,51700,11818,236775,107,236743,9263,623,3769,89458,236776,236779,13740,236779,236798,49774,4070,236796,236779,9601,40693,236787,609,3769,89458,236776,236779,13740,236779,236798,49774,4070,236796,236779,9601,40693,236775,107,236743,9263,623,3769,89458,236776,236779,13740,236779,10524,30722,236788,236787,609,3769,89458,236776,236779,13740,236779,10524,30722,236788,236775,107,236743,9263,623,3769,89458,236776,236779,9601,40693,236787,609,3769,89458,236776,236779,9601,40693,236775,107,236743,9263,623,3769,89458,236776,236779,21834,236779,170928,2182,3387,236787,609,3769,89458,236776,236779,21834,236779,170928,2182,3387,236775,107,236743,9263,623,3769,89458,236776,236779,228751,45562,236788,236787,609,3769,89458,236776,236779,228751,45562,236788,236775,107,236743,9263,623,3769,89458,236776,236779,1579,197154,6510,236787,609,3769,89458,236776,236779,1579,197154,6510,236775,107,236743,9263,623,3769,89458,236776,236779,38622,2413,236779,129494,236787,609,3769,89458,236776,236779,38622,2413,236779,129494,236775,107,236743,9263,623,3769,89458,236776,236779,236811,63325,236814,236779,27039,131385,236787,609,3769,89458,236776,236779,236811,63325,236814,236779,27039,131385,236775,107,236743,9263,623,3769,89458,236776,236779,57137,236779,97044,236779,16252,236787,609,3769,89458,236776,236779,57137,236779,97044,236779,16252,236775,107,236743,9263,623,3769,89458,236776,236779,236798,42476,236779,56506,236794,9986,236787,609,3769,89458,236776,236779,236798,42476,236779,56506,236794,9986,236775,107,236743,9263,623,3769,89458,236776,236779,88477,236779,54338,38345,236787,609,3769,89458,236776,236779,88477,236779,54338,38345,236775,107,236743,9263,623,3769,89458,236776,236779,236798,49774,236796,236779,64872,236787,609,3769,89458,236776,236779,236798,49774,236796,236779,64872,236775,107,236743,9263,623,3769,89458,236776,236779,150114,7454,236787,609,3769,89458,236776,236779,150114,7454,236775,107,236743,9263,623,3769,89458,236776,236779,13740,236779,25291,1936,236787,609,3769,89458,236776,236779,13740,236779,25291,1936,236775,107,236743,9263,623,3769,89458,236776,236779,7018,150686,236787,609,3769,89458,236776,236779,7018,150686,236775,107,236743,9263,623,3769,89458,236776,236779,74048,134560,1089,236779,97044,236787,609,3769,89458,236776,236779,74048,134560,1089,236779,97044,236775,107,236743,9263,623,3769,89458,236776,236779,97054,236779,50005,22618,236814,236787,609,3769,89458,236776,236779,97054,236779,50005,22618,236814,236775,107,236743,9263,623,3769,89458,236776,236779,23807,236779,1439,22509,236788,236787,609,3769,89458,236776,236779,23807,236779,1439,22509,236788,236775,107,236743,9263,623,3769,89458,236776,236779,155469,236798,236779,88477,236787,609,3769,89458,236776,236779,155469,236798,236779,88477,236775,107,236743,9263,623,3769,89458,236776,236779,45562,172550,236779,7454,236787,609,3769,89458,236776,236779,45562,172550,236779,7454,236775,107,236743,9263,623,3769,89458,236776,236779,20721,236779,236788,69396,169409,14702,236787,609,3769,89458,236776,236779,20721,236779,236788,69396,169409,14702,236775,107,236743,9263,623,225266,236779,33238,236779,82375,60805,236787,609,225266,236779,33238,236779,82375,60805,236775,107,236743,9263,623,88477,236779,81690,236779,10069,55581,236787,609,88477,236779,81690,236779,10069,55581,236775,107,236743,9263,623,11767,236776,236779,54338,149326,236788,236779,236823,36991,236779,24767,236787,609,11767,236776,236779,54338,149326,236788,236779,236823,36991,236779,24767,236775,107,236743,9263,623,84176,236779,15573,236787,609,84176,236779,15573,236775,107,236743,9263,623,84176,236779,33238,236779,82375,60805,236787,609,84176,236779,33238,236779,82375,60805,236775,107,236743,9263,623,236794,105114,236779,33238,236779,82375,60805,236787,609,236794,105114,236779,33238,236779,82375,60805,236775,107,236743,9263,623,117214,5430,236779,117214,63418,236787,609,117214,5430,236779,117214,63418,236775,107,236743,9263,623,19749,236779,56506,236794,9986,236779,233148,236787,609,19749,236779,56506,236794,9986,236779,15573,236775,107,236743,9263,623,22005,236779,7719,85558,236874,236787,609,22005,236779,7719,85558,236874,236775,107,236743,9263,623,50020,19499,28580,236787,609,50020,19499,28580,236775,107,236743,997,17454,623,30903,236787,609,30903,236775,107,236743,9263,623,156346,236787,609,156346,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,96412,2327,3739,3567,236764,3309,3567,107,236865,107,236865,42056,236787,512,212922,236779,4406,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4406,825,642,107,236743,15862,623,236748,212922,236779,4406,236775,107,236743,512,212922,236779,3677,236779,828,9560,3677,236786,4406,236775,1109,218484,753,236750,16150,4406,236775,107,236743,2263,3165,236779,236748,212922,236779,3677,236779,828,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,828,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4406,236787,3165,236779,236748,212922,236779,3677,236779,828,236787,609,1899,236779,236748,212922,236779,3677,236779,828,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,96412,2327,3739,3567,236764,10434,3567,107,236865,107,236865,42056,236787,512,212922,236779,4406,236779,3723,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4406,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,4406,236779,3723,236775,107,236743,512,212922,236779,3677,236779,828,9560,3677,236786,4406,236775,107,236743,2263,3165,236779,236748,212922,236779,3677,236779,828,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,828,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4406,236779,3723,236787,3165,236779,236748,212922,236779,3677,236779,828,236787,609,1899,236779,236748,212922,236779,3677,236779,828,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,96412,2327,3739,3567,236764,71597,3567,107,236865,107,236865,42056,236787,512,212922,236779,4406,236779,31627,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4406,236779,31627,825,642,107,236743,15862,623,236748,212922,236779,4406,236779,31627,236775,107,236743,512,212922,2617,4406,107,236743,2263,3165,236779,236748,212922,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4406,236779,31627,236787,3165,236779,236748,212922,236787,609,1899,236779,236748,212922,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,57366,107,107,236865,79645,506,1548,529,21739,528,496,2483,107,236865,107,236865,42056,236787,10967,236779,31846,623,2383,236775,107,236865,42056,236787,31856,236787,10967,236779,31846,623,2383,236775,236743,236770,107,236865,43228,32172,550,236787,8369,10967,236764,531,70949,107,236865,43228,32172,550,236787,31856,236787,8369,10967,607,3165,2644,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,50257,236779,31846,825,642,107,236743,15862,623,50257,236779,31846,236775,997,609,236770,236775,107,236743,2263,2483,31856,21739,34282,4171,21739,63902,56256,21739,18065,17234,21739,107,107,236743,768,870,753,236745,236743,236771,20772,1299,997,3790,187480,2744,107,139,768,870,753,236760,6610,236770,236775,20772,1299,107,141,15862,623,41201,2483,699,2129,568,1187,236743,236770,563,16304,16291,107,141,2483,11631,71468,84476,236770,1373,107,139,7758,870,753,236749,6610,236770,236775,20772,1299,107,141,15862,623,41201,2483,699,2593,236743,236770,236775,107,141,2483,16948,236770,236775,107,139,1663,107,141,15862,623,35482,236787,10967,236779,31846,655,1005,236909,2383,236909,2164,236813,870,43181,236787,236743,236770,236842,16291,107,141,637,50347,50073,609,56268,236779,18344,107,139,7999,107,139,31856,19899,236778,16728,236771,236783,997,31856,563,2593,236743,236778,107,236743,1663,107,139,15862,623,41201,2483,699,187480,2744,236764,217793,688,236775,107,139,2483,47184,9307,236743,46181,107,139,31856,19899,236770,16728,236771,236783,997,31856,563,2593,236743,236770,107,236743,7999,107,236743,15862,623,43181,236787,609,43181,236775,107,107,236743,4171,47184,17454,6610,2383,236775,1109,61291,753,236765,236768,107,236743,56256,47184,8641,22389,236751,236775,6610,2383,236775,1109,61291,753,236757,236768,107,236743,17234,47184,8641,22389,236751,236775,6610,2383,236775,1109,61291,753,236755,236768,107,107,236743,21739,34282,47184,236769,568,8992,808,236743,236770,236771,236771,236768,965,236743,236832,236810,28909,997,236743,236770,8369,578,236743,236771,236761,236832,236810,4171,107,236743,15862,623,8992,141,1017,609,8992,236775,107,236743,15862,623,31846,34282,236787,609,31846,34282,236775,107,107,236743,21739,63902,47184,236769,568,50472,900,236743,236770,236768,965,236743,236812,28909,997,236743,236770,8369,578,236743,236812,505,77791,134487,5532,107,236743,15862,623,50472,141,1017,609,50472,236775,107,236743,15862,623,31846,63902,236787,609,31846,63902,236775,107,107,236743,21739,18065,47184,236769,568,18222,900,236743,236770,236768,965,236743,236812,28909,997,236743,236770,8369,578,236743,236812,17234,107,236743,15862,623,18222,141,1017,609,18222,236775,107,236743,15862,623,31846,18065,236787,609,31846,18065,236775,107,107,236743,997,4987,7488,10967,107,236743,21739,11631,31846,18065,107,236743,5960,21739,63902,1890,21739,28909,2732,21739,11631,31846,63902,107,236743,5960,21739,34282,1890,21739,28909,2732,21739,11631,31846,34282,107,236743,15862,623,31846,140,1017,609,31846,236775,107,107,236743,768,870,6610,43181,236775,753,4076,236743,236771,20772,1299,107,138,9263,6610,31846,236775,107,138,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236743,7999,107,107,236743,2263,1322,2631,9815,7762,9815,8554,3165,107,107,236743,1322,11631,31846,34282,107,236743,5960,21739,63902,655,1322,28909,2732,1322,11631,31846,63902,107,236743,5960,21739,18065,655,1322,28909,2732,1322,11631,31846,18065,107,236743,15862,623,1387,143,1017,609,1387,236775,107,107,236743,2631,11631,31846,34282,107,236743,5960,21739,63902,1890,2631,28909,2732,2631,11631,31846,63902,107,236743,5960,21739,18065,1890,2631,28909,2732,2631,11631,31846,18065,107,236743,15862,623,2074,143,1017,609,2074,236775,107,107,236743,9815,7762,47184,236769,2631,753,21739,28909,107,236743,15862,623,10617,7762,236743,1017,609,10617,7762,236775,107,107,236743,9815,8554,47184,236769,21739,753,1322,28909,107,236743,15862,623,10617,8554,236743,1017,609,10617,8554,236775,107,107,236743,3165,11631,10617,7762,107,236743,5960,3165,655,9815,8554,28909,2732,3165,11631,10617,8554,107,236743,15862,623,1899,141,1017,609,1899,236775,107,107,236743,9263,6610,31846,22820,609,1899,568,8572,609,1387,531,609,2074,16291,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,11565,39104,107,107,236865,11968,96412,2327,64830,11565,107,236865,107,236865,42056,236787,512,212922,236779,5285,236779,9869,107,236865,564,8435,550,236787,7293,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,5285,236779,9869,825,642,107,236743,9263,6610,3769,89458,236776,236779,56506,236779,11415,566,236795,3769,89458,236776,236779,56506,236779,24767,236775,107,236743,9263,107,236743,9263,623,236776,64830,13826,531,12740,607,96412,2327,236775,107,236743,9263,107,236743,9263,623,3769,89458,236776,236779,56506,236779,11415,140,1017,609,3769,89458,236776,236779,56506,236779,11415,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,24767,236743,1017,609,3769,89458,236776,236779,56506,236779,24767,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,6738,141,1017,609,3769,89458,236776,236779,56506,236779,6738,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,42515,236743,1017,609,3769,89458,236776,236779,56506,236779,42515,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,94957,204306,9658,236787,609,3769,89458,236776,236779,56506,236779,94957,204306,9658,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,236796,56343,14436,139,1017,609,3769,89458,236776,236779,56506,236779,236796,56343,14436,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,10252,141,1017,609,3769,89458,236776,236779,56506,236779,10252,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,61217,138,1017,609,3769,89458,236776,236779,56506,236779,61217,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,88189,236773,33950,1017,609,73313,3769,89458,236776,236779,56506,236779,88189,236773,33950,236840,103234,10623,107,236743,9263,107,236743,768,870,753,236802,116478,7674,753,236766,1028,121321,501,236743,236778,236813,965,5099,236786,6455,16291,20772,1299,107,139,15862,623,236748,212922,236779,5285,236779,9869,236787,1028,121321,501,3790,7989,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,9263,623,44962,10253,107,236743,9263,107,236743,1028,121321,501,753,236776,1292,1109,57297,756,236748,212922,85636,1109,4260,107,236783,107,107,236865,96412,2327,64830,11565,3567,107,236865,107,236865,42056,236787,512,212922,236779,5285,236779,4406,107,236865,564,8435,550,236787,7293,107,236865,43228,32172,550,236787,52322,3567,1548,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,107,236748,212922,236779,5285,236779,4406,825,642,107,236743,9263,6610,3769,89458,236776,236779,56506,236779,24767,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,106,107,105,4368,107,2094,563,496,777,235117,4410,532,1388,236772,65448,64830,9427,573,37860,607,506,96412,2327,9299,236761,5715,236789,236751,496,518,5389,86156,931,529,506,3393,236764,1061,75162,53649,1363,236764,532,207977,202817,236752,15955,236787,107,107,1018,33062,23718,532,7803,53121,107,107,236829,5213,140680,53121,669,3393,563,13957,1131,5151,236764,1546,18307,236748,149850,829,496,3530,4209,236761,1174,3590,625,3735,531,941,57905,624,236764,4883,236764,532,12975,236761,107,236829,5213,22631,11774,522,53121,12939,5618,659,569,31328,52070,532,1500,496,591,11875,30542,2165,236748,212922,236779,236929,865,210313,236781,236761,107,236829,5213,3494,71107,53121,236743,669,3393,5132,3165,16329,1699,2165,584,870,6610,1899,236779,236748,212922,236775,753,7037,236743,236771,236743,155192,531,6060,207977,202817,236752,4342,607,506,2165,236748,212922,236929,4991,236761,107,236829,5213,15928,229366,34667,53121,236743,65284,30214,530,2405,7016,568,236744,236761,236759,1126,2165,3769,89458,236776,236779,56506,236779,11415,8347,2165,3769,89458,236776,236779,56506,236779,24767,18833,531,26955,506,9427,236761,107,236829,5213,6294,43290,113027,53121,236743,7714,1292,815,496,5739,3355,26804,1061,5708,236764,14120,236764,2744,236764,3938,236764,532,637,50347,50073,1550,236761,236743,1174,563,7516,236888,107,236829,5213,45668,39104,53121,49308,11045,14955,5151,1133,2165,50257,236779,31846,236929,532,2165,236748,212922,236779,5285,236779,9869,21233,107,107,1018,11813,2795,15919,86156,931,532,107182,53121,107,107,236829,5213,236929,236748,212922,236779,5285,236779,9869,236929,53121,236743,64253,1938,1003,506,9427,4850,236764,2440,1061,1463,236764,3567,236764,10739,236764,10945,236764,532,496,1694,529,5151,236761,236743,65284,2165,1364,121321,501,236929,531,6331,236747,6639,236762,8729,506,1694,529,5151,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,4406,236929,53121,236743,630,50347,50073,236751,506,3567,1548,529,506,9427,236761,107,236829,5213,236929,50257,236779,31846,236929,53121,236743,87848,506,1548,529,21739,528,496,2238,2483,236761,236743,1030,19171,1800,2129,2744,532,187480,2744,236761,236743,1030,4728,1800,10445,8369,1527,532,496,2644,529,9460,21739,607,496,10805,8448,236761,107,236829,5213,236929,236748,212922,236779,4406,236929,53121,236743,34534,506,3567,529,506,96412,2327,3739,236761,107,236829,5213,236929,236748,212922,236779,4406,236779,3723,236929,53121,34534,506,3567,529,506,96412,2327,3739,532,637,50347,50073,236751,625,528,10434,6518,236761,107,236829,5213,236929,236748,212922,236779,4406,236779,31627,236929,53121,34534,506,3567,529,506,96412,2327,3739,1699,506,2165,236748,212922,2617,4406,236929,4991,236761,107,236829,5213,236929,50257,236779,31846,236929,53121,236743,1174,1292,563,1388,236772,25217,532,19171,1607,2744,4458,122605,236761,669,8369,22851,13179,563,236743,22208,236748,32654,236764,1699,496,3364,222056,157191,84986,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,1201,236929,53121,236743,84875,506,1463,529,506,9427,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,4406,236929,53121,236743,84875,506,3567,529,506,9427,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,2451,236929,53121,236743,84875,506,10739,529,506,9427,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,31455,236929,53121,236743,84875,506,10945,529,506,9427,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,1364,75733,656,236929,53121,236743,84875,506,1028,75733,656,1938,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,11118,236929,53121,236743,84875,506,15862,8134,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,3677,236929,53121,236743,84875,506,9299,3567,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,6678,236929,53121,236743,84875,506,6381,8134,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,28546,236929,53121,236743,84875,506,10396,8134,236761,107,107,1018,33071,501,202817,236752,15827,16750,4104,532,1700,2897,7838,53121,107,107,236829,5213,236777,8435,550,55163,53121,236743,669,2165,50257,236779,31846,236929,1292,1451,2445,210313,236745,699,919,637,157043,236745,2744,18256,236761,236743,1701,2591,236764,625,1451,2426,768,506,2744,563,496,4341,2483,653,496,4341,2129,2479,236761,107,236829,5213,3494,71107,528,2165,50257,236779,31846,236929,53121,236743,669,2165,50257,236779,31846,236929,1292,4038,236789,236745,6060,207977,202817,236752,9825,1056,6013,699,496,2129,236761,236743,1700,2897,236750,8009,3165,12804,531,122605,6060,3636,1298,506,2129,4038,236789,236745,545,15194,236745,653,563,711,116479,147253,519,236761,107,236829,5213,9474,122775,30121,88098,53121,669,8369,22851,786,52214,236753,563,496,3606,222056,157191,84986,236761,236743,1701,919,1226,81306,654,8369,18558,236764,591,2897,236750,1699,496,11554,15493,135553,567,9427,653,9299,236761,236743,3153,236764,672,1093,1138,496,39604,236761,107,236829,5213,9146,236772,4539,78777,53121,236743,1700,2897,236750,1699,2165,828,33997,236929,531,6060,4991,236772,1257,12130,573,506,5151,236761,236743,1174,1093,1386,506,9427,919,11737,5119,1148,532,8722,531,1161,236761,107,236829,5213,6294,43290,113027,32955,53121,236743,6890,496,5904,1133,2165,2320,236781,13091,501,236929,653,2165,192341,30376,236929,531,11269,8729,776,43290,113027,699,506,3393,8968,236761,107,236829,5213,26653,53121,236743,15642,4360,7713,531,5330,506,11289,236755,5219,634,529,506,5151,236761,107,236829,5213,13375,2929,236748,59135,17357,236744,7838,53121,236743,1701,1440,236772,24825,6675,236764,591,2897,236750,1699,7410,2929,236748,59135,6675,531,5571,29998,506,1689,8583,236761,236743,1174,1093,4006,506,637,85622,236749,5399,236766,17412,529,506,3739,236761,107,236829,5213,9474,39104,53121,236743,1700,2897,236750,8009,5151,573,1032,3364,9395,236764,1288,618,236787,107,139,808,18704,12211,522,496,2028,107,139,808,153554,496,2028,107,139,808,76592,496,138661,177846,4681,107,139,808,37641,506,96412,2327,1262,12229,107,236829,5213,236929,43181,236929,8134,53121,669,2165,43181,236929,8134,528,2165,50257,236779,31846,236929,563,711,1388,236772,22503,236761,1030,236789,236751,711,3582,1144,625,1677,236761,236743,1700,2897,236750,197205,625,531,2613,919,569,31328,52070,236764,1288,618,2165,11118,236929,653,2165,135615,21233,107,236829,5213,236929,1364,121321,501,236929,14120,53121,669,1161,529,2165,1364,121321,501,236929,531,8729,506,1694,529,5151,528,2165,236748,212922,236779,5285,236779,9869,236929,563,496,3103,4935,48894,236744,236761,236743,1637,506,9427,563,10448,236764,506,3938,529,2165,1364,121321,501,236929,2473,2352,236761,236743,1700,2897,236750,496,919,637,157043,236745,850,229773,574,236764,1288,618,496,92604,1694,529,5151,236761,107,107,1018,12703,42056,53121,107,107,2717,42422,107,236865,4987,506,96412,2327,3567,107,236748,236779,4406,107,107,236865,79645,506,1548,529,21739,528,496,2483,107,236748,236779,50257,236779,31846,623,2094,563,496,1594,2483,1781,107,107,236865,79645,506,1548,529,21739,528,496,2129,107,236748,236779,50257,236779,31846,1041,236779,1005,236779,2164,236761,7090,107,107,236865,4987,1938,1003,506,9427,107,236748,236779,5285,236779,9869,107,107,236865,4987,506,9427,3567,107,236748,236779,5285,236779,4406,107,107,236865,4987,506,9427,3567,528,10434,6518,107,236748,236779,5285,236779,4406,236779,3723,107,107,236865,4987,506,9427,3567,1699,506,71597,107,236748,236779,5285,236779,4406,236779,31627,107,107,236865,79645,21739,607,31856,3938,107,236748,236779,50257,236779,31846,623,2094,563,496,1594,2483,1781,236743,236770,107,2717,107,107,1018,902,12323,236764,672,563,496,1388,236772,25217,532,6684,64830,9427,573,37860,607,506,96412,2327,9299,236761,236743,3763,772,76036,236751,23679,506,207977,202817,236752,15955,3349,24709,1718,2787,236764,611,740,1386,625,1581,919,637,157043,236745,236764,11737,5119,1148,236764,532,77819,1389,32654,99382],"total_duration":121446101958,"load_duration":72772542,"prompt_eval_count":4096,"prompt_eval_duration":58920288583,"eval_count":1259,"eval_duration":62452240208}]
[DEBUG] jq_sanitized: sanitized: [{"model":"gemma3n:e4b","created_at":"2025-07-30T17:50:58.576592Z","response":"This is a comprehensive and well-structured Bash library for interacting with the Ollama API. Here's a breakdown of the code, its functionality, and potential improvements:

**Overall Structure and Design:**

* **Modular:** The code is organized into functions, each performing a specific task. This makes it easy to understand, maintain, and extend.
* **Clear Naming:** Function names are descriptive and follow a consistent `ollama_` prefix.
* **Error Handling:**  The code includes error checking using `if [ \"$error_ollama\" -gt 0 ]` to handle potential issues with the `ollama` command.
* **Configuration:**  Uses environment variables (e.g., `OLLAMA_LIB_NAME`, `OLLAMA_LIB_VERSION`) to configure the library.
* **Documentation:**  Each function has a comment block explaining its purpose, usage, input, output, and return value.  This is excellent!
* **Utility Functions:** Includes helpful utility functions like `estimate_tokens` and `ollama_lib_about`.

**Function Breakdown and Explanation:**

* **`ollama_lib_about`:**  Provides information about the library itself, including its name, version, URL, license, and a list of functions.  Uses `compgen` to dynamically generate the list of functions.
* **`ollama_lib_version`:**  Returns the version number of the library.
* **`estimate_tokens`:**  Estimates the number of tokens in a given string.  It handles both file input and piped input.  It provides both raw token count and a range of estimated tokens with a confidence interval.
* **`ollama_version`:**  Gets the version of the Ollama application.
* **`ollama_version_json`:** Gets the version of the Ollama application and returns it in JSON format.
* **`ollama_version_cli`:** Gets the version of the Ollama application using the `ollama --version` command.
* **`estimate_tokens`:**  This function is well-written and handles different input types gracefully. The token estimation logic is reasonable, using a common approximation.
* **`ollama_lib_name`:**  Prints the name of the library.
* **`ollama_lib_version`:**  Prints the version of the library.
* **`ollama_lib_url`:**  Prints the URL of the library.
* **`ollama_lib_license`:**  Prints the license of the library.
* **`ollama_lib_copyright`:**  Prints the copyright information.
* **`ollama_lib_debug`:**  Prints the debug flag.
* **`ollama_lib_api`:**  Prints the API version.
* **`ollama_lib_stream`:**  Prints the stream flag.
* **`ollama_lib_messages`:**  Prints the messages flag.

**Potential Improvements and Considerations:**

* **Input Validation:**  The `estimate_tokens` function could benefit from more robust input validation.  For example, it could check if the input is a valid string or a valid file path.
* **Error Handling in `estimate_tokens`:**  The `estimate_tokens` function doesn't handle potential errors when reading from a file.  Consider adding error handling to gracefully handle cases where the file doesn't exist or is not readable.
* **More Robust Token Estimation:** The token estimation method is a simple approximation.  For more accurate token counts, consider using a dedicated tokenization library or API.  However, this would add a dependency.
* **Command-Line Arguments:**  Consider using `getopts` to handle command-line arguments for the functions.  This would make the library more flexible and easier to use.
* **Documentation Generation:**  Use a tool like `doxygen` or `Sphinx` to automatically generate documentation from the code comments.
* **Testing:**  Write unit tests to ensure the correctness of the functions.
* **Asynchronous Operations:**  For long-running operations, consider using asynchronous operations to avoid blocking the main thread.  This would improve the responsiveness of the application.
* **More Functions:**  Consider adding functions for other common tasks, such as:
    * Running a model
    * Downloading a model
    * Listing available models
    * Managing the Ollama data directory
* **`verbose` flag:** The `verbose` flag in `estimate_tokens` is not well-defined. It's not clear what it does.  Consider renaming it to something more descriptive, such as `debug` or `detailed`.
* **`compgen` usage:** The use of `compgen` to generate the list of functions in `ollama_lib_about` is a bit fragile.  If the library is updated, the output of `compgen` might change.  Consider a more robust approach, such as a predefined list of functions.

**Example Usage:**

```bash
# Get the Ollama version
o_version

# Estimate the number of tokens in a string
o_estimate_tokens \"This is a test string.\"

# Estimate the number of tokens in a file
o_estimate_tokens my_text_file.txt

# Get information about the library
o_lib_about

# Get the library version
o_lib_version

# Get the library version in JSON format
o_lib_version_json

# Get the library version using the CLI
o_lib_version_cli

# Estimate tokens with verbose output
o_estimate_tokens \"This is a test string.\" 1
```

**In summary, this is a well-written and useful Bash library for interacting with the Ollama API.  By addressing the potential improvements outlined above, you can make it even more robust, flexible, and maintainable.**","done":true,"done_reason":"stop","context":[105,2364,107,3895,618,614,7710,37293,15088,733,31016,236761,107,6294,496,2587,3393,3540,529,672,55299,8948,236787,107,107,38752,20268,236786,6264,236786,7291,55299,107,236865,107,236865,96412,2327,64830,11565,753,562,64830,13826,531,12740,607,96412,2327,107,236865,107,107,3769,89458,236776,236779,56506,236779,11415,718,51397,49751,64830,11565,236775,107,3769,89458,236776,236779,56506,236779,24767,718,236771,236761,236800,236819,236761,236778,236775,107,3769,89458,236776,236779,56506,236779,6738,718,2574,1411,4995,87285,236763,236761,854,236786,1667,9118,236786,236748,212922,236772,42422,236772,5285,236775,107,3769,89458,236776,236779,56506,236779,42515,718,36320,236775,107,3769,89458,236776,236779,56506,236779,94957,204306,9658,718,32090,568,236755,236768,236743,236778,236771,236778,236810,7058,9118,593,166652,539,655,2574,1411,4995,87285,236763,236761,854,236786,1667,9118,47005,107,107,3769,89458,236776,236779,56506,236779,10252,19899,3769,89458,236776,236779,42447,236787,31621,2855,1411,3022,207986,540,236787,236770,236770,236812,236800,236812,25938,997,96412,2327,9299,10739,236764,2301,70922,657,1345,107,3769,89458,236776,236779,56506,236779,236796,56343,14436,236784,236771,140,997,236743,236771,578,2301,15862,10396,236764,236743,236770,578,8438,15862,10396,107,3769,89458,236776,236779,56506,236779,88189,236773,33950,9036,236768,997,8199,529,10396,107,3769,89458,236776,236779,56506,236779,61217,236784,236771,139,997,236743,236771,578,2301,21566,236764,236743,236770,578,8438,21566,107,56268,236779,236773,13551,33811,236773,236784,236771,142,997,13029,2630,637,50347,50073,1550,107,56268,236779,18344,236784,236770,144,997,13029,3165,637,50347,50073,1550,107,107,236865,26946,39104,107,107,236865,32063,3618,107,236865,107,236865,42056,236787,15862,623,4375,236775,107,236865,564,8435,550,236787,236743,236770,753,506,15862,3618,107,236865,43228,32172,550,236787,3618,531,85542,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,11118,825,642,107,236743,768,870,6610,3769,89458,236776,236779,56506,236779,236796,56343,14436,236775,753,4076,623,236770,236775,20772,1299,107,140,29094,236778,9263,753,236744,28286,236796,56343,14436,236842,609,236770,236775,107,236743,7999,107,236743,637,50347,50073,236743,223680,107,236783,107,107,236865,11489,3618,107,236865,107,236865,42056,236787,3165,623,4375,236775,107,236865,564,8435,550,236787,236743,236770,753,506,3165,3618,107,236865,43228,32172,550,236787,3618,531,85542,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,1899,825,642,107,138,29094,236778,9263,753,236744,28286,18344,236842,609,236770,236775,107,236743,997,11113,34953,236754,113843,1001,87144,519,236784,7427,236778,236800,236778,236771,107,236743,637,50347,50073,236743,223680,107,236783,107,107,236865,68980,496,2483,573,1161,618,496,10434,1550,107,236865,107,236865,42056,236787,8373,236779,12977,236779,2394,623,2383,236775,107,236865,564,8435,550,236787,236743,236770,753,669,2483,531,14317,107,236865,43228,32172,550,236787,623,148758,6338,8373,1550,236775,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,218484,3165,107,3723,236779,12977,236779,2394,825,642,107,236743,15862,623,3723,236779,12977,236779,2394,236787,3498,17454,6610,236770,236775,1109,61291,753,236755,1109,7559,756,236751,236786,973,236759,1606,17234,130208,236770,50190,107,236743,2263,3165,236779,179400,107,236743,218484,753,130968,2617,1187,1540,6610,236770,236775,36467,1714,236789,107,236743,3165,236779,179400,236784,223680,107,236743,768,870,6610,1899,236779,179400,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,3723,236779,12977,236779,2394,236787,3165,236779,179400,236787,609,1899,236779,179400,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,5054,77372,496,2483,573,218484,1161,107,236865,107,236865,42056,236787,218484,236779,132064,623,2383,236775,107,236865,564,8435,550,236787,236743,236770,753,669,2483,531,118270,107,236865,43228,32172,550,236787,211883,2483,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,179400,236779,132064,825,642,107,236743,15862,623,179400,236779,132064,236787,3498,17454,6610,236770,236775,1109,61291,753,236755,1109,7559,756,236751,236786,973,236759,1606,17234,130208,236770,50190,107,236743,2263,211883,107,236743,211883,16948,236770,236775,107,236743,997,44635,41985,637,50347,50073,236751,568,6459,236764,562,199884,236777,236743,236770,236800,236768,607,37087,621,236750,107,236743,211883,47184,8641,23951,236751,236789,6610,236770,236775,1109,7559,219051,236751,17804,236750,17804,97292,236750,236786,236759,1606,107,236743,997,44635,770,76033,1472,568,43102,236764,562,199884,236777,236743,236770,236771,236768,607,37087,621,236749,1699,33100,236764,1299,13356,1626,37087,621,236749,107,236743,211883,47184,8641,23951,236751,236789,6610,29321,185165,236775,1109,33100,43836,236743,15494,96508,236785,236749,1721,1887,236743,24768,1109,7559,756,236751,17804,236785,236749,9907,107914,107,236743,997,22221,784,2256,56256,236743,236771,236772,236819,236764,236743,236770,236770,236772,236770,236778,236764,236743,236770,236812,236772,236800,236770,107,236743,211883,47184,8641,23951,236751,236789,6610,29321,185165,236775,1109,719,753,236753,16594,236771,236771,236771,2242,236771,236770,236770,236785,236771,236770,236800,236785,236771,236770,236812,236785,236771,236770,236825,2242,236771,236800,236832,1606,107,236743,9006,23951,236751,236785,236749,236789,6610,29321,185165,236775,107,236743,15862,623,179400,236779,29321,185165,236787,211883,236787,130208,29321,185165,50190,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,9299,39104,107,107,236865,20088,2864,531,506,96412,2327,9299,107,236865,107,236865,42056,236787,512,212922,236779,3677,236779,828,9560,3677,236786,2337,236775,107,236865,564,8435,550,236787,236743,236770,578,9299,10739,2479,107,236865,43228,32172,550,236787,9299,2246,1354,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,3677,236779,828,825,642,107,236743,15862,623,236748,212922,236779,3677,236779,828,236787,130208,236770,50190,107,236743,2263,1354,3165,236779,40192,107,236743,24268,753,236751,753,236917,20088,15753,3769,89458,236776,236779,56506,236779,10252,823,236770,236775,753,236814,756,4795,236772,2328,236787,3739,236786,3723,236789,107,236743,3165,236779,40192,236784,223680,107,236743,768,870,6610,1899,236779,40192,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,3677,236779,828,236787,3165,236779,40192,236787,609,1899,236779,40192,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,3677,236779,828,236787,637,50347,50073,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,25544,2864,531,506,96412,2327,9299,107,236865,107,236865,42056,236787,512,212922,236779,3677,236779,3274,9560,3677,236786,2337,236775,32928,8373,3004,123792,107,236865,564,8435,550,236787,236743,236770,753,9299,10739,2479,107,236865,564,8435,550,236787,236743,236778,753,10434,3004,107,236865,43228,32172,550,236787,9299,2246,1354,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,3677,236779,3274,825,642,107,236743,15862,623,236748,212922,236779,3677,236779,3274,236787,130208,236770,236842,130208,236778,50190,107,236743,2263,1354,3165,236779,40192,107,236743,24268,753,236751,753,236917,25544,15753,3769,89458,236776,236779,56506,236779,10252,823,236770,236775,753,236814,756,4795,236772,2328,236787,3739,236786,3723,236789,753,236753,6610,236778,236775,107,236743,3165,236779,40192,236784,223680,107,236743,768,870,6610,1899,236779,40192,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,3677,236779,828,236787,3165,236779,40192,236787,609,1899,236779,40192,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,3677,236779,3274,236787,637,50347,50073,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,65113,506,96412,2327,9299,107,236865,107,236865,42056,236787,512,212922,236779,3677,236779,21787,107,236865,564,8435,550,236787,7293,107,236865,43228,32172,550,236787,7293,107,236865,630,50347,50073,236751,236787,236743,236771,768,9299,563,125466,236764,236743,236770,768,9299,563,711,125466,107,236748,212922,236779,3677,236779,21787,825,642,107,236743,15862,623,236748,212922,236779,3677,236779,21787,236775,107,236743,2263,1354,14017,236779,828,236779,1899,107,236743,1354,47184,236748,212922,236779,3677,236779,828,25682,107,236743,14017,236779,828,236779,1899,236784,223680,107,236743,768,870,6610,3677,236779,828,236779,1899,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,3677,236779,21787,236787,3165,236787,609,3677,236779,828,236779,1899,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,768,15385,6610,500,113109,236745,236775,1251,623,51397,49751,563,4710,236775,87038,1299,107,139,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236743,7999,107,236743,3165,623,236748,212922,236779,3677,236779,21787,236787,11908,1354,236787,130208,500,113109,236745,50190,107,236743,637,50347,50073,609,56268,236779,18344,107,236783,107,107,236865,43550,39104,107,107,236865,43550,496,15323,618,8373,107,236865,107,236865,42056,236787,512,212922,236779,19057,236779,3723,623,4368,236775,623,972,25011,236745,236775,107,236865,564,8435,550,236787,236743,236770,753,669,2028,531,1161,531,8729,496,637,85622,185648,107,236865,564,8435,550,236787,236743,236778,753,669,865,25011,236745,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,19057,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,19057,236779,3723,236787,130208,236770,236842,130208,236778,50190,107,236743,15862,623,236748,212922,236779,19057,236779,3723,236787,53418,89458,236776,236779,56506,236779,61217,236787,609,3769,89458,236776,236779,56506,236779,61217,236775,107,236743,2263,8373,3165,236779,236748,212922,236779,3677,236779,3274,107,236743,8373,68415,8455,4368,8455,47901,236769,3723,236779,12977,236779,2394,6610,236770,1373,84252,972,25011,236745,8455,47901,236769,3723,236779,12977,236779,2394,6610,236778,236775,16291,107,236743,768,870,6610,3769,89458,236776,236779,56506,236779,61217,236775,753,4076,623,236771,236775,20772,1299,107,139,8373,154039,84252,6678,50416,4530,236775,107,236743,7999,107,236743,8373,23927,25938,236775,107,236743,512,212922,236779,3677,236779,3274,9560,3677,236786,19057,236775,6610,3723,236775,107,236743,3165,236779,236748,212922,236779,3677,236779,3274,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,3274,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,19057,236779,3723,236787,3165,236779,236748,212922,236779,3677,236779,3274,236787,609,1899,236779,236748,212922,236779,3677,236779,3274,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,19057,236779,3723,236787,637,50347,50073,236787,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,43550,496,15323,236764,618,21566,8373,107,236865,107,236865,42056,236787,512,212922,236779,19057,236779,6678,236779,3723,623,4368,236775,623,972,25011,236745,236775,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,19057,236779,6678,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,19057,236779,6678,236779,3723,236787,130208,236770,236842,130208,236778,50190,107,236743,2263,8373,637,85622,185648,3165,236779,236748,212922,236779,19057,236779,3723,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236770,997,14132,580,21566,107,236743,512,212922,236779,19057,236779,3723,6610,236770,236775,6610,236778,236775,107,236743,3165,236779,236748,212922,236779,19057,236779,3723,236784,223680,107,236743,9263,997,4354,236881,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,997,14132,1135,21566,107,236743,768,870,6610,1899,236779,236748,212922,236779,19057,236779,3723,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,19057,236779,6678,236779,3723,236787,3165,236779,236748,212922,236779,19057,236779,3723,236787,609,1899,236779,236748,212922,236779,19057,236779,3723,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,19057,236779,6678,236779,3723,236787,637,50347,50073,236787,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,43550,496,15323,618,1816,107,236865,107,236865,42056,236787,512,212922,236779,19057,623,4368,236775,623,972,25011,236745,236775,107,236865,564,8435,550,236787,236743,236770,753,669,2028,531,1161,531,8729,496,637,85622,185648,107,236865,564,8435,550,236787,236743,236778,753,669,865,25011,236745,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,19057,825,642,107,236743,15862,623,236748,212922,236779,19057,236787,130208,236770,236842,130208,236778,50190,107,236743,2263,8373,1354,3165,236779,236748,212922,236779,19057,236779,3723,3165,236779,179400,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,107,236743,1354,47184,236748,212922,236779,19057,236779,3723,6610,236770,236775,6610,236778,1373,107,236743,3165,236779,236748,212922,236779,19057,236779,3723,236784,223680,107,236743,15862,623,236748,212922,236779,19057,236787,1354,236787,3498,17454,6610,500,113109,236745,236775,1109,61291,753,236755,1109,7559,756,236751,236786,973,236759,1606,17234,236775,107,236743,768,870,6610,1899,236779,236748,212922,236779,19057,236779,3723,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,19057,236787,3165,236779,236748,212922,236779,19057,236779,3723,236787,609,1899,236779,236748,212922,236779,19057,236779,3723,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,218484,236779,132064,6610,500,113109,236745,236775,1109,218484,753,236750,16150,236750,85622,185648,236775,107,236743,3165,236779,179400,236784,223680,107,236743,768,870,6610,1899,236779,179400,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,19057,236787,3165,236779,179400,236787,609,1899,236779,179400,130208,236750,85622,185648,50190,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,19057,236779,6678,236779,3723,236787,637,50347,50073,236787,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,43550,496,15323,618,21566,1816,107,236865,107,236865,42056,236787,512,212922,236779,19057,236779,6678,623,4368,236775,623,972,25011,236745,236775,107,236865,564,8435,550,236787,236743,236770,753,669,2028,531,1161,531,8729,496,637,85622,185648,107,236865,564,8435,550,236787,236743,236778,753,669,865,25011,236745,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,19057,236779,6678,825,642,107,236743,15862,623,236748,212922,236779,19057,236779,6678,236787,130208,236770,236842,130208,236778,50190,107,236743,2263,1757,3165,236779,236748,212922,236779,19057,236779,3723,3165,236779,179400,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236770,997,14132,580,21566,107,236743,512,212922,236779,19057,236779,3723,6610,236770,236775,6610,236778,236775,1109,1651,205249,236784,1676,753,236750,1757,236793,776,107,139,9263,753,236749,116478,179400,236779,132064,6610,1257,236775,1109,218484,753,236750,16150,236750,85622,185648,236775,16291,107,139,3165,236779,179400,236784,223680,107,139,768,870,6610,1899,236779,179400,236775,753,7037,236743,236771,20772,1299,107,141,3165,623,236748,212922,236779,19057,236779,6678,236787,3165,236779,179400,236787,609,1899,236779,179400,236775,107,141,637,50347,50073,609,56268,236779,18344,107,139,7999,107,236743,3028,107,236743,3165,236779,236748,212922,236779,19057,236779,3723,236784,223680,107,236743,9263,997,4354,236881,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,997,14132,1135,21566,107,236743,768,870,6610,1899,236779,236748,212922,236779,19057,236779,3723,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,19057,236779,6678,236787,3165,236779,236748,212922,236779,19057,236779,3723,236787,609,1899,236779,236748,212922,236779,19057,236779,3723,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,15862,623,236748,212922,236779,19057,236779,6678,236787,637,50347,50073,236787,236743,236771,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,73997,39104,107,107,236865,4987,784,10396,107,236865,107,236865,42056,236787,10396,56736,236748,212922,236779,28546,16291,107,236865,43228,32172,550,236787,8373,236764,236743,236770,10396,810,1757,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,28546,825,642,107,236743,15862,623,236748,212922,236779,28546,236775,107,236743,768,870,609,73313,3769,89458,236776,236779,56506,236779,88189,236773,33950,236840,103234,236783,753,4076,236743,236771,20772,1299,107,139,15862,623,236748,212922,236779,28546,236787,951,10396,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,9006,23951,236751,236785,236749,236789,15753,3769,89458,236776,236779,56506,236779,88189,236773,33950,236840,103234,10623,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,4140,496,3618,107,236865,107,236865,42056,236787,512,212922,236779,4375,236779,1282,623,10639,236775,623,4375,236775,107,236865,43228,32172,550,236787,7293,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,28546,236779,1282,825,642,107,236743,15862,623,236748,212922,236779,28546,236779,1282,236787,130208,236770,50190,107,236743,2263,3853,3618,107,236743,3853,16948,236770,236775,107,236743,3618,16948,236778,236775,107,236743,53418,89458,236776,236779,56506,236779,88189,236773,33950,23927,45457,8455,10639,8455,47901,236769,3723,236779,12977,236779,2394,6610,10639,1373,84252,3955,8455,47901,236769,3723,236779,12977,236779,2394,6610,4375,236775,147829,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,25179,784,10396,107,236865,107,236865,42056,236787,512,212922,236779,28546,236779,9347,107,236865,43228,32172,550,236787,7293,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,28546,236779,9347,825,642,107,236743,15862,623,1204,101671,753,512,212922,236779,28546,236779,9347,236775,107,236743,53418,89458,236776,236779,56506,236779,88189,236773,33950,9036,236768,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,73997,1527,107,236865,107,236865,42056,236787,512,212922,236779,28546,236779,2861,107,236865,43228,32172,550,236787,1548,529,10396,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,28546,236779,2861,825,642,107,236743,15862,623,236748,212922,236779,28546,236779,2861,236775,107,236743,9263,15753,236865,3769,89458,236776,236779,56506,236779,88189,236773,33950,236840,103234,10623,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,25380,39104,107,107,236865,25380,15323,2864,618,8373,107,236865,107,236865,42056,236787,512,212922,236779,12952,236779,3723,623,4368,236775,107,236865,564,8435,550,236787,236743,236770,753,2028,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,12952,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,12952,236779,3723,236787,130208,236770,50190,107,236743,2263,2028,8373,1354,3165,236779,3274,3165,236779,179400,236779,4375,236779,3955,107,107,236743,2028,16948,236770,236775,107,236743,768,870,753,236802,6610,4368,236775,20772,1299,107,139,3165,623,236748,212922,236779,12952,236779,3723,236787,9483,3790,7989,236761,42056,236787,512,212922,236779,12952,236779,3723,7339,4368,236785,8612,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,107,236743,997,13638,753,1161,218484,531,2016,8373,236881,2480,236786,82492,1099,3499,12804,107,236743,8373,68415,8455,4368,8455,47901,236769,3723,236779,12977,236779,2394,6610,4368,1373,84252,28546,236785,138609,107,236743,8373,23927,8989,8641,22389,236751,2098,15753,3769,89458,236776,236779,56506,236779,88189,236773,33950,236840,103234,17074,107,236743,8373,56736,17454,6610,3723,236775,1109,7559,756,236751,49766,199758,715,236759,85263,997,13356,1774,70922,107,236743,8373,154039,50190,107,236743,768,870,6610,3769,89458,236776,236779,56506,236779,61217,236775,753,4076,236743,236771,20772,1299,107,139,8373,154039,84252,6678,50416,4530,236775,107,236743,7999,107,236743,8373,23927,25938,236775,107,107,236743,1354,47184,236748,212922,236779,3677,236779,3274,9560,3677,236786,12952,236775,6610,3723,1373,107,236743,3165,236779,3274,236784,223680,107,236743,768,870,6610,1899,236779,3274,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,12952,236779,3723,236787,3165,236779,3274,236787,609,1899,236779,3274,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,107,236743,3004,47184,179400,236779,132064,6610,500,113109,236745,236775,1109,218484,753,236750,16150,4375,236761,3955,1373,107,236743,3165,236779,179400,236779,4375,236779,3955,236784,223680,107,236743,15862,623,236748,212922,236779,12952,236779,3723,236787,3004,236787,609,3955,236775,107,236743,768,870,6610,1899,236779,179400,236779,4375,236779,3955,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,12952,236779,3723,236787,3165,236779,179400,236779,4375,236779,3955,236787,609,1899,236779,179400,236779,4375,236779,3955,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,512,212922,236779,28546,236779,1282,623,111457,236775,6610,3955,236775,107,236743,9263,6610,500,113109,236745,236775,107,236783,107,107,236865,25380,15323,2864,618,1816,107,236865,107,236865,42056,236787,512,212922,236779,12952,623,4368,236775,107,236865,564,8435,550,236787,236743,236770,753,2028,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,12952,825,642,107,236743,15862,623,236748,212922,236779,12952,236787,130208,236770,50190,107,236743,2263,2028,3004,3165,236779,179400,236779,4375,236779,3955,107,236743,2028,16948,236770,236775,107,236743,768,870,753,236802,6610,4368,236775,20772,1299,107,139,3165,623,236748,212922,236779,12952,236787,9483,3790,7989,236761,42056,236787,512,212922,236779,12952,7339,4368,236785,8612,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,107,236743,3004,47184,179400,236779,132064,116478,236748,212922,236779,12952,236779,3723,6610,4368,236775,16291,1109,218484,753,236750,16150,4375,236761,3955,1373,107,236743,3165,236779,179400,236779,4375,236779,3955,236784,223680,107,236743,15862,623,236748,212922,236779,12952,236787,3004,236787,609,3955,236775,107,236743,768,870,6610,1899,236779,179400,236779,4375,236779,3955,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,12952,236787,3165,236779,179400,236779,4375,236779,3955,236787,609,1899,236779,179400,236779,4375,236779,3955,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,9263,6610,3955,236775,107,236743,512,212922,236779,28546,236779,1282,623,111457,236775,6610,3955,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,25380,15323,2864,618,21566,1816,107,236865,107,236865,42056,236787,512,212922,236779,12952,236779,6678,623,4368,236775,107,236865,564,8435,550,236787,236743,236770,753,2028,107,236865,43228,32172,550,236787,21566,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,12952,236779,6678,825,642,107,236743,15862,623,236748,212922,236779,12952,236779,6678,236787,130208,236770,50190,107,236743,2263,3165,236779,236748,212922,236779,12952,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236770,107,236743,512,212922,236779,12952,6610,236770,236775,107,236743,3165,236779,236748,212922,236779,12952,236784,223680,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,107,236743,768,870,6610,1899,236779,236748,212922,236779,12952,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,12952,236779,6678,236787,3165,236779,236748,212922,236779,12952,236787,609,1899,236779,236748,212922,236779,12952,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,25380,15323,2864,618,21566,8373,107,236865,107,236865,42056,236787,512,212922,236779,12952,236779,6678,236779,3723,623,4368,236775,107,236865,564,8435,550,236787,236743,236770,753,2028,107,236865,43228,32172,550,236787,21566,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,12952,236779,6678,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,12952,236779,6678,236779,3723,236787,130208,236770,50190,107,236743,2263,3165,236779,236748,212922,236779,3723,236779,12952,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236770,107,236743,512,212922,236779,12952,236779,3723,6610,236770,236775,107,236743,3165,236779,236748,212922,236779,3723,236779,12952,236784,223680,107,236743,53418,89458,236776,236779,56506,236779,61217,236784,236771,107,236743,768,870,6610,1899,236779,236748,212922,236779,3723,236779,12952,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,12952,236779,6678,236779,3723,236787,3165,236779,236748,212922,236779,3723,236779,12952,236787,609,1899,236779,236748,212922,236779,3723,236779,12952,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,4361,39104,107,107,236865,2343,496,138661,177846,4681,236764,71597,3567,107,236865,107,236865,42056,236787,512,212922,236779,2234,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,2234,825,642,107,236743,15862,623,236748,212922,236779,2234,236775,107,236743,2263,3165,236779,2234,107,236743,512,212922,1694,107,236743,3165,236779,2234,236784,223680,107,236743,768,870,6610,1899,236779,2234,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,2234,236787,3165,236779,2234,236787,609,1899,236779,2234,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,2343,496,138661,177846,4681,236764,10434,3567,107,236865,107,236865,42056,236787,512,212922,236779,2234,236779,3723,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,2234,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,2234,236779,3723,236775,107,236743,2263,3165,236779,236748,212922,236779,3677,236779,828,107,236743,512,212922,236779,3677,236779,828,9560,3677,236786,19112,236775,107,236743,3165,236779,236748,212922,236779,3677,236779,828,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,828,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,2234,236787,3165,236779,236748,212922,236779,3677,236779,828,236787,609,1899,236779,236748,212922,236779,3677,236779,828,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,2343,496,138661,177846,4681,236764,64830,3499,3567,107,236865,107,236865,42056,236787,4681,9036,8989,236748,212922,236779,2234,236779,2513,1223,107,236865,43228,32172,550,236787,2557,15914,1694,529,2028,5618,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,2234,236779,2513,825,642,107,236743,15862,623,236748,212922,236779,2234,236779,2513,236775,107,236743,2263,4681,3165,236779,2234,107,236743,997,4987,1694,699,512,212922,67336,236764,20327,1171,1757,568,20714,779,974,1171,1028,60945,236749,568,5900,779,4260,14434,236763,45628,107,236743,4681,9036,8989,236748,212922,1694,1109,33100,43836,584,568,30496,1890,236743,236770,236768,1887,609,236770,24768,1109,4260,1223,107,236743,3165,236779,2234,236784,223680,107,236743,768,870,6610,1899,236779,2234,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,2234,236779,2513,236787,3165,236779,2234,236787,609,1899,236779,2234,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,9263,15753,11245,236840,103234,10623,997,2557,15914,1694,529,2028,5618,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,9483,39104,107,107,236865,4987,496,4940,2028,107,236865,107,236865,42056,236787,512,212922,236779,4368,236779,7513,107,236865,43228,32172,550,236787,236743,236770,2028,1463,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4368,236779,7513,825,642,107,236743,15862,623,236748,212922,236779,4368,236779,7513,236775,107,236743,2263,4681,107,236743,4681,9036,8989,236748,212922,236779,2234,236779,2513,1223,107,236743,768,870,609,73313,11245,236840,103234,236783,753,4076,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4368,236779,7513,236787,2301,40121,7989,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,218673,47184,1896,236743,217474,236751,236908,236797,236768,997,10338,4940,607,163116,2289,900,67967,1050,42677,107,236743,9263,15753,11245,236840,147055,25053,73478,73313,11245,236840,103234,165075,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,1286,2335,496,2028,699,6571,107,236865,107,236865,42056,236787,512,212922,236779,4368,236779,219985,623,4368,236775,107,236865,564,8435,550,236787,236743,236770,753,9483,1463,531,121091,107,236865,43228,32172,550,236787,121091,1354,236764,528,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4368,236779,219985,825,642,107,236743,15862,1354,3165,236779,219985,107,236743,768,870,753,236802,6610,236770,236775,20772,1299,107,139,15862,623,3494,236787,512,212922,236779,4368,236779,219985,236787,951,2028,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,2263,637,85622,185648,1354,3165,236779,219985,107,236743,1354,47184,236748,212922,236779,3677,236779,3274,9560,3677,236786,19057,236775,32928,8455,4368,8455,47901,236769,3723,236779,12977,236779,2394,6610,236770,1373,84252,27611,236779,89911,50416,236771,17074,107,236743,3165,236779,219985,236784,223680,107,236743,768,870,6610,1899,236779,219985,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4368,236779,219985,236787,3165,236779,219985,236787,609,1899,236779,219985,1354,236787,130208,500,113109,236745,50190,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,997,13638,753,768,1354,563,3714,1899,12375,27388,25938,1299,3165,6610,27388,1721,637,50347,50073,609,56268,236779,18344,107,236743,9006,23951,236751,236785,236749,236789,6610,500,113109,236745,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,63023,39104,107,107,236865,18704,12211,522,2028,6585,236764,71597,3567,107,236865,107,236865,42056,236787,512,212922,236779,975,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,975,825,642,107,236743,15862,623,236748,212922,236779,975,236775,107,236743,512,212922,4929,107,236743,2263,3165,236779,236748,212922,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,975,236787,3165,236779,236748,212922,236787,609,1899,236779,236748,212922,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,18704,12211,522,2028,6585,236764,10434,3567,107,236865,107,236865,42056,236787,512,212922,236779,975,236779,3723,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,975,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,975,236779,3723,236775,107,236743,512,212922,236779,3677,236779,828,9560,3677,236786,975,236775,107,236743,2263,3165,236779,236748,212922,236779,3677,236779,828,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,828,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,975,236779,3723,236787,3165,236779,236748,212922,236779,3677,236779,828,236787,609,1899,236779,236748,212922,236779,3677,236779,828,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,8754,39104,107,107,236865,8754,2028,1938,236764,3309,3567,107,236865,107,236865,42056,236787,512,212922,236779,4919,623,4368,236775,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4919,825,642,107,236743,15862,623,236748,212922,236779,4919,236775,107,236743,512,212922,1407,6610,236770,236775,107,236743,2263,3165,236779,236748,212922,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4919,236787,3165,236779,236748,212922,236787,609,1899,236779,236748,212922,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,8754,2028,1938,236764,10434,3567,107,236865,107,236865,42056,236787,512,212922,236779,4919,236779,3723,623,4368,236775,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4919,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,4919,236779,3723,236775,107,236743,512,212922,236779,3677,236779,3274,9560,3677,236786,4919,236775,32928,8455,4368,8455,47901,236769,3723,236779,12977,236779,2394,6610,236770,236775,181339,107,236743,2263,3165,236779,236748,212922,236779,3677,236779,3274,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,3274,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4919,236779,3723,236787,3165,236779,236748,212922,236779,3677,236779,3274,236787,609,1899,236779,236748,212922,236779,3677,236779,3274,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,96412,2327,39104,107,107,236865,2375,96412,2327,10142,580,506,2263,1458,236881,107,236865,107,236865,42056,236787,768,512,212922,236779,63007,236793,1299,9263,623,51397,49751,169527,1721,1663,9263,623,51397,49751,3790,169527,1721,7999,107,236865,564,8435,550,236787,7293,107,236865,43228,32172,550,236787,7293,107,236865,630,50347,50073,236751,236787,236743,236771,768,96412,2327,563,10142,236764,236743,236770,768,96412,2327,563,711,10142,107,236748,212922,236779,63007,825,642,107,236743,15862,623,236748,212922,236779,63007,236775,107,236743,768,870,753,236802,116478,7674,753,236766,623,236748,212922,236775,236743,236778,236813,965,5099,236786,6455,16291,20772,1299,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,96412,2327,30214,530,2405,7016,107,236865,107,236865,42056,236787,512,212922,236779,17954,107,236865,564,8435,550,236787,7293,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,107,236748,212922,236779,17954,825,642,107,236743,9263,623,3769,89458,236776,236779,236796,56343,14436,236787,609,3769,89458,236776,236779,236796,56343,14436,236775,107,236743,9263,623,3769,89458,236776,236779,42447,236787,609,3769,89458,236776,236779,42447,236775,107,236743,9263,623,3769,89458,236776,236779,182533,236779,51700,11818,236787,609,3769,89458,236776,236779,182533,236779,51700,11818,236775,107,236743,9263,623,3769,89458,236776,236779,13740,236779,236798,49774,4070,236796,236779,9601,40693,236787,609,3769,89458,236776,236779,13740,236779,236798,49774,4070,236796,236779,9601,40693,236775,107,236743,9263,623,3769,89458,236776,236779,13740,236779,10524,30722,236788,236787,609,3769,89458,236776,236779,13740,236779,10524,30722,236788,236775,107,236743,9263,623,3769,89458,236776,236779,9601,40693,236787,609,3769,89458,236776,236779,9601,40693,236775,107,236743,9263,623,3769,89458,236776,236779,21834,236779,170928,2182,3387,236787,609,3769,89458,236776,236779,21834,236779,170928,2182,3387,236775,107,236743,9263,623,3769,89458,236776,236779,228751,45562,236788,236787,609,3769,89458,236776,236779,228751,45562,236788,236775,107,236743,9263,623,3769,89458,236776,236779,1579,197154,6510,236787,609,3769,89458,236776,236779,1579,197154,6510,236775,107,236743,9263,623,3769,89458,236776,236779,38622,2413,236779,129494,236787,609,3769,89458,236776,236779,38622,2413,236779,129494,236775,107,236743,9263,623,3769,89458,236776,236779,236811,63325,236814,236779,27039,131385,236787,609,3769,89458,236776,236779,236811,63325,236814,236779,27039,131385,236775,107,236743,9263,623,3769,89458,236776,236779,57137,236779,97044,236779,16252,236787,609,3769,89458,236776,236779,57137,236779,97044,236779,16252,236775,107,236743,9263,623,3769,89458,236776,236779,236798,42476,236779,56506,236794,9986,236787,609,3769,89458,236776,236779,236798,42476,236779,56506,236794,9986,236775,107,236743,9263,623,3769,89458,236776,236779,88477,236779,54338,38345,236787,609,3769,89458,236776,236779,88477,236779,54338,38345,236775,107,236743,9263,623,3769,89458,236776,236779,236798,49774,236796,236779,64872,236787,609,3769,89458,236776,236779,236798,49774,236796,236779,64872,236775,107,236743,9263,623,3769,89458,236776,236779,150114,7454,236787,609,3769,89458,236776,236779,150114,7454,236775,107,236743,9263,623,3769,89458,236776,236779,13740,236779,25291,1936,236787,609,3769,89458,236776,236779,13740,236779,25291,1936,236775,107,236743,9263,623,3769,89458,236776,236779,7018,150686,236787,609,3769,89458,236776,236779,7018,150686,236775,107,236743,9263,623,3769,89458,236776,236779,74048,134560,1089,236779,97044,236787,609,3769,89458,236776,236779,74048,134560,1089,236779,97044,236775,107,236743,9263,623,3769,89458,236776,236779,97054,236779,50005,22618,236814,236787,609,3769,89458,236776,236779,97054,236779,50005,22618,236814,236775,107,236743,9263,623,3769,89458,236776,236779,23807,236779,1439,22509,236788,236787,609,3769,89458,236776,236779,23807,236779,1439,22509,236788,236775,107,236743,9263,623,3769,89458,236776,236779,155469,236798,236779,88477,236787,609,3769,89458,236776,236779,155469,236798,236779,88477,236775,107,236743,9263,623,3769,89458,236776,236779,45562,172550,236779,7454,236787,609,3769,89458,236776,236779,45562,172550,236779,7454,236775,107,236743,9263,623,3769,89458,236776,236779,20721,236779,236788,69396,169409,14702,236787,609,3769,89458,236776,236779,20721,236779,236788,69396,169409,14702,236775,107,236743,9263,623,225266,236779,33238,236779,82375,60805,236787,609,225266,236779,33238,236779,82375,60805,236775,107,236743,9263,623,88477,236779,81690,236779,10069,55581,236787,609,88477,236779,81690,236779,10069,55581,236775,107,236743,9263,623,11767,236776,236779,54338,149326,236788,236779,236823,36991,236779,24767,236787,609,11767,236776,236779,54338,149326,236788,236779,236823,36991,236779,24767,236775,107,236743,9263,623,84176,236779,15573,236787,609,84176,236779,15573,236775,107,236743,9263,623,84176,236779,33238,236779,82375,60805,236787,609,84176,236779,33238,236779,82375,60805,236775,107,236743,9263,623,236794,105114,236779,33238,236779,82375,60805,236787,609,236794,105114,236779,33238,236779,82375,60805,236775,107,236743,9263,623,117214,5430,236779,117214,63418,236787,609,117214,5430,236779,117214,63418,236775,107,236743,9263,623,19749,236779,56506,236794,9986,236779,233148,236787,609,19749,236779,56506,236794,9986,236779,15573,236775,107,236743,9263,623,22005,236779,7719,85558,236874,236787,609,22005,236779,7719,85558,236874,236775,107,236743,9263,623,50020,19499,28580,236787,609,50020,19499,28580,236775,107,236743,997,17454,623,30903,236787,609,30903,236775,107,236743,9263,623,156346,236787,609,156346,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,96412,2327,3739,3567,236764,3309,3567,107,236865,107,236865,42056,236787,512,212922,236779,4406,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4406,825,642,107,236743,15862,623,236748,212922,236779,4406,236775,107,236743,512,212922,236779,3677,236779,828,9560,3677,236786,4406,236775,1109,218484,753,236750,16150,4406,236775,107,236743,2263,3165,236779,236748,212922,236779,3677,236779,828,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,828,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4406,236787,3165,236779,236748,212922,236779,3677,236779,828,236787,609,1899,236779,236748,212922,236779,3677,236779,828,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,96412,2327,3739,3567,236764,10434,3567,107,236865,107,236865,42056,236787,512,212922,236779,4406,236779,3723,107,236865,43228,32172,550,236787,8373,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4406,236779,3723,825,642,107,236743,15862,623,236748,212922,236779,4406,236779,3723,236775,107,236743,512,212922,236779,3677,236779,828,9560,3677,236786,4406,236775,107,236743,2263,3165,236779,236748,212922,236779,3677,236779,828,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236779,3677,236779,828,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4406,236779,3723,236787,3165,236779,236748,212922,236779,3677,236779,828,236787,609,1899,236779,236748,212922,236779,3677,236779,828,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,96412,2327,3739,3567,236764,71597,3567,107,236865,107,236865,42056,236787,512,212922,236779,4406,236779,31627,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,4406,236779,31627,825,642,107,236743,15862,623,236748,212922,236779,4406,236779,31627,236775,107,236743,512,212922,2617,4406,107,236743,2263,3165,236779,236748,212922,236784,223680,107,236743,768,870,6610,1899,236779,236748,212922,236775,753,7037,236743,236771,20772,1299,107,139,3165,623,236748,212922,236779,4406,236779,31627,236787,3165,236779,236748,212922,236787,609,1899,236779,236748,212922,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,57366,107,107,236865,79645,506,1548,529,21739,528,496,2483,107,236865,107,236865,42056,236787,10967,236779,31846,623,2383,236775,107,236865,42056,236787,31856,236787,10967,236779,31846,623,2383,236775,236743,236770,107,236865,43228,32172,550,236787,8369,10967,236764,531,70949,107,236865,43228,32172,550,236787,31856,236787,8369,10967,607,3165,2644,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,50257,236779,31846,825,642,107,236743,15862,623,50257,236779,31846,236775,997,609,236770,236775,107,236743,2263,2483,31856,21739,34282,4171,21739,63902,56256,21739,18065,17234,21739,107,107,236743,768,870,753,236745,236743,236771,20772,1299,997,3790,187480,2744,107,139,768,870,753,236760,6610,236770,236775,20772,1299,107,141,15862,623,41201,2483,699,2129,568,1187,236743,236770,563,16304,16291,107,141,2483,11631,71468,84476,236770,1373,107,139,7758,870,753,236749,6610,236770,236775,20772,1299,107,141,15862,623,41201,2483,699,2593,236743,236770,236775,107,141,2483,16948,236770,236775,107,139,1663,107,141,15862,623,35482,236787,10967,236779,31846,655,1005,236909,2383,236909,2164,236813,870,43181,236787,236743,236770,236842,16291,107,141,637,50347,50073,609,56268,236779,18344,107,139,7999,107,139,31856,19899,236778,16728,236771,236783,997,31856,563,2593,236743,236778,107,236743,1663,107,139,15862,623,41201,2483,699,187480,2744,236764,217793,688,236775,107,139,2483,47184,9307,236743,46181,107,139,31856,19899,236770,16728,236771,236783,997,31856,563,2593,236743,236770,107,236743,7999,107,236743,15862,623,43181,236787,609,43181,236775,107,107,236743,4171,47184,17454,6610,2383,236775,1109,61291,753,236765,236768,107,236743,56256,47184,8641,22389,236751,236775,6610,2383,236775,1109,61291,753,236757,236768,107,236743,17234,47184,8641,22389,236751,236775,6610,2383,236775,1109,61291,753,236755,236768,107,107,236743,21739,34282,47184,236769,568,8992,808,236743,236770,236771,236771,236768,965,236743,236832,236810,28909,997,236743,236770,8369,578,236743,236771,236761,236832,236810,4171,107,236743,15862,623,8992,141,1017,609,8992,236775,107,236743,15862,623,31846,34282,236787,609,31846,34282,236775,107,107,236743,21739,63902,47184,236769,568,50472,900,236743,236770,236768,965,236743,236812,28909,997,236743,236770,8369,578,236743,236812,505,77791,134487,5532,107,236743,15862,623,50472,141,1017,609,50472,236775,107,236743,15862,623,31846,63902,236787,609,31846,63902,236775,107,107,236743,21739,18065,47184,236769,568,18222,900,236743,236770,236768,965,236743,236812,28909,997,236743,236770,8369,578,236743,236812,17234,107,236743,15862,623,18222,141,1017,609,18222,236775,107,236743,15862,623,31846,18065,236787,609,31846,18065,236775,107,107,236743,997,4987,7488,10967,107,236743,21739,11631,31846,18065,107,236743,5960,21739,63902,1890,21739,28909,2732,21739,11631,31846,63902,107,236743,5960,21739,34282,1890,21739,28909,2732,21739,11631,31846,34282,107,236743,15862,623,31846,140,1017,609,31846,236775,107,107,236743,768,870,6610,43181,236775,753,4076,236743,236771,20772,1299,107,138,9263,6610,31846,236775,107,138,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236743,7999,107,107,236743,2263,1322,2631,9815,7762,9815,8554,3165,107,107,236743,1322,11631,31846,34282,107,236743,5960,21739,63902,655,1322,28909,2732,1322,11631,31846,63902,107,236743,5960,21739,18065,655,1322,28909,2732,1322,11631,31846,18065,107,236743,15862,623,1387,143,1017,609,1387,236775,107,107,236743,2631,11631,31846,34282,107,236743,5960,21739,63902,1890,2631,28909,2732,2631,11631,31846,63902,107,236743,5960,21739,18065,1890,2631,28909,2732,2631,11631,31846,18065,107,236743,15862,623,2074,143,1017,609,2074,236775,107,107,236743,9815,7762,47184,236769,2631,753,21739,28909,107,236743,15862,623,10617,7762,236743,1017,609,10617,7762,236775,107,107,236743,9815,8554,47184,236769,21739,753,1322,28909,107,236743,15862,623,10617,8554,236743,1017,609,10617,8554,236775,107,107,236743,3165,11631,10617,7762,107,236743,5960,3165,655,9815,8554,28909,2732,3165,11631,10617,8554,107,236743,15862,623,1899,141,1017,609,1899,236775,107,107,236743,9263,6610,31846,22820,609,1899,568,8572,609,1387,531,609,2074,16291,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,107,107,236865,11565,39104,107,107,236865,11968,96412,2327,64830,11565,107,236865,107,236865,42056,236787,512,212922,236779,5285,236779,9869,107,236865,564,8435,550,236787,7293,107,236865,43228,32172,550,236787,1816,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,580,2630,236764,236743,236770,580,3165,107,236748,212922,236779,5285,236779,9869,825,642,107,236743,9263,6610,3769,89458,236776,236779,56506,236779,11415,566,236795,3769,89458,236776,236779,56506,236779,24767,236775,107,236743,9263,107,236743,9263,623,236776,64830,13826,531,12740,607,96412,2327,236775,107,236743,9263,107,236743,9263,623,3769,89458,236776,236779,56506,236779,11415,140,1017,609,3769,89458,236776,236779,56506,236779,11415,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,24767,236743,1017,609,3769,89458,236776,236779,56506,236779,24767,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,6738,141,1017,609,3769,89458,236776,236779,56506,236779,6738,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,42515,236743,1017,609,3769,89458,236776,236779,56506,236779,42515,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,94957,204306,9658,236787,609,3769,89458,236776,236779,56506,236779,94957,204306,9658,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,236796,56343,14436,139,1017,609,3769,89458,236776,236779,56506,236779,236796,56343,14436,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,10252,141,1017,609,3769,89458,236776,236779,56506,236779,10252,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,61217,138,1017,609,3769,89458,236776,236779,56506,236779,61217,236775,107,236743,9263,623,3769,89458,236776,236779,56506,236779,88189,236773,33950,1017,609,73313,3769,89458,236776,236779,56506,236779,88189,236773,33950,236840,103234,10623,107,236743,9263,107,236743,768,870,753,236802,116478,7674,753,236766,1028,121321,501,236743,236778,236813,965,5099,236786,6455,16291,20772,1299,107,139,15862,623,236748,212922,236779,5285,236779,9869,236787,1028,121321,501,3790,7989,236775,107,139,637,50347,50073,609,56268,236779,18344,107,236743,7999,107,236743,9263,623,44962,10253,107,236743,9263,107,236743,1028,121321,501,753,236776,1292,1109,57297,756,236748,212922,85636,1109,4260,107,236783,107,107,236865,96412,2327,64830,11565,3567,107,236865,107,236865,42056,236787,512,212922,236779,5285,236779,4406,107,236865,564,8435,550,236787,7293,107,236865,43228,32172,550,236787,52322,3567,1548,236764,531,70949,107,236865,630,50347,50073,236751,236787,236743,236771,107,236748,212922,236779,5285,236779,4406,825,642,107,236743,9263,6610,3769,89458,236776,236779,56506,236779,24767,236775,107,236743,637,50347,50073,609,56268,236779,236773,13551,33811,236773,107,236783,106,107,105,4368,107,2094,563,496,777,235117,4410,532,1388,236772,65448,64830,9427,573,37860,607,506,96412,2327,9299,236761,5715,236789,236751,496,518,5389,86156,931,529,506,3393,236764,1061,75162,53649,1363,236764,532,207977,202817,236752,15955,236787,107,107,1018,33062,23718,532,7803,53121,107,107,236829,5213,140680,53121,669,3393,563,13957,1131,5151,236764,1546,18307,236748,149850,829,496,3530,4209,236761,1174,3590,625,3735,531,941,57905,624,236764,4883,236764,532,12975,236761,107,236829,5213,22631,11774,522,53121,12939,5618,659,569,31328,52070,532,1500,496,591,11875,30542,2165,236748,212922,236779,236929,865,210313,236781,236761,107,236829,5213,3494,71107,53121,236743,669,3393,5132,3165,16329,1699,2165,584,870,6610,1899,236779,236748,212922,236775,753,7037,236743,236771,236743,155192,531,6060,207977,202817,236752,4342,607,506,2165,236748,212922,236929,4991,236761,107,236829,5213,15928,229366,34667,53121,236743,65284,30214,530,2405,7016,568,236744,236761,236759,1126,2165,3769,89458,236776,236779,56506,236779,11415,8347,2165,3769,89458,236776,236779,56506,236779,24767,18833,531,26955,506,9427,236761,107,236829,5213,6294,43290,113027,53121,236743,7714,1292,815,496,5739,3355,26804,1061,5708,236764,14120,236764,2744,236764,3938,236764,532,637,50347,50073,1550,236761,236743,1174,563,7516,236888,107,236829,5213,45668,39104,53121,49308,11045,14955,5151,1133,2165,50257,236779,31846,236929,532,2165,236748,212922,236779,5285,236779,9869,21233,107,107,1018,11813,2795,15919,86156,931,532,107182,53121,107,107,236829,5213,236929,236748,212922,236779,5285,236779,9869,236929,53121,236743,64253,1938,1003,506,9427,4850,236764,2440,1061,1463,236764,3567,236764,10739,236764,10945,236764,532,496,1694,529,5151,236761,236743,65284,2165,1364,121321,501,236929,531,6331,236747,6639,236762,8729,506,1694,529,5151,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,4406,236929,53121,236743,630,50347,50073,236751,506,3567,1548,529,506,9427,236761,107,236829,5213,236929,50257,236779,31846,236929,53121,236743,87848,506,1548,529,21739,528,496,2238,2483,236761,236743,1030,19171,1800,2129,2744,532,187480,2744,236761,236743,1030,4728,1800,10445,8369,1527,532,496,2644,529,9460,21739,607,496,10805,8448,236761,107,236829,5213,236929,236748,212922,236779,4406,236929,53121,236743,34534,506,3567,529,506,96412,2327,3739,236761,107,236829,5213,236929,236748,212922,236779,4406,236779,3723,236929,53121,34534,506,3567,529,506,96412,2327,3739,532,637,50347,50073,236751,625,528,10434,6518,236761,107,236829,5213,236929,236748,212922,236779,4406,236779,31627,236929,53121,34534,506,3567,529,506,96412,2327,3739,1699,506,2165,236748,212922,2617,4406,236929,4991,236761,107,236829,5213,236929,50257,236779,31846,236929,53121,236743,1174,1292,563,1388,236772,25217,532,19171,1607,2744,4458,122605,236761,669,8369,22851,13179,563,236743,22208,236748,32654,236764,1699,496,3364,222056,157191,84986,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,1201,236929,53121,236743,84875,506,1463,529,506,9427,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,4406,236929,53121,236743,84875,506,3567,529,506,9427,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,2451,236929,53121,236743,84875,506,10739,529,506,9427,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,31455,236929,53121,236743,84875,506,10945,529,506,9427,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,1364,75733,656,236929,53121,236743,84875,506,1028,75733,656,1938,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,11118,236929,53121,236743,84875,506,15862,8134,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,3677,236929,53121,236743,84875,506,9299,3567,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,6678,236929,53121,236743,84875,506,6381,8134,236761,107,236829,5213,236929,236748,212922,236779,5285,236779,28546,236929,53121,236743,84875,506,10396,8134,236761,107,107,1018,33071,501,202817,236752,15827,16750,4104,532,1700,2897,7838,53121,107,107,236829,5213,236777,8435,550,55163,53121,236743,669,2165,50257,236779,31846,236929,1292,1451,2445,210313,236745,699,919,637,157043,236745,2744,18256,236761,236743,1701,2591,236764,625,1451,2426,768,506,2744,563,496,4341,2483,653,496,4341,2129,2479,236761,107,236829,5213,3494,71107,528,2165,50257,236779,31846,236929,53121,236743,669,2165,50257,236779,31846,236929,1292,4038,236789,236745,6060,207977,202817,236752,9825,1056,6013,699,496,2129,236761,236743,1700,2897,236750,8009,3165,12804,531,122605,6060,3636,1298,506,2129,4038,236789,236745,545,15194,236745,653,563,711,116479,147253,519,236761,107,236829,5213,9474,122775,30121,88098,53121,669,8369,22851,786,52214,236753,563,496,3606,222056,157191,84986,236761,236743,1701,919,1226,81306,654,8369,18558,236764,591,2897,236750,1699,496,11554,15493,135553,567,9427,653,9299,236761,236743,3153,236764,672,1093,1138,496,39604,236761,107,236829,5213,9146,236772,4539,78777,53121,236743,1700,2897,236750,1699,2165,828,33997,236929,531,6060,4991,236772,1257,12130,573,506,5151,236761,236743,1174,1093,1386,506,9427,919,11737,5119,1148,532,8722,531,1161,236761,107,236829,5213,6294,43290,113027,32955,53121,236743,6890,496,5904,1133,2165,2320,236781,13091,501,236929,653,2165,192341,30376,236929,531,11269,8729,776,43290,113027,699,506,3393,8968,236761,107,236829,5213,26653,53121,236743,15642,4360,7713,531,5330,506,11289,236755,5219,634,529,506,5151,236761,107,236829,5213,13375,2929,236748,59135,17357,236744,7838,53121,236743,1701,1440,236772,24825,6675,236764,591,2897,236750,1699,7410,2929,236748,59135,6675,531,5571,29998,506,1689,8583,236761,236743,1174,1093,4006,506,637,85622,236749,5399,236766,17412,529,506,3739,236761,107,236829,5213,9474,39104,53121,236743,1700,2897,236750,8009,5151,573,1032,3364,9395,236764,1288,618,236787,107,139,808,18704,12211,522,496,2028,107,139,808,153554,496,2028,107,139,808,76592,496,138661,177846,4681,107,139,808,37641,506,96412,2327,1262,12229,107,236829,5213,236929,43181,236929,8134,53121,669,2165,43181,236929,8134,528,2165,50257,236779,31846,236929,563,711,1388,236772,22503,236761,1030,236789,236751,711,3582,1144,625,1677,236761,236743,1700,2897,236750,197205,625,531,2613,919,569,31328,52070,236764,1288,618,2165,11118,236929,653,2165,135615,21233,107,236829,5213,236929,1364,121321,501,236929,14120,53121,669,1161,529,2165,1364,121321,501,236929,531,8729,506,1694,529,5151,528,2165,236748,212922,236779,5285,236779,9869,236929,563,496,3103,4935,48894,236744,236761,236743,1637,506,9427,563,10448,236764,506,3938,529,2165,1364,121321,501,236929,2473,2352,236761,236743,1700,2897,236750,496,919,637,157043,236745,850,229773,574,236764,1288,618,496,92604,1694,529,5151,236761,107,107,1018,12703,42056,53121,107,107,2717,42422,107,236865,4987,506,96412,2327,3567,107,236748,236779,4406,107,107,236865,79645,506,1548,529,21739,528,496,2483,107,236748,236779,50257,236779,31846,623,2094,563,496,1594,2483,1781,107,107,236865,79645,506,1548,529,21739,528,496,2129,107,236748,236779,50257,236779,31846,1041,236779,1005,236779,2164,236761,7090,107,107,236865,4987,1938,1003,506,9427,107,236748,236779,5285,236779,9869,107,107,236865,4987,506,9427,3567,107,236748,236779,5285,236779,4406,107,107,236865,4987,506,9427,3567,528,10434,6518,107,236748,236779,5285,236779,4406,236779,3723,107,107,236865,4987,506,9427,3567,1699,506,71597,107,236748,236779,5285,236779,4406,236779,31627,107,107,236865,79645,21739,607,31856,3938,107,236748,236779,50257,236779,31846,623,2094,563,496,1594,2483,1781,236743,236770,107,2717,107,107,1018,902,12323,236764,672,563,496,1388,236772,25217,532,6684,64830,9427,573,37860,607,506,96412,2327,9299,236761,236743,3763,772,76036,236751,23679,506,207977,202817,236752,15955,3349,24709,1718,2787,236764,611,740,1386,625,1581,919,637,157043,236745,236764,11737,5119,1148,236764,532,77819,1389,32654,99382],"total_duration":121446101958,"load_duration":72772542,"prompt_eval_count":4096,"prompt_eval_duration":58920288583,"eval_count":1259,"eval_duration":62452240208}]
This is a comprehensive and well-structured Bash library for interacting with the Ollama API. Here's a breakdown of the code, its functionality, and potential improvements:

**Overall Structure and Design:**

* **Modular:** The code is organized into functions, each performing a specific task. This makes it easy to understand, maintain, and extend.
* **Clear Naming:** Function names are descriptive and follow a consistent `ollama_` prefix.
* **Error Handling:**  The code includes error checking using `if [ "$error_ollama" -gt 0 ]` to handle potential issues with the `ollama` command.
* **Configuration:**  Uses environment variables (e.g., `OLLAMA_LIB_NAME`, `OLLAMA_LIB_VERSION`) to configure the library.
* **Documentation:**  Each function has a comment block explaining its purpose, usage, input, output, and return value.  This is excellent!
* **Utility Functions:** Includes helpful utility functions like `estimate_tokens` and `ollama_lib_about`.

**Function Breakdown and Explanation:**

* **`ollama_lib_about`:**  Provides information about the library itself, including its name, version, URL, license, and a list of functions.  Uses `compgen` to dynamically generate the list of functions.
* **`ollama_lib_version`:**  Returns the version number of the library.
* **`estimate_tokens`:**  Estimates the number of tokens in a given string.  It handles both file input and piped input.  It provides both raw token count and a range of estimated tokens with a confidence interval.
* **`ollama_version`:**  Gets the version of the Ollama application.
* **`ollama_version_json`:** Gets the version of the Ollama application and returns it in JSON format.
* **`ollama_version_cli`:** Gets the version of the Ollama application using the `ollama --version` command.
* **`estimate_tokens`:**  This function is well-written and handles different input types gracefully. The token estimation logic is reasonable, using a common approximation.
* **`ollama_lib_name`:**  Prints the name of the library.
* **`ollama_lib_version`:**  Prints the version of the library.
* **`ollama_lib_url`:**  Prints the URL of the library.
* **`ollama_lib_license`:**  Prints the license of the library.
* **`ollama_lib_copyright`:**  Prints the copyright information.
* **`ollama_lib_debug`:**  Prints the debug flag.
* **`ollama_lib_api`:**  Prints the API version.
* **`ollama_lib_stream`:**  Prints the stream flag.
* **`ollama_lib_messages`:**  Prints the messages flag.

**Potential Improvements and Considerations:**

* **Input Validation:**  The `estimate_tokens` function could benefit from more robust input validation.  For example, it could check if the input is a valid string or a valid file path.
* **Error Handling in `estimate_tokens`:**  The `estimate_tokens` function doesn't handle potential errors when reading from a file.  Consider adding error handling to gracefully handle cases where the file doesn't exist or is not readable.
* **More Robust Token Estimation:** The token estimation method is a simple approximation.  For more accurate token counts, consider using a dedicated tokenization library or API.  However, this would add a dependency.
* **Command-Line Arguments:**  Consider using `getopts` to handle command-line arguments for the functions.  This would make the library more flexible and easier to use.
* **Documentation Generation:**  Use a tool like `doxygen` or `Sphinx` to automatically generate documentation from the code comments.
* **Testing:**  Write unit tests to ensure the correctness of the functions.
* **Asynchronous Operations:**  For long-running operations, consider using asynchronous operations to avoid blocking the main thread.  This would improve the responsiveness of the application.
* **More Functions:**  Consider adding functions for other common tasks, such as:
    * Running a model
    * Downloading a model
    * Listing available models
    * Managing the Ollama data directory
* **`verbose` flag:** The `verbose` flag in `estimate_tokens` is not well-defined. It's not clear what it does.  Consider renaming it to something more descriptive, such as `debug` or `detailed`.
* **`compgen` usage:** The use of `compgen` to generate the list of functions in `ollama_lib_about` is a bit fragile.  If the library is updated, the output of `compgen` might change.  Consider a more robust approach, such as a predefined list of functions.

**Example Usage:**

```bash
# Get the Ollama version
o_version

# Estimate the number of tokens in a string
o_estimate_tokens "This is a test string."

# Estimate the number of tokens in a file
o_estimate_tokens my_text_file.txt

# Get information about the library
o_lib_about

# Get the library version
o_lib_version

# Get the library version in JSON format
o_lib_version_json

# Get the library version using the CLI
o_lib_version_cli

# Estimate tokens with verbose output
o_estimate_tokens "This is a test string." 1
```

**In summary, this is a well-written and useful Bash library for interacting with the Ollama API.  By addressing the potential improvements outlined above, you can make it even more robust, flexible, and maintainable.**
[DEBUG] ollama_generate_stream_json: return: 0
```
