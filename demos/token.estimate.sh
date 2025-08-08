#!/usr/bin/env bash

echo "# estimate_tokens"

# Estimate the number of tokens in a string
#
# Usage: estimate_tokens "string"
# Usage: verbose: estimate_tokens "string" 1
# Output: token estimate, to stdout
# Output: verbose: token estimate with error range, to stdout
# Requires: none
# Returns: 0 on success, 1 on error
estimate_tokens() {
  #_debug "estimate_tokens" # $1"
  local string verbose tokensWords words tokensChars chars tokensBytes bytes tokens

  if [ -t 0 ]; then # Not piped input
    if [ -f "$1" ]; then
      #_debug "Getting string from file (arg 1 is filename)"
      string=$(<"$1")
    elif [ -n "$1" ]; then
      #_debug "Getting string from arg 1"
      string="$1"
    else
      #_debug "Usage: estimate_tokens <text|string|file> [verbose: 1])"
      return 1
    fi
    verbose=${2:-0} # verbose is arg 2
  else
    #_debug "Getting string from piped input, multiline"
    string=$(cat -)
    verbose=${1:-0} # verbose is arg 1
  fi
  #_debug "verbose: $verbose"

  words=$(echo "$string" | wc -w)
  chars=$(printf "%s" "$string" | wc -m)
  bytes=$(printf "%s" "$string" | wc -c)

  tokensWords=$(( (words * 100) / 75 )) # 1 token = 0.75 words
  #_debug "words      : $words"
  #_debug "tokensWords: $tokensWords"

  tokensChars=$(( (chars + 1) / 4 )) # 1 token = 4 characters
  #_debug "chars      : $chars"
  #_debug "tokensChars: $tokensChars"

  tokensBytes=$(( (bytes + 1) / 4 )) # 1 token = 4 bytes
  #_debug "bytes      : $bytes"
  #_debug "tokensBytes: $tokensBytes"

  # Get largest estimate
  tokens=$tokensBytes
  (( tokensChars > tokens )) && tokens=$tokensChars
  (( tokensWords > tokens )) && tokens=$tokensWords
  #_debug "tokens     : $tokens"

  if [ "$verbose" -eq 0 ]; then
   echo "$tokens"
   return 0
  fi

  local min max offsetMin offsetMax error

  min=$tokensWords
  (( tokensChars < min )) && min=$tokensChars
  (( tokensBytes < min )) && min=$tokensBytes
  #_debug "min        : $min"

  max=$tokensWords
  (( tokensChars > max )) && max=$tokensChars
  (( tokensBytes > max )) && max=$tokensBytes
  #_debug "max        : $max"

  offsetMin=$(( max - tokens ))
  #_debug "offsetMin  : $offsetMin"

  offsetMax=$(( tokens - min ))
  #_debug "offsetMax  : $offsetMax"

  error=$offsetMin
  (( error < offsetMax )) && error=$offsetMax
  #_debug "error      : $error"

  echo "$tokens ± $error (range $min to $max)"
  return 0
}

echo
echo '```'
echo "estimate_tokens \"string\""
echo "estimate_tokens \"string\" 1 (verbose)"

echo
string="My hovercraft is full of eels"
echo "$string"
echo -n "tokens : "
estimate_tokens "$string"
echo -n "verbose: "
estimate_tokens "$string" 1

echo
string="我的气垫船上满是鳗鱼" # Simplified Chinese "My hovercraft is full of eels"
echo "$string"
echo -n "tokens : "
estimate_tokens "$string"
echo -n "verbose: "
estimate_tokens "$string" 1

echo
echo "(contents of ../README.md)"
echo -n "tokens : "
estimate_tokens ../README.md
echo -n "verbose: "
estimate_tokens ../README.md 1

echo
echo "(contents of ../ollama_bash_lib.sh)"
echo -n "tokens : "
estimate_tokens < ../ollama_bash_lib.sh
echo -n "verbose: "
estimate_tokens < ../ollama_bash_lib.sh 1

echo '```'