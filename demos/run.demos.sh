#!/usr/bin/env bash

# cd to demos directory
cd "$(dirname "$0")" || exit 1

# Get all *.sh files
demos=($(find . -maxdepth 1 -name "*.sh"))
#echo; echo "demos:"; echo "${demos[@]}"

# Exclude some demos/utils
excluded=("./run.demos.sh" "./generate.interactive.sh" "./show.all.models.sh")
#echo; echo "excluded:"; echo "${excluded[@]}"
for target in "${excluded[@]}"; do
  for index in "${!demos[@]}"; do
    if [ "${demos[$index]}" == "$target" ]; then
      unset demos[$index]
    fi
  done
done

# Run all demos, saving output to txt file
for demo in "${demos[@]}"; do
  outfile=$(echo "$demo" | sed 's/\.sh$/.txt/g')
  echo "Run: $demo > $outfile 2>&1"
  output=$($demo)
  # Remove PII
  output=$(echo "$output" | sed '/^Ollama Bash Lib:/c\Ollama Bash Lib: /ollama-bash-lib/ollama_bash_lib.sh')
  output=$(echo "$output" | sed '/^file:/c\file: /ollama-bash-lib/ollama_bash_lib.sh')
  echo "$output" > "$outfile" 2>&1 # stdout and stderr to text file
done
