#!/usr/bin/env bash
#
# Run all Ollama Bash Lib Demos, saving output to .txt files


cd "$(dirname "$0")" || exit 1 # cd to demos directory
demos=($(find . -maxdepth 1 -name "*.sh" | sort)) # Get all *.sh files in current directory

# Exclude files
excluded=("./run.demos.sh" "./generate.interactive.sh" "./show.all.models.sh")
for target in "${excluded[@]}"; do
  for index in "${!demos[@]}"; do
    if [ "${demos[$index]}" == "$target" ]; then
      unset demos[$index]
    fi
  done
done

for demo in "${demos[@]}"; do
  outfile=$(echo "$demo" | sed 's/\.sh$/.txt/g')
  echo "Run: $demo > $outfile"
  output=$($demo 2>&1) # redirect stderr to stdout
  echo "$output" > "$outfile" 2>&1
done
