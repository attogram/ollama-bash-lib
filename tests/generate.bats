#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "ollama_generate_json: no jq" {
    load_lib
    run ollama_generate_json "model" "prompt"
    [ "$status" -eq 1 ]
}


@test "ollama_generate_json: success" {
    load_lib
    run ollama_generate_json "model" "prompt"
    [ "$status" -eq 0 ]
}

@test "ollama_generate: success" {
    load_lib
    run ollama_generate "model" "prompt"
    [ "$status" -eq 0 ]
}

@test "ollama_generate_stream_json: success" {
    load_lib
    run ollama_generate_stream_json "model" "prompt"
    [ "$status" -eq 0 ]
}

@test "ollama_generate_stream: success" {
    load_lib
    run ollama_generate_stream "model" "prompt"
    [ "$status" -eq 0 ]
}
