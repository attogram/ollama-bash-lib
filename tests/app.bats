#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "ollama_app_installed: not installed" {
    load_lib
    run ollama_app_installed
    [ "$status" -eq 1 ]
}

@test "ollama_app_turbo: on" {
    load_lib
    run ollama_app_turbo "on"
    [ "$status" -eq 0 ]
    [ "$OLLAMA_HOST" = "https://ollama.com" ]
    [ "$OLLAMA_LIB_API" = "https://ollama.com" ]
}

@test "ollama_app_turbo: off" {
    load_lib
    OLLAMA_LIB_TURBO_KEY="test"
    run ollama_app_turbo "off"
    [ "$status" -eq 0 ]
    [ -z "$OLLAMA_LIB_TURBO_KEY" ]
    [ "$OLLAMA_HOST" = "http://localhost:11434" ]
    [ "$OLLAMA_LIB_API" = "http://localhost:11434" ]
}

@test "ollama_app_vars: success" {
    load_lib
    run ollama_app_vars
    [ "$status" -eq 0 ]
}

@test "ollama_app_version: success" {
    load_lib
    run ollama_app_version
    [ "$status" -eq 0 ]
}

@test "ollama_app_version_json: success" {
    load_lib
    run ollama_app_version_json
    [ "$status" -eq 0 ]
}

@test "ollama_app_version_cli: success" {
    load_lib
    run ollama_app_version_cli
    [ "$status" -eq 0 ]
}
