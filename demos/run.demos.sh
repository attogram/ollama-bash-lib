#!/usr/bin/env bash

echo 'Run all Ollama Bash Lib Demos, save output to .md files'
echo

cd "$(dirname "$0")" || exit 1 # cd to directory this script is in

echo "Demo directory: $(pwd)"
echo

source ../ollama_bash_lib.sh

if [[ -z "$OLLAMA_LIB_TURBO_KEY" ]]; then
  echo 'Enter API Key for Turbo Mode, or Press Enter for Local mode'
  echo
fi

ollama_app_turbo -m off # Turn off turbo, to run in local mode

echo "OLLAMA_LIB_TURBO_KEY: (${#OLLAMA_LIB_TURBO_KEY} characters)"
echo "OLLAMA_HOST: $OLLAMA_HOST"
echo "OLLAMA_LIB_API: $OLLAMA_LIB_API"
echo

# All demos
demos=($(find . -maxdepth 1 -name "*.sh" | sort)) # Get all *.sh files in current directory

# Exclude files
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

# Static Demos
for demo in "${demos[@]}"; do
  outfile_md=$(echo "$demo" | sed 's/\.sh$/.md/g')
  echo "Run: $demo > $outfile_md 2>&1"
  output=$($demo 2>&1) # run demo and redirect stderr to stdout
  echo "$output" > "$outfile_md" 2>&1
done
