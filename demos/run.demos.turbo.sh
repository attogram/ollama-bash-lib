#!/usr/bin/env bash

export OLLAMA_HOST=ollama.com

echo "Run all Ollama Bash Lib Demos, save output to .md files"
echo
echo "OLLAMA_HOST: $OLLAMA_HOST"
echo

cd "$(dirname "$0")" || exit 1 # cd to directory this script is in

echo "Demo directory: $(pwd)"
echo

demos=($(find . -maxdepth 1 -name "*.sh" | sort)) # Get all *.sh files in current directory

excluded=(
  "./run.demos.sh"
  "./run.demos.turbo.sh"
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
  outfile_md="$(echo "$demo" | sed 's/\.sh$/.md/g')"
  echo "Run: $demo > $outfile_md 2>&1"
  output=$($demo 2>&1) # run demo and redirect stderr to stdout
  echo "$output" > "$outfile_md" 2>&1
done

