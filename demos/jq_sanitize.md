Ollama Bash Lib - Demo - jq_sanitize
ollama_bash_lib: ./../ollama_bash_lib.sh
ollama_lib_version: v0.38.0
ollama_installed: OK
ollama_api_ping: OK

good_json: {"value":"abc\ndef"}

jq_sanitize "{"value":"abc\ndef"}"

{"value":"abc\ndef"}


bad_json: {"value":"abc
def"}

jq_sanitize "{"value":"abc
def"}"

{"value":"abcdef"}
