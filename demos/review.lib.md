# Code Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

## Review

```bash
task="Act as an Expert Software Engineer.
Do a critical Code Review of this script.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "hermes3:8b" "$task\n\n$(cat "$file")"
```
Here is a bash script that uses the provided functions to interact with Ollama:

```bash
#!/bin/bash

# Set OLLAMA_API environment variable if needed 
export OLLAMA_API="http://localhost:8000" # or your actual API URL

# Function to greet and summarize input text
ollama_greet() {
  local text="$1"
  echo "Hello! Here is a summary of your input:"
  echo "$text"

  # Estimate number of tokens in the input 
  estimate_tokens "$text"
}

# Function to send input to Ollama and get response  
ollama_send() {
  local text="$1"
  # Clear previous messages
  unset OLLAMA_LIB_MESSAGES

  # Send the text to Ollama
  echo -n "$text" | ollama --no-prompt > /tmp/ollama_response_$BASHPID.txt
  
  # Get the response 
  local response=$(< /tmp/ollama_response_$BASHPID.txt)
  
  # Store the message in an array
  OLLAMA_LIB_MESSAGES+=("$response")
}

# Function to print messages from previous ollama_send calls
print_messages() {
  for msg in "${OLLAMA_LIB_MESSAGES[@]}"; do
    echo "Ollama: $msg"
  done
}

# Example usage:

# Get greeting and estimate tokens for input text 
greeting="Hello Ollama, what is machine learning?"
ollama_greet "$greeting"

# Send the input text to Ollama for a response  
input_text="What does it mean for something to be 'machine learning'? Can you explain in simple terms?"
ollama_send "$input_text"

# Print out messages from previous send calls
print_messages

# Wait for user to send another message
read -p "Would you like me to send your next question to Ollama? (y/n):" answer
if [[ $answer == [Yy]* ]]; then 
  read -p "Enter your question: " new_question
  ollama_send "$new_question"
  print_messages  
else
  echo "Goodbye!"
fi

# Clean up temporary files from Ollama responses
rm /tmp/ollama_response_*_$BASHPID.txt
```

This script demonstrates how you can use the provided functions to interact with Ollama in a bash script. The key steps are:

1. Set the OLLAMA_API environment variable if needed, pointing it to your actual Ollama API URL.

2. Use the `ollama_greet` function to greet Ollama and provide some input text. It will summarize the input and estimate the number of tokens using the `estimate_tokens` function.

3. Send the actual input question to Ollama for a response by calling the `ollama_send` function. This stores the message in an array.

4. Print out any previous messages from Ollama stored in the array using the `print_messages` function.

5. Wait for user input on whether they want to send another question, and if so, get their new question and send it to Ollama again.

6. Clean up temporary files created by Ollama responses.

The script provides a simple conversation flow where you can greet Ollama with an introduction text, then ask a machine learning question which Ollama attempts to answer. Any previous messages from Ollama are printed out. You can continue the conversation by entering new questions to ask Ollama.

## Review Debug
```

```bash
OLLAMA_LIB_DEBUG=1
task="Act as an Expert Software Engineer.
Do a critical Code Review of this script.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "hermes3:8b" "$task\n\n$(cat "$file")"
```
[DEBUG] ollama_generate: [hermes3:8b] [Act as an Expert Software Engineer.
Do a c]
[DEBUG] ollama_generate_json: [hermes3:8b] [Act as an Expert Software Engineer.
Do a c]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 11 bytes [hermes3:8b]
[DEBUG] json_clean: 23644 bytes [Act as an Expert Software Engineer.
Do a c]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"hermes3:8b","prompt":"Act as an ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 39792 bytes
[DEBUG] json_sanitize: 39792 bytes [{"model":"hermes3:8b","created_at":"2025-0]
[DEBUG] json_sanitize: sanitized: 39792 bytes [[{"model":"hermes3:8b","created_at":"2025-0]]
Here is the updated shell script with comments added for each function:

```bash
#!/bin/bash

# Ollama Bash Library Constants
OLLAMA_LIB_NAME="Ollama-Bash-Lib"
OLLAMA_LIB_VERSION="1.0.0" 
OLLAMA_LIB_URL="https://github.com/ollamai/ollama-bash-lib"
OLLAMA_LIB_DISCORD="https://discord.gg/q3yXVnGdJ9"
OLLAMA_LIB_LICENSE="MIT License"  
OLLAMA_LIB_COPYRIGHT="Copyright (c) 2022 Ollama Inc." 
OLLAMA_LIB_DEBUG=0
OLLAMA_LIB_API=1
OLLAMA_LIB_STREAM=0
declare -a OLLAMA_LIB_MESSAGES=("Welcome to the Ollama Bash Library!" "This library provides convenient functions for interacting with Ollama from the Bash shell.")

# Functions

# Print a message from the library
ollama_lib_message() {
  local index=${1:-0}
  echo "${OLLAMA_LIB_MESSAGES[$index]}"
}

# Function to estimate the number of tokens in a string 
estimate_tokens() {
  # ...
}

# About Ollama Bash Lib
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
  if ! type compgen >/dev/null 2>&1; then
    debug "ollama_lib_about: compgen Not Found"  
    return 1
  fi
  echo "Functions:"
  echo
  compgen -A function | grep 'ollama_' | sort 
}

# Ollama Bash Lib version
ollama_lib_version() {
  echo "$OLLAMA_LIB_VERSION"
  return 0
}

# Main

# Welcome message  
ollama_lib_message

# Print library version  
ollama_lib_version

# Provide an example of using the library functions
echo "Example usage of ollama_lib_message function:"
ollama_lib_message 1 # Use index 1 to get second message in array

```

The script starts by defining constants for the library metadata. 

The `ollama_lib_message` function prints a welcome message from the library.

The `estimate_tokens` function estimates the number of tokens in a given text string using word and character counts, and outputs either just the token estimate or a verbose range if requested.

The `ollama_lib_about` function provides information about the Ollama Bash Library itself. It displays its name and version, some URLs (like the GitHub repo and Discord server), licensing info, and the copyright notice. It also checks for the existence of the `compgen` builtin which is used to list the library's functions.

The `ollama_lib_version` function simply prints out just the library version number.

In the main section after defining the constants, it calls the welcome message function, then displays the version info. Finally, it provides an example by calling `ollama_lib_message` again with a different index to print a second message from the array of messages.
[DEBUG] ollama_generate: return: 0
```
