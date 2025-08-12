#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks/invalid_json:$PATH"
}

@test "ollama_generate: invalid json" {
    load_lib
    run ollama_generate "model" "prompt"
    [ "$status" -eq 1 ]
}
