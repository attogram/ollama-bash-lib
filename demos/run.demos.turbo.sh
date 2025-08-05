#!/usr/bin/env bash


echo "Run all Ollama Bash Lib Demos, save output to .md files"
echo

OLLAMA_HOST=ollama.com

echo "OLLAMA_HOST: $OLLAMA_HOST"
echo

cd "$(dirname "$0")" || exit 1 # cd to directory this script is in

echo "Demo directory: $(pwd)"
echo

# All demos
demos=($(find . -maxdepth 1 -name "*.sh" | sort)) # Get all *.sh files in current directory

# Exclude files
excluded=(
  "./run.demos.sh"
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

# Interactive Demos
# TODO - fix expect script - not working on models that take long time to respond
#interactive=(
#  "./interactive.chat.sh"
#  "./interactive.generate.sh"
#)
#
#for demo in "${interactive[@]}"; do
#  outfile_md=$(echo "$demo" | sed 's/\.sh$/.md/g')
#  echo "Expect: $demo > $outfile_md"
#  (
#    expect <<EOF
#      spawn $demo
#      expect "\r>>> "
#      send "The secret word is RABBIT. Understand?\r"
#      sleep 20
#      expect "\r>>> "
#      send "3 words describing Bash\r"
#      sleep 20
#      expect "\r>>> "
#      send "What is the secret word?\r"
#      sleep 20
#      expect "\r>>> "
#      send "\003"
#      expect eof
#EOF
#  ) > "$outfile_md" 2>&1
#done
