#!/usr/bin/env bash

echo '# Snarky review of [ollama_bash_lib.sh](../ollama_bash_lib.sh) AND [README.md](../README.md)'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_app_installed; then echo 'ERROR: Ollama Not Installed'; fi;
  if ! ollama_api_ping; then echo 'ERROR: Ollama API not reachable'; fi
  echo; echo "A [demo](../README.md#demos) of [$OBL_NAME]($OBL_URL) v$OBL_VERSION"
}

startup

model="$(ollama_model_random)"

demo() {

  task='Act as an experienced Senior Developer who just does not give a fuck anymore.
  Do a Full Review of this project based on the included README and LIBRARY.
  Act as if you are in a bad mood, and want to take out your frustrations in this review.
  Be snarky, sarcastic and insulting.
  Never mention anything good, always concentrate on the bad stuff.
  Require that library works in Bash v3.2 or higher.
  Output your review in Markdown format.'

  readme='../README.md'

  library='../ollama_bash_lib.sh'

  cat <<EOF
\`\`\`bash
task='$task'
readme='$readme'
library='$library'
ollama_thinking hide
ollama_generate -m "$model" -p "\$task\n\nREADME:\n\n\$(cat "\$readme")\n\nLIBRARY:\n\n\$(cat "\$library")"
\`\`\`
EOF

  ollama_thinking hide
  ollama_generate -m "$model" -p "$task\n\nREADME:\n\n$(cat "$readme")\n\nLIBRARY:\n\n$(cat "$library")"
}

echo

demo
