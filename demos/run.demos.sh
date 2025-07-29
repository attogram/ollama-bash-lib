#!/usr/bin/env bash
#
# Run all Ollama Bash Lib Demos, saving output to .txt files

cd "$(dirname "$0")" || exit 1 # cd to demos directory

demos=($(find . -maxdepth 1 -name "*.sh" | sort)) # Get all *.sh files in current directory

# Exclude files
excluded=("./run.demos.sh" "./interactive.generate.sh" "./show.all.models.sh")
for target in "${excluded[@]}"; do
  for index in "${!demos[@]}"; do
    if [ "${demos[$index]}" == "$target" ]; then
      unset demos[$index]
    fi
  done
done

for demo in "${demos[@]}"; do
  outfile_md=$(echo "$demo" | sed 's/\.sh$/.md/g')
  echo "Run: $demo > $outfile_md 2>&1"
  output=$($demo 2>&1) # run demo and redirect stderr to stdout
  echo "$output" > "$outfile_md" 2>&1
done
