#!/usr/bin/env bash

echo "Run all Ollama Bash Lib Demos, save output to .md files"
echo
echo "Turbo Mode"
echo

if [ -z "$OLLAMA_LIB_TURBO_KEY" ]; then
  echo -n 'Enter Ollama API Key: '
  read -r api_key
  export OLLAMA_LIB_TURBO_KEY="$api_key"
fi

export OLLAMA_HOST="https://ollama.com"

echo
echo "OLLAMA_HOST: $OLLAMA_HOST"
#echo "OLLAMA_LIB_TURBO_KEY: $(echo "$OLLAMA_LIB_TURBO_KEY" | wc -c) bytes"
echo "OLLAMA_LIB_TURBO_KEY: (${#OLLAMA_LIB_TURBO_KEY} characters)"
echo

cd "$(dirname "$0")" || exit 1 # cd to directory this script is in

echo "Demo directory: $(pwd)"
echo

demos=($(find . -maxdepth 1 -name "*.sh" | sort)) # Get all *.sh files in current directory

excluded=(
  "./run.demos.sh"
  "./run.turbo.demos.sh"
  "./interactive.chat.sh"
  "./interactive.generate.sh"
  "./show.all.models.sh"
)
for target in "${excluded[@]}"; do
  for index in "${!demos[@]}"; do
    if [ "${demos[$index]}" == "$target" ]; then
      unset "demos[$index]"
    fi
  done
done

echo "Running ${#demos[@]} demos: ${demos[*]}"
echo

for demo in "${demos[@]}"; do
  outfile_md="$(echo "$demo" | sed 's/\.sh$/.turbo.md/g')"
  echo "Run: $demo > $outfile_md 2>&1"
  output=$($demo 2>&1) # run demo and redirect stderr to stdout
  echo "$output" > "$outfile_md" 2>&1
done

